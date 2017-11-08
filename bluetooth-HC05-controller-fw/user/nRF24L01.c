#include "stm8s.h"
#include "stm8s_spi.h"
#include "nRF24L01.h"
#include "stm8s_gpio.h"
#include "stm8s_clk.h"
#include "sw_uart.h"

uint8_t CHANNEL;
uint8_t TX_ADDRESS[ADR_WIDTH];
uint8_t RX_ADDRESS[ADR_WIDTH];
uint8_t RX_ADDRESS_P0[ADR_WIDTH];
uint8_t RX_ADDRESS_P1[ADR_WIDTH];
uint8_t RX_ADDRESS_P2[1];
uint8_t RX_ADDRESS_P3[1];
uint8_t RX_ADDRESS_P4[1];
uint8_t RX_ADDRESS_P5[1];


void nRF_delay(uint32_t cnt)
{
        uint32_t i;
        
        for (; cnt > 0; cnt--) {
                for (i = 0; i < 3000; i++)
                        ;
        }
}

void nRF_Pin_Conf(void)
{
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI , ENABLE);
	GPIO_ExternalPullUpConfig(GPIOC, (GPIO_Pin_TypeDef)(GPIO_PIN_5|GPIO_PIN_6|GPIO_PIN_7), ENABLE);
	GPIO_Init(GPIOF, CE, GPIO_MODE_OUT_PP_HIGH_FAST);
  	GPIO_Init(GPIOE, CSN, GPIO_MODE_OUT_PP_HIGH_FAST);
  	//GPIO_Init(GPIOC, IRQ, GPIO_MODE_IN_PU_IT);
  	SPI_DeInit();

  	SPI_Init(SPI_FIRSTBIT_MSB, SPI_BAUDRATEPRESCALER_4, SPI_MODE_MASTER,
				SPI_CLOCKPOLARITY_LOW, SPI_CLOCKPHASE_1EDGE,
				SPI_DATADIRECTION_2LINES_FULLDUPLEX, SPI_NSS_SOFT, (uint8_t)0x07);

  	SPI_Cmd(ENABLE);
  	ClrCE;
  	nRF_delay(10);
  	SetCSN;
}

