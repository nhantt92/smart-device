;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW64)
;--------------------------------------------------------
	.module stm8s_uart1
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _CLK_GetClockFreq
	.globl _UART1_DeInit
	.globl _UART1_Init
	.globl _UART1_Cmd
	.globl _UART1_ITConfig
	.globl _UART1_HalfDuplexCmd
	.globl _UART1_IrDAConfig
	.globl _UART1_IrDACmd
	.globl _UART1_LINBreakDetectionConfig
	.globl _UART1_LINCmd
	.globl _UART1_SmartCardCmd
	.globl _UART1_SmartCardNACKCmd
	.globl _UART1_WakeUpConfig
	.globl _UART1_ReceiverWakeUpCmd
	.globl _UART1_ReceiveData8
	.globl _UART1_ReceiveData9
	.globl _UART1_SendData8
	.globl _UART1_SendData9
	.globl _UART1_SendBreak
	.globl _UART1_SetAddress
	.globl _UART1_SetGuardTime
	.globl _UART1_SetPrescaler
	.globl _UART1_GetFlagStatus
	.globl _UART1_ClearFlag
	.globl _UART1_GetITStatus
	.globl _UART1_ClearITPendingBit
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
;	lib/stm8s_uart1.c: 19: void UART1_DeInit(void)
;	-----------------------------------------
;	 function UART1_DeInit
;	-----------------------------------------
_UART1_DeInit:
;	lib/stm8s_uart1.c: 23: (void)UART1->SR;
	ldw	x, #0x5230
	ld	a, (x)
;	lib/stm8s_uart1.c: 24: (void)UART1->DR;
	ldw	x, #0x5231
	ld	a, (x)
;	lib/stm8s_uart1.c: 26: UART1->BRR2 = UART1_BRR2_RESET_VALUE;  /* Set UART1_BRR2 to reset value 0x00 */
	mov	0x5233+0, #0x00
;	lib/stm8s_uart1.c: 27: UART1->BRR1 = UART1_BRR1_RESET_VALUE;  /* Set UART1_BRR1 to reset value 0x00 */
	mov	0x5232+0, #0x00
;	lib/stm8s_uart1.c: 29: UART1->CR1 = UART1_CR1_RESET_VALUE;  /* Set UART1_CR1 to reset value 0x00 */
	mov	0x5234+0, #0x00
;	lib/stm8s_uart1.c: 30: UART1->CR2 = UART1_CR2_RESET_VALUE;  /* Set UART1_CR2 to reset value 0x00 */
	mov	0x5235+0, #0x00
;	lib/stm8s_uart1.c: 31: UART1->CR3 = UART1_CR3_RESET_VALUE;  /* Set UART1_CR3 to reset value 0x00 */
	mov	0x5236+0, #0x00
;	lib/stm8s_uart1.c: 32: UART1->CR4 = UART1_CR4_RESET_VALUE;  /* Set UART1_CR4 to reset value 0x00 */
	mov	0x5237+0, #0x00
;	lib/stm8s_uart1.c: 33: UART1->CR5 = UART1_CR5_RESET_VALUE;  /* Set UART1_CR5 to reset value 0x00 */
	mov	0x5238+0, #0x00
;	lib/stm8s_uart1.c: 35: UART1->GTR = UART1_GTR_RESET_VALUE;
	mov	0x5239+0, #0x00
;	lib/stm8s_uart1.c: 36: UART1->PSCR = UART1_PSCR_RESET_VALUE;
	mov	0x523a+0, #0x00
	ret
;	lib/stm8s_uart1.c: 56: void UART1_Init(uint32_t BaudRate, UART1_WordLength_TypeDef WordLength, 
;	-----------------------------------------
;	 function UART1_Init
;	-----------------------------------------
_UART1_Init:
	sub	sp, #37
;	lib/stm8s_uart1.c: 63: UART1->CR1 &= (uint8_t)(~UART1_CR1_M);  
	ldw	x, #0x5234
	ld	a, (x)
	and	a, #0xef
	ld	(x), a
;	lib/stm8s_uart1.c: 66: UART1->CR1 |= (uint8_t)WordLength;
	ldw	x, #0x5234
	ld	a, (x)
	or	a, (0x2c, sp)
	ldw	x, #0x5234
	ld	(x), a
;	lib/stm8s_uart1.c: 69: UART1->CR3 &= (uint8_t)(~UART1_CR3_STOP);  
	ldw	x, #0x5236
	ld	a, (x)
	and	a, #0xcf
	ld	(x), a
;	lib/stm8s_uart1.c: 71: UART1->CR3 |= (uint8_t)StopBits;  
	ldw	x, #0x5236
	ld	a, (x)
	or	a, (0x2d, sp)
	ldw	x, #0x5236
	ld	(x), a
;	lib/stm8s_uart1.c: 74: UART1->CR1 &= (uint8_t)(~(UART1_CR1_PCEN | UART1_CR1_PS  ));  
	ldw	x, #0x5234
	ld	a, (x)
	and	a, #0xf9
	ld	(x), a
;	lib/stm8s_uart1.c: 76: UART1->CR1 |= (uint8_t)Parity;  
	ldw	x, #0x5234
	ld	a, (x)
	or	a, (0x2e, sp)
	ldw	x, #0x5234
	ld	(x), a
;	lib/stm8s_uart1.c: 79: UART1->BRR1 &= (uint8_t)(~UART1_BRR1_DIVM);  
	ldw	x, #0x5232
	ld	a, (x)
	mov	0x5232+0, #0x00
;	lib/stm8s_uart1.c: 81: UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVM);  
	ldw	x, #0x5233
	ld	a, (x)
	and	a, #0x0f
	ld	(x), a
