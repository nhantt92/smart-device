;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW64)
;--------------------------------------------------------
	.module system
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _led_change
	.globl _led_getstatus
	.globl _sys_WriteCfg
	.globl _info
	.globl _tp_get
	.globl _TIMER_CheckTimeMS
	.globl _TIMER_InitTime
	.globl _sys
	.globl _system_init
	.globl _system_checkID
	.globl _system_manager
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
_sys::
	.ds 17
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
;	user/system.c: 11: void system_init(void)
;	-----------------------------------------
;	 function system_init
;	-----------------------------------------
_system_init:
;	user/system.c: 13: sys.mode = SYS_NOMAL;
	ldw	x, #_sys+0
	clr	(x)
;	user/system.c: 14: TIMER_InitTime(&sys.tick);
	ldw	x, #_sys+5
	pushw	x
	call	_TIMER_InitTime
	popw	x
	ret
;	user/system.c: 17: uint8_t system_checkID(uint32_t idGet)
;	-----------------------------------------
;	 function system_checkID
;	-----------------------------------------
_system_checkID:
	sub	sp, #7
;	user/system.c: 20: for(id = 0; id < MAX_KEY_ID_LEN; id++)
	ldw	x, #_sysCfg+4
	ldw	(0x06, sp), x
	clr	(0x01, sp)
00104$:
;	user/system.c: 22: if(idGet == sysCfg.id[id])
	ld	a, (0x01, sp)
	sll	a
	sll	a
	clrw	x
	ld	xl, a
	addw	x, (0x06, sp)
	ld	a, (0x3, x)
	ld	(0x05, sp), a
	ld	a, (0x2, x)
	ld	(0x04, sp), a
	ldw	x, (x)
	ldw	(0x02, sp), x
	ldw	x, (0x0c, sp)
	cpw	x, (0x04, sp)
	jrne	00105$
	ldw	x, (0x0a, sp)
	cpw	x, (0x02, sp)
	jrne	00105$
;	user/system.c: 23: return 1;
	ld	a, #0x01
	jra	00106$
00105$:
;	user/system.c: 20: for(id = 0; id < MAX_KEY_ID_LEN; id++)
	inc	(0x01, sp)
	ld	a, (0x01, sp)
	cp	a, #0x05
	jrc	00104$
;	user/system.c: 25: return 0;
	clr	a
00106$:
	addw	sp, #7
	ret
;	user/system.c: 28: void system_manager(void)
;	-----------------------------------------
;	 function system_manager
;	-----------------------------------------
_system_manager:
	sub	sp, #30
