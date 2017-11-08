#ifndef _NRF24L01_H_
#define _NRF24L01_H_

#include "stm8s.h"

#define MISO	GPIO_PIN_7
#define MOSI	GPIO_PIN_6
#define	SCK	    GPIO_PIN_5
#define IRQ		GPIO_PIN_4	
#define	CE	    GPIO_PIN_4	
#define	CSN		GPIO_PIN_5	

#define SetCE	GPIO_WriteHigh(GPIOF, CE)
#define ClrCE	GPIO_WriteLow(GPIOF, CE)

#define SetCSN	GPIO_WriteHigh(GPIOE, CSN)
#define ClrCSN	GPIO_WriteLow(GPIOE, CSN)

//Define the commands for operate the nRF24L01P
#define  R_REGISTER      0x00  //Read command register
#define  W_REGISTER      0x20  //Write command register
#define  R_RX_PAYLOAD 	 0x61  //RX Payload register address
#define  W_TX_PAYLOAD	 0xA0  //TX Payload register address
#define	 WR_ACK_PAYLOAD	 0xA8
#define  FLUSH_TX		 0xE1  //flush register command
#define  FLUSH_RX		 0xE2  //flush register command
#define  REUSE_TX_PL     0xE3  //Reuse TX payload register command
#define  NOP             0xFF  //No Operation, might be used to read status register

//Define the register address for nRF24L01P
#define  CONFIG          0x00  // Configurate the status of transceiver, mode of CRC and the replay of transceiver status
#define  EN_AA			 0x01  // Enable the atuo-ack in all channels
#define  EN_RXADDR       0x02  // Enable Rx Address
#define  SETUP_AW        0x03  // Configurate the address width
#define  SETUP_RETR      0x04  // setup the retransmit
#define  RF_CH           0x05  // Configurate the RF frequency
#define  RF_SETUP        0x06  // Setup the rate of data, and transmit power
#define  STATUS          0x07  // Status Register
#define  OBSERVE_TX      0x08  // Transmit observe register
#define  CD              0x09  // Carrier detect
#define  RX_ADDR_P0      0x0A  // Receive address of channel 0
#define  RX_ADDR_P1      0x0B  // Receive address of channel 1
#define  RX_ADDR_P2      0x0C  // Receive address of channel 2
#define  RX_ADDR_P3      0x0D  // Receive address of channel 3
#define  RX_ADDR_P4      0x0E  // Receive address of channel 4
#define  RX_ADDR_P5      0x0F  // Receive address of channel 5
#define  TX_ADDR         0x10  // Transmit address
#define  RX_PW_P0        0x11  // Size of receive data in channel 0
#define  RX_PW_P1        0x12  // Size of receive data in channel 1
#define  RX_PW_P2        0x13  // Size of receive data in channel 2
#define  RX_PW_P3        0x14  // Size of receive data in channel 3
#define  RX_PW_P4        0x15  // Size of receive data in channel 4
#define  RX_PW_P5        0x16  // Size of receive data in channel 5
#define  FIFO_STATUS     0x17  // FIFO Status
#define DYNPD			 0x1C // Enable dynamic payload length
#define FEATURE			 0x1D  // Feature Register

// Configuration Register
#define DIS_MASK_RX_DR  	0x40  //(0)Disable RX_DR interrupt. 
#define DIS_MASK_TX_DR  	0x20  //(0)Disable TX_DR Interrupt. 
#define DIS_MASK_MAX_RT 	0x10  //(0)Disable Max_retransmit interrupt 
#define EN_CRC      		0x80  //(1)Enable CRC. Forced high if one of the bits in the EN_AA is high 
#define CRC8        		0x00  //(0)Enable 1byte  CRC(8 bits) instead of two bytes(16 bits) 
#define CRC16       		0x40  //(0)Enable 2bytes CRC(16 bits) instead of one byte(8 bits) 
#define PWR_UP      		0x20  //(0)Bit seteed if in power UP. cleared if in power Down. 
#define PRIM_RX     		0x01  //(0)RX/TX control. Put receiver in RX mode.  1: RX, 0: TX 
#define PRIM_TX     		0x00

// RF Setup Register
#define CONT_WAVE    		0x80  //(0)Enables continuous carrier transmit when high(TX is always on transmitting sinc signal) 
#define PLL_LOCK     		0x10  //(0)Force PLL lock signal. Only used in test 
#define RF_DR_250kbps		0x20  //(0)Select between the low speed data rates. 
#define RF_DR_1Mbps  		0x00  //(0)Select between the medium speed data rates. 
#define RF_DR_2Mbps  		0x08  //(1)(default_mode)Select between the high speed data rates. This bitis don’t care if RF_DR_250kbps is set. 
#define RF_PWR_18dBm		0x00  //-18dBm. Set RF output power 
#define RF_PWR_12dBm		0x02  //-12dBm. Set RF output power 
#define RF_PWR_6dBm 		0x04  //-6dBm. Set RF output power 
#define RF_PWR_0dBm  		0x06  //0dBm(default). Set RF output power 

