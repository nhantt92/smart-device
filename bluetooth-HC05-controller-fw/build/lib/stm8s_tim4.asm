;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW64)
;--------------------------------------------------------
	.module stm8s_tim4
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _TIM4_DeInit
	.globl _TIM4_TimeBaseInit
	.globl _TIM4_Cmd
	.globl _TIM4_ITConfig
	.globl _TIM4_GetCounter
	.globl _TIM4_GetFlagStatus
	.globl _TIM4_ClearFlag
	.globl _TIM4_ClearITPendingBit
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
;	lib/stm8s_tim4.c: 13: void TIM4_DeInit(void)
;	-----------------------------------------
;	 function TIM4_DeInit
;	-----------------------------------------
_TIM4_DeInit:
;	lib/stm8s_tim4.c: 15: TIM4->CR1 = TIM4_CR1_RESET_VALUE;
	mov	0x5340+0, #0x00
;	lib/stm8s_tim4.c: 16: TIM4->IER = TIM4_IER_RESET_VALUE;
	mov	0x5343+0, #0x00
;	lib/stm8s_tim4.c: 17: TIM4->CNTR = TIM4_CNTR_RESET_VALUE;
	mov	0x5346+0, #0x00
;	lib/stm8s_tim4.c: 18: TIM4->PSCR = TIM4_PSCR_RESET_VALUE;
	mov	0x5347+0, #0x00
;	lib/stm8s_tim4.c: 19: TIM4->ARR = TIM4_ARR_RESET_VALUE;
	mov	0x5348+0, #0xff
;	lib/stm8s_tim4.c: 20: TIM4->SR1 = TIM4_SR1_RESET_VALUE;
	mov	0x5344+0, #0x00
	ret
;	lib/stm8s_tim4.c: 23: void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler, uint8_t TIM4_Period)
;	-----------------------------------------
;	 function TIM4_TimeBaseInit
;	-----------------------------------------
_TIM4_TimeBaseInit:
;	lib/stm8s_tim4.c: 26: TIM4->PSCR = (uint8_t)(TIM4_Prescaler);
	ldw	x, #0x5347
	ld	a, (0x03, sp)
	ld	(x), a
;	lib/stm8s_tim4.c: 28: TIM4->ARR = (uint8_t)(TIM4_Period);
	ldw	x, #0x5348
	ld	a, (0x04, sp)
	ld	(x), a
	ret
;	lib/stm8s_tim4.c: 31: void TIM4_Cmd(FunctionalState NewState)
;	-----------------------------------------
;	 function TIM4_Cmd
;	-----------------------------------------
_TIM4_Cmd:
;	lib/stm8s_tim4.c: 34: TIM4->CR1 |= TIM4_CR1_CEN;
	bset	0x5340, #0
	ret
;	lib/stm8s_tim4.c: 37: void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, FunctionalState NewState)
;	-----------------------------------------
;	 function TIM4_ITConfig
;	-----------------------------------------
_TIM4_ITConfig:
;	lib/stm8s_tim4.c: 41: TIM4->IER |= (uint8_t)TIM4_IT;
	ldw	x, #0x5343
	ld	a, (x)
	or	a, (0x03, sp)
	ldw	x, #0x5343
	ld	(x), a
	ret
;	lib/stm8s_tim4.c: 44: uint8_t TIM4_GetCounter(void)
;	-----------------------------------------
;	 function TIM4_GetCounter
;	-----------------------------------------
_TIM4_GetCounter:
;	lib/stm8s_tim4.c: 47: return (uint8_t)(TIM4->CNTR);
	ldw	x, #0x5346
	ld	a, (x)
	ret
;	lib/stm8s_tim4.c: 50: FlagStatus TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG)
;	-----------------------------------------
;	 function TIM4_GetFlagStatus
;	-----------------------------------------
_TIM4_GetFlagStatus:
;	lib/stm8s_tim4.c: 53: if ((TIM4->SR1 & (uint8_t)TIM4_FLAG)  != 0)
	ldw	x, #0x5344
	ld	a, (x)
	and	a, (0x03, sp)
	tnz	a
	jreq	00102$
;	lib/stm8s_tim4.c: 55: bitstatus = SET;
	ld	a, #0x01
	ret
00102$:
;	lib/stm8s_tim4.c: 59: bitstatus = RESET;
	clr	a
;	lib/stm8s_tim4.c: 61: return ((FlagStatus)bitstatus);
	ret
;	lib/stm8s_tim4.c: 64: void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
;	-----------------------------------------
;	 function TIM4_ClearFlag
;	-----------------------------------------
_TIM4_ClearFlag:
;	lib/stm8s_tim4.c: 67: TIM4->SR1 = (uint8_t)(~TIM4_FLAG);
	ld	a, (0x03, sp)
	cpl	a
	ldw	x, #0x5344
	ld	(x), a
	ret
;	lib/stm8s_tim4.c: 70: void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
;	-----------------------------------------
;	 function TIM4_ClearITPendingBit
;	-----------------------------------------
_TIM4_ClearITPendingBit:
;	lib/stm8s_tim4.c: 73: TIM4->SR1 = (uint8_t)(~TIM4_IT);
	ld	a, (0x03, sp)
	cpl	a
	ldw	x, #0x5344
	ld	(x), a
	ret
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)
