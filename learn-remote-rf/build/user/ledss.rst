                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.6.0 #9615 (Mac OS X x86_64)
                                      4 ;--------------------------------------------------------
                                      5 	.module ledss
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _TIMER_CheckTimeMS
                                     12 	.globl _TIMER_InitTime
                                     13 	.globl _GPIO_WriteLow
                                     14 	.globl _GPIO_WriteHigh
                                     15 	.globl _GPIO_Init
                                     16 	.globl _led
                                     17 	.globl _led_change
                                     18 	.globl _led_getstatus
                                     19 	.globl _ledstt_init
                                     20 	.globl _ledstt_manager
                                     21 ;--------------------------------------------------------
                                     22 ; ram data
                                     23 ;--------------------------------------------------------
                                     24 	.area DATA
      00000C                         25 _led::
      00000C                         26 	.ds 9
                                     27 ;--------------------------------------------------------
                                     28 ; ram data
                                     29 ;--------------------------------------------------------
                                     30 	.area INITIALIZED
                                     31 ;--------------------------------------------------------
                                     32 ; absolute external ram data
                                     33 ;--------------------------------------------------------
                                     34 	.area DABS (ABS)
                                     35 ;--------------------------------------------------------
                                     36 ; global & static initialisations
                                     37 ;--------------------------------------------------------
                                     38 	.area HOME
                                     39 	.area GSINIT
                                     40 	.area GSFINAL
                                     41 	.area GSINIT
                                     42 ;--------------------------------------------------------
                                     43 ; Home
                                     44 ;--------------------------------------------------------
                                     45 	.area HOME
                                     46 	.area HOME
                                     47 ;--------------------------------------------------------
                                     48 ; code
                                     49 ;--------------------------------------------------------
                                     50 	.area CODE
                                     51 ;	user/ledss.c: 4: void led_change(uint8_t mode, uint8_t time)
                                     52 ;	-----------------------------------------
                                     53 ;	 function led_change
                                     54 ;	-----------------------------------------
      00831F                         55 _led_change:
      00831F 89               [ 2]   56 	pushw	x
                                     57 ;	user/ledss.c: 6: led.mode = mode;
      008320 AE 00 0C         [ 2]   58 	ldw	x, #_led+0
      008323 1F 01            [ 2]   59 	ldw	(0x01, sp), x
      008325 1E 01            [ 2]   60 	ldw	x, (0x01, sp)
      008327 7B 05            [ 1]   61 	ld	a, (0x05, sp)
      008329 E7 06            [ 1]   62 	ld	(0x0006, x), a
                                     63 ;	user/ledss.c: 7: led.timeOn = time;
      00832B 1E 01            [ 2]   64 	ldw	x, (0x01, sp)
      00832D 7B 06            [ 1]   65 	ld	a, (0x06, sp)
      00832F E7 07            [ 1]   66 	ld	(0x0007, x), a
      008331 85               [ 2]   67 	popw	x
      008332 81               [ 4]   68 	ret
                                     69 ;	user/ledss.c: 10: uint8_t led_getstatus(void)
                                     70 ;	-----------------------------------------
                                     71 ;	 function led_getstatus
                                     72 ;	-----------------------------------------
      008333                         73 _led_getstatus:
                                     74 ;	user/ledss.c: 12: return led.mode;
      008333 AE 00 12         [ 2]   75 	ldw	x, #_led+6
      008336 F6               [ 1]   76 	ld	a, (x)
      008337 81               [ 4]   77 	ret
                                     78 ;	user/ledss.c: 15: void ledstt_init(void)
                                     79 ;	-----------------------------------------
                                     80 ;	 function ledstt_init
                                     81 ;	-----------------------------------------
      008338                         82 _ledstt_init:
      008338 89               [ 2]   83 	pushw	x
                                     84 ;	user/ledss.c: 17: led.mode = LED_OFF;
      008339 AE 00 0C         [ 2]   85 	ldw	x, #_led+0
      00833C 1F 01            [ 2]   86 	ldw	(0x01, sp), x
      00833E 1E 01            [ 2]   87 	ldw	x, (0x01, sp)
      008340 1C 00 06         [ 2]   88 	addw	x, #0x0006
      008343 7F               [ 1]   89 	clr	(x)
                                     90 ;	user/ledss.c: 18: led.timeOn = 0;
      008344 1E 01            [ 2]   91 	ldw	x, (0x01, sp)
      008346 1C 00 07         [ 2]   92 	addw	x, #0x0007
      008349 7F               [ 1]   93 	clr	(x)
                                     94 ;	user/ledss.c: 19: led.cycle = 0;
      00834A 1E 01            [ 2]   95 	ldw	x, (0x01, sp)
      00834C 1C 00 08         [ 2]   96 	addw	x, #0x0008
      00834F 7F               [ 1]   97 	clr	(x)
                                     98 ;	user/ledss.c: 20: GPIO_Init(PORT_LED, PIN_LED, GPIO_MODE_OUT_PP_HIGH_FAST);
      008350 4B F0            [ 1]   99 	push	#0xf0
      008352 4B 10            [ 1]  100 	push	#0x10
      008354 4B 0A            [ 1]  101 	push	#0x0a
      008356 4B 50            [ 1]  102 	push	#0x50
      008358 CD 8F 3C         [ 4]  103 	call	_GPIO_Init
      00835B 5B 04            [ 2]  104 	addw	sp, #4
                                    105 ;	user/ledss.c: 21: TIMER_InitTime(&led.tick);
      00835D 1E 01            [ 2]  106 	ldw	x, (0x01, sp)
      00835F 89               [ 2]  107 	pushw	x
      008360 CD 8C A3         [ 4]  108 	call	_TIMER_InitTime
      008363 85               [ 2]  109 	popw	x
                                    110 ;	user/ledss.c: 22: led_change(LED_FLASH, 10);
      008364 4B 0A            [ 1]  111 	push	#0x0a
      008366 4B 02            [ 1]  112 	push	#0x02
      008368 CD 83 1F         [ 4]  113 	call	_led_change
      00836B 5B 04            [ 2]  114 	addw	sp, #4
      00836D 81               [ 4]  115 	ret
                                    116 ;	user/ledss.c: 25: void ledstt_manager(void)
                                    117 ;	-----------------------------------------
                                    118 ;	 function ledstt_manager
                                    119 ;	-----------------------------------------
      00836E                        120 _ledstt_manager:
      00836E 89               [ 2]  121 	pushw	x
                                    122 ;	user/ledss.c: 27: if(!TIMER_CheckTimeMS(&led.tick, 200))
      00836F AE 00 0C         [ 2]  123 	ldw	x, #_led+0
      008372 4B C8            [ 1]  124 	push	#0xc8
      008374 4B 00            [ 1]  125 	push	#0x00
      008376 4B 00            [ 1]  126 	push	#0x00
      008378 4B 00            [ 1]  127 	push	#0x00
      00837A 89               [ 2]  128 	pushw	x
      00837B CD 8C FA         [ 4]  129 	call	_TIMER_CheckTimeMS
      00837E 5B 06            [ 2]  130 	addw	sp, #6
      008380 4D               [ 1]  131 	tnz	a
      008381 26 62            [ 1]  132 	jrne	00115$
                                    133 ;	user/ledss.c: 29: if(led.mode == LED_ON)
      008383 AE 00 0C         [ 2]  134 	ldw	x, #_led+0
      008386 1F 01            [ 2]  135 	ldw	(0x01, sp), x
      008388 1E 01            [ 2]  136 	ldw	x, (0x01, sp)
      00838A 1C 00 06         [ 2]  137 	addw	x, #0x0006
      00838D F6               [ 1]  138 	ld	a, (x)
      00838E A1 01            [ 1]  139 	cp	a, #0x01
      008390 26 0D            [ 1]  140 	jrne	00111$
                                    141 ;	user/ledss.c: 30: GPIO_WriteLow(PORT_LED, PIN_LED);
      008392 4B 10            [ 1]  142 	push	#0x10
      008394 4B 0A            [ 1]  143 	push	#0x0a
      008396 4B 50            [ 1]  144 	push	#0x50
      008398 CD 8F C1         [ 4]  145 	call	_GPIO_WriteLow
      00839B 5B 03            [ 2]  146 	addw	sp, #3
      00839D 20 46            [ 2]  147 	jra	00115$
      00839F                        148 00111$:
                                    149 ;	user/ledss.c: 31: else if(led.mode == LED_OFF)
      00839F 4D               [ 1]  150 	tnz	a
      0083A0 26 0D            [ 1]  151 	jrne	00108$
                                    152 ;	user/ledss.c: 32: GPIO_WriteHigh(PORT_LED, PIN_LED);
      0083A2 4B 10            [ 1]  153 	push	#0x10
      0083A4 4B 0A            [ 1]  154 	push	#0x0a
      0083A6 4B 50            [ 1]  155 	push	#0x50
      0083A8 CD 8F BA         [ 4]  156 	call	_GPIO_WriteHigh
      0083AB 5B 03            [ 2]  157 	addw	sp, #3
      0083AD 20 36            [ 2]  158 	jra	00115$
      0083AF                        159 00108$:
                                    160 ;	user/ledss.c: 35: if(led.timeOn != 0)
      0083AF 16 01            [ 2]  161 	ldw	y, (0x01, sp)
      0083B1 72 A9 00 07      [ 2]  162 	addw	y, #0x0007
      0083B5 90 F6            [ 1]  163 	ld	a, (y)
      0083B7 4D               [ 1]  164 	tnz	a
      0083B8 27 2A            [ 1]  165 	jreq	00105$
                                    166 ;	user/ledss.c: 37: led.timeOn--;
      0083BA 4A               [ 1]  167 	dec	a
      0083BB 90 F7            [ 1]  168 	ld	(y), a
                                    169 ;	user/ledss.c: 38: if(led.cycle == 0)
      0083BD 1E 01            [ 2]  170 	ldw	x, (0x01, sp)
      0083BF 1C 00 08         [ 2]  171 	addw	x, #0x0008
      0083C2 F6               [ 1]  172 	ld	a, (x)
      0083C3 4D               [ 1]  173 	tnz	a
      0083C4 26 10            [ 1]  174 	jrne	00102$
                                    175 ;	user/ledss.c: 40: led.cycle = 1;
      0083C6 A6 01            [ 1]  176 	ld	a, #0x01
      0083C8 F7               [ 1]  177 	ld	(x), a
                                    178 ;	user/ledss.c: 41: GPIO_WriteLow(PORT_LED, PIN_LED);
      0083C9 4B 10            [ 1]  179 	push	#0x10
      0083CB 4B 0A            [ 1]  180 	push	#0x0a
      0083CD 4B 50            [ 1]  181 	push	#0x50
      0083CF CD 8F C1         [ 4]  182 	call	_GPIO_WriteLow
      0083D2 5B 03            [ 2]  183 	addw	sp, #3
      0083D4 20 0F            [ 2]  184 	jra	00115$
      0083D6                        185 00102$:
                                    186 ;	user/ledss.c: 45: led.cycle = 0;
      0083D6 7F               [ 1]  187 	clr	(x)
                                    188 ;	user/ledss.c: 46: GPIO_WriteHigh(PORT_LED, PIN_LED);
      0083D7 4B 10            [ 1]  189 	push	#0x10
      0083D9 4B 0A            [ 1]  190 	push	#0x0a
      0083DB 4B 50            [ 1]  191 	push	#0x50
      0083DD CD 8F BA         [ 4]  192 	call	_GPIO_WriteHigh
      0083E0 5B 03            [ 2]  193 	addw	sp, #3
      0083E2 20 01            [ 2]  194 	jra	00115$
      0083E4                        195 00105$:
                                    196 ;	user/ledss.c: 50: led.mode = LED_OFF;
      0083E4 7F               [ 1]  197 	clr	(x)
      0083E5                        198 00115$:
      0083E5 85               [ 2]  199 	popw	x
      0083E6 81               [ 4]  200 	ret
                                    201 	.area CODE
                                    202 	.area INITIALIZER
                                    203 	.area CABS (ABS)