void nRF_Init(void)
{
	nRF_Pin_Conf();
	ClrCE;
	nRF_delay(10);
	nRF_Write_Reg(W_REGISTER + CONFIG, 0x0E); //Enable CRC,power up and ptx,CRC 2 Byte
	//nRF_Write_Reg(W_REGISTER + CONFIG, 0x08); //Enable CRC,power up and ptx,CRC 1 Byte
	nRF_delay(10);
	nRF_Write_Reg(W_REGISTER + EN_AA, 0x3F); //Enable Auto.Ack:Pipe0-5
	nRF_Write_Reg(W_REGISTER + EN_RXADDR, 0x3F); //Enable data P0,P1,P2,P3,P4,P5
	nRF_Write_Reg(W_REGISTER + SETUP_AW, 0x03); //Address width 5 bytes
	nRF_Write_Reg(W_REGISTER + SETUP_RETR, 0xFA); // 4000us Auto Retransmit Delay, 10 Auto Retransmit Count	
	nRF_Write_Reg(W_REGISTER + RF_CH, CHANNEL);   // Select RF channel  F = 2400 Mhz + RF_CH Mhz  ex: RF_CH = 0  => F = 2.4 Ghz
	nRF_Write_Reg(W_REGISTER + RF_SETUP, RF_PWR_0dBm|RF_DR_2Mbps);// Setup power 0dbm, rate 2Mbps
	nRF_Write_Reg(W_REGISTER + STATUS, 0x70); // Clear Data Ready RX FIFO interrupt,Data Sent TX FIFO interrupt,Maximum number of TX retransmits interrupt
	
	nRF_SPI_Write_Buf(W_REGISTER + RX_ADDR_P0, RX_ADDRESS_P0, ADR_WIDTH); // Write address into rx_add_p0
	nRF_SPI_Write_Buf(W_REGISTER + RX_ADDR_P1, RX_ADDRESS_P1, ADR_WIDTH); 	// Write address into rx_add_p1
	 
	nRF_Write_Reg(W_REGISTER + RX_ADDR_P2, RX_ADDRESS_P2[0]); // Write address into rx_add_p2
	nRF_Write_Reg(W_REGISTER + RX_ADDR_P3, RX_ADDRESS_P3[0]); // Write address into rx_add_p3
	nRF_Write_Reg(W_REGISTER + RX_ADDR_P4, RX_ADDRESS_P4[0]); // Write address into rx_add_p4
	nRF_Write_Reg(W_REGISTER + RX_ADDR_P5, RX_ADDRESS_P5[0]); // Write address into rx_add_p5

	nRF_SPI_Write_Buf(W_REGISTER + TX_ADDR, TX_ADDRESS, ADR_WIDTH); // Write address into tx_add

	nRF_Write_Reg(W_REGISTER + RX_PW_P0, 32);  // 32 bytes in RX payload in data pipe 0
	nRF_Write_Reg(W_REGISTER + RX_PW_P1, 32);  // 32 bytes in RX payload in data pipe 1
	nRF_Write_Reg(W_REGISTER + RX_PW_P2, 32);  // 32 bytes in RX payload in data pipe 2
	nRF_Write_Reg(W_REGISTER + RX_PW_P3, 32);  // 32 bytes in RX payload in data pipe 3
	nRF_Write_Reg(W_REGISTER + RX_PW_P4, 32);  // 32 bytes in RX payload in data pipe 4
	nRF_Write_Reg(W_REGISTER + RX_PW_P5, 32);  // 32 bytes in RX payload in data pipe 5
	nRF_Write_Reg(W_REGISTER + DYNPD, 0x00);   // Enable dynamic payload length
	nRF_Write_Reg(W_REGISTER + FEATURE, 0x00); // Feature Register

	nRF_Write_Reg(FLUSH_TX, 0x00); // Clear TX FIFO Buf
	nRF_Write_Reg(FLUSH_RX, 0x00); // Clear RX FIFO Buf

	SetCE;
}

uint8_t nRF_spiTransfer(uint8_t send)
{
  while(SPI_GetFlagStatus(SPI_FLAG_TXE) == RESET);
  SPI_SendData(send);
  while(SPI_GetFlagStatus(SPI_FLAG_RXNE) == RESET);
  return SPI_ReceiveData();
}


uint8_t nRF_Read(uint8_t RegAddr)
{
   uint8_t data;
   
   ClrCSN;	//CSN low, initialize SPI communication...					
   nRF_spiTransfer(RegAddr);	// Select register to read	
   data = nRF_spiTransfer(0);  //read data
   SetCSN;   // CSN high, terminate SPI communication
   return(data); 
}

uint8_t nRF_Write_Reg(uint8_t RegAddr,uint8_t data)
{
	uint8_t status;

	ClrCSN; 
	status = nRF_spiTransfer(RegAddr);
	nRF_spiTransfer(data);
	SetCSN;
	return(status);
}

uint8_t nRF_SPI_Read_Buf(uint8_t RegAddr, uint8_t *buff, uint8_t len)
{
	uint8_t status, i;
	ClrCSN;
	status = nRF_spiTransfer(RegAddr);
	for(i = 0; i < len; i++)
		buff[i] = nRF_spiTransfer(0);
	SetCSN;
	return(status);
}

uint8_t nRF_SPI_Write_Buf(uint8_t RegAddr, uint8_t *buff, uint8_t len)
{
	uint8_t status, i;
	ClrCSN;
	status = nRF_spiTransfer(RegAddr);
	for(i = 0; i < len; i++)
	{
		nRF_spiTransfer(*buff);
		buff++;
	}
	SetCSN;
	return(status);
}

