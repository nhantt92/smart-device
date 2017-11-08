;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW64)
;--------------------------------------------------------
	.module hc05
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _strlen
	.globl _memset
	.globl _strcmp
	.globl _strcpy
	.globl _memcpy
	.globl _UART1_GetFlagStatus
	.globl _UART1_SendData8
	.globl _UART1_ReceiveData8
	.globl _UART1_ITConfig
	.globl _UART1_Cmd
	.globl _UART1_Init
	.globl _UART1_DeInit
	.globl _IWDG_ReloadCounter
	.globl _GPIO_Init
	.globl _new_HC05_msg
	.globl _HC05_rx_counter
	.globl _HC05_msg
	.globl _HC05_rx_buffer
	.globl _HC05_Init
	.globl _HC05_Read
	.globl _HC05_PutChar
	.globl _HC05_PutStr
	.globl _HC05_ClearRxBuffer
	.globl _HC05_Test
	.globl _HC05_SetBaud
	.globl _HC05_SetName
	.globl _HC05_SetPin
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
_HC05_rx_buffer::
	.ds 40
_HC05_msg::
	.ds 40
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
_HC05_rx_counter::
	.ds 1
_new_HC05_msg::
	.ds 1
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
;	user/hc05.c: 18: void HC05_Init(uint32_t baudrate)
;	-----------------------------------------
;	 function HC05_Init
;	-----------------------------------------
_HC05_Init:
;	user/hc05.c: 21: GPIO_Init(GPIOD, GPIO_PIN_5, GPIO_MODE_OUT_OD_HIZ_FAST);
	push	#0xb0
	push	#0x20
	push	#0x0f
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	user/hc05.c: 22: GPIO_Init(GPIOD, GPIO_PIN_6, GPIO_MODE_IN_PU_NO_IT);
	push	#0x40
	push	#0x40
	push	#0x0f
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	user/hc05.c: 24: UART1_DeInit();
	call	_UART1_DeInit
;	user/hc05.c: 35: UART1_Init((uint32_t)baudrate, UART1_WORDLENGTH_8D, UART1_STOPBITS_1, UART1_PARITY_NO, UART1_SYNCMODE_CLOCK_DISABLE, UART1_MODE_TXRX_ENABLE);
	push	#0x0c
	push	#0x80
	push	#0x00
	push	#0x00
	push	#0x00
	ldw	x, (0x0a, sp)
	pushw	x
	ldw	x, (0x0a, sp)
	pushw	x
	call	_UART1_Init
	addw	sp, #9
;	user/hc05.c: 38: UART1_ITConfig(UART1_IT_RXNE_OR, ENABLE);
	push	#0x01
	push	#0x05
	push	#0x02
	call	_UART1_ITConfig
	addw	sp, #3
;	user/hc05.c: 41: UART1_Cmd(ENABLE);
	push	#0x01
	call	_UART1_Cmd
	pop	a
;	user/hc05.c: 51: HC05_PutStr("\r\n");
	ldw	x, #___str_0+0
	pushw	x
	call	_HC05_PutStr
	popw	x
;	user/hc05.c: 52: HC05_ClearRxBuffer();
	call	_HC05_ClearRxBuffer
;	user/hc05.c: 53: HC05_Delay(1000);
	push	#0xe8
	push	#0x03
	clrw	x
	pushw	x
	call	_HC05_Delay
	addw	sp, #4
	ret
;	user/hc05.c: 56: static void HC05_Delay(uint32_t delay)
;	-----------------------------------------
;	 function HC05_Delay
;	-----------------------------------------
_HC05_Delay:
	sub	sp, #8
;	user/hc05.c: 58: while(delay--);
	ldw	y, (0x0b, sp)
	ldw	(0x05, sp), y
	ldw	x, (0x0d, sp)
00101$:
	ldw	(0x03, sp), x
	ldw	y, (0x05, sp)
	ldw	(0x01, sp), y
	subw	x, #0x0001
	ld	a, (0x06, sp)
	sbc	a, #0x00
	ld	(0x06, sp), a
	ld	a, (0x05, sp)
	sbc	a, #0x00
	ld	(0x05, sp), a
	ldw	y, (0x03, sp)
	jrne	00101$
	ldw	y, (0x01, sp)
	jrne	00101$
	addw	sp, #8
	ret