;	lib/stm8s_uart1.c: 83: UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVF);  
	ldw	x, #0x5233
	ld	a, (x)
	and	a, #0xf0
	ld	(x), a
;	lib/stm8s_uart1.c: 86: BaudRate_Mantissa    = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
	call	_CLK_GetClockFreq
	ldw	(0x1a, sp), x
	ldw	x, (0x28, sp)
	ldw	(0x11, sp), x
	ldw	x, (0x2a, sp)
	ld	a, #0x04
00124$:
	sllw	x
	rlc	(0x12, sp)
	rlc	(0x11, sp)
	dec	a
	jrne	00124$
	ldw	(0x13, sp), x
	ldw	x, (0x13, sp)
	pushw	x
	ldw	x, (0x13, sp)
	pushw	x
	ldw	x, (0x1e, sp)
	pushw	x
	pushw	y
	call	__divulong
	addw	sp, #8
	ldw	(0x07, sp), x
	ldw	(0x05, sp), y
;	lib/stm8s_uart1.c: 87: BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
	call	_CLK_GetClockFreq
	pushw	x
	pushw	y
	push	#0x64
	clrw	x
	pushw	x
	push	#0x00
	call	__mullong
	addw	sp, #8
	ldw	(0x1e, sp), x
	ldw	x, (0x13, sp)
	pushw	x
	ldw	x, (0x13, sp)
	pushw	x
	ldw	x, (0x22, sp)
	pushw	x
	pushw	y
	call	__divulong
	addw	sp, #8
	ldw	(0x03, sp), x
	ldw	(0x01, sp), y
;	lib/stm8s_uart1.c: 89: UART1->BRR2 |= (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100)) << 4) / 100) & (uint8_t)0x0F); 
	ldw	x, #0x5233
	ld	a, (x)
	ld	(0x16, sp), a
	ldw	x, (0x07, sp)
	pushw	x
	ldw	x, (0x07, sp)
	pushw	x
	push	#0x64
	clrw	x
	pushw	x
	push	#0x00
	call	__mullong
	addw	sp, #8
	ldw	(0x0f, sp), x
	ldw	(0x0d, sp), y
	ldw	x, (0x03, sp)
	subw	x, (0x0f, sp)
	ldw	(0x0b, sp), x
	ld	a, (0x02, sp)
	sbc	a, (0x0e, sp)
	ld	(0x0a, sp), a
	ld	a, (0x01, sp)
	sbc	a, (0x0d, sp)
	ld	(0x09, sp), a
	ldw	x, (0x0b, sp)
	ldw	y, (0x09, sp)
	ld	a, #0x04
00126$:
	sllw	x
	rlcw	y
	dec	a
	jrne	00126$
	push	#0x64
	push	#0x00
	push	#0x00
	push	#0x00
	pushw	x
	pushw	y
	call	__divulong
	addw	sp, #8
	ld	a, xl
	and	a, #0x0f
	or	a, (0x16, sp)
	ldw	x, #0x5233
	ld	(x), a
;	lib/stm8s_uart1.c: 91: UART1->BRR2 |= (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0); 
	ldw	x, #0x5233
	ld	a, (x)
	ld	(0x17, sp), a
	ldw	x, (0x07, sp)
	ldw	y, (0x05, sp)
	srlw	y
	rrcw	x
	srlw	y
	rrcw	x
	srlw	y
	rrcw	x
	srlw	y
	rrcw	x
	ld	a, xl
	and	a, #0xf0
	push	a
	clrw	x
	clr	(0x22, sp)
	pop	a
	or	a, (0x17, sp)
	ldw	x, #0x5233
	ld	(x), a
;	lib/stm8s_uart1.c: 93: UART1->BRR1 |= (uint8_t)BaudRate_Mantissa;           
	ldw	x, #0x5232
	ld	a, (x)
	ld	(0x20, sp), a
	ld	a, (0x08, sp)
	or	a, (0x20, sp)
	ldw	x, #0x5232
	ld	(x), a
