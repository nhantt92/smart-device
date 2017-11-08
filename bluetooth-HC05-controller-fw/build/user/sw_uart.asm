;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW64)
;--------------------------------------------------------
	.module sw_uart
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _delaytest
	.globl _Vcomdelay
	.globl _GPIO_WriteLow
	.globl _GPIO_WriteHigh
	.globl _GPIO_Init
	.globl _sprintf
	.globl _DELAYTIME
	.globl _vcomstr
	.globl _VCOM_Init
	.globl _VCOM_puts
	.globl _VCOM_TestSpeed
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
_vcomstr::
	.ds 30
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
_DELAYTIME::
	.ds 2
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
;	user/sw_uart.c: 15: void Vcomdelay(int dtime)
;	-----------------------------------------
;	 function Vcomdelay
;	-----------------------------------------
_Vcomdelay:
	ldw	x, (0x03, sp)
00103$:
;	user/sw_uart.c: 18: for ( ; dtime >= 0; dtime--);
	tnzw	x
	jrpl	00116$
	ret
00116$:
	decw	x
	jra	00103$
	ret
;	user/sw_uart.c: 21: void VCOM_Init(void)
;	-----------------------------------------
;	 function VCOM_Init
;	-----------------------------------------
_VCOM_Init:
;	user/sw_uart.c: 23: GPIO_Init(vTxGPIO, vTxPIN, GPIO_MODE_OUT_PP_HIGH_FAST);
	push	#0xf0
	push	#0x20
	push	#0x0f
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	user/sw_uart.c: 24: vTx_H();
	push	#0x20
	push	#0x0f
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
	ret
;	user/sw_uart.c: 28: void VCOM_puts(char *str)
;	-----------------------------------------
;	 function VCOM_puts
;	-----------------------------------------
_VCOM_puts:
	sub	sp, #5
;	user/sw_uart.c: 32: disableInterrupts();
	sim
;	user/sw_uart.c: 33: while ((c=*str) && maxlen--)
	ldw	x, #0x00ff
	ldw	(0x01, sp), x
	ldw	y, (0x08, sp)
	ldw	(0x04, sp), y
00126$:
	ldw	x, (0x04, sp)
	ld	a, (x)
	ld	(0x03, sp), a
	tnz	a
	jrne	00176$
	jp	00128$
00176$:
	ldw	x, (0x01, sp)
	ldw	y, (0x01, sp)
	decw	y
	ldw	(0x01, sp), y
	tnzw	x
	jrne	00177$
	jp	00128$
00177$:
;	user/sw_uart.c: 35: vTx_L();                                              // start bit
	push	#0x20
	push	#0x0f
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
;	user/sw_uart.c: 36: Vcomdelay(DELAYTIME);          
	ldw	x, _DELAYTIME+0
	pushw	x
	call	_Vcomdelay
	popw	x
;	user/sw_uart.c: 37: if (c&0x01) vTx_H(); else vTx_L();   Vcomdelay(DELAYTIME); 
	ld	a, (0x03, sp)
	srl	a
	jrnc	00102$
	push	#0x20
	push	#0x0f
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
	jra	00103$
00102$:
	push	#0x20
	push	#0x0f
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
00103$:
	ldw	x, _DELAYTIME+0
	pushw	x
	call	_Vcomdelay
	popw	x
;	user/sw_uart.c: 38: if (c&0x02) vTx_H(); else vTx_L();   Vcomdelay(DELAYTIME);
	ld	a, (0x03, sp)
	bcp	a, #0x02
	jreq	00105$
	push	#0x20
	push	#0x0f
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
	jra	00106$
00105$:
	push	#0x20
	push	#0x0f
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
00106$:
	ldw	x, _DELAYTIME+0
	pushw	x
	call	_Vcomdelay
	popw	x
;	user/sw_uart.c: 39: if (c&0x04) vTx_H(); else vTx_L();   Vcomdelay(DELAYTIME);
	ld	a, (0x03, sp)
	bcp	a, #0x04
	jreq	00108$
	push	#0x20
	push	#0x0f
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
	jra	00109$
00108$:
	push	#0x20
	push	#0x0f
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
00109$:
	ldw	x, _DELAYTIME+0
	pushw	x
	call	_Vcomdelay
	popw	x
;	user/sw_uart.c: 40: if (c&0x08) vTx_H(); else vTx_L();   Vcomdelay(DELAYTIME);
	ld	a, (0x03, sp)
	bcp	a, #0x08
	jreq	00111$
	push	#0x20
	push	#0x0f
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
	jra	00112$
00111$:
	push	#0x20
	push	#0x0f
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
00112$:
	ldw	x, _DELAYTIME+0
	pushw	x
	call	_Vcomdelay
	popw	x
;	user/sw_uart.c: 41: if (c&0x10) vTx_H(); else vTx_L();   Vcomdelay(DELAYTIME);
	ld	a, (0x03, sp)
	bcp	a, #0x10
	jreq	00114$
	push	#0x20
	push	#0x0f
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
	jra	00115$
00114$:
	push	#0x20
	push	#0x0f
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
00115$:
	ldw	x, _DELAYTIME+0
	pushw	x
	call	_Vcomdelay
	popw	x
;	user/sw_uart.c: 42: if (c&0x20) vTx_H(); else vTx_L();   Vcomdelay(DELAYTIME);
	ld	a, (0x03, sp)
	bcp	a, #0x20
	jreq	00117$
	push	#0x20
	push	#0x0f
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
	jra	00118$
00117$:
	push	#0x20
	push	#0x0f
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
00118$:
	ldw	x, _DELAYTIME+0
	pushw	x
	call	_Vcomdelay
	popw	x
