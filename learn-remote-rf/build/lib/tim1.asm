;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW64)
;--------------------------------------------------------
	.module tim1
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _TIM1_DeInit
	.globl _TIM1_TimeBaseInit
	.globl _TIM1_Cmd
	.globl _TIM1_ITConfig
	.globl _TIM1_SetCounter
	.globl _TIM1_GetCounter
	.globl _TIM1_ClearFlag
	.globl _TIM1_ClearITPendingBit
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
;	lib/tim1.c: 4: void TIM1_DeInit(void)
;	-----------------------------------------
;	 function TIM1_DeInit
;	-----------------------------------------
_TIM1_DeInit:
;	lib/tim1.c: 6: TIM1->CR1  = TIM1_CR1_RESET_VALUE;
	mov	0x5250+0, #0x00
;	lib/tim1.c: 7: TIM1->CR2  = TIM1_CR2_RESET_VALUE;
	mov	0x5251+0, #0x00
;	lib/tim1.c: 8: TIM1->SMCR = TIM1_SMCR_RESET_VALUE;
	mov	0x5252+0, #0x00
;	lib/tim1.c: 9: TIM1->ETR  = TIM1_ETR_RESET_VALUE;
	mov	0x5253+0, #0x00
;	lib/tim1.c: 10: TIM1->IER  = TIM1_IER_RESET_VALUE;
	mov	0x5254+0, #0x00
;	lib/tim1.c: 11: TIM1->SR2  = TIM1_SR2_RESET_VALUE;
	mov	0x5256+0, #0x00
;	lib/tim1.c: 13: TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
	mov	0x525c+0, #0x00
;	lib/tim1.c: 14: TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
	mov	0x525d+0, #0x00
;	lib/tim1.c: 16: TIM1->CCMR1 = 0x01;
	mov	0x5258+0, #0x01
;	lib/tim1.c: 17: TIM1->CCMR2 = 0x01;
	mov	0x5259+0, #0x01
;	lib/tim1.c: 18: TIM1->CCMR3 = 0x01;
	mov	0x525a+0, #0x01
;	lib/tim1.c: 19: TIM1->CCMR4 = 0x01;
	mov	0x525b+0, #0x01
;	lib/tim1.c: 21: TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
	mov	0x525c+0, #0x00
;	lib/tim1.c: 22: TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
	mov	0x525d+0, #0x00
;	lib/tim1.c: 23: TIM1->CCMR1 = TIM1_CCMR1_RESET_VALUE;
	mov	0x5258+0, #0x00
;	lib/tim1.c: 24: TIM1->CCMR2 = TIM1_CCMR2_RESET_VALUE;
	mov	0x5259+0, #0x00
;	lib/tim1.c: 25: TIM1->CCMR3 = TIM1_CCMR3_RESET_VALUE;
	mov	0x525a+0, #0x00
;	lib/tim1.c: 26: TIM1->CCMR4 = TIM1_CCMR4_RESET_VALUE;
	mov	0x525b+0, #0x00
;	lib/tim1.c: 27: TIM1->CNTRH = TIM1_CNTRH_RESET_VALUE;
	mov	0x525e+0, #0x00
;	lib/tim1.c: 28: TIM1->CNTRL = TIM1_CNTRL_RESET_VALUE;
	mov	0x525f+0, #0x00
;	lib/tim1.c: 29: TIM1->PSCRH = TIM1_PSCRH_RESET_VALUE;
	mov	0x5260+0, #0x00
;	lib/tim1.c: 30: TIM1->PSCRL = TIM1_PSCRL_RESET_VALUE;
	mov	0x5261+0, #0x00
;	lib/tim1.c: 31: TIM1->ARRH  = TIM1_ARRH_RESET_VALUE;
	mov	0x5262+0, #0xff
;	lib/tim1.c: 32: TIM1->ARRL  = TIM1_ARRL_RESET_VALUE;
	mov	0x5263+0, #0xff
;	lib/tim1.c: 33: TIM1->CCR1H = TIM1_CCR1H_RESET_VALUE;
	mov	0x5265+0, #0x00
;	lib/tim1.c: 34: TIM1->CCR1L = TIM1_CCR1L_RESET_VALUE;
	mov	0x5266+0, #0x00