;	lib/stm8s_uart1.c: 96: UART1->CR2 &= (uint8_t)~(UART1_CR2_TEN | UART1_CR2_REN); 
	ldw	x, #0x5235
	ld	a, (x)
	and	a, #0xf3
	ld	(x), a
;	lib/stm8s_uart1.c: 98: UART1->CR3 &= (uint8_t)~(UART1_CR3_CPOL | UART1_CR3_CPHA | UART1_CR3_LBCL); 
	ldw	x, #0x5236
	ld	a, (x)
	and	a, #0xf8
	ld	(x), a
;	lib/stm8s_uart1.c: 100: UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & (uint8_t)(UART1_CR3_CPOL | 
	ldw	x, #0x5236
	ld	a, (x)
	ld	(0x25, sp), a
	ld	a, (0x2f, sp)
	and	a, #0x07
	or	a, (0x25, sp)
	ldw	x, #0x5236
	ld	(x), a
;	lib/stm8s_uart1.c: 103: if ((uint8_t)(Mode & UART1_MODE_TX_ENABLE))
	ld	a, (0x30, sp)
	bcp	a, #0x04
	jreq	00102$
;	lib/stm8s_uart1.c: 106: UART1->CR2 |= (uint8_t)UART1_CR2_TEN;  
	ldw	x, #0x5235
	ld	a, (x)
	or	a, #0x08
	ld	(x), a
	jra	00103$
00102$:
;	lib/stm8s_uart1.c: 111: UART1->CR2 &= (uint8_t)(~UART1_CR2_TEN);  
	ldw	x, #0x5235
	ld	a, (x)
	and	a, #0xf7
	ld	(x), a
00103$:
;	lib/stm8s_uart1.c: 113: if ((uint8_t)(Mode & UART1_MODE_RX_ENABLE))
	ld	a, (0x30, sp)
	bcp	a, #0x08
	jreq	00105$
;	lib/stm8s_uart1.c: 116: UART1->CR2 |= (uint8_t)UART1_CR2_REN;  
	ldw	x, #0x5235
	ld	a, (x)
	or	a, #0x04
	ld	(x), a
	jra	00106$
00105$:
;	lib/stm8s_uart1.c: 121: UART1->CR2 &= (uint8_t)(~UART1_CR2_REN);  
	ldw	x, #0x5235
	ld	a, (x)
	and	a, #0xfb
	ld	(x), a
00106$:
;	lib/stm8s_uart1.c: 125: if ((uint8_t)(SyncMode & UART1_SYNCMODE_CLOCK_DISABLE))
	tnz	(0x2f, sp)
	jrpl	00108$
;	lib/stm8s_uart1.c: 128: UART1->CR3 &= (uint8_t)(~UART1_CR3_CKEN); 
	ldw	x, #0x5236
	ld	a, (x)
	and	a, #0xf7
	ld	(x), a
	jra	00110$
00108$:
;	lib/stm8s_uart1.c: 132: UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & UART1_CR3_CKEN);
	ldw	x, #0x5236
	ld	a, (x)
	ld	(0x15, sp), a
	ld	a, (0x2f, sp)
	and	a, #0x08
	or	a, (0x15, sp)
	ldw	x, #0x5236
	ld	(x), a
00110$:
	addw	sp, #37
	ret
;	lib/stm8s_uart1.c: 142: void UART1_Cmd(FunctionalState NewState)
;	-----------------------------------------
;	 function UART1_Cmd
;	-----------------------------------------
_UART1_Cmd:
;	lib/stm8s_uart1.c: 144: if (NewState != DISABLE)
	tnz	(0x03, sp)
	jreq	00102$
;	lib/stm8s_uart1.c: 147: UART1->CR1 &= (uint8_t)(~UART1_CR1_UARTD); 
	ldw	x, #0x5234
	ld	a, (x)
	and	a, #0xdf
	ld	(x), a
	ret
00102$:
;	lib/stm8s_uart1.c: 152: UART1->CR1 |= UART1_CR1_UARTD;  
	ldw	x, #0x5234
	ld	a, (x)
	or	a, #0x20
	ld	(x), a
	ret
;	lib/stm8s_uart1.c: 169: void UART1_ITConfig(UART1_IT_TypeDef UART1_IT, FunctionalState NewState)
;	-----------------------------------------
;	 function UART1_ITConfig
;	-----------------------------------------
_UART1_ITConfig:
	sub	sp, #3
;	lib/stm8s_uart1.c: 174: uartreg = (uint8_t)((uint16_t)UART1_IT >> 0x08);
	ld	a, (0x06, sp)
	ld	xl, a
	clr	a
;	lib/stm8s_uart1.c: 176: itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
	ld	a, (0x07, sp)
	and	a, #0x0f
	ld	xh, a
	ld	a, #0x01
	push	a
	ld	a, xh
	tnz	a
	jreq	00139$
00138$:
	sll	(1, sp)
	dec	a
	jrne	00138$
