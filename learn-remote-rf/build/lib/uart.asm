;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (Mac OS X x86_64)
;--------------------------------------------------------
	.module uart
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _CLK_GetClockFreq
	.globl _UART1_DeInit
	.globl _UART1_Init
	.globl _UART1_Cmd
	.globl _UART1_ITConfig
	.globl _UART1_ReceiveData8
	.globl _UART1_SendData8
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
;	lib/uart.c: 5: void UART1_DeInit(void)
;	-----------------------------------------
;	 function UART1_DeInit
;	-----------------------------------------
_UART1_DeInit:
;	lib/uart.c: 9: (void)UART1->SR;
	ldw	x, #0x5230
	ld	a, (x)
;	lib/uart.c: 10: (void)UART1->DR;
	ldw	x, #0x5231
	ld	a, (x)
;	lib/uart.c: 12: UART1->BRR2 = UART1_BRR2_RESET_VALUE;  /* Set UART1_BRR2 to reset value 0x00 */
	mov	0x5233+0, #0x00
;	lib/uart.c: 13: UART1->BRR1 = UART1_BRR1_RESET_VALUE;  /* Set UART1_BRR1 to reset value 0x00 */
	mov	0x5232+0, #0x00
;	lib/uart.c: 15: UART1->CR1 = UART1_CR1_RESET_VALUE;  /* Set UART1_CR1 to reset value 0x00 */
	mov	0x5234+0, #0x00
;	lib/uart.c: 16: UART1->CR2 = UART1_CR2_RESET_VALUE;  /* Set UART1_CR2 to reset value 0x00 */
	mov	0x5235+0, #0x00
;	lib/uart.c: 17: UART1->CR3 = UART1_CR3_RESET_VALUE;  /* Set UART1_CR3 to reset value 0x00 */
	mov	0x5236+0, #0x00
;	lib/uart.c: 18: UART1->CR4 = UART1_CR4_RESET_VALUE;  /* Set UART1_CR4 to reset value 0x00 */
	mov	0x5237+0, #0x00
;	lib/uart.c: 19: UART1->CR5 = UART1_CR5_RESET_VALUE;  /* Set UART1_CR5 to reset value 0x00 */
	mov	0x5238+0, #0x00
;	lib/uart.c: 21: UART1->GTR = UART1_GTR_RESET_VALUE;
	mov	0x5239+0, #0x00
;	lib/uart.c: 22: UART1->PSCR = UART1_PSCR_RESET_VALUE;
	mov	0x523a+0, #0x00
	ret
;	lib/uart.c: 25: void UART1_Init(uint32_t BaudRate, UART1_WordLength_TypeDef WordLength, 
;	-----------------------------------------
;	 function UART1_Init
;	-----------------------------------------
_UART1_Init:
	sub	sp, #37
;	lib/uart.c: 32: UART1->CR1 &= (uint8_t)(~UART1_CR1_M);  
	ldw	x, #0x5234
	ld	a, (x)
	and	a, #0xef
	ld	(x), a
;	lib/uart.c: 35: UART1->CR1 |= (uint8_t)WordLength;
	ldw	x, #0x5234
	ld	a, (x)
	or	a, (0x2c, sp)
	ldw	x, #0x5234
	ld	(x), a
;	lib/uart.c: 38: UART1->CR3 &= (uint8_t)(~UART1_CR3_STOP);  
	ldw	x, #0x5236
	ld	a, (x)
	and	a, #0xcf
	ld	(x), a
;	lib/uart.c: 40: UART1->CR3 |= (uint8_t)StopBits;  
	ldw	x, #0x5236
	ld	a, (x)
	or	a, (0x2d, sp)
	ldw	x, #0x5236
	ld	(x), a
;	lib/uart.c: 43: UART1->CR1 &= (uint8_t)(~(UART1_CR1_PCEN | UART1_CR1_PS  ));  
	ldw	x, #0x5234
	ld	a, (x)
	and	a, #0xf9
	ld	(x), a
;	lib/uart.c: 45: UART1->CR1 |= (uint8_t)Parity;  
	ldw	x, #0x5234
	ld	a, (x)
	or	a, (0x2e, sp)
	ldw	x, #0x5234
	ld	(x), a
;	lib/uart.c: 48: UART1->BRR1 &= (uint8_t)(~UART1_BRR1_DIVM);  
	ldw	x, #0x5232
	ld	a, (x)
	mov	0x5232+0, #0x00
;	lib/uart.c: 50: UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVM);  
	ldw	x, #0x5233
	ld	a, (x)
	and	a, #0x0f
	ld	(x), a
