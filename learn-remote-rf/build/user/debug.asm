;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW64)
;--------------------------------------------------------
	.module debug
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _usart_send
	.globl _UART1_GetFlagStatus
	.globl _UART1_SendData8
	.globl _UART1_ITConfig
	.globl _UART1_Cmd
	.globl _UART1_Init
	.globl _UART1_DeInit
	.globl _IWDG_ReloadCounter
	.globl _GPIO_Init
	.globl _CLK_PeripheralClockConfig
	.globl _debug_Init
	.globl _info
	.globl _debugInfo
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
;	user/debug.c: 3: void debug_Init(void)
;	-----------------------------------------
;	 function debug_Init
;	-----------------------------------------
_debug_Init:
;	user/debug.c: 5: GPIO_Init(GPIOD, GPIO_PIN_5, GPIO_MODE_OUT_OD_HIZ_FAST);
	push	#0xb0
	push	#0x20
	push	#0x0f
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	user/debug.c: 6: GPIO_Init(GPIOD, GPIO_PIN_6, GPIO_MODE_IN_PU_NO_IT);
	push	#0x40
	push	#0x40
	push	#0x0f
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	user/debug.c: 7: CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1 , ENABLE); 
	push	#0x01
	push	#0x03
	call	_CLK_PeripheralClockConfig
	popw	x
;	user/debug.c: 9: UART1_DeInit();
	call	_UART1_DeInit