00139$:
	pop	a
	ld	(0x01, sp), a
;	lib/stm8s_uart1.c: 181: if (uartreg == 0x01)
	ld	a, xl
	cp	a, #0x01
	jrne	00141$
	ld	a, #0x01
	ld	(0x02, sp), a
	jra	00142$
00141$:
	clr	(0x02, sp)
00142$:
;	lib/stm8s_uart1.c: 185: else if (uartreg == 0x02)
	ld	a, xl
	cp	a, #0x02
	jrne	00144$
	ld	a, #0x01
	.byte 0x21
00144$:
	clr	a
00145$:
;	lib/stm8s_uart1.c: 178: if (NewState != DISABLE)
	tnz	(0x08, sp)
	jreq	00114$
;	lib/stm8s_uart1.c: 181: if (uartreg == 0x01)
	tnz	(0x02, sp)
	jreq	00105$
;	lib/stm8s_uart1.c: 183: UART1->CR1 |= itpos;
	ldw	x, #0x5234
	ld	a, (x)
	or	a, (0x01, sp)
	ldw	x, #0x5234
	ld	(x), a
	jra	00116$
00105$:
;	lib/stm8s_uart1.c: 185: else if (uartreg == 0x02)
	tnz	a
	jreq	00102$
;	lib/stm8s_uart1.c: 187: UART1->CR2 |= itpos;
	ldw	x, #0x5235
	ld	a, (x)
	or	a, (0x01, sp)
	ldw	x, #0x5235
	ld	(x), a
	jra	00116$
00102$:
;	lib/stm8s_uart1.c: 191: UART1->CR4 |= itpos;
	ldw	x, #0x5237
	ld	a, (x)
	or	a, (0x01, sp)
	ldw	x, #0x5237
	ld	(x), a
	jra	00116$
00114$:
;	lib/stm8s_uart1.c: 199: UART1->CR1 &= (uint8_t)(~itpos);
	push	a
	ld	a, (0x02, sp)
	cpl	a
	ld	(0x04, sp), a
	pop	a
;	lib/stm8s_uart1.c: 197: if (uartreg == 0x01)
	tnz	(0x02, sp)
	jreq	00111$
;	lib/stm8s_uart1.c: 199: UART1->CR1 &= (uint8_t)(~itpos);
	ldw	x, #0x5234
	ld	a, (x)
	and	a, (0x03, sp)
	ldw	x, #0x5234
	ld	(x), a
	jra	00116$
00111$:
;	lib/stm8s_uart1.c: 201: else if (uartreg == 0x02)
	tnz	a
	jreq	00108$
;	lib/stm8s_uart1.c: 203: UART1->CR2 &= (uint8_t)(~itpos);
	ldw	x, #0x5235
	ld	a, (x)
	and	a, (0x03, sp)
	ldw	x, #0x5235
	ld	(x), a
	jra	00116$
00108$:
;	lib/stm8s_uart1.c: 207: UART1->CR4 &= (uint8_t)(~itpos);
	ldw	x, #0x5237
	ld	a, (x)
	and	a, (0x03, sp)
	ldw	x, #0x5237
	ld	(x), a
00116$:
	addw	sp, #3
	ret
;	lib/stm8s_uart1.c: 219: void UART1_HalfDuplexCmd(FunctionalState NewState)
;	-----------------------------------------
;	 function UART1_HalfDuplexCmd
;	-----------------------------------------
_UART1_HalfDuplexCmd:
;	lib/stm8s_uart1.c: 222: if (NewState != DISABLE)
	tnz	(0x03, sp)
	jreq	00102$
;	lib/stm8s_uart1.c: 224: UART1->CR5 |= UART1_CR5_HDSEL;  /**< UART1 Half Duplex Enable  */
	ldw	x, #0x5238
	ld	a, (x)
	or	a, #0x08
	ld	(x), a
	ret
00102$:
;	lib/stm8s_uart1.c: 228: UART1->CR5 &= (uint8_t)~UART1_CR5_HDSEL; /**< UART1 Half Duplex Disable */
	ldw	x, #0x5238
	ld	a, (x)
	and	a, #0xf7
	ld	(x), a
	ret
;	lib/stm8s_uart1.c: 238: void UART1_IrDAConfig(UART1_IrDAMode_TypeDef UART1_IrDAMode)
;	-----------------------------------------
;	 function UART1_IrDAConfig
;	-----------------------------------------
_UART1_IrDAConfig:
;	lib/stm8s_uart1.c: 241: if (UART1_IrDAMode != UART1_IRDAMODE_NORMAL)
	tnz	(0x03, sp)
	jreq	00102$
;	lib/stm8s_uart1.c: 243: UART1->CR5 |= UART1_CR5_IRLP;
	ldw	x, #0x5238
	ld	a, (x)
	or	a, #0x04
	ld	(x), a
	ret