;	lib/uart.c: 52: UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVF);  
	ldw	x, #0x5233
	ld	a, (x)
	and	a, #0xf0
	ld	(x), a
;	lib/uart.c: 55: BaudRate_Mantissa    = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
	call	_CLK_GetClockFreq
	ldw	(0x24, sp), x
	ldw	x, (0x28, sp)
	ldw	(0x1e, sp), x
	ldw	x, (0x2a, sp)
	ld	a, #0x04
00124$:
	sllw	x
	rlc	(0x1f, sp)
	rlc	(0x1e, sp)
	dec	a
	jrne	00124$
	ldw	(0x20, sp), x
	ldw	x, (0x20, sp)
	pushw	x
	ldw	x, (0x20, sp)
	pushw	x
	ldw	x, (0x28, sp)
	pushw	x
	pushw	y
	call	__divulong
	addw	sp, #8
	ldw	(0x03, sp), x
	ldw	(0x01, sp), y
;	lib/uart.c: 56: BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
	call	_CLK_GetClockFreq
	exgw	x, y
	pushw	y
	pushw	x
	push	#0x64
	clrw	x
	pushw	x
	push	#0x00
	call	__mullong
	addw	sp, #8
	ldw	(0x1c, sp), x
	ldw	x, (0x20, sp)
	pushw	x
	ldw	x, (0x20, sp)
	pushw	x
	ldw	x, (0x20, sp)
	pushw	x
	pushw	y
	call	__divulong
	addw	sp, #8
	ldw	(0x07, sp), x
	ldw	(0x05, sp), y
;	lib/uart.c: 58: UART1->BRR2 |= (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100)) << 4) / 100) & (uint8_t)0x0F); 
	ldw	x, #0x5233
	ld	a, (x)
	ld	(0x19, sp), a
	ldw	x, (0x03, sp)
	pushw	x
	ldw	x, (0x03, sp)
	pushw	x
	push	#0x64
	clrw	x
	pushw	x
	push	#0x00
	call	__mullong
	addw	sp, #8
	ldw	(0x17, sp), x
	ldw	(0x15, sp), y
	ldw	x, (0x07, sp)
	subw	x, (0x17, sp)
	ldw	(0x13, sp), x
	ld	a, (0x06, sp)
	sbc	a, (0x16, sp)
	ld	(0x12, sp), a
	ld	a, (0x05, sp)
	sbc	a, (0x15, sp)
	ld	(0x11, sp), a
	ldw	x, (0x13, sp)
	ldw	y, (0x11, sp)
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
	or	a, (0x19, sp)
	ldw	x, #0x5233
	ld	(x), a
;	lib/uart.c: 60: UART1->BRR2 |= (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0); 
	ldw	x, #0x5233
	ld	a, (x)
	ld	(0x10, sp), a
	ldw	x, (0x03, sp)
	ldw	y, (0x01, sp)
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
	clr	(0x0d, sp)
	pop	a
	or	a, (0x10, sp)
	ldw	x, #0x5233
	ld	(x), a
;	lib/uart.c: 62: UART1->BRR1 |= (uint8_t)BaudRate_Mantissa;           
	ldw	x, #0x5232
	ld	a, (x)
	ld	(0x0b, sp), a
	ld	a, (0x04, sp)
	or	a, (0x0b, sp)
	ldw	x, #0x5232
	ld	(x), a
;	lib/uart.c: 65: UART1->CR2 &= (uint8_t)~(UART1_CR2_TEN | UART1_CR2_REN); 
	ldw	x, #0x5235
	ld	a, (x)
	and	a, #0xf3
	ld	(x), a
;	lib/uart.c: 67: UART1->CR3 &= (uint8_t)~(UART1_CR3_CPOL | UART1_CR3_CPHA | UART1_CR3_LBCL); 
	ldw	x, #0x5236
	ld	a, (x)
	and	a, #0xf8
	ld	(x), a
