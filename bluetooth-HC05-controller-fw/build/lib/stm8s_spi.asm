;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW64)
;--------------------------------------------------------
	.module stm8s_spi
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _SPI_DeInit
	.globl _SPI_Init
	.globl _SPI_Cmd
	.globl _SPI_ITConfig
	.globl _SPI_SendData
	.globl _SPI_ReceiveData
	.globl _SPI_NSSInternalSoftwareCmd
	.globl _SPI_TransmitCRC
	.globl _SPI_CalculateCRCCmd
	.globl _SPI_GetCRC
	.globl _SPI_ResetCRC
	.globl _SPI_GetCRCPolynomial
	.globl _SPI_BiDirectionalLineConfig
	.globl _SPI_GetFlagStatus
	.globl _SPI_ClearFlag
	.globl _SPI_GetITStatus
	.globl _SPI_ClearITPendingBit
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
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
;	lib/stm8s_spi.c: 13: void SPI_DeInit(void)
;	-----------------------------------------
;	 function SPI_DeInit
;	-----------------------------------------
_SPI_DeInit:
;	lib/stm8s_spi.c: 15: SPI->CR1    = SPI_CR1_RESET_VALUE;
	mov	0x5200+0, #0x00
;	lib/stm8s_spi.c: 16: SPI->CR2    = SPI_CR2_RESET_VALUE;
	mov	0x5201+0, #0x00
;	lib/stm8s_spi.c: 17: SPI->ICR    = SPI_ICR_RESET_VALUE;
	mov	0x5202+0, #0x00
;	lib/stm8s_spi.c: 18: SPI->SR     = SPI_SR_RESET_VALUE;
	mov	0x5203+0, #0x02
;	lib/stm8s_spi.c: 19: SPI->CRCPR  = SPI_CRCPR_RESET_VALUE;
	mov	0x5205+0, #0x07
	ret
;	lib/stm8s_spi.c: 22: void SPI_Init(SPI_FirstBit_TypeDef FirstBit, SPI_BaudRatePrescaler_TypeDef BaudRatePrescaler, SPI_Mode_TypeDef Mode, SPI_ClockPolarity_TypeDef ClockPolarity, SPI_ClockPhase_TypeDef ClockPhase, SPI_DataDirection_TypeDef Data_Direction, SPI_NSS_TypeDef Slave_Management, uint8_t CRCPolynomial)
;	-----------------------------------------
;	 function SPI_Init
;	-----------------------------------------
_SPI_Init:
	push	a
;	lib/stm8s_spi.c: 25: SPI->CR1 = (uint8_t)((uint8_t)((uint8_t)FirstBit | BaudRatePrescaler) |
	ld	a, (0x04, sp)
	or	a, (0x05, sp)
	ld	(0x01, sp), a
;	lib/stm8s_spi.c: 26: (uint8_t)((uint8_t)ClockPolarity | ClockPhase));
	ld	a, (0x07, sp)
	or	a, (0x08, sp)
	or	a, (0x01, sp)
	ldw	x, #0x5200
	ld	(x), a
;	lib/stm8s_spi.c: 29: SPI->CR2 = (uint8_t)((uint8_t)(Data_Direction) | (uint8_t)(Slave_Management));
	ld	a, (0x09, sp)
	or	a, (0x0a, sp)
	ldw	x, #0x5201
	ld	(x), a
;	lib/stm8s_spi.c: 31: if (Mode == SPI_MODE_MASTER)
	ld	a, (0x06, sp)
	cp	a, #0x04
	jrne	00102$
;	lib/stm8s_spi.c: 33: SPI->CR2 |= (uint8_t)SPI_CR2_SSI;
	bset	0x5201, #0
	jra	00103$
00102$:
;	lib/stm8s_spi.c: 37: SPI->CR2 &= (uint8_t)~(SPI_CR2_SSI);
	bres	0x5201, #0
00103$:
;	lib/stm8s_spi.c: 41: SPI->CR1 |= (uint8_t)(Mode);
	ldw	x, #0x5200
	ld	a, (x)
	or	a, (0x06, sp)
	ldw	x, #0x5200
	ld	(x), a
;	lib/stm8s_spi.c: 44: SPI->CRCPR = (uint8_t)CRCPolynomial;
	ldw	x, #0x5205
	ld	a, (0x0b, sp)
	ld	(x), a
	pop	a
	ret