00102$:
;	lib/stm8s_uart1.c: 247: UART1->CR5 &= ((uint8_t)~UART1_CR5_IRLP);
	ldw	x, #0x5238
	ld	a, (x)
	and	a, #0xfb
	ld	(x), a
	ret
;	lib/stm8s_uart1.c: 257: void UART1_IrDACmd(FunctionalState NewState)
;	-----------------------------------------
;	 function UART1_IrDACmd
;	-----------------------------------------
_UART1_IrDACmd:
;	lib/stm8s_uart1.c: 259: if (NewState != DISABLE)
	tnz	(0x03, sp)
	jreq	00102$
;	lib/stm8s_uart1.c: 262: UART1->CR5 |= UART1_CR5_IREN;
	ldw	x, #0x5238
	ld	a, (x)
	or	a, #0x02
	ld	(x), a
	ret
00102$:
;	lib/stm8s_uart1.c: 267: UART1->CR5 &= ((uint8_t)~UART1_CR5_IREN);
	ldw	x, #0x5238
	ld	a, (x)
	and	a, #0xfd
	ld	(x), a
	ret
;	lib/stm8s_uart1.c: 278: void UART1_LINBreakDetectionConfig(UART1_LINBreakDetectionLength_TypeDef UART1_LINBreakDetectionLength)
;	-----------------------------------------
;	 function UART1_LINBreakDetectionConfig
;	-----------------------------------------
_UART1_LINBreakDetectionConfig:
;	lib/stm8s_uart1.c: 281: if (UART1_LINBreakDetectionLength != UART1_LINBREAKDETECTIONLENGTH_10BITS)
	tnz	(0x03, sp)
	jreq	00102$
;	lib/stm8s_uart1.c: 283: UART1->CR4 |= UART1_CR4_LBDL;
	ldw	x, #0x5237
	ld	a, (x)
	or	a, #0x20
	ld	(x), a
	ret
00102$:
;	lib/stm8s_uart1.c: 287: UART1->CR4 &= ((uint8_t)~UART1_CR4_LBDL);
	ldw	x, #0x5237
	ld	a, (x)
	and	a, #0xdf
	ld	(x), a
	ret
;	lib/stm8s_uart1.c: 297: void UART1_LINCmd(FunctionalState NewState)
;	-----------------------------------------
;	 function UART1_LINCmd
;	-----------------------------------------
_UART1_LINCmd:
;	lib/stm8s_uart1.c: 300: if (NewState != DISABLE)
	tnz	(0x03, sp)
	jreq	00102$
;	lib/stm8s_uart1.c: 303: UART1->CR3 |= UART1_CR3_LINEN;
	ldw	x, #0x5236
	ld	a, (x)
	or	a, #0x40
	ld	(x), a
	ret
00102$:
;	lib/stm8s_uart1.c: 308: UART1->CR3 &= ((uint8_t)~UART1_CR3_LINEN);
	ldw	x, #0x5236
	ld	a, (x)
	and	a, #0xbf
	ld	(x), a
	ret
;	lib/stm8s_uart1.c: 318: void UART1_SmartCardCmd(FunctionalState NewState)
;	-----------------------------------------
;	 function UART1_SmartCardCmd
;	-----------------------------------------
_UART1_SmartCardCmd:
;	lib/stm8s_uart1.c: 321: if (NewState != DISABLE)
	tnz	(0x03, sp)
	jreq	00102$
;	lib/stm8s_uart1.c: 324: UART1->CR5 |= UART1_CR5_SCEN;
	ldw	x, #0x5238
	ld	a, (x)
	or	a, #0x20
	ld	(x), a
	ret
00102$:
;	lib/stm8s_uart1.c: 329: UART1->CR5 &= ((uint8_t)(~UART1_CR5_SCEN));
	ldw	x, #0x5238
	ld	a, (x)
	and	a, #0xdf
	ld	(x), a
	ret
;	lib/stm8s_uart1.c: 340: void UART1_SmartCardNACKCmd(FunctionalState NewState)
;	-----------------------------------------
;	 function UART1_SmartCardNACKCmd
;	-----------------------------------------
_UART1_SmartCardNACKCmd:
;	lib/stm8s_uart1.c: 342: if (NewState != DISABLE)
	tnz	(0x03, sp)
	jreq	00102$
;	lib/stm8s_uart1.c: 345: UART1->CR5 |= UART1_CR5_NACK;
	ldw	x, #0x5238
	ld	a, (x)
	or	a, #0x10
	ld	(x), a
	ret
00102$:
;	lib/stm8s_uart1.c: 350: UART1->CR5 &= ((uint8_t)~(UART1_CR5_NACK));
	ldw	x, #0x5238
	ld	a, (x)
	and	a, #0xef
	ld	(x), a
	ret
