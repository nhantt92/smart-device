;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW64)
;--------------------------------------------------------
	.module ledss
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _TIMER_CheckTimeMS
	.globl _TIMER_InitTime
	.globl _GPIO_WriteLow
	.globl _GPIO_WriteHigh
	.globl _GPIO_Init
	.globl _led
	.globl _led_change
	.globl _led_getstatus
	.globl _ledstt_init
	.globl _ledstt_manager
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
_led::
	.ds 9
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
;	user/ledss.c: 4: void led_change(uint8_t mode, uint8_t time)
;	-----------------------------------------
;	 function led_change
;	-----------------------------------------
_led_change:
	pushw	x
;	user/ledss.c: 6: led.mode = mode;
	ldw	x, #_led+0
	ldw	(0x01, sp), x
	ldw	x, (0x01, sp)
	ld	a, (0x05, sp)
	ld	(0x0006, x), a
;	user/ledss.c: 7: led.timeOn = time;
	ldw	x, (0x01, sp)
	ld	a, (0x06, sp)
	ld	(0x0007, x), a
	popw	x
	ret
;	user/ledss.c: 10: uint8_t led_getstatus(void)
;	-----------------------------------------
;	 function led_getstatus
;	-----------------------------------------
_led_getstatus:
;	user/ledss.c: 12: return led.mode;
	ldw	x, #_led+6
	ld	a, (x)
	ret
;	user/ledss.c: 15: void ledstt_init(void)
;	-----------------------------------------
;	 function ledstt_init
;	-----------------------------------------
_ledstt_init:
	pushw	x
;	user/ledss.c: 17: led.mode = LED_OFF;
	ldw	x, #_led+0
	ldw	(0x01, sp), x
	ldw	x, (0x01, sp)
	addw	x, #0x0006
	clr	(x)
;	user/ledss.c: 18: led.timeOn = 0;
	ldw	x, (0x01, sp)
	addw	x, #0x0007
	clr	(x)
;	user/ledss.c: 19: led.cycle = 0;
	ldw	x, (0x01, sp)
	addw	x, #0x0008
	clr	(x)
;	user/ledss.c: 20: GPIO_Init(PORT_LED, PIN_LED, GPIO_MODE_OUT_PP_HIGH_FAST);
	push	#0xf0
	push	#0x10
	push	#0x0a
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	user/ledss.c: 21: TIMER_InitTime(&led.tick);
	ldw	x, (0x01, sp)
	pushw	x
	call	_TIMER_InitTime
	popw	x
;	user/ledss.c: 22: led_change(LED_FLASH, 10);
	push	#0x0a
	push	#0x02
	call	_led_change
	addw	sp, #4
	ret
;	user/ledss.c: 25: void ledstt_manager(void)
;	-----------------------------------------
;	 function ledstt_manager
;	-----------------------------------------
_ledstt_manager:
	pushw	x
;	user/ledss.c: 27: if(!TIMER_CheckTimeMS(&led.tick, 200))
	ldw	x, #_led+0
	push	#0xc8
	push	#0x00
	push	#0x00
	push	#0x00
	pushw	x
	call	_TIMER_CheckTimeMS
	addw	sp, #6
	tnz	a
	jrne	00115$
;	user/ledss.c: 29: if(led.mode == LED_ON)
	ldw	x, #_led+0
	ldw	(0x01, sp), x
	ldw	x, (0x01, sp)
	addw	x, #0x0006
	ld	a, (x)
	cp	a, #0x01
	jrne	00111$
;	user/ledss.c: 30: GPIO_WriteLow(PORT_LED, PIN_LED);
	push	#0x10
	push	#0x0a
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
	jra	00115$
00111$:
;	user/ledss.c: 31: else if(led.mode == LED_OFF)
	tnz	a
	jrne	00108$
;	user/ledss.c: 32: GPIO_WriteHigh(PORT_LED, PIN_LED);
	push	#0x10
	push	#0x0a
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
	jra	00115$
00108$:
;	user/ledss.c: 35: if(led.timeOn != 0)
	ldw	y, (0x01, sp)
	addw	y, #0x0007
	ld	a, (y)
	tnz	a
	jreq	00105$
;	user/ledss.c: 37: led.timeOn--;
	dec	a
	ld	(y), a
;	user/ledss.c: 38: if(led.cycle == 0)
	ldw	x, (0x01, sp)
	addw	x, #0x0008
	ld	a, (x)
	tnz	a
	jrne	00102$
;	user/ledss.c: 40: led.cycle = 1;
	ld	a, #0x01
	ld	(x), a
;	user/ledss.c: 41: GPIO_WriteLow(PORT_LED, PIN_LED);
	push	#0x10
	push	#0x0a
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
	jra	00115$
00102$:
;	user/ledss.c: 45: led.cycle = 0;
	clr	(x)
;	user/ledss.c: 46: GPIO_WriteHigh(PORT_LED, PIN_LED);
	push	#0x10
	push	#0x0a
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
	jra	00115$
00105$:
;	user/ledss.c: 50: led.mode = LED_OFF;
	clr	(x)
00115$:
	popw	x
	ret
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)