;	user/hc05.c: 61: void HC05_Read(void)
;	-----------------------------------------
;	 function HC05_Read
;	-----------------------------------------
_HC05_Read:
	sub	sp, #4
;	user/hc05.c: 63: while (UART1_GetFlagStatus(UART1_FLAG_RXNE) == RESET);
00101$:
	push	#0x20
	push	#0x00
	call	_UART1_GetFlagStatus
	popw	x
	tnz	a
	jreq	00101$
;	user/hc05.c: 64: HC05_rx_buffer[HC05_rx_counter] == UART1_ReceiveData8();
	call	_UART1_ReceiveData8
;	user/hc05.c: 65: if((HC05_rx_counter+1 == HC05_RX_BUFFER_LENGTH) || (HC05_rx_buffer[HC05_rx_counter] == 0x0a))
	clrw	x
	ld	a, _HC05_rx_counter+0
	ld	xl, a
	incw	x
	cpw	x, #0x0028
	jreq	00104$
	ldw	x, #_HC05_rx_buffer+0
	ld	a, xl
	add	a, _HC05_rx_counter+0
	rlwa	x
	adc	a, #0x00
	ld	xh, a
	ld	a, (x)
	cp	a, #0x0a
	jrne	00105$
00104$:
;	user/hc05.c: 67: memcpy(HC05_msg, HC05_rx_buffer, HC05_rx_counter);
	clrw	x
	ld	a, _HC05_rx_counter+0
	ld	xl, a
	ldw	y, #_HC05_rx_buffer+0
	ldw	(0x03, sp), y
	ldw	y, (0x03, sp)
	ldw	(0x01, sp), y
	ldw	y, #_HC05_msg+0
	pushw	x
	ldw	x, (0x03, sp)
	pushw	x
	pushw	y
	call	_memcpy
	addw	sp, #6
;	user/hc05.c: 68: memset(HC05_rx_buffer, 0, HC05_RX_BUFFER_LENGTH);
	ldw	y, (0x03, sp)
	push	#0x28
	push	#0x00
	clrw	x
	pushw	x
	pushw	y
	call	_memset
	addw	sp, #6
;	user/hc05.c: 69: HC05_rx_counter = 0;
	clr	_HC05_rx_counter+0
;	user/hc05.c: 70: new_HC05_msg = 1;
	mov	_new_HC05_msg+0, #0x01
	jra	00108$
00105$:
;	user/hc05.c: 74: HC05_rx_counter++;
	ld	a, _HC05_rx_counter+0
	inc	a
	ld	_HC05_rx_counter+0, a
00108$:
	addw	sp, #4
	ret
;	user/hc05.c: 78: void HC05_PutChar(uint8_t c)
;	-----------------------------------------
;	 function HC05_PutChar
;	-----------------------------------------
_HC05_PutChar:
;	user/hc05.c: 80: while(UART1_GetFlagStatus(UART1_FLAG_TXE) == RESET);
00101$:
	push	#0x80
	push	#0x00
	call	_UART1_GetFlagStatus
	popw	x
	tnz	a
	jreq	00101$
;	user/hc05.c: 81: IWDG_ReloadCounter();
	call	_IWDG_ReloadCounter
;	user/hc05.c: 82: UART1_SendData8(c);
	ld	a, (0x03, sp)
	push	a
	call	_UART1_SendData8
	pop	a
	ret
;	user/hc05.c: 86: void HC05_PutStr(uint8_t *str)
;	-----------------------------------------
;	 function HC05_PutStr
;	-----------------------------------------
_HC05_PutStr:
	sub	sp, #17
;	user/hc05.c: 89: uint32_t tick = 0xFFFF;
	ldw	x, #0xffff
	ldw	(0x05, sp), x
	clrw	x
	ldw	(0x03, sp), x
;	user/hc05.c: 90: while(str[ad_send] != 0)
	clrw	x
	ldw	(0x01, sp), x
00105$:
	ldw	x, (0x14, sp)
	addw	x, (0x01, sp)
	ldw	(0x10, sp), x
	ldw	x, (0x10, sp)
	ld	a, (x)
	tnz	a
	jreq	00108$