;	lib/stm8s_uart1.c: 360: void UART1_WakeUpConfig(UART1_WakeUp_TypeDef UART1_WakeUp)
;	-----------------------------------------
;	 function UART1_WakeUpConfig
;	-----------------------------------------
_UART1_WakeUpConfig:
;	lib/stm8s_uart1.c: 363: UART1->CR1 &= ((uint8_t)~UART1_CR1_WAKE);
	ldw	x, #0x5234
	ld	a, (x)
	and	a, #0xf7
	ld	(x), a
;	lib/stm8s_uart1.c: 364: UART1->CR1 |= (uint8_t)UART1_WakeUp;
	ldw	x, #0x5234
	ld	a, (x)
	or	a, (0x03, sp)
	ldw	x, #0x5234
	ld	(x), a
	ret
;	lib/stm8s_uart1.c: 373: void UART1_ReceiverWakeUpCmd(FunctionalState NewState)
;	-----------------------------------------
;	 function UART1_ReceiverWakeUpCmd
;	-----------------------------------------
_UART1_ReceiverWakeUpCmd:
;	lib/stm8s_uart1.c: 376: if (NewState != DISABLE)
	tnz	(0x03, sp)
	jreq	00102$
;	lib/stm8s_uart1.c: 379: UART1->CR2 |= UART1_CR2_RWU;
	ldw	x, #0x5235
	ld	a, (x)
	or	a, #0x02
	ld	(x), a
	ret
00102$:
;	lib/stm8s_uart1.c: 384: UART1->CR2 &= ((uint8_t)~UART1_CR2_RWU);
	ldw	x, #0x5235
	ld	a, (x)
	and	a, #0xfd
	ld	(x), a
	ret
;	lib/stm8s_uart1.c: 393: uint8_t UART1_ReceiveData8(void)
;	-----------------------------------------
;	 function UART1_ReceiveData8
;	-----------------------------------------
_UART1_ReceiveData8:
;	lib/stm8s_uart1.c: 395: return ((uint8_t)UART1->DR);
	ldw	x, #0x5231
	ld	a, (x)
	ret
;	lib/stm8s_uart1.c: 403: uint16_t UART1_ReceiveData9(void)
;	-----------------------------------------
;	 function UART1_ReceiveData9
;	-----------------------------------------
_UART1_ReceiveData9:
	sub	sp, #4
;	lib/stm8s_uart1.c: 407: temp = (uint16_t)(((uint16_t)( (uint16_t)UART1->CR1 & (uint16_t)UART1_CR1_R8)) << 1);
	ldw	x, #0x5234
	ld	a, (x)
	clr	(0x03, sp)
	and	a, #0x80
	ld	xl, a
	clr	a
	ld	xh, a
	sllw	x
	ldw	(0x01, sp), x
;	lib/stm8s_uart1.c: 408: return (uint16_t)( (((uint16_t) UART1->DR) | temp ) & ((uint16_t)0x01FF));
	ldw	x, #0x5231
	ld	a, (x)
	rlwa	x
	clr	a
	rrwa	x
	or	a, (0x02, sp)
	rlwa	x
	or	a, (0x01, sp)
	and	a, #0x01
	ld	xh, a
	addw	sp, #4
	ret
;	lib/stm8s_uart1.c: 416: void UART1_SendData8(uint8_t Data)
;	-----------------------------------------
;	 function UART1_SendData8
;	-----------------------------------------
_UART1_SendData8:
;	lib/stm8s_uart1.c: 419: UART1->DR = Data;
	ldw	x, #0x5231
	ld	a, (0x03, sp)
	ld	(x), a
	ret
;	lib/stm8s_uart1.c: 428: void UART1_SendData9(uint16_t Data)
;	-----------------------------------------
;	 function UART1_SendData9
;	-----------------------------------------
_UART1_SendData9:
	push	a
;	lib/stm8s_uart1.c: 431: UART1->CR1 &= ((uint8_t)~UART1_CR1_T8);
	ldw	x, #0x5234
	ld	a, (x)
	and	a, #0xbf
	ld	(x), a
;	lib/stm8s_uart1.c: 433: UART1->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & UART1_CR1_T8);
	ldw	x, #0x5234
	ld	a, (x)
	ld	(0x01, sp), a
	ldw	x, (0x04, sp)
	srlw	x
	srlw	x
	ld	a, xl
	and	a, #0x40
	or	a, (0x01, sp)
	ldw	x, #0x5234
	ld	(x), a
;	lib/stm8s_uart1.c: 435: UART1->DR   = (uint8_t)(Data);
	ld	a, (0x05, sp)
	ldw	x, #0x5231
	ld	(x), a
	pop	a
	ret
;	lib/stm8s_uart1.c: 443: void UART1_SendBreak(void)
;	-----------------------------------------
;	 function UART1_SendBreak
;	-----------------------------------------
_UART1_SendBreak:
;	lib/stm8s_uart1.c: 445: UART1->CR2 |= UART1_CR2_SBK;
	bset	0x5235, #0
	ret