;	lib/uart.c: 69: UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & (uint8_t)(UART1_CR3_CPOL | 
	ldw	x, #0x5236
	ld	a, (x)
	ld	(0x0a, sp), a
	ld	a, (0x2f, sp)
	and	a, #0x07
	or	a, (0x0a, sp)
	ldw	x, #0x5236
	ld	(x), a
;	lib/uart.c: 72: if ((uint8_t)(Mode & UART1_MODE_TX_ENABLE))
	ld	a, (0x30, sp)
	bcp	a, #0x04
	jreq	00102$
;	lib/uart.c: 75: UART1->CR2 |= (uint8_t)UART1_CR2_TEN;  
	ldw	x, #0x5235
	ld	a, (x)
	or	a, #0x08
	ld	(x), a
	jra	00103$
00102$:
;	lib/uart.c: 80: UART1->CR2 &= (uint8_t)(~UART1_CR2_TEN);  
	ldw	x, #0x5235
	ld	a, (x)
	and	a, #0xf7
	ld	(x), a
00103$:
;	lib/uart.c: 82: if ((uint8_t)(Mode & UART1_MODE_RX_ENABLE))
	ld	a, (0x30, sp)
	bcp	a, #0x08
	jreq	00105$
;	lib/uart.c: 85: UART1->CR2 |= (uint8_t)UART1_CR2_REN;  
	ldw	x, #0x5235
	ld	a, (x)
	or	a, #0x04
	ld	(x), a
	jra	00106$
00105$:
;	lib/uart.c: 90: UART1->CR2 &= (uint8_t)(~UART1_CR2_REN);  
	ldw	x, #0x5235
	ld	a, (x)
	and	a, #0xfb
	ld	(x), a
00106$:
;	lib/uart.c: 94: if ((uint8_t)(SyncMode & UART1_SYNCMODE_CLOCK_DISABLE))
	tnz	(0x2f, sp)
	jrpl	00108$
;	lib/uart.c: 97: UART1->CR3 &= (uint8_t)(~UART1_CR3_CKEN); 
	ldw	x, #0x5236
	ld	a, (x)
	and	a, #0xf7
	ld	(x), a
	jra	00110$
00108$:
;	lib/uart.c: 101: UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & UART1_CR3_CKEN);
	ldw	x, #0x5236
	ld	a, (x)
	ld	(0x09, sp), a
	ld	a, (0x2f, sp)
	and	a, #0x08
	or	a, (0x09, sp)
	ldw	x, #0x5236
	ld	(x), a
00110$:
	addw	sp, #37
	ret
;	lib/uart.c: 105: void UART1_Cmd(FunctionalState NewState)
;	-----------------------------------------
;	 function UART1_Cmd
;	-----------------------------------------
_UART1_Cmd:
;	lib/uart.c: 107: if (NewState != DISABLE)
	tnz	(0x03, sp)
	jreq	00102$
;	lib/uart.c: 110: UART1->CR1 &= (uint8_t)(~UART1_CR1_UARTD); 
	ldw	x, #0x5234
	ld	a, (x)
	and	a, #0xdf
	ld	(x), a
	ret
00102$:
;	lib/uart.c: 115: UART1->CR1 |= UART1_CR1_UARTD;  
	ldw	x, #0x5234
	ld	a, (x)
	or	a, #0x20
	ld	(x), a
	ret
;	lib/uart.c: 119: void UART1_ITConfig(UART1_IT_TypeDef UART1_IT, FunctionalState NewState)
;	-----------------------------------------
;	 function UART1_ITConfig
;	-----------------------------------------
_UART1_ITConfig:
	sub	sp, #3
;	lib/uart.c: 124: uartreg = (uint8_t)((uint16_t)UART1_IT >> 0x08);
	ld	a, (0x06, sp)
	ld	xl, a
	clr	a
;	lib/uart.c: 126: itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
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
;	lib/uart.c: 131: if (uartreg == 0x01)
	ld	a, xl
	cp	a, #0x01
	jrne	00141$
	ld	a, #0x01
	ld	(0x03, sp), a
	jra	00142$
00141$:
	clr	(0x03, sp)
00142$:
;	lib/uart.c: 135: else if (uartreg == 0x02)
	ld	a, xl
	cp	a, #0x02
	jrne	00144$
	ld	a, #0x01
	.byte 0x21
00144$:
	clr	a
00145$:
;	lib/uart.c: 128: if (NewState != DISABLE)
	tnz	(0x08, sp)
	jreq	00114$
;	lib/uart.c: 131: if (uartreg == 0x01)
	tnz	(0x03, sp)
	jreq	00105$
;	lib/uart.c: 133: UART1->CR1 |= itpos;
	ldw	x, #0x5234
	ld	a, (x)
	or	a, (0x01, sp)
	ldw	x, #0x5234
	ld	(x), a
	jra	00116$
00105$:
;	lib/uart.c: 135: else if (uartreg == 0x02)
	tnz	a
	jreq	00102$
;	lib/uart.c: 137: UART1->CR2 |= itpos;
	ldw	x, #0x5235
	ld	a, (x)
	or	a, (0x01, sp)
	ldw	x, #0x5235
	ld	(x), a
	jra	00116$