;	user/hc05.c: 92: while((UART1_GetFlagStatus(UART1_FLAG_TXE) == RESET)&&(tick-- != 0));
	ldw	y, (0x03, sp)
	ldw	(0x0b, sp), y
	ldw	x, (0x05, sp)
00102$:
	pushw	x
	push	#0x80
	push	#0x00
	call	_UART1_GetFlagStatus
	popw	x
	ld	(0x11, sp), a
	popw	x
	tnz	(0x0f, sp)
	jrne	00113$
	ldw	(0x09, sp), x
	ldw	y, (0x0b, sp)
	ldw	(0x07, sp), y
	subw	x, #0x0001
	ld	a, (0x0c, sp)
	sbc	a, #0x00
	ld	(0x0c, sp), a
	ld	a, (0x0b, sp)
	sbc	a, #0x00
	ld	(0x0b, sp), a
	ldw	y, (0x09, sp)
	jrne	00102$
	ldw	y, (0x07, sp)
	jrne	00102$
00113$:
	ldw	(0x05, sp), x
	ldw	y, (0x0b, sp)
	ldw	(0x03, sp), y
;	user/hc05.c: 93: IWDG_ReloadCounter();
	call	_IWDG_ReloadCounter
;	user/hc05.c: 94: UART1_SendData8(str[ad_send]);
	ldw	x, (0x10, sp)
	ld	a, (x)
	push	a
	call	_UART1_SendData8
	pop	a
;	user/hc05.c: 95: ad_send++;
	ldw	x, (0x01, sp)
	incw	x
	ldw	(0x01, sp), x
	jra	00105$
00108$:
	addw	sp, #17
	ret
;	user/hc05.c: 99: void HC05_ClearRxBuffer(void)
;	-----------------------------------------
;	 function HC05_ClearRxBuffer
;	-----------------------------------------
_HC05_ClearRxBuffer:
;	user/hc05.c: 101: memset(HC05_rx_buffer, 0, HC05_RX_BUFFER_LENGTH);
	ldw	x, #_HC05_rx_buffer+0
	push	#0x28
	push	#0x00
	push	#0x00
	push	#0x00
	pushw	x
	call	_memset
	addw	sp, #6
;	user/hc05.c: 102: HC05_rx_counter = 0;
	clr	_HC05_rx_counter+0
;	user/hc05.c: 103: new_HC05_msg = 0;
	clr	_new_HC05_msg+0
	ret
;	user/hc05.c: 106: uint8_t HC05_Test(void)
;	-----------------------------------------
;	 function HC05_Test
;	-----------------------------------------
_HC05_Test:
	sub	sp, #4
;	user/hc05.c: 109: HC05_ClearRxBuffer();
	call	_HC05_ClearRxBuffer
;	user/hc05.c: 110: HC05_PutStr("AT");
	ldw	x, #___str_1+0
	pushw	x
	call	_HC05_PutStr
	popw	x
;	user/hc05.c: 111: while(HC05_rx_counter < 2)
	ldw	x, #0x6f30
	ldw	(0x03, sp), x
	ldw	x, #0x0001
	ldw	(0x01, sp), x
00103$:
	ld	a, _HC05_rx_counter+0
	cp	a, #0x02
	jrnc	00105$
;	user/hc05.c: 113: timeout--;
	ldw	x, (0x03, sp)
	subw	x, #0x0001
	ldw	(0x03, sp), x
	ld	a, (0x02, sp)
	sbc	a, #0x00
	ld	(0x02, sp), a
	ld	a, (0x01, sp)
	sbc	a, #0x00
	ld	(0x01, sp), a
;	user/hc05.c: 114: HC05_Delay(1000);
	push	#0xe8
	push	#0x03
	clrw	x
	pushw	x
	call	_HC05_Delay
	addw	sp, #4
;	user/hc05.c: 115: if(timeout == 0) return 0x01;
	ldw	x, (0x03, sp)
	jrne	00103$
	ldw	x, (0x01, sp)
	jrne	00103$
	ld	a, #0x01
	jra	00109$