;	user/debug.c: 11: UART1_Init((uint32_t)9600, UART1_WORDLENGTH_8D, UART1_STOPBITS_1, UART1_PARITY_NO,
	push	#0x0c
	push	#0x80
	push	#0x00
	push	#0x00
	push	#0x00
	push	#0x80
	push	#0x25
	clrw	x
	pushw	x
	call	_UART1_Init
	addw	sp, #9
;	user/debug.c: 14: UART1_ITConfig(UART1_IT_RXNE_OR, ENABLE);    
	push	#0x01
	push	#0x05
	push	#0x02
	call	_UART1_ITConfig
	addw	sp, #3
;	user/debug.c: 16: UART1_Cmd(ENABLE);  
	push	#0x01
	call	_UART1_Cmd
	pop	a
	ret
;	user/debug.c: 19: void usart_send(uint8_t *data)
;	-----------------------------------------
;	 function usart_send
;	-----------------------------------------
_usart_send:
	sub	sp, #3
;	user/debug.c: 23: while(data[cnt])
	clr	(0x01, sp)
00105$:
	clrw	x
	ld	a, (0x01, sp)
	ld	xl, a
	addw	x, (0x06, sp)
	ld	a, (x)
	tnz	a
	jreq	00108$
;	user/debug.c: 26: UART1_SendData8(data[cnt++]);
	ld	a, (0x01, sp)
	inc	(0x01, sp)
	clrw	x
	ld	xl, a
	addw	x, (0x06, sp)
	ld	a, (x)
	push	a
	call	_UART1_SendData8
	pop	a
;	user/debug.c: 29: while((UART1_GetFlagStatus(UART1_FLAG_TXE) == RESET)&&(timeout--))IWDG_ReloadCounter();
	ldw	x, #0x0fff
00102$:
	pushw	x
	push	#0x80
	push	#0x00
	call	_UART1_GetFlagStatus
	popw	x
	popw	x
	tnz	a
	jrne	00105$
	ldw	(0x02, sp), x
	decw	x
	ldw	y, (0x02, sp)
	jreq	00105$
	pushw	x
	call	_IWDG_ReloadCounter
	popw	x
	jra	00102$
00108$:
	addw	sp, #3
	ret
;	user/debug.c: 33: void info(const uint8_t* str)
;	-----------------------------------------
;	 function info
;	-----------------------------------------
_info:
;	user/debug.c: 35: usart_send((uint8_t*)str);
	ldw	x, (0x03, sp)
	pushw	x
	call	_usart_send
	popw	x
	ret
;	user/debug.c: 65: void debugInfo(const uint8_t* str, uint8_t *data, uint8_t len)
;	-----------------------------------------
;	 function debugInfo
;	-----------------------------------------
_debugInfo:
	sub	sp, #14
;	user/debug.c: 71: usart_send((uint8_t*)str);
	ldw	x, (0x11, sp)
	pushw	x
	call	_usart_send
	popw	x
;	user/debug.c: 72: for(add = 0; add < len; add++)
	clr	(0x01, sp)
00111$:
	ld	a, (0x01, sp)
	cp	a, (0x15, sp)
	jrc	00140$
	jp	00109$
00140$:
;	user/debug.c: 74: dat = data[add];
	clrw	x
	ld	a, (0x01, sp)
	ld	xl, a
	addw	x, (0x13, sp)
	ld	a, (x)
;	user/debug.c: 75: hnib = dat/16;
	ld	yl, a
	swap	a
	and	a, #0x0f
	exg	a, yl
;	user/debug.c: 76: lnib = dat%16;
	and	a, #0x0f
	ld	(0x08, sp), a
;	user/debug.c: 77: ascii[0] = '0';
	ldw	x, sp
	incw	x
	incw	x
	ldw	(0x0a, sp), x
	ldw	x, (0x0a, sp)
	ld	a, #0x30
	ld	(x), a
;	user/debug.c: 78: ascii[1] = 'x';
	ldw	x, (0x0a, sp)
	incw	x
	ld	a, #0x78
	ld	(x), a
;	user/debug.c: 79: ascii[4] = ' ';
	ldw	x, (0x0a, sp)
	ld	a, #0x20
	ld	(0x0004, x), a
;	user/debug.c: 80: ascii[5] = 0;
	ldw	x, (0x0a, sp)
	addw	x, #0x0005
	clr	(x)
;	user/debug.c: 81: if(hnib < 10)
	ld	a, yl
	cp	a, #0x0a
	clr	a
	rlc	a
	ld	(0x0e, sp), a
;	user/debug.c: 82: ascii[2] = hnib + '0';
	ldw	x, (0x0a, sp)
	incw	x
	incw	x
	exg	a, yl
	ld	(0x0d, sp), a
	exg	a, yl
;	user/debug.c: 81: if(hnib < 10)
	tnz	(0x0e, sp)
	jreq	00102$
;	user/debug.c: 82: ascii[2] = hnib + '0';
	ld	a, (0x0d, sp)
	add	a, #0x30
	ld	(x), a
00102$:
;	user/debug.c: 83: if(hnib >= 10)
	tnz	(0x0e, sp)
	jrne	00104$
;	user/debug.c: 84: ascii[2] = (hnib - 10) + 'A';
	ld	a, (0x0d, sp)
	add	a, #0x37
	ld	(x), a
00104$:
;	user/debug.c: 85: if(lnib < 10)
	ld	a, (0x08, sp)
	cp	a, #0x0a
	clr	a
	rlc	a
	ld	(0x0c, sp), a
;	user/debug.c: 86: ascii[3] = lnib + '0';
	ldw	x, (0x0a, sp)
	addw	x, #0x0003
	ld	a, (0x08, sp)
	ld	(0x09, sp), a
;	user/debug.c: 85: if(lnib < 10)
	tnz	(0x0c, sp)
	jreq	00106$
;	user/debug.c: 86: ascii[3] = lnib + '0';
	ld	a, (0x09, sp)
	add	a, #0x30
	ld	(x), a
00106$:
;	user/debug.c: 87: if(lnib >= 10)
	tnz	(0x0c, sp)
	jrne	00108$
;	user/debug.c: 88: ascii[3] = (lnib - 10) + 'A';
	ld	a, (0x09, sp)
	add	a, #0x37
	ld	(x), a
00108$:
;	user/debug.c: 89: usart_send(ascii);
	ldw	x, (0x0a, sp)
	pushw	x
	call	_usart_send
	popw	x
;	user/debug.c: 72: for(add = 0; add < len; add++)
	inc	(0x01, sp)
	jp	00111$
00109$:
;	user/debug.c: 91: usart_send("\r\n");
	ldw	x, #___str_0+0
	pushw	x
	call	_usart_send
	addw	sp, #16
	ret
	.area CODE
___str_0:
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area INITIALIZER
	.area CABS (ABS)