;	lib/stm8s_uart1.c: 453: void UART1_SetAddress(uint8_t UART1_Address)
;	-----------------------------------------
;	 function UART1_SetAddress
;	-----------------------------------------
_UART1_SetAddress:
;	lib/stm8s_uart1.c: 457: UART1->CR4 &= ((uint8_t)~UART1_CR4_ADD);
	ldw	x, #0x5237
	ld	a, (x)
	and	a, #0xf0
	ld	(x), a
;	lib/stm8s_uart1.c: 459: UART1->CR4 |= UART1_Address;
	ldw	x, #0x5237
	ld	a, (x)
	or	a, (0x03, sp)
	ldw	x, #0x5237
	ld	(x), a
	ret
;	lib/stm8s_uart1.c: 468: void UART1_SetGuardTime(uint8_t UART1_GuardTime)
;	-----------------------------------------
;	 function UART1_SetGuardTime
;	-----------------------------------------
_UART1_SetGuardTime:
;	lib/stm8s_uart1.c: 471: UART1->GTR = UART1_GuardTime;
	ldw	x, #0x5239
	ld	a, (0x03, sp)
	ld	(x), a
	ret
;	lib/stm8s_uart1.c: 496: void UART1_SetPrescaler(uint8_t UART1_Prescaler)
;	-----------------------------------------
;	 function UART1_SetPrescaler
;	-----------------------------------------
_UART1_SetPrescaler:
;	lib/stm8s_uart1.c: 499: UART1->PSCR = UART1_Prescaler;
	ldw	x, #0x523a
	ld	a, (0x03, sp)
	ld	(x), a
	ret
;	lib/stm8s_uart1.c: 508: FlagStatus UART1_GetFlagStatus(UART1_Flag_TypeDef UART1_FLAG)
;	-----------------------------------------
;	 function UART1_GetFlagStatus
;	-----------------------------------------
_UART1_GetFlagStatus:
	push	a
