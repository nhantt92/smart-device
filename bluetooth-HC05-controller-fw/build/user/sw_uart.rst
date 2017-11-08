                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.6.0 #9615 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module sw_uart
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _delaytest
                                     12 	.globl _Vcomdelay
                                     13 	.globl _GPIO_WriteLow
                                     14 	.globl _GPIO_WriteHigh
                                     15 	.globl _GPIO_Init
                                     16 	.globl _sprintf
                                     17 	.globl _DELAYTIME
                                     18 	.globl _vcomstr
                                     19 	.globl _VCOM_Init
                                     20 	.globl _VCOM_puts
                                     21 	.globl _VCOM_TestSpeed
                                     22 ;--------------------------------------------------------
                                     23 ; ram data
                                     24 ;--------------------------------------------------------
                                     25 	.area DATA
      000091                         26 _vcomstr::
      000091                         27 	.ds 30
                                     28 ;--------------------------------------------------------
                                     29 ; ram data
                                     30 ;--------------------------------------------------------
                                     31 	.area INITIALIZED
      0000BA                         32 _DELAYTIME::
      0000BA                         33 	.ds 2
                                     34 ;--------------------------------------------------------
                                     35 ; absolute external ram data
                                     36 ;--------------------------------------------------------
                                     37 	.area DABS (ABS)
                                     38 ;--------------------------------------------------------
                                     39 ; global & static initialisations
                                     40 ;--------------------------------------------------------
                                     41 	.area HOME
                                     42 	.area GSINIT
                                     43 	.area GSFINAL
                                     44 	.area GSINIT
                                     45 ;--------------------------------------------------------
                                     46 ; Home
                                     47 ;--------------------------------------------------------
                                     48 	.area HOME
                                     49 	.area HOME
                                     50 ;--------------------------------------------------------
                                     51 ; code
                                     52 ;--------------------------------------------------------
                                     53 	.area CODE
                                     54 ;	user/sw_uart.c: 15: void Vcomdelay(int dtime)
                                     55 ;	-----------------------------------------
                                     56 ;	 function Vcomdelay
                                     57 ;	-----------------------------------------
      00931E                         58 _Vcomdelay:
      00931E 1E 03            [ 2]   59 	ldw	x, (0x03, sp)
      009320                         60 00103$:
                                     61 ;	user/sw_uart.c: 18: for ( ; dtime >= 0; dtime--);
      009320 5D               [ 2]   62 	tnzw	x
      009321 2A 01            [ 1]   63 	jrpl	00116$
      009323 81               [ 4]   64 	ret
      009324                         65 00116$:
      009324 5A               [ 2]   66 	decw	x
      009325 20 F9            [ 2]   67 	jra	00103$
      009327 81               [ 4]   68 	ret
                                     69 ;	user/sw_uart.c: 21: void VCOM_Init(void)
                                     70 ;	-----------------------------------------
                                     71 ;	 function VCOM_Init
                                     72 ;	-----------------------------------------
      009328                         73 _VCOM_Init:
                                     74 ;	user/sw_uart.c: 23: GPIO_Init(vTxGPIO, vTxPIN, GPIO_MODE_OUT_PP_HIGH_FAST);
      009328 4B F0            [ 1]   75 	push	#0xf0
      00932A 4B 20            [ 1]   76 	push	#0x20
      00932C 4B 0F            [ 1]   77 	push	#0x0f
      00932E 4B 50            [ 1]   78 	push	#0x50
      009330 CD 98 0F         [ 4]   79 	call	_GPIO_Init
      009333 5B 04            [ 2]   80 	addw	sp, #4
                                     81 ;	user/sw_uart.c: 24: vTx_H();
      009335 4B 20            [ 1]   82 	push	#0x20
      009337 4B 0F            [ 1]   83 	push	#0x0f
      009339 4B 50            [ 1]   84 	push	#0x50
      00933B CD 98 A3         [ 4]   85 	call	_GPIO_WriteHigh
      00933E 5B 03            [ 2]   86 	addw	sp, #3
      009340 81               [ 4]   87 	ret
                                     88 ;	user/sw_uart.c: 28: void VCOM_puts(char *str)
                                     89 ;	-----------------------------------------
                                     90 ;	 function VCOM_puts
                                     91 ;	-----------------------------------------
      009341                         92 _VCOM_puts:
      009341 52 05            [ 2]   93 	sub	sp, #5
                                     94 ;	user/sw_uart.c: 32: disableInterrupts();
      009343 9B               [ 1]   95 	sim
                                     96 ;	user/sw_uart.c: 33: while ((c=*str) && maxlen--)
      009344 AE 00 FF         [ 2]   97 	ldw	x, #0x00ff
      009347 1F 01            [ 2]   98 	ldw	(0x01, sp), x
      009349 16 08            [ 2]   99 	ldw	y, (0x08, sp)
      00934B 17 04            [ 2]  100 	ldw	(0x04, sp), y
      00934D                        101 00126$:
      00934D 1E 04            [ 2]  102 	ldw	x, (0x04, sp)
      00934F F6               [ 1]  103 	ld	a, (x)
      009350 6B 03            [ 1]  104 	ld	(0x03, sp), a
      009352 4D               [ 1]  105 	tnz	a
      009353 26 03            [ 1]  106 	jrne	00176$
      009355 CC 94 C2         [ 2]  107 	jp	00128$
      009358                        108 00176$:
      009358 1E 01            [ 2]  109 	ldw	x, (0x01, sp)
      00935A 16 01            [ 2]  110 	ldw	y, (0x01, sp)
      00935C 90 5A            [ 2]  111 	decw	y
      00935E 17 01            [ 2]  112 	ldw	(0x01, sp), y
      009360 5D               [ 2]  113 	tnzw	x
      009361 26 03            [ 1]  114 	jrne	00177$
      009363 CC 94 C2         [ 2]  115 	jp	00128$
      009366                        116 00177$:
                                    117 ;	user/sw_uart.c: 35: vTx_L();                                              // start bit
      009366 4B 20            [ 1]  118 	push	#0x20
      009368 4B 0F            [ 1]  119 	push	#0x0f
      00936A 4B 50            [ 1]  120 	push	#0x50
      00936C CD 98 AA         [ 4]  121 	call	_GPIO_WriteLow
      00936F 5B 03            [ 2]  122 	addw	sp, #3
                                    123 ;	user/sw_uart.c: 36: Vcomdelay(DELAYTIME);          
      009371 CE 00 BA         [ 2]  124 	ldw	x, _DELAYTIME+0
      009374 89               [ 2]  125 	pushw	x
      009375 CD 93 1E         [ 4]  126 	call	_Vcomdelay
      009378 85               [ 2]  127 	popw	x
                                    128 ;	user/sw_uart.c: 37: if (c&0x01) vTx_H(); else vTx_L();   Vcomdelay(DELAYTIME); 
      009379 7B 03            [ 1]  129 	ld	a, (0x03, sp)
      00937B 44               [ 1]  130 	srl	a
      00937C 24 0D            [ 1]  131 	jrnc	00102$
      00937E 4B 20            [ 1]  132 	push	#0x20
      009380 4B 0F            [ 1]  133 	push	#0x0f
      009382 4B 50            [ 1]  134 	push	#0x50
      009384 CD 98 A3         [ 4]  135 	call	_GPIO_WriteHigh
      009387 5B 03            [ 2]  136 	addw	sp, #3
      009389 20 0B            [ 2]  137 	jra	00103$
      00938B                        138 00102$:
      00938B 4B 20            [ 1]  139 	push	#0x20
      00938D 4B 0F            [ 1]  140 	push	#0x0f
      00938F 4B 50            [ 1]  141 	push	#0x50
      009391 CD 98 AA         [ 4]  142 	call	_GPIO_WriteLow
      009394 5B 03            [ 2]  143 	addw	sp, #3
      009396                        144 00103$:
      009396 CE 00 BA         [ 2]  145 	ldw	x, _DELAYTIME+0
      009399 89               [ 2]  146 	pushw	x
      00939A CD 93 1E         [ 4]  147 	call	_Vcomdelay
      00939D 85               [ 2]  148 	popw	x
                                    149 ;	user/sw_uart.c: 38: if (c&0x02) vTx_H(); else vTx_L();   Vcomdelay(DELAYTIME);
      00939E 7B 03            [ 1]  150 	ld	a, (0x03, sp)
      0093A0 A5 02            [ 1]  151 	bcp	a, #0x02
      0093A2 27 0D            [ 1]  152 	jreq	00105$
      0093A4 4B 20            [ 1]  153 	push	#0x20
      0093A6 4B 0F            [ 1]  154 	push	#0x0f
      0093A8 4B 50            [ 1]  155 	push	#0x50
      0093AA CD 98 A3         [ 4]  156 	call	_GPIO_WriteHigh
      0093AD 5B 03            [ 2]  157 	addw	sp, #3
      0093AF 20 0B            [ 2]  158 	jra	00106$
      0093B1                        159 00105$:
      0093B1 4B 20            [ 1]  160 	push	#0x20
      0093B3 4B 0F            [ 1]  161 	push	#0x0f
      0093B5 4B 50            [ 1]  162 	push	#0x50
      0093B7 CD 98 AA         [ 4]  163 	call	_GPIO_WriteLow
      0093BA 5B 03            [ 2]  164 	addw	sp, #3
      0093BC                        165 00106$:
      0093BC CE 00 BA         [ 2]  166 	ldw	x, _DELAYTIME+0
      0093BF 89               [ 2]  167 	pushw	x
      0093C0 CD 93 1E         [ 4]  168 	call	_Vcomdelay
      0093C3 85               [ 2]  169 	popw	x
                                    170 ;	user/sw_uart.c: 39: if (c&0x04) vTx_H(); else vTx_L();   Vcomdelay(DELAYTIME);
      0093C4 7B 03            [ 1]  171 	ld	a, (0x03, sp)
      0093C6 A5 04            [ 1]  172 	bcp	a, #0x04
      0093C8 27 0D            [ 1]  173 	jreq	00108$
      0093CA 4B 20            [ 1]  174 	push	#0x20
      0093CC 4B 0F            [ 1]  175 	push	#0x0f
      0093CE 4B 50            [ 1]  176 	push	#0x50
      0093D0 CD 98 A3         [ 4]  177 	call	_GPIO_WriteHigh
      0093D3 5B 03            [ 2]  178 	addw	sp, #3
      0093D5 20 0B            [ 2]  179 	jra	00109$
      0093D7                        180 00108$:
      0093D7 4B 20            [ 1]  181 	push	#0x20
      0093D9 4B 0F            [ 1]  182 	push	#0x0f
      0093DB 4B 50            [ 1]  183 	push	#0x50
      0093DD CD 98 AA         [ 4]  184 	call	_GPIO_WriteLow
      0093E0 5B 03            [ 2]  185 	addw	sp, #3
      0093E2                        186 00109$:
      0093E2 CE 00 BA         [ 2]  187 	ldw	x, _DELAYTIME+0
      0093E5 89               [ 2]  188 	pushw	x
      0093E6 CD 93 1E         [ 4]  189 	call	_Vcomdelay
      0093E9 85               [ 2]  190 	popw	x
                                    191 ;	user/sw_uart.c: 40: if (c&0x08) vTx_H(); else vTx_L();   Vcomdelay(DELAYTIME);
      0093EA 7B 03            [ 1]  192 	ld	a, (0x03, sp)
      0093EC A5 08            [ 1]  193 	bcp	a, #0x08
      0093EE 27 0D            [ 1]  194 	jreq	00111$
      0093F0 4B 20            [ 1]  195 	push	#0x20
      0093F2 4B 0F            [ 1]  196 	push	#0x0f
      0093F4 4B 50            [ 1]  197 	push	#0x50
      0093F6 CD 98 A3         [ 4]  198 	call	_GPIO_WriteHigh
      0093F9 5B 03            [ 2]  199 	addw	sp, #3
      0093FB 20 0B            [ 2]  200 	jra	00112$
      0093FD                        201 00111$:
      0093FD 4B 20            [ 1]  202 	push	#0x20
      0093FF 4B 0F            [ 1]  203 	push	#0x0f
      009401 4B 50            [ 1]  204 	push	#0x50
      009403 CD 98 AA         [ 4]  205 	call	_GPIO_WriteLow
      009406 5B 03            [ 2]  206 	addw	sp, #3
      009408                        207 00112$:
      009408 CE 00 BA         [ 2]  208 	ldw	x, _DELAYTIME+0
      00940B 89               [ 2]  209 	pushw	x
      00940C CD 93 1E         [ 4]  210 	call	_Vcomdelay
      00940F 85               [ 2]  211 	popw	x
                                    212 ;	user/sw_uart.c: 41: if (c&0x10) vTx_H(); else vTx_L();   Vcomdelay(DELAYTIME);
      009410 7B 03            [ 1]  213 	ld	a, (0x03, sp)
      009412 A5 10            [ 1]  214 	bcp	a, #0x10
      009414 27 0D            [ 1]  215 	jreq	00114$
      009416 4B 20            [ 1]  216 	push	#0x20
      009418 4B 0F            [ 1]  217 	push	#0x0f
      00941A 4B 50            [ 1]  218 	push	#0x50
      00941C CD 98 A3         [ 4]  219 	call	_GPIO_WriteHigh
      00941F 5B 03            [ 2]  220 	addw	sp, #3
      009421 20 0B            [ 2]  221 	jra	00115$
      009423                        222 00114$:
      009423 4B 20            [ 1]  223 	push	#0x20
      009425 4B 0F            [ 1]  224 	push	#0x0f
      009427 4B 50            [ 1]  225 	push	#0x50
      009429 CD 98 AA         [ 4]  226 	call	_GPIO_WriteLow
      00942C 5B 03            [ 2]  227 	addw	sp, #3
      00942E                        228 00115$:
      00942E CE 00 BA         [ 2]  229 	ldw	x, _DELAYTIME+0
      009431 89               [ 2]  230 	pushw	x
      009432 CD 93 1E         [ 4]  231 	call	_Vcomdelay
      009435 85               [ 2]  232 	popw	x
                                    233 ;	user/sw_uart.c: 42: if (c&0x20) vTx_H(); else vTx_L();   Vcomdelay(DELAYTIME);
      009436 7B 03            [ 1]  234 	ld	a, (0x03, sp)
      009438 A5 20            [ 1]  235 	bcp	a, #0x20
      00943A 27 0D            [ 1]  236 	jreq	00117$
      00943C 4B 20            [ 1]  237 	push	#0x20
      00943E 4B 0F            [ 1]  238 	push	#0x0f
      009440 4B 50            [ 1]  239 	push	#0x50
      009442 CD 98 A3         [ 4]  240 	call	_GPIO_WriteHigh
      009445 5B 03            [ 2]  241 	addw	sp, #3
      009447 20 0B            [ 2]  242 	jra	00118$
      009449                        243 00117$:
      009449 4B 20            [ 1]  244 	push	#0x20
      00944B 4B 0F            [ 1]  245 	push	#0x0f
      00944D 4B 50            [ 1]  246 	push	#0x50
      00944F CD 98 AA         [ 4]  247 	call	_GPIO_WriteLow
      009452 5B 03            [ 2]  248 	addw	sp, #3
      009454                        249 00118$:
      009454 CE 00 BA         [ 2]  250 	ldw	x, _DELAYTIME+0
      009457 89               [ 2]  251 	pushw	x
      009458 CD 93 1E         [ 4]  252 	call	_Vcomdelay
      00945B 85               [ 2]  253 	popw	x
                                    254 ;	user/sw_uart.c: 43: if (c&0x40) vTx_H(); else vTx_L();   Vcomdelay(DELAYTIME);
      00945C 7B 03            [ 1]  255 	ld	a, (0x03, sp)
      00945E A5 40            [ 1]  256 	bcp	a, #0x40
      009460 27 0D            [ 1]  257 	jreq	00120$
      009462 4B 20            [ 1]  258 	push	#0x20
      009464 4B 0F            [ 1]  259 	push	#0x0f
      009466 4B 50            [ 1]  260 	push	#0x50
      009468 CD 98 A3         [ 4]  261 	call	_GPIO_WriteHigh
      00946B 5B 03            [ 2]  262 	addw	sp, #3
      00946D 20 0B            [ 2]  263 	jra	00121$
      00946F                        264 00120$:
      00946F 4B 20            [ 1]  265 	push	#0x20
      009471 4B 0F            [ 1]  266 	push	#0x0f
      009473 4B 50            [ 1]  267 	push	#0x50
      009475 CD 98 AA         [ 4]  268 	call	_GPIO_WriteLow
      009478 5B 03            [ 2]  269 	addw	sp, #3
      00947A                        270 00121$:
      00947A CE 00 BA         [ 2]  271 	ldw	x, _DELAYTIME+0
      00947D 89               [ 2]  272 	pushw	x
      00947E CD 93 1E         [ 4]  273 	call	_Vcomdelay
      009481 85               [ 2]  274 	popw	x
                                    275 ;	user/sw_uart.c: 44: if (c&0x80) vTx_H(); else vTx_L();   Vcomdelay(DELAYTIME);
      009482 0D 03            [ 1]  276 	tnz	(0x03, sp)
      009484 2A 0D            [ 1]  277 	jrpl	00123$
      009486 4B 20            [ 1]  278 	push	#0x20
      009488 4B 0F            [ 1]  279 	push	#0x0f
      00948A 4B 50            [ 1]  280 	push	#0x50
      00948C CD 98 A3         [ 4]  281 	call	_GPIO_WriteHigh
      00948F 5B 03            [ 2]  282 	addw	sp, #3
      009491 20 0B            [ 2]  283 	jra	00124$
      009493                        284 00123$:
      009493 4B 20            [ 1]  285 	push	#0x20
      009495 4B 0F            [ 1]  286 	push	#0x0f
      009497 4B 50            [ 1]  287 	push	#0x50
      009499 CD 98 AA         [ 4]  288 	call	_GPIO_WriteLow
      00949C 5B 03            [ 2]  289 	addw	sp, #3
      00949E                        290 00124$:
      00949E CE 00 BA         [ 2]  291 	ldw	x, _DELAYTIME+0
      0094A1 89               [ 2]  292 	pushw	x
      0094A2 CD 93 1E         [ 4]  293 	call	_Vcomdelay
      0094A5 85               [ 2]  294 	popw	x
                                    295 ;	user/sw_uart.c: 45: vTx_H();                                             // stop bit    (1.5bit for sure)
      0094A6 4B 20            [ 1]  296 	push	#0x20
      0094A8 4B 0F            [ 1]  297 	push	#0x0f
      0094AA 4B 50            [ 1]  298 	push	#0x50
      0094AC CD 98 A3         [ 4]  299 	call	_GPIO_WriteHigh
      0094AF 5B 03            [ 2]  300 	addw	sp, #3
                                    301 ;	user/sw_uart.c: 46: Vcomdelay(DELAYTIME<<1);             
      0094B1 CE 00 BA         [ 2]  302 	ldw	x, _DELAYTIME+0
      0094B4 58               [ 2]  303 	sllw	x
      0094B5 89               [ 2]  304 	pushw	x
      0094B6 CD 93 1E         [ 4]  305 	call	_Vcomdelay
      0094B9 85               [ 2]  306 	popw	x
                                    307 ;	user/sw_uart.c: 47: str++;
      0094BA 1E 04            [ 2]  308 	ldw	x, (0x04, sp)
      0094BC 5C               [ 2]  309 	incw	x
      0094BD 1F 04            [ 2]  310 	ldw	(0x04, sp), x
      0094BF CC 93 4D         [ 2]  311 	jp	00126$
      0094C2                        312 00128$:
                                    313 ;	user/sw_uart.c: 49: enableInterrupts();
      0094C2 9A               [ 1]  314 	rim
      0094C3 5B 05            [ 2]  315 	addw	sp, #5
      0094C5 81               [ 4]  316 	ret
                                    317 ;	user/sw_uart.c: 52: void delaytest(uint32_t x)
                                    318 ;	-----------------------------------------
                                    319 ;	 function delaytest
                                    320 ;	-----------------------------------------
      0094C6                        321 _delaytest:
      0094C6 52 10            [ 2]  322 	sub	sp, #16
                                    323 ;	user/sw_uart.c: 55: while(x--)
      0094C8 16 13            [ 2]  324 	ldw	y, (0x13, sp)
      0094CA 17 05            [ 2]  325 	ldw	(0x05, sp), y
      0094CC 16 15            [ 2]  326 	ldw	y, (0x15, sp)
      0094CE                        327 00102$:
      0094CE 17 0F            [ 2]  328 	ldw	(0x0f, sp), y
      0094D0 1E 05            [ 2]  329 	ldw	x, (0x05, sp)
      0094D2 1F 0D            [ 2]  330 	ldw	(0x0d, sp), x
      0094D4 72 A2 00 01      [ 2]  331 	subw	y, #0x0001
      0094D8 7B 06            [ 1]  332 	ld	a, (0x06, sp)
      0094DA A2 00            [ 1]  333 	sbc	a, #0x00
      0094DC 6B 06            [ 1]  334 	ld	(0x06, sp), a
      0094DE 7B 05            [ 1]  335 	ld	a, (0x05, sp)
      0094E0 A2 00            [ 1]  336 	sbc	a, #0x00
      0094E2 6B 05            [ 1]  337 	ld	(0x05, sp), a
      0094E4 1E 0F            [ 2]  338 	ldw	x, (0x0f, sp)
      0094E6 26 04            [ 1]  339 	jrne	00126$
      0094E8 1E 0D            [ 2]  340 	ldw	x, (0x0d, sp)
      0094EA 27 34            [ 1]  341 	jreq	00108$
      0094EC                        342 00126$:
      0094EC 1E 03            [ 2]  343 	ldw	x, (0x03, sp)
      0094EE 1F 0B            [ 2]  344 	ldw	(0x0b, sp), x
      0094F0 1E 01            [ 2]  345 	ldw	x, (0x01, sp)
      0094F2 1F 09            [ 2]  346 	ldw	(0x09, sp), x
      0094F4                        347 00106$:
                                    348 ;	user/sw_uart.c: 57: for(;i<3000;i++);
      0094F4 1E 0B            [ 2]  349 	ldw	x, (0x0b, sp)
      0094F6 A3 0B B8         [ 2]  350 	cpw	x, #0x0bb8
      0094F9 7B 0A            [ 1]  351 	ld	a, (0x0a, sp)
      0094FB A2 00            [ 1]  352 	sbc	a, #0x00
      0094FD 7B 09            [ 1]  353 	ld	a, (0x09, sp)
      0094FF A2 00            [ 1]  354 	sbc	a, #0x00
      009501 24 CB            [ 1]  355 	jrnc	00102$
      009503 1E 0B            [ 2]  356 	ldw	x, (0x0b, sp)
      009505 1C 00 01         [ 2]  357 	addw	x, #0x0001
      009508 1F 0B            [ 2]  358 	ldw	(0x0b, sp), x
      00950A 7B 0A            [ 1]  359 	ld	a, (0x0a, sp)
      00950C A9 00            [ 1]  360 	adc	a, #0x00
      00950E 6B 0A            [ 1]  361 	ld	(0x0a, sp), a
      009510 7B 09            [ 1]  362 	ld	a, (0x09, sp)
      009512 A9 00            [ 1]  363 	adc	a, #0x00
      009514 6B 09            [ 1]  364 	ld	(0x09, sp), a
      009516 1E 0B            [ 2]  365 	ldw	x, (0x0b, sp)
      009518 1F 03            [ 2]  366 	ldw	(0x03, sp), x
      00951A 1E 09            [ 2]  367 	ldw	x, (0x09, sp)
      00951C 1F 01            [ 2]  368 	ldw	(0x01, sp), x
      00951E 20 D4            [ 2]  369 	jra	00106$
      009520                        370 00108$:
      009520 5B 10            [ 2]  371 	addw	sp, #16
      009522 81               [ 4]  372 	ret
                                    373 ;	user/sw_uart.c: 61: void VCOM_TestSpeed(void)
                                    374 ;	-----------------------------------------
                                    375 ;	 function VCOM_TestSpeed
                                    376 ;	-----------------------------------------
      009523                        377 _VCOM_TestSpeed:
      009523 52 08            [ 2]  378 	sub	sp, #8
                                    379 ;	user/sw_uart.c: 66: for(i=250;i>=1;i--)
      009525                        380 00109$:
      009525 AE 95 8D         [ 2]  381 	ldw	x, #___str_0+0
      009528 1F 07            [ 2]  382 	ldw	(0x07, sp), x
      00952A AE 00 91         [ 2]  383 	ldw	x, #_vcomstr+0
      00952D 1F 03            [ 2]  384 	ldw	(0x03, sp), x
      00952F 16 03            [ 2]  385 	ldw	y, (0x03, sp)
      009531 17 05            [ 2]  386 	ldw	(0x05, sp), y
      009533 AE 00 FA         [ 2]  387 	ldw	x, #0x00fa
      009536 1F 01            [ 2]  388 	ldw	(0x01, sp), x
      009538                        389 00105$:
                                    390 ;	user/sw_uart.c: 68: DELAYTIME = i;  
      009538 7B 02            [ 1]  391 	ld	a, (0x02, sp)
      00953A C7 00 BB         [ 1]  392 	ld	_DELAYTIME+1, a
      00953D 7B 01            [ 1]  393 	ld	a, (0x01, sp)
      00953F C7 00 BA         [ 1]  394 	ld	_DELAYTIME+0, a
                                    395 ;	user/sw_uart.c: 69: vTx_H();
      009542 4B 20            [ 1]  396 	push	#0x20
      009544 4B 0F            [ 1]  397 	push	#0x0f
      009546 4B 50            [ 1]  398 	push	#0x50
      009548 CD 98 A3         [ 4]  399 	call	_GPIO_WriteHigh
      00954B 5B 03            [ 2]  400 	addw	sp, #3
                                    401 ;	user/sw_uart.c: 70: delaytest(10000); 
      00954D 4B 10            [ 1]  402 	push	#0x10
      00954F 4B 27            [ 1]  403 	push	#0x27
      009551 5F               [ 1]  404 	clrw	x
      009552 89               [ 2]  405 	pushw	x
      009553 CD 94 C6         [ 4]  406 	call	_delaytest
      009556 5B 04            [ 2]  407 	addw	sp, #4
                                    408 ;	user/sw_uart.c: 71: VCOM_sprintf(vcomstr,"VCOM at %d TESTING SPEED\r\n",i);
      009558 16 07            [ 2]  409 	ldw	y, (0x07, sp)
      00955A 1E 03            [ 2]  410 	ldw	x, (0x03, sp)
      00955C 7B 02            [ 1]  411 	ld	a, (0x02, sp)
      00955E 88               [ 1]  412 	push	a
      00955F 7B 02            [ 1]  413 	ld	a, (0x02, sp)
      009561 88               [ 1]  414 	push	a
      009562 90 89            [ 2]  415 	pushw	y
      009564 89               [ 2]  416 	pushw	x
      009565 CD 9F B9         [ 4]  417 	call	_sprintf
      009568 5B 06            [ 2]  418 	addw	sp, #6
                                    419 ;	user/sw_uart.c: 72: VCOM_puts(vcomstr); 
      00956A 1E 05            [ 2]  420 	ldw	x, (0x05, sp)
      00956C 89               [ 2]  421 	pushw	x
      00956D CD 93 41         [ 4]  422 	call	_VCOM_puts
      009570 85               [ 2]  423 	popw	x
                                    424 ;	user/sw_uart.c: 73: vTx_L(); 
      009571 4B 20            [ 1]  425 	push	#0x20
      009573 4B 0F            [ 1]  426 	push	#0x0f
      009575 4B 50            [ 1]  427 	push	#0x50
      009577 CD 98 AA         [ 4]  428 	call	_GPIO_WriteLow
      00957A 5B 03            [ 2]  429 	addw	sp, #3
                                    430 ;	user/sw_uart.c: 66: for(i=250;i>=1;i--)
      00957C 1E 01            [ 2]  431 	ldw	x, (0x01, sp)
      00957E 5A               [ 2]  432 	decw	x
      00957F 1F 01            [ 2]  433 	ldw	(0x01, sp), x
      009581 1E 01            [ 2]  434 	ldw	x, (0x01, sp)
      009583 A3 00 01         [ 2]  435 	cpw	x, #0x0001
      009586 2E B0            [ 1]  436 	jrsge	00105$
      009588 20 9B            [ 2]  437 	jra	00109$
      00958A 5B 08            [ 2]  438 	addw	sp, #8
      00958C 81               [ 4]  439 	ret
                                    440 	.area CODE
      00958D                        441 ___str_0:
      00958D 56 43 4F 4D 20 61 74   442 	.ascii "VCOM at %d TESTING SPEED"
             20 25 64 20 54 45 53
             54 49 4E 47 20 53 50
             45 45 44
      0095A5 0D                     443 	.db 0x0d
      0095A6 0A                     444 	.db 0x0a
      0095A7 00                     445 	.db 0x00
                                    446 	.area INITIALIZER
      00A885                        447 __xinit__DELAYTIME:
      00A885 00 E6                  448 	.dw #0x00e6
                                    449 	.area CABS (ABS)