;	lib/tim1.c: 35: TIM1->CCR2H = TIM1_CCR2H_RESET_VALUE;
	mov	0x5267+0, #0x00
;	lib/tim1.c: 36: TIM1->CCR2L = TIM1_CCR2L_RESET_VALUE;
	mov	0x5268+0, #0x00
;	lib/tim1.c: 37: TIM1->CCR3H = TIM1_CCR3H_RESET_VALUE;
	mov	0x5269+0, #0x00
;	lib/tim1.c: 38: TIM1->CCR3L = TIM1_CCR3L_RESET_VALUE;
	mov	0x526a+0, #0x00
;	lib/tim1.c: 39: TIM1->CCR4H = TIM1_CCR4H_RESET_VALUE;
	mov	0x526b+0, #0x00
;	lib/tim1.c: 40: TIM1->CCR4L = TIM1_CCR4L_RESET_VALUE;
	mov	0x526c+0, #0x00
;	lib/tim1.c: 41: TIM1->OISR  = TIM1_OISR_RESET_VALUE;
	mov	0x526f+0, #0x00
;	lib/tim1.c: 42: TIM1->EGR   = 0x01; /* TIM1_EGR_UG */
	mov	0x5257+0, #0x01
;	lib/tim1.c: 43: TIM1->DTR   = TIM1_DTR_RESET_VALUE;
	mov	0x526e+0, #0x00
;	lib/tim1.c: 44: TIM1->BKR   = TIM1_BKR_RESET_VALUE;
	mov	0x526d+0, #0x00
;	lib/tim1.c: 45: TIM1->RCR   = TIM1_RCR_RESET_VALUE;
	mov	0x5264+0, #0x00
;	lib/tim1.c: 46: TIM1->SR1   = TIM1_SR1_RESET_VALUE;
	mov	0x5255+0, #0x00
	ret
;	lib/tim1.c: 49: void TIM1_TimeBaseInit(uint16_t TIM1_Prescaler,
;	-----------------------------------------
;	 function TIM1_TimeBaseInit
;	-----------------------------------------
_TIM1_TimeBaseInit:
	sub	sp, #4
;	lib/tim1.c: 56: TIM1->ARRH = (uint8_t)(TIM1_Period >> 8);
	ld	a, (0x0a, sp)
	clr	(0x01, sp)
	ldw	x, #0x5262
	ld	(x), a
;	lib/tim1.c: 57: TIM1->ARRL = (uint8_t)(TIM1_Period);
	ld	a, (0x0b, sp)
	ldw	x, #0x5263
	ld	(x), a
;	lib/tim1.c: 60: TIM1->PSCRH = (uint8_t)(TIM1_Prescaler >> 8);
	ld	a, (0x07, sp)
	clr	(0x03, sp)
	ldw	x, #0x5260
	ld	(x), a
;	lib/tim1.c: 61: TIM1->PSCRL = (uint8_t)(TIM1_Prescaler);
	ld	a, (0x08, sp)
	ldw	x, #0x5261
	ld	(x), a
;	lib/tim1.c: 64: TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)(~(TIM1_CR1_CMS | TIM1_CR1_DIR)))
	ldw	x, #0x5250
	ld	a, (x)
	and	a, #0x8f
;	lib/tim1.c: 65: | (uint8_t)(TIM1_CounterMode));
	or	a, (0x09, sp)
	ldw	x, #0x5250
	ld	(x), a
;	lib/tim1.c: 68: TIM1->RCR = TIM1_RepetitionCounter;
	ldw	x, #0x5264
	ld	a, (0x0c, sp)
	ld	(x), a
	addw	sp, #4
	ret
;	lib/tim1.c: 71: void TIM1_Cmd(FunctionalState NewState)
;	-----------------------------------------
;	 function TIM1_Cmd
;	-----------------------------------------
_TIM1_Cmd:
;	lib/tim1.c: 74: if (NewState != DISABLE)
	tnz	(0x03, sp)
	jreq	00102$
;	lib/tim1.c: 76: TIM1->CR1 |= TIM1_CR1_CEN;
	bset	0x5250, #0
	ret
