                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.6.0 #9615 (Mac OS X x86_64)
                                      4 ;--------------------------------------------------------
                                      5 	.module debug
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _usart_send
                                     12 	.globl _UART1_GetFlagStatus
                                     13 	.globl _UART1_SendData8
                                     14 	.globl _UART1_ITConfig
                                     15 	.globl _UART1_Cmd
                                     16 	.globl _UART1_Init
                                     17 	.globl _UART1_DeInit
                                     18 	.globl _IWDG_ReloadCounter
                                     19 	.globl _GPIO_Init
                                     20 	.globl _CLK_PeripheralClockConfig
                                     21 	.globl _debug_Init
                                     22 	.globl _info
                                     23 	.globl _debugInfo
                                     24 ;--------------------------------------------------------
                                     25 ; ram data
                                     26 ;--------------------------------------------------------
                                     27 	.area DATA
                                     28 ;--------------------------------------------------------
                                     29 ; ram data
                                     30 ;--------------------------------------------------------
                                     31 	.area INITIALIZED
                                     32 ;--------------------------------------------------------
                                     33 ; absolute external ram data
                                     34 ;--------------------------------------------------------
                                     35 	.area DABS (ABS)
                                     36 ;--------------------------------------------------------
                                     37 ; global & static initialisations
                                     38 ;--------------------------------------------------------
                                     39 	.area HOME
                                     40 	.area GSINIT
                                     41 	.area GSFINAL
                                     42 	.area GSINIT
                                     43 ;--------------------------------------------------------
                                     44 ; Home
                                     45 ;--------------------------------------------------------
                                     46 	.area HOME
                                     47 	.area HOME
                                     48 ;--------------------------------------------------------
                                     49 ; code
                                     50 ;--------------------------------------------------------
                                     51 	.area CODE
                                     52 ;	user/debug.c: 3: void debug_Init(void)
                                     53 ;	-----------------------------------------
                                     54 ;	 function debug_Init
                                     55 ;	-----------------------------------------
      0080A0                         56 _debug_Init:
                                     57 ;	user/debug.c: 5: GPIO_Init(GPIOD, GPIO_PIN_5, GPIO_MODE_OUT_OD_HIZ_FAST);
      0080A0 4B B0            [ 1]   58 	push	#0xb0
      0080A2 4B 20            [ 1]   59 	push	#0x20
      0080A4 4B 0F            [ 1]   60 	push	#0x0f
      0080A6 4B 50            [ 1]   61 	push	#0x50
      0080A8 CD 8F 3C         [ 4]   62 	call	_GPIO_Init
      0080AB 5B 04            [ 2]   63 	addw	sp, #4
                                     64 ;	user/debug.c: 6: GPIO_Init(GPIOD, GPIO_PIN_6, GPIO_MODE_IN_PU_NO_IT);
      0080AD 4B 40            [ 1]   65 	push	#0x40
      0080AF 4B 40            [ 1]   66 	push	#0x40
      0080B1 4B 0F            [ 1]   67 	push	#0x0f
      0080B3 4B 50            [ 1]   68 	push	#0x50
      0080B5 CD 8F 3C         [ 4]   69 	call	_GPIO_Init
      0080B8 5B 04            [ 2]   70 	addw	sp, #4
                                     71 ;	user/debug.c: 7: CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1 , ENABLE); 
      0080BA 4B 01            [ 1]   72 	push	#0x01
      0080BC 4B 03            [ 1]   73 	push	#0x03
      0080BE CD 8D C8         [ 4]   74 	call	_CLK_PeripheralClockConfig
      0080C1 85               [ 2]   75 	popw	x
                                     76 ;	user/debug.c: 9: UART1_DeInit();
      0080C2 CD 91 AF         [ 4]   77 	call	_UART1_DeInit
                                     78 ;	user/debug.c: 11: UART1_Init((uint32_t)9600, UART1_WORDLENGTH_8D, UART1_STOPBITS_1, UART1_PARITY_NO,
      0080C5 4B 0C            [ 1]   79 	push	#0x0c
      0080C7 4B 80            [ 1]   80 	push	#0x80
      0080C9 4B 00            [ 1]   81 	push	#0x00
      0080CB 4B 00            [ 1]   82 	push	#0x00
      0080CD 4B 00            [ 1]   83 	push	#0x00
      0080CF 4B 80            [ 1]   84 	push	#0x80
      0080D1 4B 25            [ 1]   85 	push	#0x25
      0080D3 5F               [ 1]   86 	clrw	x
      0080D4 89               [ 2]   87 	pushw	x
      0080D5 CD 91 DC         [ 4]   88 	call	_UART1_Init
      0080D8 5B 09            [ 2]   89 	addw	sp, #9
                                     90 ;	user/debug.c: 14: UART1_ITConfig(UART1_IT_RXNE_OR, ENABLE);    
      0080DA 4B 01            [ 1]   91 	push	#0x01
      0080DC 4B 05            [ 1]   92 	push	#0x05
      0080DE 4B 02            [ 1]   93 	push	#0x02
      0080E0 CD 93 7D         [ 4]   94 	call	_UART1_ITConfig
      0080E3 5B 03            [ 2]   95 	addw	sp, #3
                                     96 ;	user/debug.c: 16: UART1_Cmd(ENABLE);  
      0080E5 4B 01            [ 1]   97 	push	#0x01
      0080E7 CD 93 69         [ 4]   98 	call	_UART1_Cmd
      0080EA 84               [ 1]   99 	pop	a
      0080EB 81               [ 4]  100 	ret
                                    101 ;	user/debug.c: 19: void usart_send(uint8_t *data)
                                    102 ;	-----------------------------------------
                                    103 ;	 function usart_send
                                    104 ;	-----------------------------------------
      0080EC                        105 _usart_send:
      0080EC 52 03            [ 2]  106 	sub	sp, #3
                                    107 ;	user/debug.c: 23: while(data[cnt])
      0080EE 0F 01            [ 1]  108 	clr	(0x01, sp)
      0080F0                        109 00105$:
      0080F0 5F               [ 1]  110 	clrw	x
      0080F1 7B 01            [ 1]  111 	ld	a, (0x01, sp)
      0080F3 97               [ 1]  112 	ld	xl, a
      0080F4 72 FB 06         [ 2]  113 	addw	x, (0x06, sp)
      0080F7 F6               [ 1]  114 	ld	a, (x)
      0080F8 4D               [ 1]  115 	tnz	a
      0080F9 27 2D            [ 1]  116 	jreq	00108$
                                    117 ;	user/debug.c: 26: UART1_SendData8(data[cnt++]);
      0080FB 7B 01            [ 1]  118 	ld	a, (0x01, sp)
      0080FD 0C 01            [ 1]  119 	inc	(0x01, sp)
      0080FF 5F               [ 1]  120 	clrw	x
      008100 97               [ 1]  121 	ld	xl, a
      008101 72 FB 06         [ 2]  122 	addw	x, (0x06, sp)
      008104 F6               [ 1]  123 	ld	a, (x)
      008105 88               [ 1]  124 	push	a
      008106 CD 94 14         [ 4]  125 	call	_UART1_SendData8
      008109 84               [ 1]  126 	pop	a
                                    127 ;	user/debug.c: 29: while((UART1_GetFlagStatus(UART1_FLAG_TXE) == RESET)&&(timeout--))IWDG_ReloadCounter();
      00810A AE 0F FF         [ 2]  128 	ldw	x, #0x0fff
      00810D                        129 00102$:
      00810D 89               [ 2]  130 	pushw	x
      00810E 4B 80            [ 1]  131 	push	#0x80
      008110 4B 00            [ 1]  132 	push	#0x00
      008112 CD 94 1B         [ 4]  133 	call	_UART1_GetFlagStatus
      008115 85               [ 2]  134 	popw	x
      008116 85               [ 2]  135 	popw	x
      008117 4D               [ 1]  136 	tnz	a
      008118 26 D6            [ 1]  137 	jrne	00105$
      00811A 1F 02            [ 2]  138 	ldw	(0x02, sp), x
      00811C 5A               [ 2]  139 	decw	x
      00811D 16 02            [ 2]  140 	ldw	y, (0x02, sp)
      00811F 27 CF            [ 1]  141 	jreq	00105$
      008121 89               [ 2]  142 	pushw	x
      008122 CD 90 06         [ 4]  143 	call	_IWDG_ReloadCounter
      008125 85               [ 2]  144 	popw	x
      008126 20 E5            [ 2]  145 	jra	00102$
      008128                        146 00108$:
      008128 5B 03            [ 2]  147 	addw	sp, #3
      00812A 81               [ 4]  148 	ret
                                    149 ;	user/debug.c: 33: void info(const uint8_t* str)
                                    150 ;	-----------------------------------------
                                    151 ;	 function info
                                    152 ;	-----------------------------------------
      00812B                        153 _info:
                                    154 ;	user/debug.c: 35: usart_send((uint8_t*)str);
      00812B 1E 03            [ 2]  155 	ldw	x, (0x03, sp)
      00812D 89               [ 2]  156 	pushw	x
      00812E CD 80 EC         [ 4]  157 	call	_usart_send
      008131 85               [ 2]  158 	popw	x
      008132 81               [ 4]  159 	ret
                                    160 ;	user/debug.c: 65: void debugInfo(const uint8_t* str, uint8_t *data, uint8_t len)
                                    161 ;	-----------------------------------------
                                    162 ;	 function debugInfo
                                    163 ;	-----------------------------------------
      008133                        164 _debugInfo:
      008133 52 0E            [ 2]  165 	sub	sp, #14
                                    166 ;	user/debug.c: 71: usart_send((uint8_t*)str);
      008135 1E 11            [ 2]  167 	ldw	x, (0x11, sp)
      008137 89               [ 2]  168 	pushw	x
      008138 CD 80 EC         [ 4]  169 	call	_usart_send
      00813B 85               [ 2]  170 	popw	x
                                    171 ;	user/debug.c: 72: for(add = 0; add < len; add++)
      00813C 0F 02            [ 1]  172 	clr	(0x02, sp)
      00813E                        173 00111$:
      00813E 7B 02            [ 1]  174 	ld	a, (0x02, sp)
      008140 11 15            [ 1]  175 	cp	a, (0x15, sp)
      008142 25 03            [ 1]  176 	jrc	00140$
      008144 CC 81 C7         [ 2]  177 	jp	00109$
      008147                        178 00140$:
                                    179 ;	user/debug.c: 74: dat = data[add];
      008147 5F               [ 1]  180 	clrw	x
      008148 7B 02            [ 1]  181 	ld	a, (0x02, sp)
      00814A 97               [ 1]  182 	ld	xl, a
      00814B 72 FB 13         [ 2]  183 	addw	x, (0x13, sp)
      00814E F6               [ 1]  184 	ld	a, (x)
                                    185 ;	user/debug.c: 75: hnib = dat/16;
      00814F 90 97            [ 1]  186 	ld	yl, a
      008151 4E               [ 1]  187 	swap	a
      008152 A4 0F            [ 1]  188 	and	a, #0x0f
      008154 61               [ 1]  189 	exg	a, yl
                                    190 ;	user/debug.c: 76: lnib = dat%16;
      008155 A4 0F            [ 1]  191 	and	a, #0x0f
      008157 6B 01            [ 1]  192 	ld	(0x01, sp), a
                                    193 ;	user/debug.c: 77: ascii[0] = '0';
      008159 96               [ 1]  194 	ldw	x, sp
      00815A 1C 00 03         [ 2]  195 	addw	x, #3
      00815D 1F 0D            [ 2]  196 	ldw	(0x0d, sp), x
      00815F 1E 0D            [ 2]  197 	ldw	x, (0x0d, sp)
      008161 A6 30            [ 1]  198 	ld	a, #0x30
      008163 F7               [ 1]  199 	ld	(x), a
                                    200 ;	user/debug.c: 78: ascii[1] = 'x';
      008164 1E 0D            [ 2]  201 	ldw	x, (0x0d, sp)
      008166 5C               [ 2]  202 	incw	x
      008167 A6 78            [ 1]  203 	ld	a, #0x78
      008169 F7               [ 1]  204 	ld	(x), a
                                    205 ;	user/debug.c: 79: ascii[4] = ' ';
      00816A 1E 0D            [ 2]  206 	ldw	x, (0x0d, sp)
      00816C A6 20            [ 1]  207 	ld	a, #0x20
      00816E E7 04            [ 1]  208 	ld	(0x0004, x), a
                                    209 ;	user/debug.c: 80: ascii[5] = 0;
      008170 1E 0D            [ 2]  210 	ldw	x, (0x0d, sp)
      008172 1C 00 05         [ 2]  211 	addw	x, #0x0005
      008175 7F               [ 1]  212 	clr	(x)
                                    213 ;	user/debug.c: 81: if(hnib < 10)
      008176 90 9F            [ 1]  214 	ld	a, yl
      008178 A1 0A            [ 1]  215 	cp	a, #0x0a
      00817A 4F               [ 1]  216 	clr	a
      00817B 49               [ 1]  217 	rlc	a
      00817C 6B 0C            [ 1]  218 	ld	(0x0c, sp), a
                                    219 ;	user/debug.c: 82: ascii[2] = hnib + '0';
      00817E 1E 0D            [ 2]  220 	ldw	x, (0x0d, sp)
      008180 5C               [ 2]  221 	incw	x
      008181 5C               [ 2]  222 	incw	x
      008182 61               [ 1]  223 	exg	a, yl
      008183 6B 0B            [ 1]  224 	ld	(0x0b, sp), a
      008185 61               [ 1]  225 	exg	a, yl
                                    226 ;	user/debug.c: 81: if(hnib < 10)
      008186 0D 0C            [ 1]  227 	tnz	(0x0c, sp)
      008188 27 05            [ 1]  228 	jreq	00102$
                                    229 ;	user/debug.c: 82: ascii[2] = hnib + '0';
      00818A 7B 0B            [ 1]  230 	ld	a, (0x0b, sp)
      00818C AB 30            [ 1]  231 	add	a, #0x30
      00818E F7               [ 1]  232 	ld	(x), a
      00818F                        233 00102$:
                                    234 ;	user/debug.c: 83: if(hnib >= 10)
      00818F 0D 0C            [ 1]  235 	tnz	(0x0c, sp)
      008191 26 05            [ 1]  236 	jrne	00104$
                                    237 ;	user/debug.c: 84: ascii[2] = (hnib - 10) + 'A';
      008193 7B 0B            [ 1]  238 	ld	a, (0x0b, sp)
      008195 AB 37            [ 1]  239 	add	a, #0x37
      008197 F7               [ 1]  240 	ld	(x), a
      008198                        241 00104$:
                                    242 ;	user/debug.c: 85: if(lnib < 10)
      008198 7B 01            [ 1]  243 	ld	a, (0x01, sp)
      00819A A1 0A            [ 1]  244 	cp	a, #0x0a
      00819C 4F               [ 1]  245 	clr	a
      00819D 49               [ 1]  246 	rlc	a
      00819E 6B 0A            [ 1]  247 	ld	(0x0a, sp), a
                                    248 ;	user/debug.c: 86: ascii[3] = lnib + '0';
      0081A0 1E 0D            [ 2]  249 	ldw	x, (0x0d, sp)
      0081A2 1C 00 03         [ 2]  250 	addw	x, #0x0003
      0081A5 7B 01            [ 1]  251 	ld	a, (0x01, sp)
      0081A7 6B 09            [ 1]  252 	ld	(0x09, sp), a
                                    253 ;	user/debug.c: 85: if(lnib < 10)
      0081A9 0D 0A            [ 1]  254 	tnz	(0x0a, sp)
      0081AB 27 05            [ 1]  255 	jreq	00106$
                                    256 ;	user/debug.c: 86: ascii[3] = lnib + '0';
      0081AD 7B 09            [ 1]  257 	ld	a, (0x09, sp)
      0081AF AB 30            [ 1]  258 	add	a, #0x30
      0081B1 F7               [ 1]  259 	ld	(x), a
      0081B2                        260 00106$:
                                    261 ;	user/debug.c: 87: if(lnib >= 10)
      0081B2 0D 0A            [ 1]  262 	tnz	(0x0a, sp)
      0081B4 26 05            [ 1]  263 	jrne	00108$
                                    264 ;	user/debug.c: 88: ascii[3] = (lnib - 10) + 'A';
      0081B6 7B 09            [ 1]  265 	ld	a, (0x09, sp)
      0081B8 AB 37            [ 1]  266 	add	a, #0x37
      0081BA F7               [ 1]  267 	ld	(x), a
      0081BB                        268 00108$:
                                    269 ;	user/debug.c: 89: usart_send(ascii);
      0081BB 1E 0D            [ 2]  270 	ldw	x, (0x0d, sp)
      0081BD 89               [ 2]  271 	pushw	x
      0081BE CD 80 EC         [ 4]  272 	call	_usart_send
      0081C1 85               [ 2]  273 	popw	x
                                    274 ;	user/debug.c: 72: for(add = 0; add < len; add++)
      0081C2 0C 02            [ 1]  275 	inc	(0x02, sp)
      0081C4 CC 81 3E         [ 2]  276 	jp	00111$
      0081C7                        277 00109$:
                                    278 ;	user/debug.c: 91: usart_send("\r\n");
      0081C7 AE 81 D1         [ 2]  279 	ldw	x, #___str_0+0
      0081CA 89               [ 2]  280 	pushw	x
      0081CB CD 80 EC         [ 4]  281 	call	_usart_send
      0081CE 5B 10            [ 2]  282 	addw	sp, #16
      0081D0 81               [ 4]  283 	ret
                                    284 	.area CODE
      0081D1                        285 ___str_0:
      0081D1 0D                     286 	.db 0x0d
      0081D2 0A                     287 	.db 0x0a
      0081D3 00                     288 	.db 0x00
                                    289 	.area INITIALIZER
                                    290 	.area CABS (ABS)