;	lib/stm8s_uart1.c: 516: if ((UART1->CR4 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
	ld	a, (0x05, sp)
	ld	(0x01, sp), a
;	lib/stm8s_uart1.c: 514: if (UART1_FLAG == UART1_FLAG_LBDF)
	ldw	x, (0x04, sp)
	cpw	x, #0x0210
	jrne	00114$
;	lib/stm8s_uart1.c: 516: if ((UART1->CR4 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
	ldw	x, #0x5237
	ld	a, (x)
	and	a, (0x01, sp)
	tnz	a
	jreq	00102$
;	lib/stm8s_uart1.c: 519: status = SET;
	ld	a, #0x01
	jra	00115$
00102$:
;	lib/stm8s_uart1.c: 524: status = RESET;
	clr	a
	jra	00115$
00114$:
;	lib/stm8s_uart1.c: 527: else if (UART1_FLAG == UART1_FLAG_SBK)
	ldw	x, (0x04, sp)
	cpw	x, #0x0101
	jrne	00111$
;	lib/stm8s_uart1.c: 529: if ((UART1->CR2 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
	ldw	x, #0x5235
	ld	a, (x)
	and	a, (0x01, sp)
	tnz	a
	jreq	00105$
;	lib/stm8s_uart1.c: 532: status = SET;
	ld	a, #0x01
	jra	00115$
00105$:
;	lib/stm8s_uart1.c: 537: status = RESET;
	clr	a
	jra	00115$
00111$:
;	lib/stm8s_uart1.c: 542: if ((UART1->SR & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
	ldw	x, #0x5230
	ld	a, (x)
	and	a, (0x01, sp)
	tnz	a
	jreq	00108$
;	lib/stm8s_uart1.c: 545: status = SET;
	ld	a, #0x01
;	lib/stm8s_uart1.c: 550: status = RESET;
	.byte 0x21
00108$:
	clr	a
00115$:
;	lib/stm8s_uart1.c: 554: return status;
	addw	sp, #1
	ret
;	lib/stm8s_uart1.c: 583: void UART1_ClearFlag(UART1_Flag_TypeDef UART1_FLAG)
;	-----------------------------------------
;	 function UART1_ClearFlag
;	-----------------------------------------
_UART1_ClearFlag:
;	lib/stm8s_uart1.c: 587: if (UART1_FLAG == UART1_FLAG_RXNE)
	ldw	x, (0x03, sp)
	cpw	x, #0x0020
	jrne	00102$
;	lib/stm8s_uart1.c: 589: UART1->SR = (uint8_t)~(UART1_SR_RXNE);
	mov	0x5230+0, #0xdf
	ret
00102$:
;	lib/stm8s_uart1.c: 594: UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
	ldw	x, #0x5237
	ld	a, (x)
	and	a, #0xef
	ld	(x), a
	ret
;	lib/stm8s_uart1.c: 611: ITStatus UART1_GetITStatus(UART1_IT_TypeDef UART1_IT)
;	-----------------------------------------
;	 function UART1_GetITStatus
;	-----------------------------------------
_UART1_GetITStatus:
	sub	sp, #5
;	lib/stm8s_uart1.c: 620: itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
	ld	a, (0x09, sp)
	ld	xl, a
	and	a, #0x0f
	ld	xh, a
	ld	a, #0x01
	push	a
	ld	a, xh
	tnz	a
	jreq	00154$
00153$:
	sll	(1, sp)
	dec	a
	jrne	00153$
00154$:
	pop	a
	ld	(0x03, sp), a
;	lib/stm8s_uart1.c: 622: itmask1 = (uint8_t)((uint8_t)UART1_IT >> (uint8_t)4);
	ld	a, xl
	swap	a
	and	a, #0x0f
	ld	xl, a
;	lib/stm8s_uart1.c: 624: itmask2 = (uint8_t)((uint8_t)1 << itmask1);
	ld	a, #0x01
	push	a
	ld	a, xl
	tnz	a
	jreq	00156$
00155$:
	sll	(1, sp)
	dec	a
	jrne	00155$
00156$:
	pop	a
	ld	(0x01, sp), a
;	lib/stm8s_uart1.c: 628: if (UART1_IT == UART1_IT_PE)
	ldw	x, (0x08, sp)
	cpw	x, #0x0100
	jrne	00117$
;	lib/stm8s_uart1.c: 631: enablestatus = (uint8_t)((uint8_t)UART1->CR1 & itmask2);
	ldw	x, #0x5234
	ld	a, (x)
	and	a, (0x01, sp)
	ld	(0x05, sp), a
;	lib/stm8s_uart1.c: 634: if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
	ldw	x, #0x5230
	ld	a, (x)
	and	a, (0x03, sp)
	tnz	a
	jreq	00102$
	tnz	(0x05, sp)
	jreq	00102$
;	lib/stm8s_uart1.c: 637: pendingbitstatus = SET;
	ld	a, #0x01
	jra	00118$
00102$:
;	lib/stm8s_uart1.c: 642: pendingbitstatus = RESET;
	clr	a
	jra	00118$
00117$:
;	lib/stm8s_uart1.c: 646: else if (UART1_IT == UART1_IT_LBDF)
	ldw	x, (0x08, sp)
	cpw	x, #0x0346
	jrne	00114$
;	lib/stm8s_uart1.c: 649: enablestatus = (uint8_t)((uint8_t)UART1->CR4 & itmask2);
	ldw	x, #0x5237
	ld	a, (x)
	and	a, (0x01, sp)
	ld	(0x02, sp), a
;	lib/stm8s_uart1.c: 651: if (((UART1->CR4 & itpos) != (uint8_t)0x00) && enablestatus)
	ldw	x, #0x5237
	ld	a, (x)
	and	a, (0x03, sp)
	tnz	a
	jreq	00106$
	tnz	(0x02, sp)
	jreq	00106$
;	lib/stm8s_uart1.c: 654: pendingbitstatus = SET;
	ld	a, #0x01
	jra	00118$
00106$:
;	lib/stm8s_uart1.c: 659: pendingbitstatus = RESET;
	clr	a
	jra	00118$
00114$:
;	lib/stm8s_uart1.c: 665: enablestatus = (uint8_t)((uint8_t)UART1->CR2 & itmask2);
	ldw	x, #0x5235
	ld	a, (x)
	and	a, (0x01, sp)
	ld	(0x04, sp), a
;	lib/stm8s_uart1.c: 667: if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
	ldw	x, #0x5230
	ld	a, (x)
	and	a, (0x03, sp)
	tnz	a
	jreq	00110$
	tnz	(0x04, sp)
	jreq	00110$
;	lib/stm8s_uart1.c: 670: pendingbitstatus = SET;
	ld	a, #0x01
;	lib/stm8s_uart1.c: 675: pendingbitstatus = RESET;
	.byte 0x21
00110$:
	clr	a
00118$:
;	lib/stm8s_uart1.c: 680: return  pendingbitstatus;
	addw	sp, #5
	ret
;	lib/stm8s_uart1.c: 708: void UART1_ClearITPendingBit(UART1_IT_TypeDef UART1_IT)
;	-----------------------------------------
;	 function UART1_ClearITPendingBit
;	-----------------------------------------
_UART1_ClearITPendingBit:
;	lib/stm8s_uart1.c: 712: if (UART1_IT == UART1_IT_RXNE)
	ldw	x, (0x03, sp)
	cpw	x, #0x0255
	jrne	00102$
;	lib/stm8s_uart1.c: 714: UART1->SR = (uint8_t)~(UART1_SR_RXNE);
	mov	0x5230+0, #0xdf
	ret
00102$:
;	lib/stm8s_uart1.c: 719: UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
	ldw	x, #0x5237
	ld	a, (x)
	and	a, #0xef
	ld	(x), a
	ret
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)