;	lib/stm8s_spi.c: 47: void SPI_Cmd(FunctionalState NewState)
;	-----------------------------------------
;	 function SPI_Cmd
;	-----------------------------------------
_SPI_Cmd:
;	lib/stm8s_spi.c: 50: if (NewState != DISABLE)
	tnz	(0x03, sp)
	jreq	00102$
;	lib/stm8s_spi.c: 52: SPI->CR1 |= SPI_CR1_SPE; /* Enable the SPI peripheral*/
	ldw	x, #0x5200
	ld	a, (x)
	or	a, #0x40
	ld	(x), a
	ret
00102$:
;	lib/stm8s_spi.c: 56: SPI->CR1 &= (uint8_t)(~SPI_CR1_SPE); /* Disable the SPI peripheral*/
	ldw	x, #0x5200
	ld	a, (x)
	and	a, #0xbf
	ld	(x), a
	ret
;	lib/stm8s_spi.c: 60: void SPI_ITConfig(SPI_IT_TypeDef SPI_IT, FunctionalState NewState)
;	-----------------------------------------
;	 function SPI_ITConfig
;	-----------------------------------------
_SPI_ITConfig:
	pushw	x
;	lib/stm8s_spi.c: 65: itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)SPI_IT & (uint8_t)0x0F));
	ld	a, (0x05, sp)
	and	a, #0x0f
	ld	xl, a
	ld	a, #0x01
	push	a
	ld	a, xl
	tnz	a
	jreq	00111$
00110$:
	sll	(1, sp)
	dec	a
	jrne	00110$
00111$:
	pop	a
	ld	(0x01, sp), a
;	lib/stm8s_spi.c: 67: if (NewState != DISABLE)
	tnz	(0x06, sp)
	jreq	00102$
;	lib/stm8s_spi.c: 69: SPI->ICR |= itpos; /* Enable interrupt*/
	ldw	x, #0x5202
	ld	a, (x)
	or	a, (0x01, sp)
	ldw	x, #0x5202
	ld	(x), a
	jra	00104$
00102$:
;	lib/stm8s_spi.c: 73: SPI->ICR &= (uint8_t)(~itpos); /* Disable interrupt*/
	ldw	x, #0x5202
	ld	a, (x)
	ld	(0x02, sp), a
	ld	a, (0x01, sp)
	cpl	a
	and	a, (0x02, sp)
	ldw	x, #0x5202
	ld	(x), a
00104$:
	popw	x
	ret
;	lib/stm8s_spi.c: 77: void SPI_SendData(uint8_t Data)
;	-----------------------------------------
;	 function SPI_SendData
;	-----------------------------------------
_SPI_SendData:
;	lib/stm8s_spi.c: 79: SPI->DR = Data; 
	ldw	x, #0x5204
	ld	a, (0x03, sp)
	ld	(x), a
	ret
;	lib/stm8s_spi.c: 82: uint8_t SPI_ReceiveData(void)
;	-----------------------------------------
;	 function SPI_ReceiveData
;	-----------------------------------------
_SPI_ReceiveData:
;	lib/stm8s_spi.c: 84: return ((uint8_t)SPI->DR); 
	ldw	x, #0x5204
	ld	a, (x)
	ret
;	lib/stm8s_spi.c: 87: void SPI_NSSInternalSoftwareCmd(FunctionalState NewState)
;	-----------------------------------------
;	 function SPI_NSSInternalSoftwareCmd
;	-----------------------------------------
_SPI_NSSInternalSoftwareCmd:
;	lib/stm8s_spi.c: 89: if (NewState != DISABLE)
	tnz	(0x03, sp)
	jreq	00102$
;	lib/stm8s_spi.c: 91: SPI->CR2 |= SPI_CR2_SSI; /* Set NSS pin internally by software*/
	bset	0x5201, #0
	ret
00102$:
;	lib/stm8s_spi.c: 95: SPI->CR2 &= (uint8_t)(~SPI_CR2_SSI); /* Reset NSS pin internally by software*/
	bres	0x5201, #0
	ret
;	lib/stm8s_spi.c: 99: void SPI_TransmitCRC(void)
;	-----------------------------------------
;	 function SPI_TransmitCRC
;	-----------------------------------------
_SPI_TransmitCRC:
;	lib/stm8s_spi.c: 101: SPI->CR2 |= SPI_CR2_CRCNEXT; /* Enable the CRC transmission*/
	ldw	x, #0x5201
	ld	a, (x)
	or	a, #0x10
	ld	(x), a
	ret
