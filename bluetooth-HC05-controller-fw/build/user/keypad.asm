;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW64)
;--------------------------------------------------------
	.module keypad
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _GPIO_ReadInputPin
	.globl _GPIO_Init
	.globl _key
	.globl _touch_pad_init
	.globl _touch_get
	.globl _tp_get
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
_key::
	.ds 39
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
;	user/keypad.c: 7: void touch_pad_init(void)
;	-----------------------------------------
;	 function touch_pad_init
;	-----------------------------------------
_touch_pad_init:
	sub	sp, #4
;	user/keypad.c: 9: GPIO_Init(KEY_PORT1, KEY1|KEY2|KEY3|KEY4|KEY5, GPIO_MODE_IN_PU_NO_IT);
	push	#0x40
	push	#0x9d
	push	#0x0f
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	user/keypad.c: 10: GPIO_Init(KEY_PORT2, KEY6|KEY7|KEY8, GPIO_MODE_IN_PU_NO_IT);
	push	#0x40
	push	#0x1c
	push	#0x0a
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	user/keypad.c: 11: for(key.name = 0; key.name < NUM_KEY; key.name++)
	ldw	y, #_key+0
	clr	(y)
00103$:
	ld	a, (y)
	cp	a, #0x08
	jrnc	00105$
;	user/keypad.c: 13: key.ext[key.name].press = key.ext[key.name].press = TP_RELEASE;
	ldw	x, #_key+0
	ldw	(0x01, sp), x
	ldw	x, (0x01, sp)
	incw	x
	ldw	(0x03, sp), x
	ldw	x, (0x01, sp)
	ld	a, (x)
	sll	a
	sll	a
	clrw	x
	ld	xl, a
	addw	x, (0x03, sp)
	incw	x
	clr	(x)
	clr	(x)
;	user/keypad.c: 14: key.ext[key.name].waitRelease = 0;
	ldw	x, (0x01, sp)
	ld	a, (x)
	sll	a
	sll	a
	clrw	x
	ld	xl, a
	addw	x, (0x03, sp)
	incw	x
	incw	x
	clr	(x)
;	user/keypad.c: 15: key.ext[key.name].cnt = 0;
	ldw	x, (0x01, sp)
	ld	a, (x)
	sll	a
	sll	a
	clrw	x
	ld	xl, a
	addw	x, (0x03, sp)
	addw	x, #0x0003
	clr	(x)
;	user/keypad.c: 11: for(key.name = 0; key.name < NUM_KEY; key.name++)
	ldw	x, (0x01, sp)
	inc	(x)
	jra	00103$
00105$:
	addw	sp, #4
	ret