00105$:
;	user/hc05.c: 117: if(strcmp(HC05_rx_buffer, "OK") == 0) return 0x00;
	ldw	y, #___str_2+0
	ldw	x, #_HC05_rx_buffer+0
	pushw	y
	pushw	x
	call	_strcmp
	addw	sp, #4
	tnzw	x
	jrne	00107$
	clr	a
	jra	00109$
00107$:
;	user/hc05.c: 118: else return 0x02;
	ld	a, #0x02
00109$:
	addw	sp, #4
	ret
;	user/hc05.c: 121: uint8_t HC05_SetBaud(uint32_t speed)
;	-----------------------------------------
;	 function HC05_SetBaud
;	-----------------------------------------
_HC05_SetBaud:
	sub	sp, #28
;	user/hc05.c: 126: HC05_ClearRxBuffer(); //clear rx buffer
	call	_HC05_ClearRxBuffer
;	user/hc05.c: 128: if(speed == 1200)
	ldw	x, (0x21, sp)
	cpw	x, #0x04b0
	jrne	00126$
	ldw	x, (0x1f, sp)
	cpw	x, #0x0000
	jrne	00126$
;	user/hc05.c: 130: strcpy(buf, "OK1200");
	ldw	y, #___str_3+0
	ldw	x, sp
	incw	x
	pushw	y
	pushw	x
	call	_strcpy
	addw	sp, #4
;	user/hc05.c: 131: HC05_PutStr("AT+BAUD1");                          
	ldw	x, #___str_4+0
	pushw	x
	call	_HC05_PutStr
	popw	x
	jp	00148$
00126$:
;	user/hc05.c: 133: else if(speed == 2400)
	ldw	x, (0x21, sp)
	cpw	x, #0x0960
	jrne	00123$
	ldw	x, (0x1f, sp)
	cpw	x, #0x0000
	jrne	00123$
;	user/hc05.c: 135: strcpy(buf, "OK2400");
	ldw	y, #___str_5+0
	ldw	x, sp
	incw	x
	pushw	y
	pushw	x
	call	_strcpy
	addw	sp, #4
;	user/hc05.c: 136: HC05_PutStr("AT+BAUD2");                          
	ldw	x, #___str_6+0
	pushw	x
	call	_HC05_PutStr
	popw	x
	jp	00148$
00123$:
;	user/hc05.c: 138: else if(speed == 4800)
	ldw	x, (0x21, sp)
	cpw	x, #0x12c0
	jrne	00120$
	ldw	x, (0x1f, sp)
	cpw	x, #0x0000
	jrne	00120$
;	user/hc05.c: 140: strcpy(buf, "OK4800");
	ldw	y, #___str_7+0
	ldw	x, sp
	incw	x
	pushw	y
	pushw	x
	call	_strcpy
	addw	sp, #4
;	user/hc05.c: 141: HC05_PutStr("AT+BAUD3");                          
	ldw	x, #___str_8+0
	pushw	x
	call	_HC05_PutStr
	popw	x
	jp	00148$
00120$:
;	user/hc05.c: 143: else if(speed == 9600)
	ldw	x, (0x21, sp)
	cpw	x, #0x2580
	jrne	00117$
	ldw	x, (0x1f, sp)
	cpw	x, #0x0000
	jrne	00117$
;	user/hc05.c: 145: strcpy(buf, "OK9600");
	ldw	y, #___str_9+0
	ldw	x, sp
	incw	x
	pushw	y
	pushw	x
	call	_strcpy
	addw	sp, #4
;	user/hc05.c: 146: HC05_PutStr("AT+BAUD4");                          
	ldw	x, #___str_10+0
	pushw	x
	call	_HC05_PutStr
	popw	x
	jp	00148$
00117$:
;	user/hc05.c: 148: else if(speed == 19200)
	ldw	x, (0x21, sp)
	cpw	x, #0x4b00
	jrne	00114$
	ldw	x, (0x1f, sp)
	cpw	x, #0x0000
	jrne	00114$
;	user/hc05.c: 150: strcpy(buf, "OK19200");
	ldw	y, #___str_11+0
	ldw	x, sp
	incw	x
	pushw	y
	pushw	x
	call	_strcpy
	addw	sp, #4
;	user/hc05.c: 151: HC05_PutStr("AT+BAUD5");                          
	ldw	x, #___str_12+0
	pushw	x
	call	_HC05_PutStr
	popw	x
	jp	00148$