00102$:
;	lib/uart.c: 141: UART1->CR4 |= itpos;
	ldw	x, #0x5237
	ld	a, (x)
	or	a, (0x01, sp)
	ldw	x, #0x5237
	ld	(x), a
	jra	00116$
00114$:
;	lib/uart.c: 149: UART1->CR1 &= (uint8_t)(~itpos);
	push	a
	ld	a, (0x02, sp)
	cpl	a
	ld	(0x03, sp), a
	pop	a
;	lib/uart.c: 147: if (uartreg == 0x01)
	tnz	(0x03, sp)
	jreq	00111$
;	lib/uart.c: 149: UART1->CR1 &= (uint8_t)(~itpos);
	ldw	x, #0x5234
	ld	a, (x)
	and	a, (0x02, sp)
	ldw	x, #0x5234
	ld	(x), a
	jra	00116$
00111$:
;	lib/uart.c: 151: else if (uartreg == 0x02)
	tnz	a
	jreq	00108$
;	lib/uart.c: 153: UART1->CR2 &= (uint8_t)(~itpos);
	ldw	x, #0x5235
	ld	a, (x)
	and	a, (0x02, sp)
	ldw	x, #0x5235
	ld	(x), a
	jra	00116$
00108$:
;	lib/uart.c: 157: UART1->CR4 &= (uint8_t)(~itpos);
	ldw	x, #0x5237
	ld	a, (x)
	and	a, (0x02, sp)
	ldw	x, #0x5237
	ld	(x), a
00116$:
	addw	sp, #3
	ret
;	lib/uart.c: 163: uint8_t UART1_ReceiveData8(void)
;	-----------------------------------------
;	 function UART1_ReceiveData8
;	-----------------------------------------
_UART1_ReceiveData8:
;	lib/uart.c: 165: return ((uint8_t)UART1->DR);
	ldw	x, #0x5231
	ld	a, (x)
	ret
;	lib/uart.c: 168: void UART1_SendData8(uint8_t Data)
;	-----------------------------------------
;	 function UART1_SendData8
;	-----------------------------------------
_UART1_SendData8:
;	lib/uart.c: 171: UART1->DR = Data;
	ldw	x, #0x5231
	ld	a, (0x03, sp)
	ld	(x), a
	ret
;	lib/uart.c: 174: FlagStatus UART1_GetFlagStatus(UART1_Flag_TypeDef UART1_FLAG)
;	-----------------------------------------
;	 function UART1_GetFlagStatus
;	-----------------------------------------
_UART1_GetFlagStatus:
	push	a
