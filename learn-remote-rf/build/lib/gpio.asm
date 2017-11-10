;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (Mac OS X x86_64)
;--------------------------------------------------------
	.module gpio
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _GPIO_DeInit
	.globl _GPIO_Init
	.globl _GPIO_Write
	.globl _GPIO_WriteHigh
	.globl _GPIO_WriteLow
	.globl _GPIO_ReadInputPin
	.globl _GPIO_ExternalPullUpConfig
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
;	lib/gpio.c: 5: void GPIO_DeInit(GPIO_TypeDef* GPIOx)
;	-----------------------------------------
;	 function GPIO_DeInit
;	-----------------------------------------
_GPIO_DeInit:
	pushw	x
;	lib/gpio.c: 7: GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
	ldw	y, (0x05, sp)
	ldw	(0x01, sp), y
	ldw	x, (0x01, sp)
	clr	(x)
;	lib/gpio.c: 8: GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
	ldw	x, (0x01, sp)
	incw	x
	incw	x
	clr	(x)
;	lib/gpio.c: 9: GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
	ldw	x, (0x01, sp)
	addw	x, #0x0003
	clr	(x)
;	lib/gpio.c: 10: GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
	ldw	x, (0x01, sp)
	addw	x, #0x0004
	clr	(x)
	popw	x
	ret
;	lib/gpio.c: 13: void GPIO_Init(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
;	-----------------------------------------
;	 function GPIO_Init
;	-----------------------------------------
_GPIO_Init:
	sub	sp, #5
;	lib/gpio.c: 16: GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
	ldw	y, (0x08, sp)
	ldw	(0x01, sp), y
	ldw	x, (0x01, sp)
	addw	x, #0x0004
	ldw	(0x03, sp), x
	ldw	x, (0x03, sp)
	ld	a, (x)
	push	a
	ld	a, (0x0b, sp)
	cpl	a
	ld	(0x06, sp), a
	pop	a
	and	a, (0x05, sp)
	ldw	x, (0x03, sp)
	ld	(x), a
;	lib/gpio.c: 33: GPIOx->DDR |= (uint8_t)GPIO_Pin;
	ldw	x, (0x01, sp)
	incw	x
	incw	x
;	lib/gpio.c: 22: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
	tnz	(0x0b, sp)
	jrpl	00105$
;	lib/gpio.c: 26: GPIOx->ODR |= (uint8_t)GPIO_Pin;
	ldw	y, (0x01, sp)
	ld	a, (y)
;	lib/gpio.c: 24: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
	push	a
	ld	a, (0x0c, sp)
	bcp	a, #0x10
	pop	a
	jreq	00102$
;	lib/gpio.c: 26: GPIOx->ODR |= (uint8_t)GPIO_Pin;
	or	a, (0x0a, sp)
	ldw	y, (0x01, sp)
	ld	(y), a
	jra	00103$
00102$:
;	lib/gpio.c: 30: GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
	and	a, (0x05, sp)
	ldw	y, (0x01, sp)
	ld	(y), a
00103$:
;	lib/gpio.c: 33: GPIOx->DDR |= (uint8_t)GPIO_Pin;
	ld	a, (x)
	or	a, (0x0a, sp)
	ld	(x), a
	jra	00106$
00105$:
;	lib/gpio.c: 38: GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
	ld	a, (x)
	and	a, (0x05, sp)
	ld	(x), a
00106$:
;	lib/gpio.c: 47: GPIOx->CR1 |= (uint8_t)GPIO_Pin;
	ldw	x, (0x01, sp)
	addw	x, #0x0003
;	lib/gpio.c: 45: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
	ld	a, (0x0b, sp)
	bcp	a, #0x40
	jreq	00108$
;	lib/gpio.c: 47: GPIOx->CR1 |= (uint8_t)GPIO_Pin;
	ld	a, (x)
	or	a, (0x0a, sp)
	ld	(x), a
	jra	00109$
00108$:
;	lib/gpio.c: 51: GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
	ld	a, (x)
	and	a, (0x05, sp)
	ld	(x), a
00109$:
;	lib/gpio.c: 58: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
	ld	a, (0x0b, sp)
	bcp	a, #0x20
	jreq	00111$
;	lib/gpio.c: 60: GPIOx->CR2 |= (uint8_t)GPIO_Pin;
	ldw	x, (0x03, sp)
	ld	a, (x)
	or	a, (0x0a, sp)
	ldw	x, (0x03, sp)
	ld	(x), a
	jra	00113$
00111$:
;	lib/gpio.c: 64: GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
	ldw	x, (0x03, sp)
	ld	a, (x)
	and	a, (0x05, sp)
	ldw	x, (0x03, sp)
	ld	(x), a
00113$:
	addw	sp, #5
	ret
;	lib/gpio.c: 68: void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t PortVal)
;	-----------------------------------------
;	 function GPIO_Write
;	-----------------------------------------
_GPIO_Write:
;	lib/gpio.c: 70: GPIOx->ODR = PortVal;
	ldw	x, (0x03, sp)
	ld	a, (0x05, sp)
	ld	(x), a
	ret
;	lib/gpio.c: 73: void GPIO_WriteHigh(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
;	-----------------------------------------
;	 function GPIO_WriteHigh
;	-----------------------------------------
_GPIO_WriteHigh:
;	lib/gpio.c: 75: GPIOx->ODR |= (uint8_t)PortPins;
	ldw	x, (0x03, sp)
	ld	a, (x)
	or	a, (0x05, sp)
	ld	(x), a
	ret
;	lib/gpio.c: 78: void GPIO_WriteLow(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
;	-----------------------------------------
;	 function GPIO_WriteLow
;	-----------------------------------------
_GPIO_WriteLow:
	push	a
;	lib/gpio.c: 80: GPIOx->ODR &= (uint8_t)(~PortPins);
	ldw	x, (0x04, sp)
	ld	a, (x)
	ld	(0x01, sp), a
	ld	a, (0x06, sp)
	cpl	a
	and	a, (0x01, sp)
	ld	(x), a
	pop	a
	ret
;	lib/gpio.c: 93: BitStatus GPIO_ReadInputPin(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
;	-----------------------------------------
;	 function GPIO_ReadInputPin
;	-----------------------------------------
_GPIO_ReadInputPin:
;	lib/gpio.c: 95: return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
	ldw	x, (0x03, sp)
	ld	a, (0x1, x)
	and	a, (0x05, sp)
	ret
;	lib/gpio.c: 98: void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, FunctionalState NewState)
;	-----------------------------------------
;	 function GPIO_ExternalPullUpConfig
;	-----------------------------------------
_GPIO_ExternalPullUpConfig:
	push	a
;	lib/gpio.c: 102: GPIOx->CR1 |= (uint8_t)GPIO_Pin;
	ldw	x, (0x04, sp)
	addw	x, #0x0003
;	lib/gpio.c: 100: if (NewState != DISABLE)  //External Pull-Up Set
	tnz	(0x07, sp)
	jreq	00102$
;	lib/gpio.c: 102: GPIOx->CR1 |= (uint8_t)GPIO_Pin;
	ld	a, (x)
	or	a, (0x06, sp)
	ld	(x), a
	jra	00104$
00102$:
;	lib/gpio.c: 106: GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
	ld	a, (x)
	ld	(0x01, sp), a
	ld	a, (0x06, sp)
	cpl	a
	and	a, (0x01, sp)
	ld	(x), a
00104$:
	pop	a
	ret
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)
