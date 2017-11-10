;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW64)
;--------------------------------------------------------
	.module rom
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _debugInfo
	.globl _sysCfg
	.globl _sys_WriteCfg
	.globl _sys_readCfg
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
_sysCfg::
	.ds 24
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
;	user/rom.c: 5: void sys_WriteCfg(void)
;	-----------------------------------------
;	 function sys_WriteCfg
;	-----------------------------------------
_sys_WriteCfg:
	sub	sp, #9
;	user/rom.c: 9: pSys = (uint8_t*)&sysCfg;
	ldw	y, #_sysCfg+0
;	user/rom.c: 11: FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
	mov	0x5064+0, #0xae
;	user/rom.c: 12: FLASH->DUKR = FLASH_RASS_KEY1;
	mov	0x5064+0, #0x56
;	user/rom.c: 13: while((FLASH->IAPSR & (uint8_t)FLASH_FLAG_DUL) == RESET);
00101$:
	ldw	x, #0x505f
	ld	a, (x)
	bcp	a, #0x08
	jreq	00101$
;	user/rom.c: 14: for(add = 0; add < CFG_LEN; add++)
	clr	(0x01, sp)
00105$:
;	user/rom.c: 16: *(PointerAttr uint8_t*) (MemoryAddressCast)(CFG_ADDRESS_START+add) = *pSys;
	clrw	x
	ld	a, (0x01, sp)
	ld	xl, a
	clr	a
	clr	(0x06, sp)
	addw	x, #0x4000
	adc	a, #0x00
	ld	(0x03, sp), a
	ld	a, (0x06, sp)
	adc	a, #0x00
	ld	a, (y)
	ld	(x), a
;	user/rom.c: 17: pSys++;
	incw	y
;	user/rom.c: 14: for(add = 0; add < CFG_LEN; add++)
	inc	(0x01, sp)
	ld	a, (0x01, sp)
	cp	a, #0x18
	jrc	00105$
;	user/rom.c: 20: FLASH->IAPSR &= (uint8_t)FLASH_MEMTYPE_DATA;
	ldw	x, #0x505f
	ld	a, (x)
	and	a, #0xf7
	ld	(x), a
	addw	sp, #9
	ret
;	user/rom.c: 23: void sys_readCfg(void)
;	-----------------------------------------
;	 function sys_readCfg
;	-----------------------------------------
_sys_readCfg:
	sub	sp, #43
;	user/rom.c: 28: pSys = (uint8_t*)&sysCfg;
	ldw	x, #_sysCfg+0
	ldw	(0x22, sp), x
	ldw	y, (0x22, sp)