;	lib/stm8s_spi.c: 104: void SPI_CalculateCRCCmd(FunctionalState NewState)
;	-----------------------------------------
;	 function SPI_CalculateCRCCmd
;	-----------------------------------------
_SPI_CalculateCRCCmd:
;	lib/stm8s_spi.c: 107: if (NewState != DISABLE)
	tnz	(0x03, sp)
	jreq	00102$
;	lib/stm8s_spi.c: 109: SPI->CR2 |= SPI_CR2_CRCEN; /* Enable the CRC calculation*/
	ldw	x, #0x5201
	ld	a, (x)
	or	a, #0x20
	ld	(x), a
	ret
00102$:
;	lib/stm8s_spi.c: 113: SPI->CR2 &= (uint8_t)(~SPI_CR2_CRCEN); /* Disable the CRC calculation*/
	ldw	x, #0x5201
	ld	a, (x)
	and	a, #0xdf
	ld	(x), a
	ret
;	lib/stm8s_spi.c: 117: uint8_t SPI_GetCRC(SPI_CRC_TypeDef SPI_CRC)
;	-----------------------------------------
;	 function SPI_GetCRC
;	-----------------------------------------
_SPI_GetCRC:
;	lib/stm8s_spi.c: 122: if (SPI_CRC != SPI_CRC_RX)
	tnz	(0x03, sp)
	jreq	00102$
;	lib/stm8s_spi.c: 124: crcreg = SPI->TXCRCR;  /* Get the Tx CRC register*/
	ldw	x, #0x5207
	ld	a, (x)
	ret
00102$:
;	lib/stm8s_spi.c: 128: crcreg = SPI->RXCRCR; /* Get the Rx CRC register*/
	ldw	x, #0x5206
	ld	a, (x)
;	lib/stm8s_spi.c: 132: return crcreg;
	ret
;	lib/stm8s_spi.c: 135: void SPI_ResetCRC(void)
;	-----------------------------------------
;	 function SPI_ResetCRC
;	-----------------------------------------
_SPI_ResetCRC:
;	lib/stm8s_spi.c: 139: SPI_CalculateCRCCmd(ENABLE);
	push	#0x01
	call	_SPI_CalculateCRCCmd
	pop	a
;	lib/stm8s_spi.c: 142: SPI_Cmd(ENABLE);
	push	#0x01
	call	_SPI_Cmd
	pop	a
	ret
;	lib/stm8s_spi.c: 150: uint8_t SPI_GetCRCPolynomial(void)
;	-----------------------------------------
;	 function SPI_GetCRCPolynomial
;	-----------------------------------------
_SPI_GetCRCPolynomial:
;	lib/stm8s_spi.c: 152: return SPI->CRCPR; /* Return the CRC polynomial register */
	ldw	x, #0x5205
	ld	a, (x)
	ret
;	lib/stm8s_spi.c: 160: void SPI_BiDirectionalLineConfig(SPI_Direction_TypeDef SPI_Direction)
;	-----------------------------------------
;	 function SPI_BiDirectionalLineConfig
;	-----------------------------------------
_SPI_BiDirectionalLineConfig:
;	lib/stm8s_spi.c: 163: if (SPI_Direction != SPI_DIRECTION_RX)
	tnz	(0x03, sp)
	jreq	00102$
;	lib/stm8s_spi.c: 165: SPI->CR2 |= SPI_CR2_BDOE; /* Set the Tx only mode*/
	ldw	x, #0x5201
	ld	a, (x)
	or	a, #0x40
	ld	(x), a
	ret
00102$:
;	lib/stm8s_spi.c: 169: SPI->CR2 &= (uint8_t)(~SPI_CR2_BDOE); /* Set the Rx only mode*/
	ldw	x, #0x5201
	ld	a, (x)
	and	a, #0xbf
	ld	(x), a
	ret
;	lib/stm8s_spi.c: 174: FlagStatus SPI_GetFlagStatus(SPI_Flag_TypeDef SPI_FLAG)
;	-----------------------------------------
;	 function SPI_GetFlagStatus
;	-----------------------------------------
_SPI_GetFlagStatus:
;	lib/stm8s_spi.c: 178: if ((SPI->SR & (uint8_t)SPI_FLAG) != (uint8_t)RESET)
	ldw	x, #0x5203
	ld	a, (x)
	and	a, (0x03, sp)
	tnz	a
	jreq	00102$