;	user/sw_uart.c: 43: if (c&0x40) vTx_H(); else vTx_L();   Vcomdelay(DELAYTIME);
	ld	a, (0x03, sp)
	bcp	a, #0x40
	jreq	00120$
	push	#0x20
	push	#0x0f
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
	jra	00121$
00120$:
	push	#0x20
	push	#0x0f
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
00121$:
	ldw	x, _DELAYTIME+0
	pushw	x
	call	_Vcomdelay
	popw	x
;	user/sw_uart.c: 44: if (c&0x80) vTx_H(); else vTx_L();   Vcomdelay(DELAYTIME);
	tnz	(0x03, sp)
	jrpl	00123$
	push	#0x20
	push	#0x0f
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
	jra	00124$
00123$:
	push	#0x20
	push	#0x0f
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
00124$:
	ldw	x, _DELAYTIME+0
	pushw	x
	call	_Vcomdelay
	popw	x
;	user/sw_uart.c: 45: vTx_H();                                             // stop bit    (1.5bit for sure)
	push	#0x20
	push	#0x0f
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
;	user/sw_uart.c: 46: Vcomdelay(DELAYTIME<<1);             
	ldw	x, _DELAYTIME+0
	sllw	x
	pushw	x
	call	_Vcomdelay
	popw	x
;	user/sw_uart.c: 47: str++;
	ldw	x, (0x04, sp)
	incw	x
	ldw	(0x04, sp), x
	jp	00126$
00128$:
;	user/sw_uart.c: 49: enableInterrupts();
	rim
	addw	sp, #5
	ret
;	user/sw_uart.c: 52: void delaytest(uint32_t x)
;	-----------------------------------------
;	 function delaytest
;	-----------------------------------------
_delaytest:
	sub	sp, #16
;	user/sw_uart.c: 55: while(x--)
	ldw	y, (0x13, sp)
	ldw	(0x05, sp), y
	ldw	y, (0x15, sp)
00102$:
	ldw	(0x0f, sp), y
	ldw	x, (0x05, sp)
	ldw	(0x0d, sp), x
	subw	y, #0x0001
	ld	a, (0x06, sp)
	sbc	a, #0x00
	ld	(0x06, sp), a
	ld	a, (0x05, sp)
	sbc	a, #0x00
	ld	(0x05, sp), a
	ldw	x, (0x0f, sp)
	jrne	00126$
	ldw	x, (0x0d, sp)
	jreq	00108$
00126$:
	ldw	x, (0x03, sp)
	ldw	(0x0b, sp), x
	ldw	x, (0x01, sp)
	ldw	(0x09, sp), x
00106$:
;	user/sw_uart.c: 57: for(;i<3000;i++);
	ldw	x, (0x0b, sp)
	cpw	x, #0x0bb8
	ld	a, (0x0a, sp)
	sbc	a, #0x00
	ld	a, (0x09, sp)
	sbc	a, #0x00
	jrnc	00102$
	ldw	x, (0x0b, sp)
	addw	x, #0x0001
	ldw	(0x0b, sp), x
	ld	a, (0x0a, sp)
	adc	a, #0x00
	ld	(0x0a, sp), a
	ld	a, (0x09, sp)
	adc	a, #0x00
	ld	(0x09, sp), a
	ldw	x, (0x0b, sp)
	ldw	(0x03, sp), x
	ldw	x, (0x09, sp)
	ldw	(0x01, sp), x
	jra	00106$
00108$:
	addw	sp, #16
	ret
;	user/sw_uart.c: 61: void VCOM_TestSpeed(void)
;	-----------------------------------------
;	 function VCOM_TestSpeed
;	-----------------------------------------
_VCOM_TestSpeed:
	sub	sp, #8
;	user/sw_uart.c: 66: for(i=250;i>=1;i--)
00109$:
	ldw	x, #___str_0+0
	ldw	(0x07, sp), x
	ldw	x, #_vcomstr+0
	ldw	(0x03, sp), x
	ldw	y, (0x03, sp)
	ldw	(0x05, sp), y
	ldw	x, #0x00fa
	ldw	(0x01, sp), x
00105$:
;	user/sw_uart.c: 68: DELAYTIME = i;  
	ld	a, (0x02, sp)
	ld	_DELAYTIME+1, a
	ld	a, (0x01, sp)
	ld	_DELAYTIME+0, a
;	user/sw_uart.c: 69: vTx_H();
	push	#0x20
	push	#0x0f
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
;	user/sw_uart.c: 70: delaytest(10000); 
	push	#0x10
	push	#0x27
	clrw	x
	pushw	x
	call	_delaytest
	addw	sp, #4
;	user/sw_uart.c: 71: VCOM_sprintf(vcomstr,"VCOM at %d TESTING SPEED\r\n",i);
	ldw	y, (0x07, sp)
	ldw	x, (0x03, sp)
	ld	a, (0x02, sp)
	push	a
	ld	a, (0x02, sp)
	push	a
	pushw	y
	pushw	x
	call	_sprintf
	addw	sp, #6
;	user/sw_uart.c: 72: VCOM_puts(vcomstr); 
	ldw	x, (0x05, sp)
	pushw	x
	call	_VCOM_puts
	popw	x
;	user/sw_uart.c: 73: vTx_L(); 
	push	#0x20
	push	#0x0f
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
;	user/sw_uart.c: 66: for(i=250;i>=1;i--)
	ldw	x, (0x01, sp)
	decw	x
	ldw	(0x01, sp), x
	ldw	x, (0x01, sp)
	cpw	x, #0x0001
	jrsge	00105$
	jra	00109$
	addw	sp, #8
	ret
	.area CODE
___str_0:
	.ascii "VCOM at %d TESTING SPEED"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area INITIALIZER
__xinit__DELAYTIME:
	.dw #0x00e6
	.area CABS (ABS)
