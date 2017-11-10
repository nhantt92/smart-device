                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.6.0 #9615 (MINGW64)
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
      00831E                         55 _led_change:
      00831E 89               [ 2]   56 	pushw	x
                                     57 ;	user/ledss.c: 6: led.mode = mode;
      00831F AE 00 0C         [ 2]   58 	ldw	x, #_led+0
      008322 1F 01            [ 2]   59 	ldw	(0x01, sp), x
      008324 1E 01            [ 2]   60 	ldw	x, (0x01, sp)
      008326 7B 05            [ 1]   61 	ld	a, (0x05, sp)
      008328 E7 06            [ 1]   62 	ld	(0x0006, x), a
                                     63 ;	user/ledss.c: 7: led.timeOn = time;
      00832A 1E 01            [ 2]   64 	ldw	x, (0x01, sp)
      00832C 7B 06            [ 1]   65 	ld	a, (0x06, sp)
      00832E E7 07            [ 1]   66 	ld	(0x0007, x), a
      008330 85               [ 2]   67 	popw	x
      008331 81               [ 4]   68 	ret
                                     69 ;	user/ledss.c: 10: uint8_t led_getstatus(void)
                                     70 ;	-----------------------------------------
                                     71 ;	 function led_getstatus
                                     72 ;	-----------------------------------------
      008332                         73 _led_getstatus:
                                     74 ;	user/ledss.c: 12: return led.mode;
      008332 AE 00 12         [ 2]   75 	ldw	x, #_led+6
      008335 F6               [ 1]   76 	ld	a, (x)
      008336 81               [ 4]   77 	ret
                                     78 ;	user/ledss.c: 15: void ledstt_init(void)
                                     79 ;	-----------------------------------------
                                     80 ;	 function ledstt_init
                                     81 ;	-----------------------------------------
      008337                         82 _ledstt_init:
      008337 89               [ 2]   83 	pushw	x
                                     84 ;	user/ledss.c: 17: led.mode = LED_OFF;
      008338 AE 00 0C         [ 2]   85 	ldw	x, #_led+0
      00833B 1F 01            [ 2]   86 	ldw	(0x01, sp), x
      00833D 1E 01            [ 2]   87 	ldw	x, (0x01, sp)
      00833F 1C 00 06         [ 2]   88 	addw	x, #0x0006
      008342 7F               [ 1]   89 	clr	(x)
                                     90 ;	user/ledss.c: 18: led.timeOn = 0;
      008343 1E 01            [ 2]   91 	ldw	x, (0x01, sp)
      008345 1C 00 07         [ 2]   92 	addw	x, #0x0007
      008348 7F               [ 1]   93 	clr	(x)
                                     94 ;	user/ledss.c: 19: led.cycle = 0;
      008349 1E 01            [ 2]   95 	ldw	x, (0x01, sp)
      00834B 1C 00 08         [ 2]   96 	addw	x, #0x0008
      00834E 7F               [ 1]   97 	clr	(x)
                                     98 ;	user/ledss.c: 20: GPIO_Init(PORT_LED, PIN_LED, GPIO_MODE_OUT_PP_HIGH_FAST);
      00834F 4B F0            [ 1]   99 	push	#0xf0
      008351 4B 10            [ 1]  100 	push	#0x10
      008353 4B 0A            [ 1]  101 	push	#0x0a
      008355 4B 50            [ 1]  102 	push	#0x50
      008357 CD 8F 28         [ 4]  103 	call	_GPIO_Init
      00835A 5B 04            [ 2]  104 	addw	sp, #4
                                    105 ;	user/ledss.c: 21: TIMER_InitTime(&led.tick);
      00835C 1E 01            [ 2]  106 	ldw	x, (0x01, sp)
      00835E 89               [ 2]  107 	pushw	x
      00835F CD 8C 8F         [ 4]  108 	call	_TIMER_InitTime
      008362 85               [ 2]  109 	popw	x
                                    110 ;	user/ledss.c: 22: led_change(LED_FLASH, 10);
      008363 4B 0A            [ 1]  111 	push	#0x0a
      008365 4B 02            [ 1]  112 	push	#0x02
      008367 CD 83 1E         [ 4]  113 	call	_led_change
      00836A 5B 04            [ 2]  114 	addw	sp, #4
      00836C 81               [ 4]  115 	ret
                                    116 ;	user/ledss.c: 25: void ledstt_manager(void)
                                    117 ;	-----------------------------------------
                                    118 ;	 function ledstt_manager
                                    119 ;	-----------------------------------------
      00836D                        120 _ledstt_manager:
      00836D 89               [ 2]  121 	pushw	x
                                    122 ;	user/ledss.c: 27: if(!TIMER_CheckTimeMS(&led.tick, 200))
      00836E AE 00 0C         [ 2]  123 	ldw	x, #_led+0
      008371 4B C8            [ 1]  124 	push	#0xc8
      008373 4B 00            [ 1]  125 	push	#0x00
      008375 4B 00            [ 1]  126 	push	#0x00
      008377 4B 00            [ 1]  127 	push	#0x00
      008379 89               [ 2]  128 	pushw	x
      00837A CD 8C E6         [ 4]  129 	call	_TIMER_CheckTimeMS
      00837D 5B 06            [ 2]  130 	addw	sp, #6
      00837F 4D               [ 1]  131 	tnz	a
      008380 26 62            [ 1]  132 	jrne	00115$
                                    133 ;	user/ledss.c: 29: if(led.mode == LED_ON)
      008382 AE 00 0C         [ 2]  134 	ldw	x, #_led+0
      008385 1F 01            [ 2]  135 	ldw	(0x01, sp), x
      008387 1E 01            [ 2]  136 	ldw	x, (0x01, sp)
      008389 1C 00 06         [ 2]  137 	addw	x, #0x0006
      00838C F6               [ 1]  138 	ld	a, (x)
      00838D A1 01            [ 1]  139 	cp	a, #0x01
      00838F 26 0D            [ 1]  140 	jrne	00111$
                                    141 ;	user/ledss.c: 30: GPIO_WriteLow(PORT_LED, PIN_LED);
      008391 4B 10            [ 1]  142 	push	#0x10
      008393 4B 0A            [ 1]  143 	push	#0x0a
      008395 4B 50            [ 1]  144 	push	#0x50
      008397 CD 8F B4         [ 4]  145 	call	_GPIO_WriteLow
      00839A 5B 03            [ 2]  146 	addw	sp, #3
      00839C 20 46            [ 2]  147 	jra	00115$
      00839E                        148 00111$:
                                    149 ;	user/ledss.c: 31: else if(led.mode == LED_OFF)
      00839E 4D               [ 1]  150 	tnz	a
      00839F 26 0D            [ 1]  151 	jrne	00108$
                                    152 ;	user/ledss.c: 32: GPIO_WriteHigh(PORT_LED, PIN_LED);
      0083A1 4B 10            [ 1]  153 	push	#0x10
      0083A3 4B 0A            [ 1]  154 	push	#0x0a
      0083A5 4B 50            [ 1]  155 	push	#0x50
      0083A7 CD 8F AD         [ 4]  156 	call	_GPIO_WriteHigh
      0083AA 5B 03            [ 2]  157 	addw	sp, #3
      0083AC 20 36            [ 2]  158 	jra	00115$
      0083AE                        159 00108$:
                                    160 ;	user/ledss.c: 35: if(led.timeOn != 0)
      0083AE 16 01            [ 2]  161 	ldw	y, (0x01, sp)
      0083B0 72 A9 00 07      [ 2]  162 	addw	y, #0x0007
      0083B4 90 F6            [ 1]  163 	ld	a, (y)
      0083B6 4D               [ 1]  164 	tnz	a
      0083B7 27 2A            [ 1]  165 	jreq	00105$
                                    166 ;	user/ledss.c: 37: led.timeOn--;
      0083B9 4A               [ 1]  167 	dec	a
      0083BA 90 F7            [ 1]  168 	ld	(y), a
                                    169 ;	user/ledss.c: 38: if(led.cycle == 0)
      0083BC 1E 01            [ 2]  170 	ldw	x, (0x01, sp)
      0083BE 1C 00 08         [ 2]  171 	addw	x, #0x0008
      0083C1 F6               [ 1]  172 	ld	a, (x)
      0083C2 4D               [ 1]  173 	tnz	a
      0083C3 26 10            [ 1]  174 	jrne	00102$
                                    175 ;	user/ledss.c: 40: led.cycle = 1;
      0083C5 A6 01            [ 1]  176 	ld	a, #0x01
      0083C7 F7               [ 1]  177 	ld	(x), a
                                    178 ;	user/ledss.c: 41: GPIO_WriteLow(PORT_LED, PIN_LED);
      0083C8 4B 10            [ 1]  179 	push	#0x10
      0083CA 4B 0A            [ 1]  180 	push	#0x0a
      0083CC 4B 50            [ 1]  181 	push	#0x50
      0083CE CD 8F B4         [ 4]  182 	call	_GPIO_WriteLow
      0083D1 5B 03            [ 2]  183 	addw	sp, #3
      0083D3 20 0F            [ 2]  184 	jra	00115$
      0083D5                        185 00102$:
                                    186 ;	user/ledss.c: 45: led.cycle = 0;
      0083D5 7F               [ 1]  187 	clr	(x)
                                    188 ;	user/ledss.c: 46: GPIO_WriteHigh(PORT_LED, PIN_LED);
      0083D6 4B 10            [ 1]  189 	push	#0x10
      0083D8 4B 0A            [ 1]  190 	push	#0x0a
      0083DA 4B 50            [ 1]  191 	push	#0x50
      0083DC CD 8F AD         [ 4]  192 	call	_GPIO_WriteHigh
      0083DF 5B 03            [ 2]  193 	addw	sp, #3
      0083E1 20 01            [ 2]  194 	jra	00115$
      0083E3                        195 00105$:
                                    196 ;	user/ledss.c: 50: led.mode = LED_OFF;
      0083E3 7F               [ 1]  197 	clr	(x)
      0083E4                        198 00115$:
      0083E4 85               [ 2]  199 	popw	x
      0083E5 81               [ 4]  200 	ret
                                    201 	.area CODE
                                    202 	.area INITIALIZER
                                    203 	.area CABS (ABS)
