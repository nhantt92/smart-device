;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW64)
;--------------------------------------------------------
	.module nRF24L01
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _VCOM_puts
	.globl _sprintf
	.globl _SPI_GetFlagStatus
	.globl _SPI_ReceiveData
	.globl _SPI_SendData
	.globl _SPI_Cmd
	.globl _SPI_Init
	.globl _SPI_DeInit
	.globl _GPIO_ExternalPullUpConfig
	.globl _GPIO_WriteLow
	.globl _GPIO_WriteHigh
	.globl _GPIO_Init
	.globl _CLK_PeripheralClockConfig
	.globl _RX_ADDRESS_P5
	.globl _RX_ADDRESS_P4
	.globl _RX_ADDRESS_P3
	.globl _RX_ADDRESS_P2
	.globl _RX_ADDRESS_P1
	.globl _RX_ADDRESS_P0
	.globl _RX_ADDRESS
	.globl _TX_ADDRESS
	.globl _CHANNEL
	.globl _nRF_delay
	.globl _nRF_Pin_Conf
	.globl _nRF_Init
	.globl _nRF_spiTransfer
	.globl _nRF_Read
	.globl _nRF_Write_Reg
	.globl _nRF_SPI_Read_Buf
	.globl _nRF_SPI_Write_Buf
	.globl _nRF_Set_RxMode
	.globl _nRF_Set_TxMode
	.globl _nRF_Set_Channel
	.globl _nRF_ClearSend
	.globl _nRF_Set_Tx_Addr
	.globl _nRF_Set_Rx_Addr
	.globl _nRF_Clear_Status
	.globl _nRF_Read_Status
	.globl _nRF_Read_Lost_Packet
	.globl _nRF_Read_Power_Detector
	.globl _nRF_Read_Retransmitted_Packet
	.globl _nRF_RxPacket
	.globl _nRF_TxPacket
	.globl _nRF_Debug
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
_CHANNEL::
	.ds 1
_TX_ADDRESS::
	.ds 5
_RX_ADDRESS::
	.ds 5
_RX_ADDRESS_P0::
	.ds 5
_RX_ADDRESS_P1::
	.ds 5
_RX_ADDRESS_P2::
	.ds 1
_RX_ADDRESS_P3::
	.ds 1
_RX_ADDRESS_P4::
	.ds 1
_RX_ADDRESS_P5::
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
;	user/nRF24L01.c: 19: void nRF_delay(uint32_t cnt)
;	-----------------------------------------
;	 function nRF_delay
;	-----------------------------------------
_nRF_delay:
	sub	sp, #12
	ldw	y, (0x0f, sp)
	ldw	(0x09, sp), y
	ldw	x, (0x11, sp)