00114$:
;	user/hc05.c: 153: else if(speed == 38400)
	ldw	x, (0x21, sp)
	cpw	x, #0x9600
	jrne	00111$
	ldw	x, (0x1f, sp)
	cpw	x, #0x0000
	jrne	00111$
;	user/hc05.c: 155: strcpy(buf, "OK38400");
	ldw	y, #___str_13+0
	ldw	x, sp
	incw	x
	pushw	y
	pushw	x
	call	_strcpy
	addw	sp, #4
;	user/hc05.c: 156: HC05_PutStr("AT+BAUD6");                          
	ldw	x, #___str_14+0
	pushw	x
	call	_HC05_PutStr
	popw	x
	jra	00148$
00111$:
;	user/hc05.c: 158: else if(speed == 57600)
	ldw	x, (0x21, sp)
	cpw	x, #0xe100
	jrne	00108$
	ldw	x, (0x1f, sp)
	cpw	x, #0x0000
	jrne	00108$
;	user/hc05.c: 160: strcpy(buf, "OK57600");
	ldw	y, #___str_15+0
	ldw	x, sp
	incw	x
	pushw	y
	pushw	x
	call	_strcpy
	addw	sp, #4
;	user/hc05.c: 161: HC05_PutStr("AT+BAUD7");                          
	ldw	x, #___str_16+0
	pushw	x
	call	_HC05_PutStr
	popw	x
	jra	00148$
00108$:
;	user/hc05.c: 163: else if(speed == 115200)
	ldw	x, (0x21, sp)
	cpw	x, #0xc200
	jrne	00105$
	ldw	x, (0x1f, sp)
	cpw	x, #0x0001
	jrne	00105$
;	user/hc05.c: 165: strcpy(buf, "OK115200");
	ldw	y, #___str_17+0
	ldw	x, sp
	incw	x
	pushw	y
	pushw	x
	call	_strcpy
	addw	sp, #4
;	user/hc05.c: 166: HC05_PutStr("AT+BAUD8");                          
	ldw	x, #___str_18+0
	pushw	x
	call	_HC05_PutStr
	popw	x
	jra	00148$
00105$:
;	user/hc05.c: 168: else if(speed == 230400)
	ldw	x, (0x21, sp)
	cpw	x, #0x8400
	jrne	00102$
	ldw	x, (0x1f, sp)
	cpw	x, #0x0003
	jrne	00102$
;	user/hc05.c: 170: strcpy(buf, "OK230400");
	ldw	y, #___str_19+0
	ldw	x, sp
	incw	x
	pushw	y
	pushw	x
	call	_strcpy
	addw	sp, #4
;	user/hc05.c: 171: HC05_PutStr("AT+BAUD9");                          
	ldw	x, #___str_20+0
	pushw	x
	call	_HC05_PutStr
	popw	x
	jra	00148$
00102$:
;	user/hc05.c: 175: return 0x01; //error - incorrect speed
	ld	a, #0x01
	jra	00136$
;	user/hc05.c: 178: while(HC05_rx_counter < strlen(buf)) //wait for "OK" message
00148$:
	ldw	x, sp
	incw	x
	ldw	(0x1b, sp), x
	ldw	x, #0x6f30
	ldw	(0x17, sp), x
	ldw	x, #0x0001
	ldw	(0x15, sp), x
00130$:
	ldw	x, (0x1b, sp)
	pushw	x
	call	_strlen
	addw	sp, #2
	ldw	(0x19, sp), x
	clrw	x
	ld	a, _HC05_rx_counter+0
	ld	xl, a
	cpw	x, (0x19, sp)
	jrnc	00132$
;	user/hc05.c: 180: timeout--;
	ldw	x, (0x17, sp)
	subw	x, #0x0001
	ldw	(0x17, sp), x
	ld	a, (0x16, sp)
	sbc	a, #0x00
	ld	(0x16, sp), a
	ld	a, (0x15, sp)
	sbc	a, #0x00
	ld	(0x15, sp), a
;	user/hc05.c: 181: HC05_Delay(1000); //wait +/- 100us just to give interrupt time to service incoming message
	push	#0xe8
	push	#0x03
	clrw	x
	pushw	x
	call	_HC05_Delay
	addw	sp, #4