;	user/system.c: 31: if(!TIMER_CheckTimeMS(&sys.tick, 100)){
	ldw	x, #_sys+0
	ldw	(0x07, sp), x
	ldw	x, (0x07, sp)
	addw	x, #0x0005
	push	#0x64
	push	#0x00
	push	#0x00
	push	#0x00
	pushw	x
	call	_TIMER_CheckTimeMS
	addw	sp, #6
	ld	(0x01, sp), a
	tnz	(0x01, sp)
	jreq	00209$
	jp	00135$
00209$:
;	user/system.c: 32: switch(sys.mode)
	ldw	x, (0x07, sp)
	ld	a, (x)
;	user/system.c: 38: if(++sys.keyPressTime > 30)
	ldw	x, (0x07, sp)
	addw	x, #0x000f
	ldw	(0x0d, sp), x
;	user/system.c: 41: sys.setTimeOut = 600;
	ldw	x, (0x07, sp)
	addw	x, #0x000b
	ldw	(0x03, sp), x
;	user/system.c: 43: sys.keyReleaseTime = 100;
	ldw	x, (0x07, sp)
	addw	x, #0x0010
	ldw	(0x1b, sp), x
;	user/system.c: 44: sys.idKeyGet = 0;
	ldw	x, (0x07, sp)
	incw	x
	ldw	(0x1d, sp), x
;	user/system.c: 32: switch(sys.mode)
	cp	a, #0x00
	jreq	00101$
	cp	a, #0x01
	jreq	00108$
	jp	00135$
;	user/system.c: 34: case SYS_NOMAL:
00101$:
;	user/system.c: 35: keyGet = tp_get(TP_SET);
	push	#0x00
	call	_tp_get
	addw	sp, #1
;	user/system.c: 36: if(keyGet == TP_PRESS)
	cp	a, #0x01
	jrne	00105$
;	user/system.c: 38: if(++sys.keyPressTime > 30)
	ldw	x, (0x0d, sp)
	ld	a, (x)
	inc	a
	ld	(x), a
	cp	a, #0x1e
	jrule	00105$
;	user/system.c: 40: sys.mode = SYS_SET_ID;
	ldw	x, (0x07, sp)
	ld	a, #0x01
	ld	(x), a
;	user/system.c: 41: sys.setTimeOut = 600;
	ldw	x, (0x03, sp)
	ldw	y, #0x0258
	ldw	(0x2, x), y
	clr	(0x1, x)
	clr	(x)
;	user/system.c: 42: sys.keyPressTime = 0;
	ldw	x, (0x0d, sp)
	clr	(x)
;	user/system.c: 43: sys.keyReleaseTime = 100;
	ldw	x, (0x1b, sp)
	ld	a, #0x64
	ld	(x), a
;	user/system.c: 44: sys.idKeyGet = 0;
	ldw	x, (0x1d, sp)
	clrw	y
	ldw	(0x2, x), y
	ldw	(x), y
;	user/system.c: 45: led_change(LED_ON, 0);
	push	#0x00
	push	#0x01
	call	_led_change
	popw	x
;	user/system.c: 46: info("\r\nSet key id.....");
	ldw	x, #___str_0+0
	pushw	x
	call	_info
	popw	x
00105$:
;	user/system.c: 49: if(sys.idKeyGet != 0)
	ldw	x, (0x1d, sp)
	pushw	x
	ldw	x, (0x2, x)
	exgw	x, y
	popw	x
	ldw	x, (x)
	tnzw	y
	jrne	00220$
	tnzw	x
	jrne	00220$
	jp	00135$
00220$:
;	user/system.c: 51: sys.idKeyGet = 0;
	ldw	x, (0x1d, sp)
	clrw	y
	ldw	(0x2, x), y
	ldw	(x), y
;	user/system.c: 52: led_change(LED_FLASH, 10);
	push	#0x0a
	push	#0x02
	call	_led_change
	popw	x
;	user/system.c: 54: break;
	jp	00135$
;	user/system.c: 55: case SYS_SET_ID:
00108$:
;	user/system.c: 56: if((sysCfg.idLen != 0)&&(led_getstatus() != LED_FLASH))
	ldw	x, #_sysCfg+0
	ldw	(0x15, sp), x
	ldw	x, (0x15, sp)
	incw	x
	incw	x
	ldw	(0x05, sp), x
	ldw	x, (0x05, sp)
	ldw	x, (x)
	tnzw	x
	jreq	00110$
	call	_led_getstatus
	cp	a, #0x02
	jreq	00110$
;	user/system.c: 57: led_change(LED_ON, 0);
	push	#0x00
	push	#0x01
	call	_led_change
	popw	x
00110$:
;	user/system.c: 58: if(sys.keyReleaseTime != 0)
	ldw	x, (0x1b, sp)
	ld	a, (x)
	tnz	a
	jreq	00113$
;	user/system.c: 60: sys.keyReleaseTime--;
	dec	a
	ldw	x, (0x1b, sp)
	ld	(x), a
;	user/system.c: 61: sys.keyPressTime = 0;
	ldw	x, (0x0d, sp)
	clr	(x)
00113$:
;	user/system.c: 63: keyGet = tp_get(TP_SET);
	push	#0x00
	call	_tp_get
	addw	sp, #1
;	user/system.c: 68: for(sysCfg.idLen = 0; sysCfg.idLen < MAX_KEY_ID_LEN; sysCfg.idLen++)
	ldw	x, (0x15, sp)
	addw	x, #0x0004
	ldw	(0x19, sp), x
;	user/system.c: 64: if((keyGet == TP_PRESS)&&(sys.keyReleaseTime == 0))
	cp	a, #0x01
	jrne	00118$
	ldw	x, (0x1b, sp)
	ld	a, (x)
	tnz	a
	jrne	00118$
;	user/system.c: 66: if(++sys.keyPressTime > 10)
	ldw	x, (0x0d, sp)
	ld	a, (x)
	inc	a
	ld	(x), a
	cp	a, #0x0a
	jrule	00118$
;	user/system.c: 68: for(sysCfg.idLen = 0; sysCfg.idLen < MAX_KEY_ID_LEN; sysCfg.idLen++)
	ldw	x, (0x05, sp)
	clr	(0x1, x)
	clr	(x)
	ldw	y, (0x19, sp)
	ldw	(0x17, sp), y
00133$:
	ldw	x, (0x05, sp)
	ldw	x, (x)
	cpw	x, #0x0005
	jrnc	00114$
;	user/system.c: 69: sysCfg.id[sysCfg.idLen] = 0;
	sllw	x
	sllw	x
	addw	x, (0x17, sp)
	clrw	y
	ldw	(0x2, x), y
	ldw	(x), y
;	user/system.c: 68: for(sysCfg.idLen = 0; sysCfg.idLen < MAX_KEY_ID_LEN; sysCfg.idLen++)
	ldw	x, (0x05, sp)
	ldw	x, (x)
	incw	x
	ldw	y, (0x05, sp)
	ldw	(y), x
	jra	00133$
00114$:
;	user/system.c: 70: sysCfg.idLen = 0;
	ldw	x, (0x05, sp)
	clr	(0x1, x)
	clr	(x)
;	user/system.c: 71: sys_WriteCfg();
	call	_sys_WriteCfg
;	user/system.c: 72: led_change(LED_OFF, 0);
	push	#0x00
	push	#0x00
	call	_led_change
	popw	x
;	user/system.c: 73: info("\r\nClear all key.....");
	ldw	x, #___str_1+0
	pushw	x
	call	_info
	popw	x
00118$:
;	user/system.c: 76: if(sys.setTimeOut != 0)
	ldw	x, (0x03, sp)
	pushw	x
	ldw	x, (0x2, x)
	exgw	x, y
	popw	x
	ldw	x, (x)
	tnzw	y
	jrne	00232$
	tnzw	x
	jrne	00232$
	jp	00127$
00232$:
;	user/system.c: 78: sys.setTimeOut--;
	subw	y, #0x0001
	ld	a, xl
	sbc	a, #0x00
	ld	(0x0a, sp), a
	ld	a, xh
	sbc	a, #0x00
	ld	(0x09, sp), a
	ldw	x, (0x03, sp)
	ldw	(0x2, x), y
	ldw	y, (0x09, sp)
	ldw	(x), y
;	user/system.c: 79: if(sys.idKeyGet != 0)
	ldw	x, (0x1d, sp)
	pushw	x
	ldw	x, (0x2, x)
	exgw	x, y
	popw	x
	ldw	x, (x)
	tnzw	y
	jrne	00233$
	tnzw	x
	jreq	00135$
00233$:
;	user/system.c: 81: sys.setTimeOut = 600;
	ldw	x, (0x03, sp)
	ldw	y, #0x0258
	ldw	(0x2, x), y
	clr	(0x1, x)
	clr	(x)
;	user/system.c: 82: if(system_checkID(sys.idKeyGet) == 0)
	ldw	x, (0x1d, sp)
	pushw	x
	ldw	x, (0x2, x)
	exgw	x, y
	popw	x
	ldw	x, (x)
	pushw	y
	pushw	x
	call	_system_checkID
	addw	sp, #4
	ld	(0x02, sp), a
	tnz	(0x02, sp)
	jrne	00123$
;	user/system.c: 84: info("\r\nSave key.....");
	ldw	x, #___str_2+0
	pushw	x
	call	_info
	popw	x
;	user/system.c: 85: sysCfg.id[sysCfg.idLen] = sys.idKeyGet;
	ldw	x, (0x05, sp)
	ldw	x, (x)
	sllw	x
	sllw	x
	addw	x, (0x19, sp)
	ldw	(0x13, sp), x
	ldw	x, (0x1d, sp)
	pushw	x
	ldw	x, (0x2, x)
	exgw	x, y
	popw	x
	ldw	x, (x)
	ldw	(0x0f, sp), x
	ldw	x, (0x13, sp)
	ldw	(0x2, x), y
	ldw	y, (0x0f, sp)
	ldw	(x), y
;	user/system.c: 86: if(++sysCfg.idLen >= MAX_KEY_ID_LEN)sysCfg.idLen = 0;
	ldw	x, (0x05, sp)
	ldw	x, (x)
	incw	x
	ldw	y, (0x05, sp)
	ldw	(y), x
	cpw	x, #0x0005
	jrc	00121$
	ldw	x, (0x05, sp)
	clr	(0x1, x)
	clr	(x)
00121$:
;	user/system.c: 87: sys_WriteCfg();
	call	_sys_WriteCfg
;	user/system.c: 88: led_change(LED_FLASH, 10);
	push	#0x0a
	push	#0x02
	call	_led_change
	popw	x
00123$:
;	user/system.c: 90: sys.idKeyGet = 0;
	ldw	x, (0x1d, sp)
	clrw	y
	ldw	(0x2, x), y
	ldw	(x), y
	jra	00135$
00127$:
;	user/system.c: 95: sys.keyPressTime = 0;
	ldw	x, (0x0d, sp)
	clr	(x)
;	user/system.c: 96: sys.mode = SYS_NOMAL;
	ldw	x, (0x07, sp)
	clr	(x)
;	user/system.c: 97: led_change(LED_OFF, 0);
	push	#0x00
	push	#0x00
	call	_led_change
	popw	x
;	user/system.c: 100: }
00135$:
	addw	sp, #30
	ret
	.area CODE
___str_0:
	.db 0x0d
	.db 0x0a
	.ascii "Set key id....."
	.db 0x00
___str_1:
	.db 0x0d
	.db 0x0a
	.ascii "Clear all key....."
	.db 0x00
___str_2:
	.db 0x0d
	.db 0x0a
	.ascii "Save key....."
	.db 0x00
	.area INITIALIZER
	.area CABS (ABS)