// Status Register
#define IRQ_RX_dataready  	0x40  //(0)Data Ready RX FIFO interrupt. Asserted when new data arrives RX FIFOc.Write 1 to clear bit. 
#define IRQ_TX_datasent   	0x20  //(0)Data Sent TX FIFO interrupt. Asserted when packet transmitted on TX. If AUTO_ACK is activated,this bit is set high only when ACK isreceived.Write 1 to clear bit. 
#define IRQ_MAX_retransmit	0x10  //(0)Maximum number of TX retransmits interrupt Write 1 to clear bit. If asserted it must be cleared to enable further communication. 
#define IRQ_ALL           	0x70  //Allows clearing all IRQs at the same time 
#define RX_PIPE0          	0x00  //(R)(bits 3:1)Data pipe number for the payload available for reading from RX_FIFO 000-101: Data Pipe Number 
#define RX_PIPE1          	0x02  //(R)(bits 3:1)Data pipe number for the payload available for reading from RX_FIFO 000-101: Data Pipe Number 
#define RX_PIPE2          	0x04  //(R)(bits 3:1)Data pipe number for the payload available for reading from RX_FIFO 000-101: Data Pipe Number 
#define RX_PIPE3          	0x06  //(R)(bits 3:1)Data pipe number for the payload available for reading from RX_FIFO 000-101: Data Pipe Number 
#define RX_PIPE4          	0x08  //(R)(bits 3:1)Data pipe number for the payload available for reading from RX_FIFO 000-101: Data Pipe Number 
#define RX_PIPE5          	0x0A  //(R)(bits 3:1)Data pipe number for the payload available for reading from RX_FIFO 000-101: Data Pipe Number 
#define RX_BUFFER_EMPTY   	0x0E  //(R)Data pipe number for the payload available for reading from RX_FIFO 000-101: Data Pipe Number 
#define TX_BUFFER_FULL    	0x01  //(R)(0)TX FIFO full flag. 1: TX FIFO full. 0: Available locations in TX FIFO. 

// FIFO Status Register
#define TX_REUSE 			0x40  //(R)Pulse the rfce high for at least 10µs to Reuse last transmitted payload. TX payload reuse is active until W_TX_PAYLOAD or FLUSH TX is executed. TX_REUSE is set by the SPI command REUSE_TX_PL, and is reset by the SPI commands W_TX_PAYLOAD or FLUSH TX 
#define TX_FULL  			0x20  //(R)TX FIFO buffer full flag 
#define TX_EMPTY 			0x10  //(R)TX FIFO buffer empty 
#define RX_FULL  			0x02  //(R)RX FIFO buffer full flag 
#define RX_EMPTY 			0x01  //(R)RX FIFO buffer empty    

// Feature Register
#define EN_DPL      		0x04  //Enables Dynamic Payload Length(General DPL enable) 
#define EN_ACK_PAY  		0x02  //Enables Payload with ACK 
#define EN_DYN_ACK  		0x01  //Enables the W_TX_PAYLOAD_NOACK command 
#define EN_DPL_ALL  		0x07  //All DPL functions enabled 

#define ADR_WIDTH 			5

#define RX_PLOAD_WIDTH 		32
#define TX_PLOAD_WIDTH 		32



void nRF_Pin_Conf(void);
void nRF_enable(void);
void nRF_disable(void);
void CSN_Clear(void);
void CSN_Set(void);
void nRF_Init(void);
uint8_t nRF_spiTransfer(uint8_t send);
uint8_t nRF_Read(uint8_t RegAddr);
uint8_t nRF_Write_Reg(uint8_t RegAddr,uint8_t data);
uint8_t nRF_SPI_Read_Buf(uint8_t RegAddr, uint8_t *buff, uint8_t len);
uint8_t nRF_SPI_Write_Buf(uint8_t RegAddr, uint8_t *buff, uint8_t len);
void nRF_Set_TxMode(void);
void nRF_Set_RxMode(void);
void nRF_Set_Channel(uint8_t channel);
void nRF_ClearSend(void);
void nRF_Set_Tx_Addr(uint8_t *add);
void nRF_Set_Rx_Addr(uint8_t *add);
void nRF_Clear_Status(uint8_t clear);
uint8_t nRF_Read_Status(void);
uint8_t nRF_Read_Lost_Packet(void);
uint8_t nRF_Read_Power_Detector(void);
uint8_t nRF_Read_Retransmitted_Packet(void);
uint8_t nRF_RxPacket(uint8_t *rxbuf);
void nRF_TxPacket(uint8_t *txbuf);
void nRF_Debug(void);
void nRF_delay(uint32_t cnt);
#endif