00102$:
;	lib/tim1.c: 80: TIM1->CR1 &= (uint8_t)(~TIM1_CR1_CEN);
	bres	0x5250, #0
	ret
;	lib/tim1.c: 84: void TIM1_ITConfig(TIM1_IT_TypeDef  TIM1_IT, FunctionalState NewState)
;	-----------------------------------------
;	 function TIM1_ITConfig
;	-----------------------------------------
_TIM1_ITConfig:
	push	a
;	lib/tim1.c: 86: if (NewState != DISABLE)
	tnz	(0x05, sp)
	jreq	00102$
;	lib/tim1.c: 89: TIM1->IER |= (uint8_t)TIM1_IT;
	ldw	x, #0x5254
	ld	a, (x)
	or	a, (0x04, sp)
	ldw	x, #0x5254
	ld	(x), a
	jra	00104$
00102$:
;	lib/tim1.c: 94: TIM1->IER &= (uint8_t)(~(uint8_t)TIM1_IT);
	ldw	x, #0x5254
	ld	a, (x)
	ld	(0x01, sp), a
	ld	a, (0x04, sp)
	cpl	a
	and	a, (0x01, sp)
	ldw	x, #0x5254
	ld	(x), a
00104$:
	pop	a
	ret
;	lib/tim1.c: 98: void TIM1_SetCounter(uint16_t Counter)
;	-----------------------------------------
;	 function TIM1_SetCounter
;	-----------------------------------------
_TIM1_SetCounter:
	pushw	x
;	lib/tim1.c: 101: TIM1->CNTRH = (uint8_t)(Counter >> 8);
	ld	a, (0x05, sp)
	clr	(0x01, sp)
	ldw	x, #0x525e
	ld	(x), a
;	lib/tim1.c: 102: TIM1->CNTRL = (uint8_t)(Counter);
	ld	a, (0x06, sp)
	ldw	x, #0x525f
	ld	(x), a
	popw	x
	ret
;	lib/tim1.c: 112: uint16_t TIM1_GetCounter(void)
;	-----------------------------------------
;	 function TIM1_GetCounter
;	-----------------------------------------
_TIM1_GetCounter:
	sub	sp, #4
;	lib/tim1.c: 116: tmpcntr = ((uint16_t)TIM1->CNTRH << 8);
	ldw	x, #0x525e
	ld	a, (x)
	ld	xh, a
	clr	a
	clr	a
	ld	(0x02, sp), a
;	lib/tim1.c: 119: return (uint16_t)(tmpcntr | (uint16_t)(TIM1->CNTRL));
	ldw	y, #0x525f
	ld	a, (y)
	clr	(0x03, sp)
	or	a, (0x02, sp)
	rlwa	x
	or	a, (0x03, sp)
	ld	xh, a
	addw	sp, #4
	ret
;	lib/tim1.c: 141: void TIM1_ClearFlag(TIM1_FLAG_TypeDef TIM1_FLAG)
;	-----------------------------------------
;	 function TIM1_ClearFlag
;	-----------------------------------------
_TIM1_ClearFlag:
	pushw	x
;	lib/tim1.c: 144: TIM1->SR1 = (uint8_t)(~(uint8_t)(TIM1_FLAG));
	ld	a, (0x06, sp)
	cpl	a
	ldw	x, #0x5255
	ld	(x), a
;	lib/tim1.c: 145: TIM1->SR2 = (uint8_t)((uint8_t)(~((uint8_t)((uint16_t)TIM1_FLAG >> 8))) & 
	ld	a, (0x05, sp)
	clr	(0x01, sp)
	cpl	a
	and	a, #0x1e
	ldw	x, #0x5256
	ld	(x), a
	popw	x
	ret
;	lib/tim1.c: 169: void TIM1_ClearITPendingBit(TIM1_IT_TypeDef TIM1_IT)
;	-----------------------------------------
;	 function TIM1_ClearITPendingBit
;	-----------------------------------------
_TIM1_ClearITPendingBit:
;	lib/tim1.c: 172: TIM1->SR1 = (uint8_t)(~(uint8_t)TIM1_IT);
	ld	a, (0x03, sp)
	cpl	a
	ldw	x, #0x5255
	ld	(x), a
	ret
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)