;	user/rom.c: 35: (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
	ldw	x, #0x505f
	ld	a, (x)
;	user/rom.c: 37: FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
	mov	0x5064+0, #0xae
;	user/rom.c: 38: FLASH->DUKR = FLASH_RASS_KEY1;
	mov	0x5064+0, #0x56
;	user/rom.c: 39: while((FLASH->IAPSR & (uint8_t)FLASH_FLAG_DUL) == RESET);
00101$:
	ldw	x, #0x505f
	ld	a, (x)
	bcp	a, #0x08
	jreq	00101$
;	user/rom.c: 40: for(add = 0; add < CFG_LEN; add++)
	clr	(0x05, sp)
00107$:
;	user/rom.c: 42: *pSys = (*(PointerAttr uint8_t *) (MemoryAddressCast)(CFG_ADDRESS_START+add));
	clrw	x
	ld	a, (0x05, sp)
	ld	xl, a
	clr	a
	clr	(0x1e, sp)
	addw	x, #0x4000
	adc	a, #0x00
	ld	(0x1b, sp), a
	ld	a, (0x1e, sp)
	adc	a, #0x00
	ld	a, (x)
	ld	(y), a
;	user/rom.c: 43: pSys++;
	incw	y
;	user/rom.c: 40: for(add = 0; add < CFG_LEN; add++)
	inc	(0x05, sp)
	ld	a, (0x05, sp)
	cp	a, #0x18
	jrc	00107$
;	user/rom.c: 45: if(sysCfg.holder != CFG_HOLDER)
	ldw	x, (0x22, sp)
	ldw	x, (x)
;	user/rom.c: 48: sysCfg.id[0] = DEFAULT_ID_1;
	ldw	y, (0x22, sp)
	addw	y, #0x0004
	ldw	(0x18, sp), y
;	user/rom.c: 49: sysCfg.id[1] = DEFAULT_ID_2;
	ldw	y, (0x22, sp)
	addw	y, #0x0008
	ldw	(0x2a, sp), y
;	user/rom.c: 45: if(sysCfg.holder != CFG_HOLDER)
	cpw	x, #0x0044
	jreq	00106$
;	user/rom.c: 47: sysCfg.holder = CFG_HOLDER;
	ldw	x, (0x22, sp)
	ldw	y, #0x0044
	ldw	(x), y
;	user/rom.c: 48: sysCfg.id[0] = DEFAULT_ID_1;
	ldw	x, (0x18, sp)
	ldw	y, #0x92c6
	ldw	(0x2, x), y
	ldw	y, #0x0143
	ldw	(x), y
;	user/rom.c: 49: sysCfg.id[1] = DEFAULT_ID_2;
	ldw	x, (0x2a, sp)
	ldw	y, #0xb7c6
	ldw	(0x2, x), y
	ldw	y, #0x0160
	ldw	(x), y
;	user/rom.c: 50: sys_WriteCfg();
	call	_sys_WriteCfg
00106$:
;	user/rom.c: 53: FLASH->IAPSR &= (uint8_t)FLASH_MEMTYPE_DATA;
	ldw	x, #0x505f
	ld	a, (x)
	and	a, #0xf7
	ld	(x), a
;	user/rom.c: 55: cm[0] = (sysCfg.id[0]&0xFF000000)>>24;
	ldw	x, sp
	incw	x
	ldw	(0x16, sp), x
	ldw	x, (0x18, sp)
	pushw	x
	ldw	x, (0x2, x)
	exgw	x, y
	popw	x
	ldw	x, (x)
	clr	a
	clrw	y
	ld	a, xh
	clrw	x
	clr	(0x26, sp)
	ldw	x, (0x16, sp)
	ld	(x), a
;	user/rom.c: 56: cm[1] = (sysCfg.id[0]&0x00FF0000)>>16;
	ldw	x, (0x16, sp)
	incw	x
	ldw	(0x14, sp), x
	ldw	x, (0x18, sp)
	pushw	x
	ldw	x, (0x2, x)
	exgw	x, y
	popw	x
	ldw	x, (x)
	clrw	y
	clr	a
	clrw	y
	ld	a, xl
	ldw	x, (0x14, sp)
	ld	(x), a
;	user/rom.c: 57: cm[2] = (sysCfg.id[0]&0x0000FF00)>>8;
	ldw	x, (0x16, sp)
	incw	x
	incw	x
	ldw	(0x12, sp), x
	ldw	x, (0x18, sp)
	pushw	x
	ldw	x, (0x2, x)
	exgw	x, y
	popw	x
	ldw	x, (x)
	clr	(0x11, sp)
	clrw	x
	clr	a
	ld	a, yh
	ldw	x, (0x12, sp)
	ld	(x), a
;	user/rom.c: 58: cm[3] = (sysCfg.id[0]&0x000000FF)>>0;
	ldw	x, (0x16, sp)
	addw	x, #0x0003
	ldw	(0x24, sp), x
	ldw	x, (0x18, sp)
	pushw	x
	ldw	x, (0x2, x)
	exgw	x, y
	popw	x
	ldw	x, (x)
	clr	a
	clrw	x
	ld	a, yl
	ldw	x, (0x24, sp)
	ld	(x), a
;	user/rom.c: 59: debugInfo("Key 1: ", cm, 4);
	ldw	y, (0x16, sp)
	ldw	x, #___str_0+0
	push	#0x04
	pushw	y
	pushw	x
	call	_debugInfo
	addw	sp, #5
;	user/rom.c: 60: cm[0] = (sysCfg.id[1]&0xFF000000)>>24;
	ldw	x, (0x2a, sp)
	pushw	x
	ldw	x, (0x2, x)
	exgw	x, y
	popw	x
	ldw	x, (x)
	clr	a
	clrw	y
	ld	a, xh
	clrw	x
	clr	(0x0a, sp)
	ldw	x, (0x16, sp)
	ld	(x), a
;	user/rom.c: 61: cm[1] = (sysCfg.id[1]&0x00FF0000)>>16;
	ldw	x, (0x2a, sp)
	pushw	x
	ldw	x, (0x2, x)
	exgw	x, y
	popw	x
	ldw	x, (x)
	clrw	y
	clr	a
	clrw	y
	ld	a, xl
	ldw	x, (0x14, sp)
	ld	(x), a
;	user/rom.c: 62: cm[2] = (sysCfg.id[1]&0x0000FF00)>>8;
	ldw	x, (0x2a, sp)
	pushw	x
	ldw	x, (0x2, x)
	exgw	x, y
	popw	x
	ldw	x, (x)
	clr	(0x09, sp)
	clrw	x
	clr	a
	ld	a, yh
	ldw	x, (0x12, sp)
	ld	(x), a
;	user/rom.c: 63: cm[3] = (sysCfg.id[1]&0x000000FF)>>0;
	ldw	x, (0x2a, sp)
	pushw	x
	ldw	x, (0x2, x)
	exgw	x, y
	popw	x
	ldw	x, (x)
	clr	a
	clrw	x
	ld	a, yl
	ldw	x, (0x24, sp)
	ld	(x), a
;	user/rom.c: 64: debugInfo("Key 2: ", cm, 4);
	ldw	y, (0x16, sp)
	ldw	x, #___str_1+0
	push	#0x04
	pushw	y
	pushw	x
	call	_debugInfo
	addw	sp, #48
	ret
	.area CODE
___str_0:
	.ascii "Key 1: "
	.db 0x00
___str_1:
	.ascii "Key 2: "
	.db 0x00
	.area INITIALIZER
	.area CABS (ABS)