;	user/hc05.c: 182: if (timeout == 0) 
	ldw	x, (0x17, sp)
	jrne	00130$
	ldw	x, (0x15, sp)
	jrne	00130$
;	user/hc05.c: 183: return 0x02; //if the timeout delay is exeeded, exit with error code
	ld	a, #0x02
	jra	00136$
00132$:
;	user/hc05.c: 185: if(strcmp(HC05_rx_buffer, buf) == 0)
	ldw	y, (0x1b, sp)
	ldw	x, #_HC05_rx_buffer+0
	pushw	y
	pushw	x
	call	_strcmp
	addw	sp, #4
	tnzw	x
	jrne	00134$
;	user/hc05.c: 186: return 0x00; //success
	clr	a
	jra	00136$
00134$:
;	user/hc05.c: 188: return 0x03; //unknown return AT msg from HC06
	ld	a, #0x03
00136$:
	addw	sp, #28
	ret
;	user/hc05.c: 191: uint8_t HC05_SetName(char *name)
;	-----------------------------------------
;	 function HC05_SetName
;	-----------------------------------------
_HC05_SetName:
	sub	sp, #20
;	user/hc05.c: 196: HC05_ClearRxBuffer(); //clear rx buffer
	call	_HC05_ClearRxBuffer
;	user/hc05.c: 198: if(strlen(name) > 13) //error - name more than 20 characters
	ldw	x, (0x17, sp)
	pushw	x
	call	_strlen
	addw	sp, #2
	cpw	x, #0x000d
	jrule	00102$
;	user/hc05.c: 199: return 0x01;
	ld	a, #0x01
	jra	00111$
00102$:
;	user/hc05.c: 202: HC05_PutStr(cmd); //AT command for SET NAME
	ldw	x, sp
	incw	x
	pushw	x
	call	_HC05_PutStr
	popw	x
;	user/hc05.c: 204: while(HC05_rx_counter < 9) //wait for "OKsetname" message, i.e. 9 chars
	ldw	y, #0x6f30
	ldw	x, #0x0001
00105$:
	ld	a, _HC05_rx_counter+0
	cp	a, #0x09
	jrnc	00107$
;	user/hc05.c: 206: timeout--;
	subw	y, #0x0001
	ld	a, xl
	sbc	a, #0x00
	rlwa	x
	sbc	a, #0x00
	ld	xh, a
;	user/hc05.c: 207: HC05_Delay(1000); //wait +/- 100us just to give interrupt time to service incoming message
	pushw	x
	pushw	y
	push	#0xe8
	push	#0x03
	push	#0x00
	push	#0x00
	call	_HC05_Delay
	addw	sp, #4
	popw	y
	popw	x
;	user/hc05.c: 208: if (timeout == 0) 
	tnzw	y
	jrne	00105$
	tnzw	x
	jrne	00105$
;	user/hc05.c: 209: return 0x02; //if the timeout delay is exeeded, exit with error code
	ld	a, #0x02
	jra	00111$
00107$:
;	user/hc05.c: 211: if(strcmp(HC05_rx_buffer, "OKsetname") == 0)
	ldw	y, #___str_21+0
	ldw	x, #_HC05_rx_buffer+0
	pushw	y
	pushw	x
	call	_strcmp
	addw	sp, #4
	tnzw	x
	jrne	00109$
;	user/hc05.c: 212: return 0x00; //success
	clr	a
	jra	00111$
00109$:
;	user/hc05.c: 214: return 0x03; //unknown return AT msg from HC06
	ld	a, #0x03
00111$:
	addw	sp, #20
	ret
;	user/hc05.c: 217: uint8_t HC05_SetPin(uint8_t *pin)
;	-----------------------------------------
;	 function HC05_SetPin
;	-----------------------------------------
_HC05_SetPin:
	sub	sp, #20
;	user/hc05.c: 222: HC05_ClearRxBuffer(); //clear rx buffer
	call	_HC05_ClearRxBuffer
