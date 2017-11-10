;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW64)
;--------------------------------------------------------
	.module exti
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _EXTI_SetExtIntSensitivity
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
;	lib/exti.c: 4: void EXTI_SetExtIntSensitivity(EXTI_Port_TypeDef Port, EXTI_Sensitivity_TypeDef SensitivityValue)
;	-----------------------------------------
;	 function EXTI_SetExtIntSensitivity
;	-----------------------------------------
_EXTI_SetExtIntSensitivity:
	sub	sp, #3
;	lib/exti.c: 7: switch (Port)
	ld	a, (0x06, sp)
	cp	a, #0x04
	jrule	00114$
	jp	00108$
00114$:
	clrw	x
	ld	a, (0x06, sp)
	ld	xl, a
	sllw	x
	ldw	x, (#00115$, x)
	jp	(x)
00115$:
	.dw	#00101$
	.dw	#00102$
	.dw	#00103$
	.dw	#00104$
	.dw	#00105$
;	lib/exti.c: 9: case EXTI_PORT_GPIOA:
00101$:
;	lib/exti.c: 10: EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PAIS);
	ldw	x, #0x50a0
	ld	a, (x)
	and	a, #0xfc
	ld	(x), a
;	lib/exti.c: 11: EXTI->CR1 |= (uint8_t)(SensitivityValue);
	ldw	x, #0x50a0
	ld	a, (x)
	or	a, (0x07, sp)
	ldw	x, #0x50a0
	ld	(x), a
;	lib/exti.c: 12: break;
	jra	00108$
;	lib/exti.c: 13: case EXTI_PORT_GPIOB:
00102$:
;	lib/exti.c: 14: EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PBIS);
	ldw	x, #0x50a0
	ld	a, (x)
	and	a, #0xf3
	ld	(x), a
;	lib/exti.c: 15: EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 2);
	ldw	x, #0x50a0
	ld	a, (x)
	ld	(0x03, sp), a
	ld	a, (0x07, sp)
	sll	a
	sll	a
	or	a, (0x03, sp)
	ldw	x, #0x50a0
	ld	(x), a
;	lib/exti.c: 16: break;
	jra	00108$
;	lib/exti.c: 17: case EXTI_PORT_GPIOC:
00103$:
;	lib/exti.c: 18: EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PCIS);
	ldw	x, #0x50a0
	ld	a, (x)
	and	a, #0xcf
	ld	(x), a
;	lib/exti.c: 19: EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 4);
	ldw	x, #0x50a0
	ld	a, (x)
	ld	(0x02, sp), a
	ld	a, (0x07, sp)
	swap	a
	and	a, #0xf0
	or	a, (0x02, sp)
	ldw	x, #0x50a0
	ld	(x), a
;	lib/exti.c: 20: break;
	jra	00108$
;	lib/exti.c: 21: case EXTI_PORT_GPIOD:
00104$:
;	lib/exti.c: 22: EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PDIS);
	ldw	x, #0x50a0
	ld	a, (x)
	and	a, #0x3f
	ld	(x), a
;	lib/exti.c: 23: EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 6);
	ldw	x, #0x50a0
	ld	a, (x)
	ld	(0x01, sp), a
	ld	a, (0x07, sp)
	swap	a
	and	a, #0xf0
	sll	a
	sll	a
	or	a, (0x01, sp)
	ldw	x, #0x50a0
	ld	(x), a
;	lib/exti.c: 24: break;
	jra	00108$
;	lib/exti.c: 25: case EXTI_PORT_GPIOE:
00105$:
;	lib/exti.c: 26: EXTI->CR2 &= (uint8_t)(~EXTI_CR2_PEIS);
	ldw	x, #0x50a1
	ld	a, (x)
	and	a, #0xfc
	ld	(x), a
;	lib/exti.c: 27: EXTI->CR2 |= (uint8_t)(SensitivityValue);
	ldw	x, #0x50a1
	ld	a, (x)
	or	a, (0x07, sp)
	ldw	x, #0x50a1
	ld	(x), a
;	lib/exti.c: 31: }
00108$:
	addw	sp, #3
	ret
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)
