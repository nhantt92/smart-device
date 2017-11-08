                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.6.0 #9615 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module keypad
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _GPIO_ReadInputPin
                                     12 	.globl _GPIO_Init
                                     13 	.globl _key
                                     14 	.globl _touch_pad_init
                                     15 	.globl _touch_get
                                     16 	.globl _tp_get
                                     17 ;--------------------------------------------------------
                                     18 ; ram data
                                     19 ;--------------------------------------------------------
                                     20 	.area DATA
      000051                         21 _key::
      000051                         22 	.ds 39
                                     23 ;--------------------------------------------------------
                                     24 ; ram data
                                     25 ;--------------------------------------------------------
                                     26 	.area INITIALIZED
                                     27 ;--------------------------------------------------------
                                     28 ; absolute external ram data
                                     29 ;--------------------------------------------------------
                                     30 	.area DABS (ABS)
                                     31 ;--------------------------------------------------------
                                     32 ; global & static initialisations
                                     33 ;--------------------------------------------------------
                                     34 	.area HOME
                                     35 	.area GSINIT
                                     36 	.area GSFINAL
                                     37 	.area GSINIT
                                     38 ;--------------------------------------------------------
                                     39 ; Home
                                     40 ;--------------------------------------------------------
                                     41 	.area HOME
                                     42 	.area HOME
                                     43 ;--------------------------------------------------------
                                     44 ; code
                                     45 ;--------------------------------------------------------
                                     46 	.area CODE
                                     47 ;	user/keypad.c: 7: void touch_pad_init(void)
                                     48 ;	-----------------------------------------
                                     49 ;	 function touch_pad_init
                                     50 ;	-----------------------------------------
      008605                         51 _touch_pad_init:
      008605 52 04            [ 2]   52 	sub	sp, #4
                                     53 ;	user/keypad.c: 9: GPIO_Init(KEY_PORT1, KEY1|KEY2|KEY3|KEY4|KEY5, GPIO_MODE_IN_PU_NO_IT);
      008607 4B 40            [ 1]   54 	push	#0x40
      008609 4B 9D            [ 1]   55 	push	#0x9d
      00860B 4B 0F            [ 1]   56 	push	#0x0f
      00860D 4B 50            [ 1]   57 	push	#0x50
      00860F CD 98 0F         [ 4]   58 	call	_GPIO_Init
      008612 5B 04            [ 2]   59 	addw	sp, #4
                                     60 ;	user/keypad.c: 10: GPIO_Init(KEY_PORT2, KEY6|KEY7|KEY8, GPIO_MODE_IN_PU_NO_IT);
      008614 4B 40            [ 1]   61 	push	#0x40
      008616 4B 1C            [ 1]   62 	push	#0x1c
      008618 4B 0A            [ 1]   63 	push	#0x0a
      00861A 4B 50            [ 1]   64 	push	#0x50
      00861C CD 98 0F         [ 4]   65 	call	_GPIO_Init
      00861F 5B 04            [ 2]   66 	addw	sp, #4
                                     67 ;	user/keypad.c: 11: for(key.name = 0; key.name < NUM_KEY; key.name++)
      008621 90 AE 00 51      [ 2]   68 	ldw	y, #_key+0
      008625 90 7F            [ 1]   69 	clr	(y)
      008627                         70 00103$:
      008627 90 F6            [ 1]   71 	ld	a, (y)
      008629 A1 08            [ 1]   72 	cp	a, #0x08
      00862B 24 37            [ 1]   73 	jrnc	00105$
                                     74 ;	user/keypad.c: 13: key.ext[key.name].press = key.ext[key.name].press = TP_RELEASE;
      00862D AE 00 51         [ 2]   75 	ldw	x, #_key+0
      008630 1F 01            [ 2]   76 	ldw	(0x01, sp), x
      008632 1E 01            [ 2]   77 	ldw	x, (0x01, sp)
      008634 5C               [ 2]   78 	incw	x
      008635 1F 03            [ 2]   79 	ldw	(0x03, sp), x
      008637 1E 01            [ 2]   80 	ldw	x, (0x01, sp)
      008639 F6               [ 1]   81 	ld	a, (x)
      00863A 48               [ 1]   82 	sll	a
      00863B 48               [ 1]   83 	sll	a
      00863C 5F               [ 1]   84 	clrw	x
      00863D 97               [ 1]   85 	ld	xl, a
      00863E 72 FB 03         [ 2]   86 	addw	x, (0x03, sp)
      008641 5C               [ 2]   87 	incw	x
      008642 7F               [ 1]   88 	clr	(x)
      008643 7F               [ 1]   89 	clr	(x)
                                     90 ;	user/keypad.c: 14: key.ext[key.name].waitRelease = 0;
      008644 1E 01            [ 2]   91 	ldw	x, (0x01, sp)
      008646 F6               [ 1]   92 	ld	a, (x)
      008647 48               [ 1]   93 	sll	a
      008648 48               [ 1]   94 	sll	a
      008649 5F               [ 1]   95 	clrw	x
      00864A 97               [ 1]   96 	ld	xl, a
      00864B 72 FB 03         [ 2]   97 	addw	x, (0x03, sp)
      00864E 5C               [ 2]   98 	incw	x
      00864F 5C               [ 2]   99 	incw	x
      008650 7F               [ 1]  100 	clr	(x)
                                    101 ;	user/keypad.c: 15: key.ext[key.name].cnt = 0;
      008651 1E 01            [ 2]  102 	ldw	x, (0x01, sp)
      008653 F6               [ 1]  103 	ld	a, (x)
      008654 48               [ 1]  104 	sll	a
      008655 48               [ 1]  105 	sll	a
      008656 5F               [ 1]  106 	clrw	x
      008657 97               [ 1]  107 	ld	xl, a
      008658 72 FB 03         [ 2]  108 	addw	x, (0x03, sp)
      00865B 1C 00 03         [ 2]  109 	addw	x, #0x0003
      00865E 7F               [ 1]  110 	clr	(x)
                                    111 ;	user/keypad.c: 11: for(key.name = 0; key.name < NUM_KEY; key.name++)
      00865F 1E 01            [ 2]  112 	ldw	x, (0x01, sp)
      008661 7C               [ 1]  113 	inc	(x)
      008662 20 C3            [ 2]  114 	jra	00103$
      008664                        115 00105$:
      008664 5B 04            [ 2]  116 	addw	sp, #4
      008666 81               [ 4]  117 	ret
                                    118 ;	user/keypad.c: 19: void touch_get(uint8_t port_id){
                                    119 ;	-----------------------------------------
                                    120 ;	 function touch_get
                                    121 ;	-----------------------------------------
      008667                        122 _touch_get:
      008667 52 04            [ 2]  123 	sub	sp, #4
                                    124 ;	user/keypad.c: 25: key.ext[port_id].press = TP_PRESS;
      008669 7B 07            [ 1]  125 	ld	a, (0x07, sp)
      00866B 48               [ 1]  126 	sll	a
      00866C 48               [ 1]  127 	sll	a
      00866D 6B 04            [ 1]  128 	ld	(0x04, sp), a
                                    129 ;	user/keypad.c: 21: switch(port_id){
      00866F 7B 07            [ 1]  130 	ld	a, (0x07, sp)
      008671 A1 00            [ 1]  131 	cp	a, #0x00
      008673 27 18            [ 1]  132 	jreq	00101$
      008675 7B 07            [ 1]  133 	ld	a, (0x07, sp)
      008677 A1 01            [ 1]  134 	cp	a, #0x01
      008679 27 42            [ 1]  135 	jreq	00105$
      00867B 7B 07            [ 1]  136 	ld	a, (0x07, sp)
      00867D A1 02            [ 1]  137 	cp	a, #0x02
      00867F 27 6A            [ 1]  138 	jreq	00109$
      008681 7B 07            [ 1]  139 	ld	a, (0x07, sp)
      008683 A1 03            [ 1]  140 	cp	a, #0x03
      008685 26 03            [ 1]  141 	jrne	00175$
      008687 CC 87 19         [ 2]  142 	jp	00113$
      00868A                        143 00175$:
      00868A CC 87 45         [ 2]  144 	jp	00117$
                                    145 ;	user/keypad.c: 22: case 0:
      00868D                        146 00101$:
                                    147 ;	user/keypad.c: 23: keyGet = KEY5_In();
      00868D 4B 80            [ 1]  148 	push	#0x80
      00868F 4B 0F            [ 1]  149 	push	#0x0f
      008691 4B 50            [ 1]  150 	push	#0x50
      008693 CD 98 C8         [ 4]  151 	call	_GPIO_ReadInputPin
      008696 5B 03            [ 2]  152 	addw	sp, #3
      008698 5F               [ 1]  153 	clrw	x
      008699 97               [ 1]  154 	ld	xl, a
                                    155 ;	user/keypad.c: 24: if(keyGet == 0)
      00869A 5D               [ 2]  156 	tnzw	x
      00869B 26 11            [ 1]  157 	jrne	00103$
                                    158 ;	user/keypad.c: 25: key.ext[port_id].press = TP_PRESS;
      00869D AE 00 52         [ 2]  159 	ldw	x, #_key+1
      0086A0 9F               [ 1]  160 	ld	a, xl
      0086A1 1B 04            [ 1]  161 	add	a, (0x04, sp)
      0086A3 02               [ 1]  162 	rlwa	x
      0086A4 A9 00            [ 1]  163 	adc	a, #0x00
      0086A6 95               [ 1]  164 	ld	xh, a
      0086A7 5C               [ 2]  165 	incw	x
      0086A8 A6 01            [ 1]  166 	ld	a, #0x01
      0086AA F7               [ 1]  167 	ld	(x), a
      0086AB CC 87 45         [ 2]  168 	jp	00117$
      0086AE                        169 00103$:
                                    170 ;	user/keypad.c: 27: key.ext[port_id].press = TP_RELEASE;
      0086AE AE 00 52         [ 2]  171 	ldw	x, #_key+1
      0086B1 9F               [ 1]  172 	ld	a, xl
      0086B2 1B 04            [ 1]  173 	add	a, (0x04, sp)
      0086B4 02               [ 1]  174 	rlwa	x
      0086B5 A9 00            [ 1]  175 	adc	a, #0x00
      0086B7 95               [ 1]  176 	ld	xh, a
      0086B8 5C               [ 2]  177 	incw	x
      0086B9 7F               [ 1]  178 	clr	(x)
                                    179 ;	user/keypad.c: 28: break;
      0086BA CC 87 45         [ 2]  180 	jp	00117$
                                    181 ;	user/keypad.c: 29: case 1:
      0086BD                        182 00105$:
                                    183 ;	user/keypad.c: 30: keyGet = KEY6_In();
      0086BD 4B 04            [ 1]  184 	push	#0x04
      0086BF 4B 0A            [ 1]  185 	push	#0x0a
      0086C1 4B 50            [ 1]  186 	push	#0x50
      0086C3 CD 98 C8         [ 4]  187 	call	_GPIO_ReadInputPin
      0086C6 5B 03            [ 2]  188 	addw	sp, #3
      0086C8 5F               [ 1]  189 	clrw	x
      0086C9 97               [ 1]  190 	ld	xl, a
                                    191 ;	user/keypad.c: 31: if(keyGet == 0)
      0086CA 5D               [ 2]  192 	tnzw	x
      0086CB 26 10            [ 1]  193 	jrne	00107$
                                    194 ;	user/keypad.c: 32: key.ext[port_id].press = TP_PRESS;
      0086CD AE 00 52         [ 2]  195 	ldw	x, #_key+1
      0086D0 9F               [ 1]  196 	ld	a, xl
      0086D1 1B 04            [ 1]  197 	add	a, (0x04, sp)
      0086D3 02               [ 1]  198 	rlwa	x
      0086D4 A9 00            [ 1]  199 	adc	a, #0x00
      0086D6 95               [ 1]  200 	ld	xh, a
      0086D7 5C               [ 2]  201 	incw	x
      0086D8 A6 01            [ 1]  202 	ld	a, #0x01
      0086DA F7               [ 1]  203 	ld	(x), a
      0086DB 20 68            [ 2]  204 	jra	00117$
      0086DD                        205 00107$:
                                    206 ;	user/keypad.c: 34: key.ext[port_id].press = TP_RELEASE;
      0086DD AE 00 52         [ 2]  207 	ldw	x, #_key+1
      0086E0 9F               [ 1]  208 	ld	a, xl
      0086E1 1B 04            [ 1]  209 	add	a, (0x04, sp)
      0086E3 02               [ 1]  210 	rlwa	x
      0086E4 A9 00            [ 1]  211 	adc	a, #0x00
      0086E6 95               [ 1]  212 	ld	xh, a
      0086E7 5C               [ 2]  213 	incw	x
      0086E8 7F               [ 1]  214 	clr	(x)
                                    215 ;	user/keypad.c: 35: break;
      0086E9 20 5A            [ 2]  216 	jra	00117$
                                    217 ;	user/keypad.c: 36: case 2:
      0086EB                        218 00109$:
                                    219 ;	user/keypad.c: 37: keyGet = KEY8_In();
      0086EB 4B 10            [ 1]  220 	push	#0x10
      0086ED 4B 0A            [ 1]  221 	push	#0x0a
      0086EF 4B 50            [ 1]  222 	push	#0x50
      0086F1 CD 98 C8         [ 4]  223 	call	_GPIO_ReadInputPin
      0086F4 5B 03            [ 2]  224 	addw	sp, #3
      0086F6 5F               [ 1]  225 	clrw	x
      0086F7 97               [ 1]  226 	ld	xl, a
                                    227 ;	user/keypad.c: 38: if(keyGet == 0)
      0086F8 5D               [ 2]  228 	tnzw	x
      0086F9 26 10            [ 1]  229 	jrne	00111$
                                    230 ;	user/keypad.c: 39: key.ext[port_id].press = TP_PRESS;
      0086FB AE 00 52         [ 2]  231 	ldw	x, #_key+1
      0086FE 9F               [ 1]  232 	ld	a, xl
      0086FF 1B 04            [ 1]  233 	add	a, (0x04, sp)
      008701 02               [ 1]  234 	rlwa	x
      008702 A9 00            [ 1]  235 	adc	a, #0x00
      008704 95               [ 1]  236 	ld	xh, a
      008705 5C               [ 2]  237 	incw	x
      008706 A6 01            [ 1]  238 	ld	a, #0x01
      008708 F7               [ 1]  239 	ld	(x), a
      008709 20 3A            [ 2]  240 	jra	00117$
      00870B                        241 00111$:
                                    242 ;	user/keypad.c: 41: key.ext[port_id].press = TP_RELEASE;
      00870B AE 00 52         [ 2]  243 	ldw	x, #_key+1
      00870E 9F               [ 1]  244 	ld	a, xl
      00870F 1B 04            [ 1]  245 	add	a, (0x04, sp)
      008711 02               [ 1]  246 	rlwa	x
      008712 A9 00            [ 1]  247 	adc	a, #0x00
      008714 95               [ 1]  248 	ld	xh, a
      008715 5C               [ 2]  249 	incw	x
      008716 7F               [ 1]  250 	clr	(x)
                                    251 ;	user/keypad.c: 42: break;
      008717 20 2C            [ 2]  252 	jra	00117$
                                    253 ;	user/keypad.c: 43: case 3:
      008719                        254 00113$:
                                    255 ;	user/keypad.c: 44: keyGet = KEY7_In();
      008719 4B 08            [ 1]  256 	push	#0x08
      00871B 4B 0A            [ 1]  257 	push	#0x0a
      00871D 4B 50            [ 1]  258 	push	#0x50
      00871F CD 98 C8         [ 4]  259 	call	_GPIO_ReadInputPin
      008722 5B 03            [ 2]  260 	addw	sp, #3
      008724 5F               [ 1]  261 	clrw	x
      008725 97               [ 1]  262 	ld	xl, a
                                    263 ;	user/keypad.c: 45: if(keyGet == 0)
      008726 5D               [ 2]  264 	tnzw	x
      008727 26 10            [ 1]  265 	jrne	00115$
                                    266 ;	user/keypad.c: 46: key.ext[port_id].press = TP_PRESS;
      008729 AE 00 52         [ 2]  267 	ldw	x, #_key+1
      00872C 9F               [ 1]  268 	ld	a, xl
      00872D 1B 04            [ 1]  269 	add	a, (0x04, sp)
      00872F 02               [ 1]  270 	rlwa	x
      008730 A9 00            [ 1]  271 	adc	a, #0x00
      008732 95               [ 1]  272 	ld	xh, a
      008733 5C               [ 2]  273 	incw	x
      008734 A6 01            [ 1]  274 	ld	a, #0x01
      008736 F7               [ 1]  275 	ld	(x), a
      008737 20 0C            [ 2]  276 	jra	00117$
      008739                        277 00115$:
                                    278 ;	user/keypad.c: 48: key.ext[port_id].press = TP_RELEASE;
      008739 AE 00 52         [ 2]  279 	ldw	x, #_key+1
      00873C 9F               [ 1]  280 	ld	a, xl
      00873D 1B 04            [ 1]  281 	add	a, (0x04, sp)
      00873F 02               [ 1]  282 	rlwa	x
      008740 A9 00            [ 1]  283 	adc	a, #0x00
      008742 95               [ 1]  284 	ld	xh, a
      008743 5C               [ 2]  285 	incw	x
      008744 7F               [ 1]  286 	clr	(x)
                                    287 ;	user/keypad.c: 50: }
      008745                        288 00117$:
                                    289 ;	user/keypad.c: 51: if(key.ext[port_id].press != key.ext[port_id].pressed)
      008745 AE 00 52         [ 2]  290 	ldw	x, #_key+1
      008748 9F               [ 1]  291 	ld	a, xl
      008749 1B 04            [ 1]  292 	add	a, (0x04, sp)
      00874B 6B 02            [ 1]  293 	ld	(0x02, sp), a
      00874D 9E               [ 1]  294 	ld	a, xh
      00874E A9 00            [ 1]  295 	adc	a, #0x00
      008750 6B 01            [ 1]  296 	ld	(0x01, sp), a
      008752 1E 01            [ 2]  297 	ldw	x, (0x01, sp)
      008754 E6 01            [ 1]  298 	ld	a, (0x1, x)
      008756 1E 01            [ 2]  299 	ldw	x, (0x01, sp)
      008758 88               [ 1]  300 	push	a
      008759 F6               [ 1]  301 	ld	a, (x)
      00875A 6B 04            [ 1]  302 	ld	(0x04, sp), a
      00875C 84               [ 1]  303 	pop	a
                                    304 ;	user/keypad.c: 53: ++(key.ext[port_id].cnt);
      00875D 1E 01            [ 2]  305 	ldw	x, (0x01, sp)
      00875F 1C 00 03         [ 2]  306 	addw	x, #0x0003
                                    307 ;	user/keypad.c: 51: if(key.ext[port_id].press != key.ext[port_id].pressed)
      008762 11 03            [ 1]  308 	cp	a, (0x03, sp)
      008764 27 12            [ 1]  309 	jreq	00121$
                                    310 ;	user/keypad.c: 53: ++(key.ext[port_id].cnt);
      008766 F6               [ 1]  311 	ld	a, (x)
      008767 4C               [ 1]  312 	inc	a
      008768 F7               [ 1]  313 	ld	(x), a
                                    314 ;	user/keypad.c: 54: if(key.ext[port_id].cnt == NUM_OF_SAMPLE_KEY)
      008769 A1 0A            [ 1]  315 	cp	a, #0x0a
      00876B 26 0C            [ 1]  316 	jrne	00123$
                                    317 ;	user/keypad.c: 56: key.ext[port_id].pressed = key.ext[port_id].pressed;
      00876D 16 01            [ 2]  318 	ldw	y, (0x01, sp)
      00876F 90 F6            [ 1]  319 	ld	a, (y)
      008771 16 01            [ 2]  320 	ldw	y, (0x01, sp)
      008773 90 F7            [ 1]  321 	ld	(y), a
                                    322 ;	user/keypad.c: 57: key.ext[port_id].cnt = 0;
      008775 7F               [ 1]  323 	clr	(x)
      008776 20 01            [ 2]  324 	jra	00123$
      008778                        325 00121$:
                                    326 ;	user/keypad.c: 62: key.ext[port_id].cnt = 0;
      008778 7F               [ 1]  327 	clr	(x)
      008779                        328 00123$:
      008779 5B 04            [ 2]  329 	addw	sp, #4
      00877B 81               [ 4]  330 	ret
                                    331 ;	user/keypad.c: 66: uint8_t tp_get(uint8_t id){
                                    332 ;	-----------------------------------------
                                    333 ;	 function tp_get
                                    334 ;	-----------------------------------------
      00877C                        335 _tp_get:
      00877C 89               [ 2]  336 	pushw	x
                                    337 ;	user/keypad.c: 67: return key.ext[id].pressed;
      00877D AE 00 52         [ 2]  338 	ldw	x, #_key+1
      008780 1F 01            [ 2]  339 	ldw	(0x01, sp), x
      008782 7B 05            [ 1]  340 	ld	a, (0x05, sp)
      008784 48               [ 1]  341 	sll	a
      008785 48               [ 1]  342 	sll	a
      008786 5F               [ 1]  343 	clrw	x
      008787 97               [ 1]  344 	ld	xl, a
      008788 72 FB 01         [ 2]  345 	addw	x, (0x01, sp)
      00878B F6               [ 1]  346 	ld	a, (x)
      00878C 85               [ 2]  347 	popw	x
      00878D 81               [ 4]  348 	ret
                                    349 	.area CODE
                                    350 	.area INITIALIZER
                                    351 	.area CABS (ABS)