;	lib/uart.c: 180: if ((UART1->CR4 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
	ld	a, (0x05, sp)
	ld	(0x01, sp), a
;	lib/uart.c: 178: if (UART1_FLAG == UART1_FLAG_LBDF)
	ldw	x, (0x04, sp)
	cpw	x, #0x0210
	jrne	00114$
;	lib/uart.c: 180: if ((UART1->CR4 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
	ldw	x, #0x5237
	ld	a, (x)
	and	a, (0x01, sp)
	tnz	a
	jreq	00102$
;	lib/uart.c: 183: status = SET;
	ld	a, #0x01
	jra	00115$
00102$:
;	lib/uart.c: 188: status = RESET;
	clr	a
	jra	00115$
00114$:
;	lib/uart.c: 191: else if (UART1_FLAG == UART1_FLAG_SBK)
	ldw	x, (0x04, sp)
	cpw	x, #0x0101
	jrne	00111$
;	lib/uart.c: 193: if ((UART1->CR2 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
	ldw	x, #0x5235
	ld	a, (x)
	and	a, (0x01, sp)
	tnz	a
	jreq	00105$
;	lib/uart.c: 196: status = SET;
	ld	a, #0x01
	jra	00115$
00105$:
;	lib/uart.c: 201: status = RESET;
	clr	a
	jra	00115$
00111$:
;	lib/uart.c: 206: if ((UART1->SR & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
	ldw	x, #0x5230
	ld	a, (x)
	and	a, (0x01, sp)
	tnz	a
	jreq	00108$
;	lib/uart.c: 209: status = SET;
	ld	a, #0x01
;	lib/uart.c: 214: status = RESET;
	.byte 0x21
00108$:
	clr	a
00115$:
;	lib/uart.c: 218: return status;
	addw	sp, #1
	ret
;	lib/uart.c: 221: void UART1_ClearFlag(UART1_Flag_TypeDef UART1_FLAG)
;	-----------------------------------------
;	 function UART1_ClearFlag
;	-----------------------------------------
_UART1_ClearFlag:
;	lib/uart.c: 224: if (UART1_FLAG == UART1_FLAG_RXNE)
	ldw	x, (0x03, sp)
	cpw	x, #0x0020
	jrne	00102$
;	lib/uart.c: 226: UART1->SR = (uint8_t)~(UART1_SR_RXNE);
	mov	0x5230+0, #0xdf
	ret
00102$:
;	lib/uart.c: 231: UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
	ldw	x, #0x5237
	ld	a, (x)
	and	a, #0xef
	ld	(x), a
	ret
;	lib/uart.c: 235: ITStatus UART1_GetITStatus(UART1_IT_TypeDef UART1_IT)
;	-----------------------------------------
;	 function UART1_GetITStatus
;	-----------------------------------------
_UART1_GetITStatus:
	sub	sp, #5
;	lib/uart.c: 244: itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
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
;	lib/uart.c: 246: itmask1 = (uint8_t)((uint8_t)UART1_IT >> (uint8_t)4);
	ld	a, xl
	swap	a
	and	a, #0x0f
	ld	xl, a
;	lib/uart.c: 248: itmask2 = (uint8_t)((uint8_t)1 << itmask1);
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
	ld	(0x02, sp), a
;	lib/uart.c: 251: if (UART1_IT == UART1_IT_PE)
	ldw	x, (0x08, sp)
	cpw	x, #0x0100
	jrne	00117$
;	lib/uart.c: 254: enablestatus = (uint8_t)((uint8_t)UART1->CR1 & itmask2);
	ldw	x, #0x5234
	ld	a, (x)
	and	a, (0x02, sp)
	ld	(0x04, sp), a
;	lib/uart.c: 257: if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
	ldw	x, #0x5230
	ld	a, (x)
	and	a, (0x03, sp)
	tnz	a
	jreq	00102$
	tnz	(0x04, sp)
	jreq	00102$
;	lib/uart.c: 260: pendingbitstatus = SET;
	ld	a, #0x01
	jra	00118$
00102$:
;	lib/uart.c: 265: pendingbitstatus = RESET;
	clr	a
	jra	00118$
00117$:
;	lib/uart.c: 269: else if (UART1_IT == UART1_IT_LBDF)
	ldw	x, (0x08, sp)
	cpw	x, #0x0346
	jrne	00114$
;	lib/uart.c: 272: enablestatus = (uint8_t)((uint8_t)UART1->CR4 & itmask2);
	ldw	x, #0x5237
	ld	a, (x)
	and	a, (0x02, sp)
	ld	(0x01, sp), a
;	lib/uart.c: 274: if (((UART1->CR4 & itpos) != (uint8_t)0x00) && enablestatus)
	ldw	x, #0x5237
	ld	a, (x)
	and	a, (0x03, sp)
	tnz	a
	jreq	00106$
	tnz	(0x01, sp)
	jreq	00106$
;	lib/uart.c: 277: pendingbitstatus = SET;
	ld	a, #0x01
	jra	00118$
00106$:
;	lib/uart.c: 282: pendingbitstatus = RESET;
	clr	a
	jra	00118$
00114$:
;	lib/uart.c: 288: enablestatus = (uint8_t)((uint8_t)UART1->CR2 & itmask2);
	ldw	x, #0x5235
	ld	a, (x)
	and	a, (0x02, sp)
	ld	(0x05, sp), a
;	lib/uart.c: 290: if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
	ldw	x, #0x5230
	ld	a, (x)
	and	a, (0x03, sp)
	tnz	a
	jreq	00110$
	tnz	(0x05, sp)
	jreq	00110$
;	lib/uart.c: 293: pendingbitstatus = SET;
	ld	a, #0x01
;	lib/uart.c: 298: pendingbitstatus = RESET;
	.byte 0x21
00110$:
	clr	a
00118$:
;	lib/uart.c: 303: return  pendingbitstatus;
	addw	sp, #5
	ret
;	lib/uart.c: 306: void UART1_ClearITPendingBit(UART1_IT_TypeDef UART1_IT)
;	-----------------------------------------
;	 function UART1_ClearITPendingBit
;	-----------------------------------------
_UART1_ClearITPendingBit:
;	lib/uart.c: 309: if (UART1_IT == UART1_IT_RXNE)
	ldw	x, (0x03, sp)
	cpw	x, #0x0255
	jrne	00102$
;	lib/uart.c: 311: UART1->SR = (uint8_t)~(UART1_SR_RXNE);
	mov	0x5230+0, #0xdf
	ret
00102$:
;	lib/uart.c: 316: UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
	ldw	x, #0x5237
	ld	a, (x)
	and	a, #0xef
	ld	(x), a
	ret
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)