;	user/keypad.c: 19: void touch_get(uint8_t port_id){
;	-----------------------------------------
;	 function touch_get
;	-----------------------------------------
_touch_get:
	sub	sp, #4
;	user/keypad.c: 25: key.ext[port_id].press = TP_PRESS;
	ld	a, (0x07, sp)
	sll	a
	sll	a
	ld	(0x04, sp), a
;	user/keypad.c: 21: switch(port_id){
	ld	a, (0x07, sp)
	cp	a, #0x00
	jreq	00101$
	ld	a, (0x07, sp)
	cp	a, #0x01
	jreq	00105$
	ld	a, (0x07, sp)
	cp	a, #0x02
	jreq	00109$
	ld	a, (0x07, sp)
	cp	a, #0x03
	jrne	00175$
	jp	00113$
00175$:
	jp	00117$
;	user/keypad.c: 22: case 0:
00101$:
;	user/keypad.c: 23: keyGet = KEY5_In();
	push	#0x80
	push	#0x0f
	push	#0x50
	call	_GPIO_ReadInputPin
	addw	sp, #3
	clrw	x
	ld	xl, a
;	user/keypad.c: 24: if(keyGet == 0)
	tnzw	x
	jrne	00103$
;	user/keypad.c: 25: key.ext[port_id].press = TP_PRESS;
	ldw	x, #_key+1
	ld	a, xl
	add	a, (0x04, sp)
	rlwa	x
	adc	a, #0x00
	ld	xh, a
	incw	x
	ld	a, #0x01
	ld	(x), a
	jp	00117$
00103$:
;	user/keypad.c: 27: key.ext[port_id].press = TP_RELEASE;
	ldw	x, #_key+1
	ld	a, xl
	add	a, (0x04, sp)
	rlwa	x
	adc	a, #0x00
	ld	xh, a
	incw	x
	clr	(x)
;	user/keypad.c: 28: break;
	jp	00117$
;	user/keypad.c: 29: case 1:
00105$:
;	user/keypad.c: 30: keyGet = KEY6_In();
	push	#0x04
	push	#0x0a
	push	#0x50
	call	_GPIO_ReadInputPin
	addw	sp, #3
	clrw	x
	ld	xl, a
;	user/keypad.c: 31: if(keyGet == 0)
	tnzw	x
	jrne	00107$
;	user/keypad.c: 32: key.ext[port_id].press = TP_PRESS;
	ldw	x, #_key+1
	ld	a, xl
	add	a, (0x04, sp)
	rlwa	x
	adc	a, #0x00
	ld	xh, a
	incw	x
	ld	a, #0x01
	ld	(x), a
	jra	00117$
00107$:
;	user/keypad.c: 34: key.ext[port_id].press = TP_RELEASE;
	ldw	x, #_key+1
	ld	a, xl
	add	a, (0x04, sp)
	rlwa	x
	adc	a, #0x00
	ld	xh, a
	incw	x
	clr	(x)
;	user/keypad.c: 35: break;
	jra	00117$
;	user/keypad.c: 36: case 2:
00109$:
;	user/keypad.c: 37: keyGet = KEY8_In();
	push	#0x10
	push	#0x0a
	push	#0x50
	call	_GPIO_ReadInputPin
	addw	sp, #3
	clrw	x
	ld	xl, a
;	user/keypad.c: 38: if(keyGet == 0)
	tnzw	x
	jrne	00111$
;	user/keypad.c: 39: key.ext[port_id].press = TP_PRESS;
	ldw	x, #_key+1
	ld	a, xl
	add	a, (0x04, sp)
	rlwa	x
	adc	a, #0x00
	ld	xh, a
	incw	x
	ld	a, #0x01
	ld	(x), a
	jra	00117$
00111$:
;	user/keypad.c: 41: key.ext[port_id].press = TP_RELEASE;
	ldw	x, #_key+1
	ld	a, xl
	add	a, (0x04, sp)
	rlwa	x
	adc	a, #0x00
	ld	xh, a
	incw	x
	clr	(x)
;	user/keypad.c: 42: break;
	jra	00117$
;	user/keypad.c: 43: case 3:
00113$:
;	user/keypad.c: 44: keyGet = KEY7_In();
	push	#0x08
	push	#0x0a
	push	#0x50
	call	_GPIO_ReadInputPin
	addw	sp, #3
	clrw	x
	ld	xl, a
;	user/keypad.c: 45: if(keyGet == 0)
	tnzw	x
	jrne	00115$
;	user/keypad.c: 46: key.ext[port_id].press = TP_PRESS;
	ldw	x, #_key+1
	ld	a, xl
	add	a, (0x04, sp)
	rlwa	x
	adc	a, #0x00
	ld	xh, a
	incw	x
	ld	a, #0x01
	ld	(x), a
	jra	00117$
00115$:
;	user/keypad.c: 48: key.ext[port_id].press = TP_RELEASE;
	ldw	x, #_key+1
	ld	a, xl
	add	a, (0x04, sp)
	rlwa	x
	adc	a, #0x00
	ld	xh, a
	incw	x
	clr	(x)
;	user/keypad.c: 50: }
00117$:
;	user/keypad.c: 51: if(key.ext[port_id].press != key.ext[port_id].pressed)
	ldw	x, #_key+1
	ld	a, xl
	add	a, (0x04, sp)
	ld	(0x02, sp), a
	ld	a, xh
	adc	a, #0x00
	ld	(0x01, sp), a
	ldw	x, (0x01, sp)
	ld	a, (0x1, x)
	ldw	x, (0x01, sp)
	push	a
	ld	a, (x)
	ld	(0x04, sp), a
	pop	a
;	user/keypad.c: 53: ++(key.ext[port_id].cnt);
	ldw	x, (0x01, sp)
	addw	x, #0x0003
;	user/keypad.c: 51: if(key.ext[port_id].press != key.ext[port_id].pressed)
	cp	a, (0x03, sp)
	jreq	00121$
;	user/keypad.c: 53: ++(key.ext[port_id].cnt);
	ld	a, (x)
	inc	a
	ld	(x), a
;	user/keypad.c: 54: if(key.ext[port_id].cnt == NUM_OF_SAMPLE_KEY)
	cp	a, #0x0a
	jrne	00123$
;	user/keypad.c: 56: key.ext[port_id].pressed = key.ext[port_id].pressed;
	ldw	y, (0x01, sp)
	ld	a, (y)
	ldw	y, (0x01, sp)
	ld	(y), a
;	user/keypad.c: 57: key.ext[port_id].cnt = 0;
	clr	(x)
	jra	00123$
00121$:
;	user/keypad.c: 62: key.ext[port_id].cnt = 0;
	clr	(x)
00123$:
	addw	sp, #4
	ret
;	user/keypad.c: 66: uint8_t tp_get(uint8_t id){
;	-----------------------------------------
;	 function tp_get
;	-----------------------------------------
_tp_get:
	pushw	x
;	user/keypad.c: 67: return key.ext[id].pressed;
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
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)