00107$:
;	user/nRF24L01.c: 23: for (; cnt > 0; cnt--) {
	tnzw	x
	jrne	00130$
	ldw	y, (0x09, sp)
	jreq	00109$
00130$:
;	user/nRF24L01.c: 24: for (i = 0; i < 3000; i++)
	ldw	y, #0x0bb8
	ldw	(0x03, sp), y
	clr	(0x02, sp)
	clr	(0x01, sp)
00105$:
	ldw	y, (0x03, sp)
	subw	y, #0x0001
	ldw	(0x07, sp), y
	ld	a, (0x02, sp)
	sbc	a, #0x00
	ld	(0x06, sp), a
	ld	a, (0x01, sp)
	sbc	a, #0x00
	ld	(0x05, sp), a
	ldw	y, (0x07, sp)
	ldw	(0x03, sp), y
	ldw	y, (0x05, sp)
	ldw	(0x01, sp), y
	ldw	y, (0x07, sp)
	jrne	00105$
	ldw	y, (0x05, sp)
	jrne	00105$
;	user/nRF24L01.c: 23: for (; cnt > 0; cnt--) {
	subw	x, #0x0001
	ld	a, (0x0a, sp)
	sbc	a, #0x00
	ld	(0x0a, sp), a
	ld	a, (0x09, sp)
	sbc	a, #0x00
	ld	(0x09, sp), a
	jra	00107$
00109$:
	addw	sp, #12
	ret
;	user/nRF24L01.c: 29: void nRF_Pin_Conf(void)
;	-----------------------------------------
;	 function nRF_Pin_Conf
;	-----------------------------------------
_nRF_Pin_Conf:
;	user/nRF24L01.c: 31: CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI , ENABLE);
	push	#0x01
	push	#0x01
	call	_CLK_PeripheralClockConfig
	popw	x
;	user/nRF24L01.c: 32: GPIO_ExternalPullUpConfig(GPIOC, (GPIO_Pin_TypeDef)(GPIO_PIN_5|GPIO_PIN_6|GPIO_PIN_7), ENABLE);
	push	#0x01
	push	#0xe0
	push	#0x0a
	push	#0x50
	call	_GPIO_ExternalPullUpConfig
	addw	sp, #4
;	user/nRF24L01.c: 33: GPIO_Init(GPIOF, CE, GPIO_MODE_OUT_PP_HIGH_FAST);
	push	#0xf0
	push	#0x10
	push	#0x19
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	user/nRF24L01.c: 34: GPIO_Init(GPIOE, CSN, GPIO_MODE_OUT_PP_HIGH_FAST);
	push	#0xf0
	push	#0x20
	push	#0x14
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	user/nRF24L01.c: 36: SPI_DeInit();
	call	_SPI_DeInit
;	user/nRF24L01.c: 38: SPI_Init(SPI_FIRSTBIT_MSB, SPI_BAUDRATEPRESCALER_4, SPI_MODE_MASTER,
	push	#0x07
	push	#0x02
	push	#0x00
	push	#0x00
	push	#0x00
	push	#0x04
	push	#0x08
	push	#0x00
	call	_SPI_Init
	addw	sp, #8
;	user/nRF24L01.c: 42: SPI_Cmd(ENABLE);
	push	#0x01
	call	_SPI_Cmd
	pop	a
;	user/nRF24L01.c: 43: ClrCE;
	push	#0x10
	push	#0x19
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
;	user/nRF24L01.c: 44: nRF_delay(10);
	push	#0x0a
	clrw	x
	pushw	x
	push	#0x00
	call	_nRF_delay
	addw	sp, #4
;	user/nRF24L01.c: 45: SetCSN;
	push	#0x20
	push	#0x14
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
	ret
;	user/nRF24L01.c: 48: void nRF_Init(void)
;	-----------------------------------------
;	 function nRF_Init
;	-----------------------------------------
_nRF_Init:
;	user/nRF24L01.c: 50: nRF_Pin_Conf();
	call	_nRF_Pin_Conf
;	user/nRF24L01.c: 51: ClrCE;
	push	#0x10
	push	#0x19
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
;	user/nRF24L01.c: 52: nRF_delay(10);
	push	#0x0a
	clrw	x
	pushw	x
	push	#0x00
	call	_nRF_delay
	addw	sp, #4
;	user/nRF24L01.c: 53: nRF_Write_Reg(W_REGISTER + CONFIG, 0x0E); //Enable CRC,power up and ptx,CRC 2 Byte
	push	#0x0e
	push	#0x20
	call	_nRF_Write_Reg
	popw	x
;	user/nRF24L01.c: 55: nRF_delay(10);
	push	#0x0a
	clrw	x
	pushw	x
	push	#0x00
	call	_nRF_delay
	addw	sp, #4
;	user/nRF24L01.c: 56: nRF_Write_Reg(W_REGISTER + EN_AA, 0x3F); //Enable Auto.Ack:Pipe0-5
	push	#0x3f
	push	#0x21
	call	_nRF_Write_Reg
	popw	x
;	user/nRF24L01.c: 57: nRF_Write_Reg(W_REGISTER + EN_RXADDR, 0x3F); //Enable data P0,P1,P2,P3,P4,P5
	push	#0x3f
	push	#0x22
	call	_nRF_Write_Reg
	popw	x
;	user/nRF24L01.c: 58: nRF_Write_Reg(W_REGISTER + SETUP_AW, 0x03); //Address width 5 bytes
	push	#0x03
	push	#0x23
	call	_nRF_Write_Reg
	popw	x
;	user/nRF24L01.c: 59: nRF_Write_Reg(W_REGISTER + SETUP_RETR, 0xFA); // 4000us Auto Retransmit Delay, 10 Auto Retransmit Count	
	push	#0xfa
	push	#0x24
	call	_nRF_Write_Reg
	popw	x
;	user/nRF24L01.c: 60: nRF_Write_Reg(W_REGISTER + RF_CH, CHANNEL);   // Select RF channel  F = 2400 Mhz + RF_CH Mhz  ex: RF_CH = 0  => F = 2.4 Ghz
	push	_CHANNEL+0
	push	#0x25
	call	_nRF_Write_Reg
	popw	x
;	user/nRF24L01.c: 61: nRF_Write_Reg(W_REGISTER + RF_SETUP, RF_PWR_0dBm|RF_DR_2Mbps);// Setup power 0dbm, rate 2Mbps
	push	#0x0e
	push	#0x26
	call	_nRF_Write_Reg
	popw	x
;	user/nRF24L01.c: 62: nRF_Write_Reg(W_REGISTER + STATUS, 0x70); // Clear Data Ready RX FIFO interrupt,Data Sent TX FIFO interrupt,Maximum number of TX retransmits interrupt
	push	#0x70
	push	#0x27
	call	_nRF_Write_Reg
	popw	x
;	user/nRF24L01.c: 64: nRF_SPI_Write_Buf(W_REGISTER + RX_ADDR_P0, RX_ADDRESS_P0, ADR_WIDTH); // Write address into rx_add_p0
	ldw	x, #_RX_ADDRESS_P0+0
	push	#0x05
	pushw	x
	push	#0x2a
	call	_nRF_SPI_Write_Buf
	addw	sp, #4
;	user/nRF24L01.c: 65: nRF_SPI_Write_Buf(W_REGISTER + RX_ADDR_P1, RX_ADDRESS_P1, ADR_WIDTH); 	// Write address into rx_add_p1
	ldw	x, #_RX_ADDRESS_P1+0
	push	#0x05
	pushw	x
	push	#0x2b
	call	_nRF_SPI_Write_Buf
	addw	sp, #4
;	user/nRF24L01.c: 67: nRF_Write_Reg(W_REGISTER + RX_ADDR_P2, RX_ADDRESS_P2[0]); // Write address into rx_add_p2
	ldw	x, #_RX_ADDRESS_P2+0
	ld	a, (x)
	push	a
	push	#0x2c
	call	_nRF_Write_Reg
	popw	x
;	user/nRF24L01.c: 68: nRF_Write_Reg(W_REGISTER + RX_ADDR_P3, RX_ADDRESS_P3[0]); // Write address into rx_add_p3
	ldw	x, #_RX_ADDRESS_P3+0
	ld	a, (x)
	push	a
	push	#0x2d
	call	_nRF_Write_Reg
	popw	x
;	user/nRF24L01.c: 69: nRF_Write_Reg(W_REGISTER + RX_ADDR_P4, RX_ADDRESS_P4[0]); // Write address into rx_add_p4
	ldw	x, #_RX_ADDRESS_P4+0
	ld	a, (x)
	push	a
	push	#0x2e
	call	_nRF_Write_Reg
	popw	x
;	user/nRF24L01.c: 70: nRF_Write_Reg(W_REGISTER + RX_ADDR_P5, RX_ADDRESS_P5[0]); // Write address into rx_add_p5
	ldw	x, #_RX_ADDRESS_P5+0
	ld	a, (x)
	push	a
	push	#0x2f
	call	_nRF_Write_Reg
	popw	x
;	user/nRF24L01.c: 72: nRF_SPI_Write_Buf(W_REGISTER + TX_ADDR, TX_ADDRESS, ADR_WIDTH); // Write address into tx_add
	ldw	x, #_TX_ADDRESS+0
	push	#0x05
	pushw	x
	push	#0x30
	call	_nRF_SPI_Write_Buf
	addw	sp, #4
;	user/nRF24L01.c: 74: nRF_Write_Reg(W_REGISTER + RX_PW_P0, 32);  // 32 bytes in RX payload in data pipe 0
	push	#0x20
	push	#0x31
	call	_nRF_Write_Reg
	popw	x
;	user/nRF24L01.c: 75: nRF_Write_Reg(W_REGISTER + RX_PW_P1, 32);  // 32 bytes in RX payload in data pipe 1
	push	#0x20
	push	#0x32
	call	_nRF_Write_Reg
	popw	x
;	user/nRF24L01.c: 76: nRF_Write_Reg(W_REGISTER + RX_PW_P2, 32);  // 32 bytes in RX payload in data pipe 2
	push	#0x20
	push	#0x33
	call	_nRF_Write_Reg
	popw	x
;	user/nRF24L01.c: 77: nRF_Write_Reg(W_REGISTER + RX_PW_P3, 32);  // 32 bytes in RX payload in data pipe 3
	push	#0x20
	push	#0x34
	call	_nRF_Write_Reg
	popw	x
;	user/nRF24L01.c: 78: nRF_Write_Reg(W_REGISTER + RX_PW_P4, 32);  // 32 bytes in RX payload in data pipe 4
	push	#0x20
	push	#0x35
	call	_nRF_Write_Reg
	popw	x
;	user/nRF24L01.c: 79: nRF_Write_Reg(W_REGISTER + RX_PW_P5, 32);  // 32 bytes in RX payload in data pipe 5
	push	#0x20
	push	#0x36
	call	_nRF_Write_Reg
	popw	x
;	user/nRF24L01.c: 80: nRF_Write_Reg(W_REGISTER + DYNPD, 0x00);   // Enable dynamic payload length
	push	#0x00
	push	#0x3c
	call	_nRF_Write_Reg
	popw	x
;	user/nRF24L01.c: 81: nRF_Write_Reg(W_REGISTER + FEATURE, 0x00); // Feature Register
	push	#0x00
	push	#0x3d
	call	_nRF_Write_Reg
	popw	x
;	user/nRF24L01.c: 83: nRF_Write_Reg(FLUSH_TX, 0x00); // Clear TX FIFO Buf
	push	#0x00
	push	#0xe1
	call	_nRF_Write_Reg
	popw	x
;	user/nRF24L01.c: 84: nRF_Write_Reg(FLUSH_RX, 0x00); // Clear RX FIFO Buf
	push	#0x00
	push	#0xe2
	call	_nRF_Write_Reg
	popw	x
;	user/nRF24L01.c: 86: SetCE;
	push	#0x10
	push	#0x19
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
	ret
;	user/nRF24L01.c: 89: uint8_t nRF_spiTransfer(uint8_t send)
;	-----------------------------------------
;	 function nRF_spiTransfer
;	-----------------------------------------
_nRF_spiTransfer:
;	user/nRF24L01.c: 91: while(SPI_GetFlagStatus(SPI_FLAG_TXE) == RESET);
00101$:
	push	#0x02
	call	_SPI_GetFlagStatus
	addw	sp, #1
	tnz	a
	jreq	00101$
;	user/nRF24L01.c: 92: SPI_SendData(send);
	ld	a, (0x03, sp)
	push	a
	call	_SPI_SendData
	pop	a
;	user/nRF24L01.c: 93: while(SPI_GetFlagStatus(SPI_FLAG_RXNE) == RESET);
00104$:
	push	#0x01
	call	_SPI_GetFlagStatus
	addw	sp, #1
	tnz	a
	jreq	00104$
;	user/nRF24L01.c: 94: return SPI_ReceiveData();
	jp	_SPI_ReceiveData
;	user/nRF24L01.c: 98: uint8_t nRF_Read(uint8_t RegAddr)
;	-----------------------------------------
;	 function nRF_Read
;	-----------------------------------------
_nRF_Read:
;	user/nRF24L01.c: 102: ClrCSN;	//CSN low, initialize SPI communication...					
	push	#0x20
	push	#0x14
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
;	user/nRF24L01.c: 103: nRF_spiTransfer(RegAddr);	// Select register to read	
	ld	a, (0x03, sp)
	push	a
	call	_nRF_spiTransfer
	pop	a
;	user/nRF24L01.c: 104: data = nRF_spiTransfer(0);  //read data
	push	#0x00
	call	_nRF_spiTransfer
	addw	sp, #1
;	user/nRF24L01.c: 105: SetCSN;   // CSN high, terminate SPI communication
	push	a
	push	#0x20
	push	#0x14
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
	pop	a
;	user/nRF24L01.c: 106: return(data); 
	ret
;	user/nRF24L01.c: 109: uint8_t nRF_Write_Reg(uint8_t RegAddr,uint8_t data)
;	-----------------------------------------
;	 function nRF_Write_Reg
;	-----------------------------------------
_nRF_Write_Reg:
	push	a
;	user/nRF24L01.c: 113: ClrCSN; 
	push	#0x20
	push	#0x14
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
;	user/nRF24L01.c: 114: status = nRF_spiTransfer(RegAddr);
	ld	a, (0x04, sp)
	push	a
	call	_nRF_spiTransfer
	addw	sp, #1
	ld	(0x01, sp), a
;	user/nRF24L01.c: 115: nRF_spiTransfer(data);
	ld	a, (0x05, sp)
	push	a
	call	_nRF_spiTransfer
	pop	a
;	user/nRF24L01.c: 116: SetCSN;
	push	#0x20
	push	#0x14
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
;	user/nRF24L01.c: 117: return(status);
	ld	a, (0x01, sp)
	addw	sp, #1
	ret
;	user/nRF24L01.c: 120: uint8_t nRF_SPI_Read_Buf(uint8_t RegAddr, uint8_t *buff, uint8_t len)
;	-----------------------------------------
;	 function nRF_SPI_Read_Buf
;	-----------------------------------------
_nRF_SPI_Read_Buf:
	pushw	x
;	user/nRF24L01.c: 123: ClrCSN;
	push	#0x20
	push	#0x14
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
;	user/nRF24L01.c: 124: status = nRF_spiTransfer(RegAddr);
	ld	a, (0x05, sp)
	push	a
	call	_nRF_spiTransfer
	addw	sp, #1
	ld	(0x02, sp), a
;	user/nRF24L01.c: 125: for(i = 0; i < len; i++)
	clr	(0x01, sp)
00103$:
	ld	a, (0x01, sp)
	cp	a, (0x08, sp)
	jrnc	00101$
;	user/nRF24L01.c: 126: buff[i] = nRF_spiTransfer(0);
	clrw	x
	ld	a, (0x01, sp)
	ld	xl, a
	addw	x, (0x06, sp)
	pushw	x
	push	#0x00
	call	_nRF_spiTransfer
	addw	sp, #1
	popw	x
	ld	(x), a
;	user/nRF24L01.c: 125: for(i = 0; i < len; i++)
	inc	(0x01, sp)
	jra	00103$
00101$:
;	user/nRF24L01.c: 127: SetCSN;
	push	#0x20
	push	#0x14
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
;	user/nRF24L01.c: 128: return(status);
	ld	a, (0x02, sp)
	popw	x
	ret
;	user/nRF24L01.c: 131: uint8_t nRF_SPI_Write_Buf(uint8_t RegAddr, uint8_t *buff, uint8_t len)
;	-----------------------------------------
;	 function nRF_SPI_Write_Buf
;	-----------------------------------------
_nRF_SPI_Write_Buf:
	pushw	x
;	user/nRF24L01.c: 134: ClrCSN;
	push	#0x20
	push	#0x14
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
;	user/nRF24L01.c: 135: status = nRF_spiTransfer(RegAddr);
	ld	a, (0x05, sp)
	push	a
	call	_nRF_spiTransfer
	addw	sp, #1
	ld	(0x01, sp), a
;	user/nRF24L01.c: 136: for(i = 0; i < len; i++)
	ldw	x, (0x06, sp)
	clr	(0x02, sp)
00103$:
	ld	a, (0x02, sp)
	cp	a, (0x08, sp)
	jrnc	00101$
;	user/nRF24L01.c: 138: nRF_spiTransfer(*buff);
	ld	a, (x)
	pushw	x
	push	a
	call	_nRF_spiTransfer
	pop	a
	popw	x
;	user/nRF24L01.c: 139: buff++;
	incw	x
;	user/nRF24L01.c: 136: for(i = 0; i < len; i++)
	inc	(0x02, sp)
	jra	00103$
00101$:
;	user/nRF24L01.c: 141: SetCSN;
	push	#0x20
	push	#0x14
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
;	user/nRF24L01.c: 142: return(status);
	ld	a, (0x01, sp)
	popw	x
	ret
;	user/nRF24L01.c: 145: void nRF_Set_RxMode(void)
;	-----------------------------------------
;	 function nRF_Set_RxMode
;	-----------------------------------------
_nRF_Set_RxMode:
;	user/nRF24L01.c: 148: ClrCE;
	push	#0x10
	push	#0x19
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
;	user/nRF24L01.c: 149: status = nRF_Read(CONFIG);
	push	#0x00
	call	_nRF_Read
	addw	sp, #1
;	user/nRF24L01.c: 150: status = (status&0xFE)|PRIM_RX;
	and	a, #0xfe
	or	a, #0x01
;	user/nRF24L01.c: 151: nRF_Write_Reg(W_REGISTER + CONFIG, status);
	push	a
	push	#0x20
	call	_nRF_Write_Reg
	popw	x
;	user/nRF24L01.c: 152: SetCE;
	push	#0x10
	push	#0x19
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
;	user/nRF24L01.c: 153: status = nRF_Read_Status();
	call	_nRF_Read_Status
;	user/nRF24L01.c: 154: nRF_Clear_Status(status|IRQ_RX_dataready); // Clear Data Ready RX FIFO interrupt
	or	a, #0x40
	push	a
	call	_nRF_Clear_Status
	pop	a
;	user/nRF24L01.c: 155: nRF_Write_Reg(FLUSH_RX, 0x00); //Clear RX FIFO Buf
	push	#0x00
	push	#0xe2
	call	_nRF_Write_Reg
	popw	x
	ret
;	user/nRF24L01.c: 169: void nRF_Set_TxMode(void)
;	-----------------------------------------
;	 function nRF_Set_TxMode
;	-----------------------------------------
_nRF_Set_TxMode:
;	user/nRF24L01.c: 172: ClrCE;
	push	#0x10
	push	#0x19
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
;	user/nRF24L01.c: 173: nRF_delay(10);
	push	#0x0a
	clrw	x
	pushw	x
	push	#0x00
	call	_nRF_delay
	addw	sp, #4
;	user/nRF24L01.c: 174: status = nRF_Read(CONFIG);
	push	#0x00
	call	_nRF_Read
	addw	sp, #1
;	user/nRF24L01.c: 175: status = (status&0xFE)|PRIM_TX;
	and	a, #0xfe
;	user/nRF24L01.c: 176: nRF_Write_Reg(W_REGISTER + CONFIG, status);
	push	a
	push	#0x20
	call	_nRF_Write_Reg
	popw	x
;	user/nRF24L01.c: 177: SetCE;
	push	#0x10
	push	#0x19
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
;	user/nRF24L01.c: 179: status = nRF_Read_Status();
	call	_nRF_Read_Status
;	user/nRF24L01.c: 180: nRF_Clear_Status(status|IRQ_TX_datasent|IRQ_MAX_retransmit); // Clear Data Sent TX FIFO interrupt,Maximum number of TX retransmits interrupt
	or	a, #0x30
	push	a
	call	_nRF_Clear_Status
	pop	a
;	user/nRF24L01.c: 181: nRF_Write_Reg(FLUSH_TX, 0x00);					 				      // Clear TX FIFO Buf
	push	#0x00
	push	#0xe1
	call	_nRF_Write_Reg
	popw	x
	ret
;	user/nRF24L01.c: 200: void nRF_Set_Channel(uint8_t channel)
;	-----------------------------------------
;	 function nRF_Set_Channel
;	-----------------------------------------
_nRF_Set_Channel:
;	user/nRF24L01.c: 202: if (channel > 127)
	ld	a, (0x03, sp)
	cp	a, #0x7f
	jrule	00102$
;	user/nRF24L01.c: 203: channel = 127;
	ld	a, #0x7f
	ld	(0x03, sp), a
00102$:
;	user/nRF24L01.c: 204: nRF_Write_Reg(W_REGISTER + RF_CH, channel);
	ld	a, (0x03, sp)
	push	a
	push	#0x25
	call	_nRF_Write_Reg
	popw	x
	ret
;	user/nRF24L01.c: 207: void nRF_ClearSend(void)
;	-----------------------------------------
;	 function nRF_ClearSend
;	-----------------------------------------
_nRF_ClearSend:
;	user/nRF24L01.c: 209: nRF_Write_Reg(W_REGISTER + STATUS, 0XFF);
	push	#0xff
	push	#0x27
	call	_nRF_Write_Reg
	popw	x
	ret
;	user/nRF24L01.c: 212: void nRF_Set_Tx_Addr(uint8_t *add)
;	-----------------------------------------
;	 function nRF_Set_Tx_Addr
;	-----------------------------------------
_nRF_Set_Tx_Addr:
;	user/nRF24L01.c: 214: nRF_SPI_Write_Buf(W_REGISTER + TX_ADDR, add, ADR_WIDTH);
	push	#0x05
	ldw	x, (0x04, sp)
	pushw	x
	push	#0x30
	call	_nRF_SPI_Write_Buf
	addw	sp, #4
	ret
;	user/nRF24L01.c: 217: void nRF_Set_Rx_Addr(uint8_t *add)
;	-----------------------------------------
;	 function nRF_Set_Rx_Addr
;	-----------------------------------------
_nRF_Set_Rx_Addr:
;	user/nRF24L01.c: 219: nRF_SPI_Write_Buf(W_REGISTER + RX_ADDR_P0, add, ADR_WIDTH);
	push	#0x05
	ldw	x, (0x04, sp)
	pushw	x
	push	#0x2a
	call	_nRF_SPI_Write_Buf
	addw	sp, #4
	ret
;	user/nRF24L01.c: 222: void nRF_Clear_Status(uint8_t clear)
;	-----------------------------------------
;	 function nRF_Clear_Status
;	-----------------------------------------
_nRF_Clear_Status:
;	user/nRF24L01.c: 224: nRF_Write_Reg(W_REGISTER + STATUS, clear);
	ld	a, (0x03, sp)
	push	a
	push	#0x27
	call	_nRF_Write_Reg
	popw	x
	ret
;	user/nRF24L01.c: 227: uint8_t nRF_Read_Status(void)
;	-----------------------------------------
;	 function nRF_Read_Status
;	-----------------------------------------
_nRF_Read_Status:
;	user/nRF24L01.c: 230: status = nRF_Read(STATUS);
	push	#0x07
	call	_nRF_Read
	addw	sp, #1
;	user/nRF24L01.c: 231: return status;
	ret
;	user/nRF24L01.c: 234: uint8_t nRF_Read_Lost_Packet(void)
;	-----------------------------------------
;	 function nRF_Read_Lost_Packet
;	-----------------------------------------
_nRF_Read_Lost_Packet:
;	user/nRF24L01.c: 237: status = nRF_Read(OBSERVE_TX);
	push	#0x08
	call	_nRF_Read
	addw	sp, #1
;	user/nRF24L01.c: 238: return((status&0xF0)>>4);
	and	a, #0xf0
	swap	a
	and	a, #0x0f
	ret
;	user/nRF24L01.c: 241: uint8_t nRF_Read_Power_Detector(void)
;	-----------------------------------------
;	 function nRF_Read_Power_Detector
;	-----------------------------------------
_nRF_Read_Power_Detector:
;	user/nRF24L01.c: 244: status = nRF_Read(STATUS);
	push	#0x07
	call	_nRF_Read
	addw	sp, #1
;	user/nRF24L01.c: 245: return status;
	ret
;	user/nRF24L01.c: 248: uint8_t nRF_Read_Retransmitted_Packet(void)
;	-----------------------------------------
;	 function nRF_Read_Retransmitted_Packet
;	-----------------------------------------
_nRF_Read_Retransmitted_Packet:
;	user/nRF24L01.c: 251: status = nRF_Read(OBSERVE_TX);
	push	#0x08
	call	_nRF_Read
	addw	sp, #1
;	user/nRF24L01.c: 252: return (status&0x0F); 
	and	a, #0x0f
	ret
;	user/nRF24L01.c: 255: uint8_t nRF_RxPacket(uint8_t *rxbuf)
;	-----------------------------------------
;	 function nRF_RxPacket
;	-----------------------------------------
_nRF_RxPacket:
;	user/nRF24L01.c: 258: flag = nRF_Read_Status();
	call	_nRF_Read_Status
;	user/nRF24L01.c: 259: if(flag & IRQ_RX_dataready) //Data Ready RX FIFO interrupt
	bcp	a, #0x40
	jreq	00102$
;	user/nRF24L01.c: 261: nRF_Clear_Status(flag); // Write 1 to clear bit IRQ_RX_dataready
	push	a
	push	a
	call	_nRF_Clear_Status
	pop	a
	pop	a
;	user/nRF24L01.c: 262: nRF_SPI_Read_Buf(R_RX_PAYLOAD, rxbuf, RX_PLOAD_WIDTH); //read receive payload from RX_FIFO buffer
	push	a
	push	#0x20
	ldw	x, (0x05, sp)
	pushw	x
	push	#0x61
	call	_nRF_SPI_Read_Buf
	addw	sp, #4
	push	#0x00
	push	#0xe2
	call	_nRF_Write_Reg
	popw	x
	pop	a
;	user/nRF24L01.c: 264: return (flag&0x0E)>>1; //return pipe
	and	a, #0x0e
	srl	a
	ret
00102$:
;	user/nRF24L01.c: 266: return 0x07;
	ld	a, #0x07
	ret
;	user/nRF24L01.c: 269: void nRF_TxPacket(uint8_t *txbuf)
;	-----------------------------------------
;	 function nRF_TxPacket
;	-----------------------------------------
_nRF_TxPacket:
;	user/nRF24L01.c: 272: status = nRF_Read_Status(); // read register STATUS's value
	call	_nRF_Read_Status
;	user/nRF24L01.c: 273: Fifo = nRF_Read(FIFO_STATUS);
	push	a
	push	#0x17
	call	_nRF_Read
	addw	sp, #1
	ld	xl, a
	pop	a
;	user/nRF24L01.c: 274: if((status&IRQ_TX_datasent)||(status&IRQ_MAX_retransmit)||(Fifo&TX_EMPTY))
	bcp	a, #0x20
	jrne	00101$
	bcp	a, #0x10
	jrne	00101$
	push	a
	ld	a, xl
	bcp	a, #0x10
	pop	a
	jrne	00117$
	ret
00117$:
00101$:
;	user/nRF24L01.c: 276: nRF_Clear_Status(status);
	push	a
	call	_nRF_Clear_Status
	pop	a
;	user/nRF24L01.c: 277: nRF_Write_Reg(FLUSH_TX, 0x00);
	push	#0x00
	push	#0xe1
	call	_nRF_Write_Reg
	popw	x
;	user/nRF24L01.c: 278: nRF_SPI_Write_Buf(W_TX_PAYLOAD, txbuf, TX_PLOAD_WIDTH);	
	push	#0x20
	ldw	x, (0x04, sp)
	pushw	x
	push	#0xa0
	call	_nRF_SPI_Write_Buf
	addw	sp, #4
	ret
;	user/nRF24L01.c: 287: void nRF_Debug(void)
;	-----------------------------------------
;	 function nRF_Debug
;	-----------------------------------------
_nRF_Debug:
	sub	sp, #151
;	user/nRF24L01.c: 292: status = nRF_Read(CONFIG);
	push	#0x00
	call	_nRF_Read
	addw	sp, #1
;	user/nRF24L01.c: 293: sprintf(buff_usart,"CONFIG: %2x\r\n",status);
	clr	(0x7c, sp)
	ldw	x, #___str_0+0
	ldw	(0x94, sp), x
	ldw	x, sp
	addw	x, #6
	ldw	(0x8e, sp), x
	ldw	x, (0x8e, sp)
	push	a
	ld	a, (0x7d, sp)
	push	a
	ldw	y, (0x96, sp)
	pushw	y
	pushw	x
	call	_sprintf
	addw	sp, #6
;	user/nRF24L01.c: 294: VCOM_puts(buff_usart);
	ldw	x, (0x8e, sp)
	pushw	x
	call	_VCOM_puts
	popw	x
;	user/nRF24L01.c: 295: status = nRF_Read(EN_AA);
	push	#0x01
	call	_nRF_Read
	addw	sp, #1
;	user/nRF24L01.c: 296: sprintf(buff_usart,"EN_AA: %2x\r\n",status);
	clrw	x
	ld	xl, a
	ldw	y, #___str_1+0
	ldw	(0x8c, sp), y
	ldw	y, (0x8e, sp)
	pushw	x
	ldw	x, (0x8e, sp)
	pushw	x
	pushw	y
	call	_sprintf
	addw	sp, #6
;	user/nRF24L01.c: 297: VCOM_puts(buff_usart);
	ldw	x, (0x8e, sp)
	pushw	x
	call	_VCOM_puts
	popw	x
;	user/nRF24L01.c: 298: status = nRF_Read(EN_RXADDR);
	push	#0x02
	call	_nRF_Read
	addw	sp, #1
;	user/nRF24L01.c: 299: sprintf(buff_usart,"EN_RXADDR: %2x\r\n",status);
	clrw	x
	ld	xl, a
	ldw	y, #___str_2+0
	ldw	(0x82, sp), y
	ldw	y, (0x8e, sp)
	pushw	x
	ldw	x, (0x84, sp)
	pushw	x
	pushw	y
	call	_sprintf
	addw	sp, #6
;	user/nRF24L01.c: 300: VCOM_puts(buff_usart);
	ldw	x, (0x8e, sp)
	pushw	x
	call	_VCOM_puts
	popw	x
;	user/nRF24L01.c: 301: status = nRF_Read(SETUP_AW);
	push	#0x03
	call	_nRF_Read
	addw	sp, #1
;	user/nRF24L01.c: 302: sprintf(buff_usart,"SETUP_AW: %2x\r\n",status);
	clrw	x
	ld	xl, a
	ldw	y, #___str_3+0
	ldw	(0x96, sp), y
	ldw	y, (0x8e, sp)
	pushw	x
	ldw	x, (0x98, sp)
	pushw	x
	pushw	y
	call	_sprintf
	addw	sp, #6
;	user/nRF24L01.c: 303: VCOM_puts(buff_usart);
	ldw	x, (0x8e, sp)
	pushw	x
	call	_VCOM_puts
	popw	x
;	user/nRF24L01.c: 304: status = nRF_Read(SETUP_RETR);
	push	#0x04
	call	_nRF_Read
	addw	sp, #1
;	user/nRF24L01.c: 305: sprintf(buff_usart,"SETUP_RETR: %2x\r\n",status);
	clrw	x
	ld	xl, a
	ldw	y, #___str_4+0
	ldw	(0x80, sp), y
	ldw	y, (0x8e, sp)
	pushw	x
	ldw	x, (0x82, sp)
	pushw	x
	pushw	y
	call	_sprintf
	addw	sp, #6
;	user/nRF24L01.c: 306: VCOM_puts(buff_usart);
	ldw	x, (0x8e, sp)
	pushw	x
	call	_VCOM_puts
	popw	x
;	user/nRF24L01.c: 307: status = nRF_Read(RF_CH);
	push	#0x05
	call	_nRF_Read
	addw	sp, #1
;	user/nRF24L01.c: 308: sprintf(buff_usart,"RF_CH: %2x\r\n",status);
	clrw	x
	ld	xl, a
	ldw	y, #___str_5+0
	ldw	(0x7a, sp), y
	ldw	y, (0x8e, sp)
	pushw	x
	ldw	x, (0x7c, sp)
	pushw	x
	pushw	y
	call	_sprintf
	addw	sp, #6
;	user/nRF24L01.c: 309: VCOM_puts(buff_usart);
	ldw	x, (0x8e, sp)
	pushw	x
	call	_VCOM_puts
	popw	x
;	user/nRF24L01.c: 310: status = nRF_Read(RF_SETUP);
	push	#0x06
	call	_nRF_Read
	addw	sp, #1
;	user/nRF24L01.c: 311: sprintf(buff_usart,"RF_SETUP: %2x\r\n",status);
	clrw	x
	ld	xl, a
	ldw	y, #___str_6+0
	ldw	(0x78, sp), y
	ldw	y, (0x8e, sp)
	pushw	x
	ldw	x, (0x7a, sp)
	pushw	x
	pushw	y
	call	_sprintf
	addw	sp, #6
;	user/nRF24L01.c: 312: VCOM_puts(buff_usart);
	ldw	x, (0x8e, sp)
	pushw	x
	call	_VCOM_puts
	popw	x
;	user/nRF24L01.c: 313: status = nRF_Read(STATUS);
	push	#0x07
	call	_nRF_Read
	addw	sp, #1
;	user/nRF24L01.c: 314: sprintf(buff_usart,"STATUS: %2x\r\n",status);
	clrw	x
	ld	xl, a
	ldw	y, #___str_7+0
	ldw	(0x86, sp), y
	ldw	y, (0x8e, sp)
	pushw	x
	ldw	x, (0x88, sp)
	pushw	x
	pushw	y
	call	_sprintf
	addw	sp, #6
;	user/nRF24L01.c: 315: VCOM_puts(buff_usart);
	ldw	x, (0x8e, sp)
	pushw	x
	call	_VCOM_puts
	popw	x
;	user/nRF24L01.c: 316: status = nRF_Read(OBSERVE_TX);
	push	#0x08
	call	_nRF_Read
	addw	sp, #1
;	user/nRF24L01.c: 317: sprintf(buff_usart,"OBSERVE_TX: %2x\r\n",status);
	clrw	x
	ld	xl, a
	ldw	y, #___str_8+0
	ldw	(0x7e, sp), y
	ldw	y, (0x8e, sp)
	pushw	x
	ldw	x, (0x80, sp)
	pushw	x
	pushw	y
	call	_sprintf
	addw	sp, #6
;	user/nRF24L01.c: 318: VCOM_puts(buff_usart);
	ldw	x, (0x8e, sp)
	pushw	x
	call	_VCOM_puts
	popw	x
;	user/nRF24L01.c: 319: status = nRF_Read(CD);
	push	#0x09
	call	_nRF_Read
	addw	sp, #1
;	user/nRF24L01.c: 320: sprintf(buff_usart,"CD: %2x\r\n",status);
	clrw	x
	ld	xl, a
	ldw	y, #___str_9+0
	ldw	(0x76, sp), y
	ldw	y, (0x8e, sp)
	pushw	x
	ldw	x, (0x78, sp)
	pushw	x
	pushw	y
	call	_sprintf
	addw	sp, #6
;	user/nRF24L01.c: 321: VCOM_puts(buff_usart);
	ldw	x, (0x8e, sp)
	pushw	x
	call	_VCOM_puts
	popw	x
;	user/nRF24L01.c: 322: nRF_SPI_Read_Buf(RX_ADDR_P0,buff,5);
	ldw	x, sp
	incw	x
	ldw	(0x74, sp), x
	ldw	x, (0x74, sp)
	push	#0x05
	pushw	x
	push	#0x0a
	call	_nRF_SPI_Read_Buf
	addw	sp, #4
;	user/nRF24L01.c: 323: sprintf(buff_usart,"RX_ADDR_P0: %2x%2x%2x%2x%2x\r\n",buff[0],buff[1],buff[2],buff[3],buff[4]);
	ldw	x, (0x74, sp)
	addw	x, #0x0004
	ldw	(0x8a, sp), x
	ldw	x, (0x8a, sp)
	ld	a, (x)
	ld	(0x85, sp), a
	clr	(0x84, sp)
	ldw	x, (0x74, sp)
	addw	x, #0x0003
	ldw	(0x72, sp), x
	ldw	x, (0x72, sp)
	ld	a, (x)
	clrw	x
	ld	xl, a
	ldw	y, (0x74, sp)
	incw	y
	incw	y
	ldw	(0x92, sp), y
	ldw	y, (0x92, sp)
	ld	a, (y)
	ld	(0x91, sp), a
	clr	(0x90, sp)
	ldw	y, (0x74, sp)
	incw	y
	ldw	(0x88, sp), y
	ldw	y, (0x88, sp)
	ld	a, (y)
	ld	(0x5d, sp), a
	clr	(0x5c, sp)
	ldw	y, (0x74, sp)
	ld	a, (y)
	clr	(0x50, sp)
	ldw	y, #___str_10+0
	ldw	(0x4c, sp), y
	ldw	y, (0x8e, sp)
	ldw	(0x4e, sp), y
	ldw	y, (0x84, sp)
	pushw	y
	pushw	x
	ldw	x, (0x94, sp)
	pushw	x
	ldw	x, (0x62, sp)
	pushw	x
	push	a
	ld	a, (0x59, sp)
	push	a
	ldw	x, (0x56, sp)
	pushw	x
	ldw	x, (0x5a, sp)
	pushw	x
	call	_sprintf
	addw	sp, #14
;	user/nRF24L01.c: 324: VCOM_puts(buff_usart);
	ldw	x, (0x8e, sp)
	pushw	x
	call	_VCOM_puts
	popw	x
;	user/nRF24L01.c: 325: nRF_SPI_Read_Buf(RX_ADDR_P1,buff,5);
	ldw	x, (0x74, sp)
	push	#0x05
	pushw	x
	push	#0x0b
	call	_nRF_SPI_Read_Buf
	addw	sp, #4
;	user/nRF24L01.c: 326: sprintf(buff_usart,"RX_ADDR_P1: %2x%2x%2x%2x%2x\r\n",buff[0],buff[1],buff[2],buff[3],buff[4]);
	ldw	x, (0x8a, sp)
	ld	a, (x)
	ld	(0x71, sp), a
	clr	(0x70, sp)
	ldw	x, (0x72, sp)
	ld	a, (x)
	ld	(0x59, sp), a
	clr	(0x58, sp)
	ldw	x, (0x92, sp)
	ld	a, (x)
	ld	(0x67, sp), a
	clr	(0x66, sp)
	ldw	x, (0x88, sp)
	ld	a, (x)
	ld	(0x6d, sp), a
	clr	(0x6c, sp)
	ldw	x, (0x74, sp)
	ld	a, (x)
	clr	(0x6a, sp)
	ldw	x, #___str_11+0
	ldw	(0x4a, sp), x
	ldw	y, (0x8e, sp)
	ldw	x, (0x70, sp)
	pushw	x
	ldw	x, (0x5a, sp)
	pushw	x
	ldw	x, (0x6a, sp)
	pushw	x
	ldw	x, (0x72, sp)
	pushw	x
	push	a
	ld	a, (0x73, sp)
	push	a
	ldw	x, (0x54, sp)
	pushw	x
	pushw	y
	call	_sprintf
	addw	sp, #14
;	user/nRF24L01.c: 327: VCOM_puts(buff_usart);
	ldw	x, (0x8e, sp)
	pushw	x
	call	_VCOM_puts
	popw	x
;	user/nRF24L01.c: 328: status = nRF_Read(RX_ADDR_P2);
	push	#0x0c
	call	_nRF_Read
	addw	sp, #1
;	user/nRF24L01.c: 329: sprintf(buff_usart,"RX_ADDR_P2: %2x\r\n",status);
	clrw	x
	ld	xl, a
	ldw	y, #___str_12+0
	ldw	(0x68, sp), y
	ldw	y, (0x8e, sp)
	pushw	x
	ldw	x, (0x6a, sp)
	pushw	x
	pushw	y
	call	_sprintf
	addw	sp, #6
;	user/nRF24L01.c: 330: VCOM_puts(buff_usart);
	ldw	x, (0x8e, sp)
	pushw	x
	call	_VCOM_puts
	popw	x
;	user/nRF24L01.c: 331: status = nRF_Read(RX_ADDR_P3);
	push	#0x0d
	call	_nRF_Read
	addw	sp, #1
;	user/nRF24L01.c: 332: sprintf(buff_usart,"RX_ADDR_P3: %2x\r\n",status);
	clrw	x
	ld	xl, a
	ldw	y, #___str_13+0
	ldw	(0x44, sp), y
	ldw	y, (0x8e, sp)
	pushw	x
	ldw	x, (0x46, sp)
	pushw	x
	pushw	y
	call	_sprintf
	addw	sp, #6
;	user/nRF24L01.c: 333: VCOM_puts(buff_usart);
	ldw	x, (0x8e, sp)
	pushw	x
	call	_VCOM_puts
	popw	x
;	user/nRF24L01.c: 334: status = nRF_Read(RX_ADDR_P4);
	push	#0x0e
	call	_nRF_Read
	addw	sp, #1
;	user/nRF24L01.c: 335: sprintf(buff_usart,"RX_ADDR_P4: %2x\r\n",status);
	clrw	x
	ld	xl, a
	ldw	y, #___str_14+0
	ldw	(0x38, sp), y
	ldw	y, (0x8e, sp)
	pushw	x
	ldw	x, (0x3a, sp)
	pushw	x
	pushw	y
	call	_sprintf
	addw	sp, #6
;	user/nRF24L01.c: 336: VCOM_puts(buff_usart);
	ldw	x, (0x8e, sp)
	pushw	x
	call	_VCOM_puts
	popw	x
;	user/nRF24L01.c: 337: status = nRF_Read(RX_ADDR_P5);
	push	#0x0f
	call	_nRF_Read
	addw	sp, #1
;	user/nRF24L01.c: 338: sprintf(buff_usart,"RX_ADDR_P5: %2x\r\n",status);
	clrw	x
	ld	xl, a
	ldw	y, #___str_15+0
	ldw	(0x5a, sp), y
	ldw	y, (0x8e, sp)
	pushw	x
	ldw	x, (0x5c, sp)
	pushw	x
	pushw	y
	call	_sprintf
	addw	sp, #6
;	user/nRF24L01.c: 339: VCOM_puts(buff_usart);	
	ldw	x, (0x8e, sp)
	pushw	x
	call	_VCOM_puts
	popw	x
;	user/nRF24L01.c: 340: nRF_SPI_Read_Buf(TX_ADDR,buff,5);
	ldw	x, (0x74, sp)
	push	#0x05
	pushw	x
	push	#0x10
	call	_nRF_SPI_Read_Buf
	addw	sp, #4
;	user/nRF24L01.c: 341: sprintf(buff_usart,"TX_ADDR: %2x%2x%2x%2x%2x\r\n",buff[0],buff[1],buff[2],buff[3],buff[4]);
	ldw	x, (0x8a, sp)
	ld	a, (x)
	ld	(0x41, sp), a
	clr	(0x40, sp)
	ldw	x, (0x72, sp)
	ld	a, (x)
	ld	(0x6f, sp), a
	clr	(0x6e, sp)
	ldw	x, (0x92, sp)
	ld	a, (x)
	ld	(0x63, sp), a
	clr	(0x62, sp)
	ldw	x, (0x88, sp)
	ld	a, (x)
	ld	(0x3d, sp), a
	clr	(0x3c, sp)
	ldw	x, (0x74, sp)
	ld	a, (x)
	clr	(0x64, sp)
	ldw	x, #___str_16+0
	ldw	(0x52, sp), x
	ldw	y, (0x8e, sp)
	ldw	x, (0x40, sp)
	pushw	x
	ldw	x, (0x70, sp)
	pushw	x
	ldw	x, (0x66, sp)
	pushw	x
	ldw	x, (0x42, sp)
	pushw	x
	push	a
	ld	a, (0x6d, sp)
	push	a
	ldw	x, (0x5c, sp)
	pushw	x
	pushw	y
	call	_sprintf
	addw	sp, #14
;	user/nRF24L01.c: 342: VCOM_puts(buff_usart);
	ldw	x, (0x8e, sp)
	pushw	x
	call	_VCOM_puts
	popw	x
;	user/nRF24L01.c: 343: status = nRF_Read(RX_PW_P0);
	push	#0x11
	call	_nRF_Read
	addw	sp, #1
;	user/nRF24L01.c: 344: sprintf(buff_usart,"RX_PW_P0: %2x\r\n",status);
	clrw	x
	ld	xl, a
	ldw	y, #___str_17+0
	ldw	(0x60, sp), y
	ldw	y, (0x8e, sp)
	pushw	x
	ldw	x, (0x62, sp)
	pushw	x
	pushw	y
	call	_sprintf
	addw	sp, #6
;	user/nRF24L01.c: 345: VCOM_puts(buff_usart);
	ldw	x, (0x8e, sp)
	pushw	x
	call	_VCOM_puts
	popw	x
;	user/nRF24L01.c: 346: status = nRF_Read(RX_PW_P1);
	push	#0x12
	call	_nRF_Read
	addw	sp, #1
;	user/nRF24L01.c: 347: sprintf(buff_usart,"RX_PW_P1: %2x\r\n",status);
	clrw	x
	ld	xl, a
	ldw	y, #___str_18+0
	ldw	(0x3e, sp), y
	ldw	y, (0x8e, sp)
	pushw	x
	ldw	x, (0x40, sp)
	pushw	x
	pushw	y
	call	_sprintf
	addw	sp, #6
;	user/nRF24L01.c: 348: VCOM_puts(buff_usart);
	ldw	x, (0x8e, sp)
	pushw	x
	call	_VCOM_puts
	popw	x
;	user/nRF24L01.c: 349: status = nRF_Read(RX_PW_P2);
	push	#0x13
	call	_nRF_Read
	addw	sp, #1
;	user/nRF24L01.c: 350: sprintf(buff_usart,"RX_PW_P2: %2x\r\n",status);
	clrw	x
	ld	xl, a
	ldw	y, #___str_19+0
	ldw	(0x5e, sp), y
	ldw	y, (0x8e, sp)
	pushw	x
	ldw	x, (0x60, sp)
	pushw	x
	pushw	y
	call	_sprintf
	addw	sp, #6
;	user/nRF24L01.c: 351: VCOM_puts(buff_usart);
	ldw	x, (0x8e, sp)
	pushw	x
	call	_VCOM_puts
	popw	x
;	user/nRF24L01.c: 352: status = nRF_Read(RX_PW_P3);
	push	#0x14
	call	_nRF_Read
	addw	sp, #1
;	user/nRF24L01.c: 353: sprintf(buff_usart,"RX_PW_P3: %2x\r\n",status);
	clrw	x
	ld	xl, a
	ldw	y, #___str_20+0
	ldw	(0x56, sp), y
	ldw	y, (0x8e, sp)
	pushw	x
	ldw	x, (0x58, sp)
	pushw	x
	pushw	y
	call	_sprintf
	addw	sp, #6
;	user/nRF24L01.c: 354: VCOM_puts(buff_usart);
	ldw	x, (0x8e, sp)
	pushw	x
	call	_VCOM_puts
	popw	x
;	user/nRF24L01.c: 355: status = nRF_Read(RX_PW_P4);
	push	#0x15
	call	_nRF_Read
	addw	sp, #1
;	user/nRF24L01.c: 356: sprintf(buff_usart,"RX_PW_P4: %2x\r\n",status);
	clrw	x
	ld	xl, a
	ldw	y, #___str_21+0
	ldw	(0x48, sp), y
	ldw	y, (0x8e, sp)
	pushw	x
	ldw	x, (0x4a, sp)
	pushw	x
	pushw	y
	call	_sprintf
	addw	sp, #6
;	user/nRF24L01.c: 357: VCOM_puts(buff_usart);
	ldw	x, (0x8e, sp)
	pushw	x
	call	_VCOM_puts
	popw	x
;	user/nRF24L01.c: 358: status = nRF_Read(RX_PW_P5);
	push	#0x16
	call	_nRF_Read
	addw	sp, #1
;	user/nRF24L01.c: 359: sprintf(buff_usart,"RX_PW_P5: %2x\r\n",status);
	clrw	x
	ld	xl, a
	ldw	y, #___str_22+0
	ldw	(0x54, sp), y
	ldw	y, (0x8e, sp)
	pushw	x
	ldw	x, (0x56, sp)
	pushw	x
	pushw	y
	call	_sprintf
	addw	sp, #6
;	user/nRF24L01.c: 360: VCOM_puts(buff_usart);
	ldw	x, (0x8e, sp)
	pushw	x
	call	_VCOM_puts
	popw	x
;	user/nRF24L01.c: 361: status = nRF_Read(FIFO_STATUS);
	push	#0x17
	call	_nRF_Read
	addw	sp, #1
;	user/nRF24L01.c: 362: sprintf(buff_usart,"FIFO_STATUS: %2x\r\n",status);
	clrw	x
	ld	xl, a
	ldw	y, #___str_23+0
	ldw	(0x46, sp), y
	ldw	y, (0x8e, sp)
	pushw	x
	ldw	x, (0x48, sp)
	pushw	x
	pushw	y
	call	_sprintf
	addw	sp, #6
;	user/nRF24L01.c: 363: VCOM_puts(buff_usart);
	ldw	x, (0x8e, sp)
	pushw	x
	call	_VCOM_puts
	popw	x
;	user/nRF24L01.c: 364: status = nRF_Read(DYNPD);
	push	#0x1c
	call	_nRF_Read
	addw	sp, #1
;	user/nRF24L01.c: 365: sprintf(buff_usart,"DYNPD: %2x\r\n",status);
	clrw	x
	ld	xl, a
	ldw	y, #___str_24+0
	ldw	(0x3a, sp), y
	ldw	y, (0x8e, sp)
	pushw	x
	ldw	x, (0x3c, sp)
	pushw	x
	pushw	y
	call	_sprintf
	addw	sp, #6
;	user/nRF24L01.c: 366: VCOM_puts(buff_usart);
	ldw	x, (0x8e, sp)
	pushw	x
	call	_VCOM_puts
	popw	x
;	user/nRF24L01.c: 367: status = nRF_Read(FEATURE);
	push	#0x1d
	call	_nRF_Read
	addw	sp, #1
;	user/nRF24L01.c: 368: sprintf(buff_usart,"FEATURE: %2x\r\n",status);
	clrw	x
	ld	xl, a
	ldw	y, #___str_25+0
	ldw	(0x42, sp), y
	ldw	y, (0x8e, sp)
	pushw	x
	ldw	x, (0x44, sp)
	pushw	x
	pushw	y
	call	_sprintf
	addw	sp, #6
;	user/nRF24L01.c: 369: VCOM_puts(buff_usart);
	ldw	x, (0x8e, sp)
	pushw	x
	call	_VCOM_puts
	addw	sp, #153
	ret
	.area CODE
___str_0:
	.ascii "CONFIG: %2x"
	.db 0x0d
	.db 0x0a
	.db 0x00
___str_1:
	.ascii "EN_AA: %2x"
	.db 0x0d
	.db 0x0a
	.db 0x00
___str_2:
	.ascii "EN_RXADDR: %2x"
	.db 0x0d
	.db 0x0a
	.db 0x00
___str_3:
	.ascii "SETUP_AW: %2x"
	.db 0x0d
	.db 0x0a
	.db 0x00
___str_4:
	.ascii "SETUP_RETR: %2x"
	.db 0x0d
	.db 0x0a
	.db 0x00
___str_5:
	.ascii "RF_CH: %2x"
	.db 0x0d
	.db 0x0a
	.db 0x00
___str_6:
	.ascii "RF_SETUP: %2x"
	.db 0x0d
	.db 0x0a
	.db 0x00
___str_7:
	.ascii "STATUS: %2x"
	.db 0x0d
	.db 0x0a
	.db 0x00
___str_8:
	.ascii "OBSERVE_TX: %2x"
	.db 0x0d
	.db 0x0a
	.db 0x00
___str_9:
	.ascii "CD: %2x"
	.db 0x0d
	.db 0x0a
	.db 0x00
___str_10:
	.ascii "RX_ADDR_P0: %2x%2x%2x%2x%2x"
	.db 0x0d
	.db 0x0a
	.db 0x00
___str_11:
	.ascii "RX_ADDR_P1: %2x%2x%2x%2x%2x"
	.db 0x0d
	.db 0x0a
	.db 0x00
___str_12:
	.ascii "RX_ADDR_P2: %2x"
	.db 0x0d
	.db 0x0a
	.db 0x00
___str_13:
	.ascii "RX_ADDR_P3: %2x"
	.db 0x0d
	.db 0x0a
	.db 0x00
___str_14:
	.ascii "RX_ADDR_P4: %2x"
	.db 0x0d
	.db 0x0a
	.db 0x00
___str_15:
	.ascii "RX_ADDR_P5: %2x"
	.db 0x0d
	.db 0x0a
	.db 0x00
___str_16:
	.ascii "TX_ADDR: %2x%2x%2x%2x%2x"
	.db 0x0d
	.db 0x0a
	.db 0x00
___str_17:
	.ascii "RX_PW_P0: %2x"
	.db 0x0d
	.db 0x0a
	.db 0x00
___str_18:
	.ascii "RX_PW_P1: %2x"
	.db 0x0d
	.db 0x0a
	.db 0x00
___str_19:
	.ascii "RX_PW_P2: %2x"
	.db 0x0d
	.db 0x0a
	.db 0x00
___str_20:
	.ascii "RX_PW_P3: %2x"
	.db 0x0d
	.db 0x0a
	.db 0x00
___str_21:
	.ascii "RX_PW_P4: %2x"
	.db 0x0d
	.db 0x0a
	.db 0x00
___str_22:
	.ascii "RX_PW_P5: %2x"
	.db 0x0d
	.db 0x0a
	.db 0x00
___str_23:
	.ascii "FIFO_STATUS: %2x"
	.db 0x0d
	.db 0x0a
	.db 0x00
___str_24:
	.ascii "DYNPD: %2x"
	.db 0x0d
	.db 0x0a
	.db 0x00
___str_25:
	.ascii "FEATURE: %2x"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area INITIALIZER
	.area CABS (ABS)