;	lib/stm8s_spi.c: 180: status = SET; /* SPI_FLAG is set */
	ld	a, #0x01
	ret
00102$:
;	lib/stm8s_spi.c: 184: status = RESET; /* SPI_FLAG is reset*/
	clr	a
;	lib/stm8s_spi.c: 188: return status;
	ret
;	lib/stm8s_spi.c: 191: void SPI_ClearFlag(SPI_Flag_TypeDef SPI_FLAG)
;	-----------------------------------------
;	 function SPI_ClearFlag
;	-----------------------------------------
_SPI_ClearFlag:
;	lib/stm8s_spi.c: 193: SPI->SR = (uint8_t)(~SPI_FLAG);
	ld	a, (0x03, sp)
	cpl	a
	ldw	x, #0x5203
	ld	(x), a
	ret
;	lib/stm8s_spi.c: 196: ITStatus SPI_GetITStatus(SPI_IT_TypeDef SPI_IT)
;	-----------------------------------------
;	 function SPI_GetITStatus
;	-----------------------------------------
_SPI_GetITStatus:
	sub	sp, #3
;	lib/stm8s_spi.c: 204: itpos = (uint8_t)((uint8_t)1 << ((uint8_t)SPI_IT & (uint8_t)0x0F));
	ld	a, (0x06, sp)
	and	a, #0x0f
	ld	xl, a
	ld	a, #0x01
	push	a
	ld	a, xl
	tnz	a
	jreq	00116$
00115$:
	sll	(1, sp)
	dec	a
	jrne	00115$
00116$:
	pop	a
	ld	(0x03, sp), a
;	lib/stm8s_spi.c: 207: itmask1 = (uint8_t)((uint8_t)SPI_IT >> (uint8_t)4);
	ld	a, (0x06, sp)
	swap	a
	and	a, #0x0f
	ld	xl, a
;	lib/stm8s_spi.c: 209: itmask2 = (uint8_t)((uint8_t)1 << itmask1);
	ld	a, #0x01
	push	a
	ld	a, xl
	tnz	a
	jreq	00118$
00117$:
	sll	(1, sp)
	dec	a
	jrne	00117$
00118$:
	pop	a
	ld	(0x01, sp), a
;	lib/stm8s_spi.c: 211: enablestatus = (uint8_t)((uint8_t)SPI->SR & itmask2);
	ldw	x, #0x5203
	ld	a, (x)
	and	a, (0x01, sp)
	ld	(0x02, sp), a
;	lib/stm8s_spi.c: 213: if (((SPI->ICR & itpos) != RESET) && enablestatus)
	ldw	x, #0x5202
	ld	a, (x)
	and	a, (0x03, sp)
	tnz	a
	jreq	00102$
	tnz	(0x02, sp)
	jreq	00102$
;	lib/stm8s_spi.c: 216: pendingbitstatus = SET;
	ld	a, #0x01
;	lib/stm8s_spi.c: 221: pendingbitstatus = RESET;
	.byte 0x21
00102$:
	clr	a
00103$:
;	lib/stm8s_spi.c: 224: return  pendingbitstatus;
	addw	sp, #3
	ret
;	lib/stm8s_spi.c: 227: void SPI_ClearITPendingBit(SPI_IT_TypeDef SPI_IT)
;	-----------------------------------------
;	 function SPI_ClearITPendingBit
;	-----------------------------------------
_SPI_ClearITPendingBit:
;	lib/stm8s_spi.c: 234: itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)(SPI_IT & (uint8_t)0xF0) >> 4));
	ld	a, (0x03, sp)
	and	a, #0xf0
	swap	a
	and	a, #0x0f
	ld	xl, a
	ld	a, #0x01
	push	a
	ld	a, xl
	tnz	a
	jreq	00104$
00103$:
	sll	(1, sp)
	dec	a
	jrne	00103$
00104$:
	pop	a
;	lib/stm8s_spi.c: 236: SPI->SR = (uint8_t)(~itpos);
	cpl	a
	ldw	x, #0x5203
	ld	(x), a
	ret
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)