void nRF_Set_RxMode(void)
{
	uint8_t status;
	ClrCE;
	status = nRF_Read(CONFIG);
	status = (status&0xFE)|PRIM_RX;
	nRF_Write_Reg(W_REGISTER + CONFIG, status);
	SetCE;
	status = nRF_Read_Status();
	nRF_Clear_Status(status|IRQ_RX_dataready); // Clear Data Ready RX FIFO interrupt
	nRF_Write_Reg(FLUSH_RX, 0x00); //Clear RX FIFO Buf
	// nRF_Write_Reg(W_REGISTER + CONFIG, 0x0f); //Enable CRC, 2 byte CRC, Recive
	// nRF_SPI_Write_Buf(W_REGISTER + RX_ADDR_P0, TX_ADDRESS, ADR_WIDTH);	// Use the same address on the RX device as the TX device
	// nRF_Write_Reg(W_REGISTER + EN_AA, 0x01); //Enable Auto.Ack:Pipe0
	// nRF_Write_Reg(W_REGISTER +  EN_RXADDR, 0x01); //Enable Pipe0
	// nRF_Write_Reg(W_REGISTER + RF_CH, 40);			//Select RF channel 40

	// nRF_Write_Reg(W_REGISTER + RX_PW_P0, TX_PLOAD_WIDTH); //Select same RX payload width as TX Payload width
	// nRF_Write_Reg(W_REGISTER + RF_SETUP, 0x0F);	//TX_PWR:0dBm, Datarate:2Mbps, LNA:HCURR)
	// nRF_Write_Reg(W_REGISTER + CONFIG, 0x0F);	//Set PWR_UP bit, enable CRC(2 bytes) & Prim:RX. RX_DR enabled
	// nRF_enable();
	// delay(100);
}

void nRF_Set_TxMode(void)
{
	uint8_t status;
	ClrCE;
	nRF_delay(10);
	status = nRF_Read(CONFIG);
	status = (status&0xFE)|PRIM_TX;
	nRF_Write_Reg(W_REGISTER + CONFIG, status);
	SetCE;
	
	status = nRF_Read_Status();
	nRF_Clear_Status(status|IRQ_TX_datasent|IRQ_MAX_retransmit); // Clear Data Sent TX FIFO interrupt,Maximum number of TX retransmits interrupt
	nRF_Write_Reg(FLUSH_TX, 0x00);					 				      // Clear TX FIFO Buf

	// nRF_Write_Reg(W_REGISTER + CONFIG, 0x0e);  // Enable CRC, 2 byte CRC, Send
	// nRF_Write_Reg(W_REGISTER + SETUP_RETR, 0x2F); //Setup resend

	// nRF_SPI_Write_Buf(W_REGISTER + TX_ADDR, TX_ADDRESS, ADR_WIDTH); // Writes TX_Address to nRF24L01
	// nRF_SPI_Write_Buf(W_REGISTER + RX_ADDR_P0, TX_ADDRESS, ADR_WIDTH);	// RX_Addr0 same as TX_Adr for Auto.Ack
	// //nRF_SPI_Write_Buf(W_TX_PAYLOAD, Tx_Buf, TX_PLOAD_WIDTH); // Writes data to TX payload
	// nRF_Write_Reg(W_REGISTER + EN_AA, 0x01); //Enable Auto.Ack:Pipe0)
	// nRF_Write_Reg(W_REGISTER + EN_RXADDR, 0x01); //Enable Pipe0
	// nRF_Write_Reg(W_REGISTER + SETUP_RETR, 0x1a); //500µs + 86µs, 10 retrans...

	// nRF_Write_Reg(W_REGISTER + RF_CH, 40);		//Select RF channel 40
	// nRF_Write_Reg(W_REGISTER + RF_SETUP, 0x0f);	 //TX_PWR:0dBm, Datarate:2Mbps, LNA:HCURR
	// nRF_Write_Reg(W_REGISTER + CONFIG, 0x0e);	 //Set PWR_UP bit, enable CRC(2 bytes) & Prim:TX. MAX_RT & TX_DS enabled
	// nRF_enable();
	// delay(100);
}

void nRF_Set_Channel(uint8_t channel)
{
	if (channel > 127)
		channel = 127;
	nRF_Write_Reg(W_REGISTER + RF_CH, channel);
}