;	user/hc05.c: 224: if((strlen(pin) < 4) || (strlen(pin) > 4))
	ldw	x, (0x17, sp)
	pushw	x
	call	_strlen
	addw	sp, #2
	cpw	x, #0x0004
	jrc	00101$
	ldw	x, (0x17, sp)
	pushw	x
	call	_strlen
	addw	sp, #2
	cpw	x, #0x0004
	jrule	00102$
00101$:
;	user/hc05.c: 225: return 0x01; //error - too few or many characetrs in pin
	ld	a, #0x01
	jra	00112$
00102$:
;	user/hc05.c: 228: HC05_PutStr(buf); //AT command for SET PIN
	ldw	x, sp
	incw	x
	pushw	x
	call	_HC05_PutStr
	popw	x
;	user/hc05.c: 230: while(HC05_rx_counter < 8) //wait for "OKsetpin" message, i.e. 8 chars
	ldw	y, #0x6f30
	ldw	x, #0x0001
00106$:
	ld	a, _HC05_rx_counter+0
	cp	a, #0x08
	jrnc	00108$
;	user/hc05.c: 232: timeout--;
	subw	y, #0x0001
	ld	a, xl
	sbc	a, #0x00
	rlwa	x
	sbc	a, #0x00
	ld	xh, a
;	user/hc05.c: 233: HC05_Delay(1000); //wait +/- 100us just to give interrupt time to service incoming message
	pushw	x
	pushw	y
	push	#0xe8
	push	#0x03
	push	#0x00
	push	#0x00
	call	_HC05_Delay
	addw	sp, #4
	popw	y
	popw	x
;	user/hc05.c: 234: if (timeout == 0) 
	tnzw	y
	jrne	00106$
	tnzw	x
	jrne	00106$
;	user/hc05.c: 235: return 0x02; //if the timeout delay is exeeded, exit with error code
	ld	a, #0x02
	jra	00112$
00108$:
;	user/hc05.c: 237: if(strcmp(HC05_rx_buffer, "OKsetPIN") == 0)
	ldw	y, #___str_22+0
	ldw	x, #_HC05_rx_buffer+0
	pushw	y
	pushw	x
	call	_strcmp
	addw	sp, #4
	tnzw	x
	jrne	00110$
;	user/hc05.c: 238: return 0x00; //success
	clr	a
	jra	00112$
00110$:
;	user/hc05.c: 240: return 0x03; //unknown return AT msg from HC06
	ld	a, #0x03
00112$:
	addw	sp, #20
	ret
	.area CODE
___str_0:
	.db 0x0d
	.db 0x0a
	.db 0x00
___str_1:
	.ascii "AT"
	.db 0x00
___str_2:
	.ascii "OK"
	.db 0x00
___str_3:
	.ascii "OK1200"
	.db 0x00
___str_4:
	.ascii "AT+BAUD1"
	.db 0x00
___str_5:
	.ascii "OK2400"
	.db 0x00
___str_6:
	.ascii "AT+BAUD2"
	.db 0x00
___str_7:
	.ascii "OK4800"
	.db 0x00
___str_8:
	.ascii "AT+BAUD3"
	.db 0x00
___str_9:
	.ascii "OK9600"
	.db 0x00
___str_10:
	.ascii "AT+BAUD4"
	.db 0x00
___str_11:
	.ascii "OK19200"
	.db 0x00
___str_12:
	.ascii "AT+BAUD5"
	.db 0x00
___str_13:
	.ascii "OK38400"
	.db 0x00
___str_14:
	.ascii "AT+BAUD6"
	.db 0x00
___str_15:
	.ascii "OK57600"
	.db 0x00
___str_16:
	.ascii "AT+BAUD7"
	.db 0x00
___str_17:
	.ascii "OK115200"
	.db 0x00
___str_18:
	.ascii "AT+BAUD8"
	.db 0x00
___str_19:
	.ascii "OK230400"
	.db 0x00
___str_20:
	.ascii "AT+BAUD9"
	.db 0x00
___str_21:
	.ascii "OKsetname"
	.db 0x00
___str_22:
	.ascii "OKsetPIN"
	.db 0x00
	.area INITIALIZER
__xinit__HC05_rx_counter:
	.db #0x00	; 0
__xinit__new_HC05_msg:
	.db #0x00	; 0
	.area CABS (ABS)
