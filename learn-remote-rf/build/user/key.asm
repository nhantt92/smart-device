;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (Mac OS X x86_64)
;--------------------------------------------------------
	.module key
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _touch_get
	.globl _TIMER_CheckTimeMS
	.globl _TIMER_InitTime
	.globl _GPIO_ReadInputPin
	.globl _GPIO_Init
	.globl _key
	.globl _tp_init
	.globl _tp_get
	.globl _tp_manager
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
_key::
	.ds 11
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
;	user/key.c: 7: void tp_init(void)
;	-----------------------------------------
;	 function tp_init
;	-----------------------------------------
_tp_init:
	sub	sp, #6
;	user/key.c: 9: GPIO_Init(PORT_SET_KEY, PIN_SET_KEY, GPIO_MODE_IN_PU_NO_IT);
	push	#0x40
	push	#0x02
	push	#0x0a
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	user/key.c: 10: TIMER_InitTime(&key.tick);
	ldw	x, #_key+0
	ldw	(0x05, sp), x
	ldw	x, (0x05, sp)
	addw	x, #0x0005
	pushw	x
	call	_TIMER_InitTime
	popw	x
;	user/key.c: 11: for(key.name = TP_SET; key.name < NUM_KEY; key.name++){
	ldw	x, (0x05, sp)
	clr	(x)
	ldw	x, (0x05, sp)
	incw	x
	ldw	(0x03, sp), x
00103$:
	ldw	x, (0x05, sp)
	ld	a, (x)
	cp	a, #0x01
	jrnc	00105$
;	user/key.c: 12: key.ext[key.name].pressed = key.ext[key.name].press = TP_RELEASE;
	sll	a
	sll	a
	ld	xl, a
	clr	a
	ld	xh, a
	addw	x, (0x03, sp)
	ldw	(0x01, sp), x
	ldw	x, (0x01, sp)
	incw	x
	clr	(x)
	ldw	x, (0x01, sp)
	clr	(x)
;	user/key.c: 13: key.ext[key.name].waitRelease = 0;
	ldw	x, (0x05, sp)
	ld	a, (x)
	sll	a
	sll	a
	clrw	x
	ld	xl, a
	addw	x, (0x03, sp)
	incw	x
	incw	x
	clr	(x)
;	user/key.c: 14: key.ext[key.name].cnt = 0;
	ldw	x, (0x05, sp)
	ld	a, (x)
	sll	a
	sll	a
	clrw	x
	ld	xl, a
	addw	x, (0x03, sp)
	addw	x, #0x0003
	clr	(x)
;	user/key.c: 11: for(key.name = TP_SET; key.name < NUM_KEY; key.name++){
	ldw	x, (0x05, sp)
	inc	(x)
	jra	00103$
00105$:
	addw	sp, #6
	ret
;	user/key.c: 18: void touch_get(uint8_t port_id)     
;	-----------------------------------------
;	 function touch_get
;	-----------------------------------------
_touch_get:
	sub	sp, #6
;	user/key.c: 30: key.ext[port_id].press = TP_PRESS;
	ld	a, (0x09, sp)
	sll	a
	sll	a
	ld	(0x06, sp), a
;	user/key.c: 21: switch(port_id)
	ld	a, (0x09, sp)
	cp	a, #0x00
	jrne	00105$
;	user/key.c: 24: keyGet = SET_In();
	push	#0x02
	push	#0x0a
	push	#0x50
	call	_GPIO_ReadInputPin
	addw	sp, #3
	clrw	x
	ld	xl, a
;	user/key.c: 26: if(keyGet != PIN_SET_KEY)
	cpw	x, #0x0002
	jreq	00103$
;	user/key.c: 30: key.ext[port_id].press = TP_PRESS;
	ldw	x, #_key+1
	ld	a, xl
	add	a, (0x06, sp)
	rlwa	x
	adc	a, #0x00
	ld	xh, a
	incw	x
	ld	a, #0x01
	ld	(x), a
	jra	00105$
00103$:
;	user/key.c: 32: key.ext[port_id].press = TP_RELEASE;
	ldw	x, #_key+1
	ld	a, xl
	add	a, (0x06, sp)
	rlwa	x
	adc	a, #0x00
	ld	xh, a
	incw	x
	clr	(x)
;	user/key.c: 34: }
00105$:
;	user/key.c: 35: if(key.ext[port_id].press != key.ext[port_id].pressed)
	ldw	x, #_key+1
	ld	a, xl
	add	a, (0x06, sp)
	ld	(0x05, sp), a
	ld	a, xh
	adc	a, #0x00
	ld	(0x04, sp), a
	ldw	x, (0x04, sp)
	incw	x
	ldw	(0x02, sp), x
	ldw	x, (0x02, sp)
	ld	a, (x)
	ldw	x, (0x04, sp)
	push	a
	ld	a, (x)
	ld	(0x02, sp), a
	pop	a
;	user/key.c: 37: ++(key.ext[port_id].cnt);
	ldw	x, (0x04, sp)
	addw	x, #0x0003
;	user/key.c: 35: if(key.ext[port_id].press != key.ext[port_id].pressed)
	cp	a, (0x01, sp)
	jreq	00109$
;	user/key.c: 37: ++(key.ext[port_id].cnt);
	ld	a, (x)
	inc	a
	ld	(x), a
;	user/key.c: 38: if(key.ext[port_id].cnt == NUM_OF_SAMPLE_KEY)
	cp	a, #0x0a
	jrne	00111$
;	user/key.c: 40: key.ext[port_id].pressed = key.ext[port_id].press;
	ldw	y, (0x02, sp)
	ld	a, (y)
	ldw	y, (0x04, sp)
	ld	(y), a
;	user/key.c: 41: key.ext[port_id].cnt = 0;
	clr	(x)
	jra	00111$
00109$:
;	user/key.c: 46: key.ext[port_id].cnt = 0;
	clr	(x)
00111$:
	addw	sp, #6
	ret
;	user/key.c: 50: uint8_t tp_get(uint8_t id)
;	-----------------------------------------
;	 function tp_get
;	-----------------------------------------
_tp_get:
	pushw	x
;	user/key.c: 52: return key.ext[id].pressed;
	ldw	x, #_key+1
	ldw	(0x01, sp), x
	ld	a, (0x05, sp)
	sll	a
	sll	a
	clrw	x
	ld	xl, a
	addw	x, (0x01, sp)
	ld	a, (x)
	popw	x
	ret
;	user/key.c: 55: void tp_manager(void)
;	-----------------------------------------
;	 function tp_manager
;	-----------------------------------------
_tp_manager:
	sub	sp, #5
;	user/key.c: 57: if(!TIMER_CheckTimeMS(&key.tick, 10))
	ldw	x, #_key+0
	ldw	(0x04, sp), x
	ldw	x, (0x04, sp)
	addw	x, #0x0005
	push	#0x0a
	push	#0x00
	push	#0x00
	push	#0x00
	pushw	x
	call	_TIMER_CheckTimeMS
	addw	sp, #6
	ld	(0x03, sp), a
	tnz	(0x03, sp)
	jrne	00111$
;	user/key.c: 59: for(key.name = TP_SET;key.name < NUM_KEY;key.name++)
	ldw	x, (0x04, sp)
	clr	(x)
	ldw	x, (0x04, sp)
	incw	x
	ldw	(0x01, sp), x
00109$:
	ldw	x, (0x04, sp)
	ld	a, (x)
	cp	a, #0x01
	jrnc	00111$
;	user/key.c: 61: touch_get(key.name);
	push	a
	call	_touch_get
	pop	a
;	user/key.c: 62: if(key.ext[key.name].pressed == TP_PRESS)
	ldw	x, (0x04, sp)
	ld	a, (x)
	sll	a
	sll	a
	clrw	x
	ld	xl, a
	addw	x, (0x01, sp)
	ld	a, (x)
	cp	a, #0x01
	jrne	00102$
;	user/key.c: 64: key.ext[key.name].waitRelease = 1;
	incw	x
	incw	x
	ld	a, #0x01
	ld	(x), a
00102$:
;	user/key.c: 67: if(key.ext[key.name].pressed == TP_RELEASE){
	ldw	x, (0x04, sp)
	ld	a, (x)
	sll	a
	sll	a
	clrw	x
	ld	xl, a
	addw	x, (0x01, sp)
	ld	a, (x)
	tnz	a
	jrne	00110$
;	user/key.c: 68: key.ext[key.name].waitRelease = 0;
	incw	x
	incw	x
	clr	(x)
00110$:
;	user/key.c: 59: for(key.name = TP_SET;key.name < NUM_KEY;key.name++)
	ldw	x, (0x04, sp)
	inc	(x)
	jra	00109$
00111$:
	addw	sp, #5
	ret
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)