void nRF_ClearSend(void)
{
	nRF_Write_Reg(W_REGISTER + STATUS, 0XFF);
}

void nRF_Set_Tx_Addr(uint8_t *add)
{
	nRF_SPI_Write_Buf(W_REGISTER + TX_ADDR, add, ADR_WIDTH);
}

void nRF_Set_Rx_Addr(uint8_t *add)
{	
	nRF_SPI_Write_Buf(W_REGISTER + RX_ADDR_P0, add, ADR_WIDTH);
}

void nRF_Clear_Status(uint8_t clear)
{
	nRF_Write_Reg(W_REGISTER + STATUS, clear);
}

uint8_t nRF_Read_Status(void)
{
	uint8_t status;
	status = nRF_Read(STATUS);
	return status;
}

uint8_t nRF_Read_Lost_Packet(void)
{
	uint8_t status;
	status = nRF_Read(OBSERVE_TX);
	return((status&0xF0)>>4);
}

uint8_t nRF_Read_Power_Detector(void)
{
	uint8_t status;
	status = nRF_Read(STATUS);
	return status;
}

uint8_t nRF_Read_Retransmitted_Packet(void)
{
	uint8_t status;
	status = nRF_Read(OBSERVE_TX);
	return (status&0x0F); 
}

uint8_t nRF_RxPacket(uint8_t *rxbuf)
{
	uint8_t flag;
	flag = nRF_Read_Status();
	if(flag & IRQ_RX_dataready) //Data Ready RX FIFO interrupt
	{
		nRF_Clear_Status(flag); // Write 1 to clear bit IRQ_RX_dataready
		nRF_SPI_Read_Buf(R_RX_PAYLOAD, rxbuf, RX_PLOAD_WIDTH); //read receive payload from RX_FIFO buffer
		nRF_Write_Reg(FLUSH_RX, 0x00); //Clear RX_FIFO
		return (flag&0x0E)>>1; //return pipe
	} 
	return 0x07;
}

void nRF_TxPacket(uint8_t *txbuf)
{
	uint8_t status, Fifo;
	status = nRF_Read_Status(); // read register STATUS's value
	Fifo = nRF_Read(FIFO_STATUS);
	if((status&IRQ_TX_datasent)||(status&IRQ_MAX_retransmit)||(Fifo&TX_EMPTY))
	{
		nRF_Clear_Status(status);
		nRF_Write_Reg(FLUSH_TX, 0x00);
		nRF_SPI_Write_Buf(W_TX_PAYLOAD, txbuf, TX_PLOAD_WIDTH);	
	}
	// nRF_SPI_Write_Buf(W_REGISTER + RX_ADDR_P0, TX_ADDRESS, ADR_WIDTH); // Send Address
	// nRF_SPI_Write_Buf(W_TX_PAYLOAD, txbuf, TX_PLOAD_WIDTH); 			 //send data
	// //SPI_RW_Reg(WRITE_REG + CONFIG, 0x0e);   		 // Send Out
	// nRF_enable();
	// delay(100);
}

void nRF_Debug(void)
{
	uint8_t status;
	uint8_t buff[5];
	char buff_usart[50];
	status = nRF_Read(CONFIG);
	sprintf(buff_usart,"CONFIG: %2x\r\n",status);
	VCOM_puts(buff_usart);
	status = nRF_Read(EN_AA);
	sprintf(buff_usart,"EN_AA: %2x\r\n",status);
	VCOM_puts(buff_usart);
	status = nRF_Read(EN_RXADDR);
	sprintf(buff_usart,"EN_RXADDR: %2x\r\n",status);
	VCOM_puts(buff_usart);
	status = nRF_Read(SETUP_AW);
	sprintf(buff_usart,"SETUP_AW: %2x\r\n",status);
	VCOM_puts(buff_usart);
	status = nRF_Read(SETUP_RETR);
	sprintf(buff_usart,"SETUP_RETR: %2x\r\n",status);
	VCOM_puts(buff_usart);
	status = nRF_Read(RF_CH);
	sprintf(buff_usart,"RF_CH: %2x\r\n",status);
	VCOM_puts(buff_usart);
	status = nRF_Read(RF_SETUP);
	sprintf(buff_usart,"RF_SETUP: %2x\r\n",status);
	VCOM_puts(buff_usart);
	status = nRF_Read(STATUS);
	sprintf(buff_usart,"STATUS: %2x\r\n",status);
	VCOM_puts(buff_usart);
	status = nRF_Read(OBSERVE_TX);
	sprintf(buff_usart,"OBSERVE_TX: %2x\r\n",status);
	VCOM_puts(buff_usart);
	status = nRF_Read(CD);
	sprintf(buff_usart,"CD: %2x\r\n",status);
	VCOM_puts(buff_usart);
	nRF_SPI_Read_Buf(RX_ADDR_P0,buff,5);
	sprintf(buff_usart,"RX_ADDR_P0: %2x%2x%2x%2x%2x\r\n",buff[0],buff[1],buff[2],buff[3],buff[4]);
	VCOM_puts(buff_usart);
	nRF_SPI_Read_Buf(RX_ADDR_P1,buff,5);
	sprintf(buff_usart,"RX_ADDR_P1: %2x%2x%2x%2x%2x\r\n",buff[0],buff[1],buff[2],buff[3],buff[4]);
	VCOM_puts(buff_usart);
	status = nRF_Read(RX_ADDR_P2);
	sprintf(buff_usart,"RX_ADDR_P2: %2x\r\n",status);
	VCOM_puts(buff_usart);
	status = nRF_Read(RX_ADDR_P3);
	sprintf(buff_usart,"RX_ADDR_P3: %2x\r\n",status);
	VCOM_puts(buff_usart);
	status = nRF_Read(RX_ADDR_P4);
	sprintf(buff_usart,"RX_ADDR_P4: %2x\r\n",status);
	VCOM_puts(buff_usart);
	status = nRF_Read(RX_ADDR_P5);
	sprintf(buff_usart,"RX_ADDR_P5: %2x\r\n",status);
	VCOM_puts(buff_usart);	
	nRF_SPI_Read_Buf(TX_ADDR,buff,5);
	sprintf(buff_usart,"TX_ADDR: %2x%2x%2x%2x%2x\r\n",buff[0],buff[1],buff[2],buff[3],buff[4]);
	VCOM_puts(buff_usart);
	status = nRF_Read(RX_PW_P0);
	sprintf(buff_usart,"RX_PW_P0: %2x\r\n",status);
	VCOM_puts(buff_usart);
	status = nRF_Read(RX_PW_P1);
	sprintf(buff_usart,"RX_PW_P1: %2x\r\n",status);
	VCOM_puts(buff_usart);
	status = nRF_Read(RX_PW_P2);
	sprintf(buff_usart,"RX_PW_P2: %2x\r\n",status);
	VCOM_puts(buff_usart);
	status = nRF_Read(RX_PW_P3);
	sprintf(buff_usart,"RX_PW_P3: %2x\r\n",status);
	VCOM_puts(buff_usart);
	status = nRF_Read(RX_PW_P4);
	sprintf(buff_usart,"RX_PW_P4: %2x\r\n",status);
	VCOM_puts(buff_usart);
	status = nRF_Read(RX_PW_P5);
	sprintf(buff_usart,"RX_PW_P5: %2x\r\n",status);
	VCOM_puts(buff_usart);
	status = nRF_Read(FIFO_STATUS);
	sprintf(buff_usart,"FIFO_STATUS: %2x\r\n",status);
	VCOM_puts(buff_usart);
	status = nRF_Read(DYNPD);
	sprintf(buff_usart,"DYNPD: %2x\r\n",status);
	VCOM_puts(buff_usart);
	status = nRF_Read(FEATURE);
	sprintf(buff_usart,"FEATURE: %2x\r\n",status);
	VCOM_puts(buff_usart);
}