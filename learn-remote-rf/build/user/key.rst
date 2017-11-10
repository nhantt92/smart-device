                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.6.0 #9615 (Mac OS X x86_64)
                                      4 ;--------------------------------------------------------
                                      5 	.module key
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _touch_get
                                     12 	.globl _TIMER_CheckTimeMS
                                     13 	.globl _TIMER_InitTime
                                     14 	.globl _GPIO_ReadInputPin
                                     15 	.globl _GPIO_Init
                                     16 	.globl _key
                                     17 	.globl _tp_init
                                     18 	.globl _tp_get
                                     19 	.globl _tp_manager
                                     20 ;--------------------------------------------------------
                                     21 ; ram data
                                     22 ;--------------------------------------------------------
                                     23 	.area DATA
      000001                         24 _key::
      000001                         25 	.ds 11
                                     26 ;--------------------------------------------------------
                                     27 ; ram data
                                     28 ;--------------------------------------------------------
                                     29 	.area INITIALIZED
                                     30 ;--------------------------------------------------------
                                     31 ; absolute external ram data
                                     32 ;--------------------------------------------------------
                                     33 	.area DABS (ABS)
                                     34 ;--------------------------------------------------------
                                     35 ; global & static initialisations
                                     36 ;--------------------------------------------------------
                                     37 	.area HOME
                                     38 	.area GSINIT
                                     39 	.area GSFINAL
                                     40 	.area GSINIT
                                     41 ;--------------------------------------------------------
                                     42 ; Home
                                     43 ;--------------------------------------------------------
                                     44 	.area HOME
                                     45 	.area HOME
                                     46 ;--------------------------------------------------------
                                     47 ; code
                                     48 ;--------------------------------------------------------
                                     49 	.area CODE
                                     50 ;	user/key.c: 7: void tp_init(void)
                                     51 ;	-----------------------------------------
                                     52 ;	 function tp_init
                                     53 ;	-----------------------------------------
      0081D4                         54 _tp_init:
      0081D4 52 06            [ 2]   55 	sub	sp, #6
                                     56 ;	user/key.c: 9: GPIO_Init(PORT_SET_KEY, PIN_SET_KEY, GPIO_MODE_IN_PU_NO_IT);
      0081D6 4B 40            [ 1]   57 	push	#0x40
      0081D8 4B 02            [ 1]   58 	push	#0x02
      0081DA 4B 0A            [ 1]   59 	push	#0x0a
      0081DC 4B 50            [ 1]   60 	push	#0x50
      0081DE CD 8F 3C         [ 4]   61 	call	_GPIO_Init
      0081E1 5B 04            [ 2]   62 	addw	sp, #4
                                     63 ;	user/key.c: 10: TIMER_InitTime(&key.tick);
      0081E3 AE 00 01         [ 2]   64 	ldw	x, #_key+0
      0081E6 1F 05            [ 2]   65 	ldw	(0x05, sp), x
      0081E8 1E 05            [ 2]   66 	ldw	x, (0x05, sp)
      0081EA 1C 00 05         [ 2]   67 	addw	x, #0x0005
      0081ED 89               [ 2]   68 	pushw	x
      0081EE CD 8C A3         [ 4]   69 	call	_TIMER_InitTime
      0081F1 85               [ 2]   70 	popw	x
                                     71 ;	user/key.c: 11: for(key.name = TP_SET; key.name < NUM_KEY; key.name++){
      0081F2 1E 05            [ 2]   72 	ldw	x, (0x05, sp)
      0081F4 7F               [ 1]   73 	clr	(x)
      0081F5 1E 05            [ 2]   74 	ldw	x, (0x05, sp)
      0081F7 5C               [ 2]   75 	incw	x
      0081F8 1F 03            [ 2]   76 	ldw	(0x03, sp), x
      0081FA                         77 00103$:
      0081FA 1E 05            [ 2]   78 	ldw	x, (0x05, sp)
      0081FC F6               [ 1]   79 	ld	a, (x)
      0081FD A1 01            [ 1]   80 	cp	a, #0x01
      0081FF 24 31            [ 1]   81 	jrnc	00105$
                                     82 ;	user/key.c: 12: key.ext[key.name].pressed = key.ext[key.name].press = TP_RELEASE;
      008201 48               [ 1]   83 	sll	a
      008202 48               [ 1]   84 	sll	a
      008203 97               [ 1]   85 	ld	xl, a
      008204 4F               [ 1]   86 	clr	a
      008205 95               [ 1]   87 	ld	xh, a
      008206 72 FB 03         [ 2]   88 	addw	x, (0x03, sp)
      008209 1F 01            [ 2]   89 	ldw	(0x01, sp), x
      00820B 1E 01            [ 2]   90 	ldw	x, (0x01, sp)
      00820D 5C               [ 2]   91 	incw	x
      00820E 7F               [ 1]   92 	clr	(x)
      00820F 1E 01            [ 2]   93 	ldw	x, (0x01, sp)
      008211 7F               [ 1]   94 	clr	(x)
                                     95 ;	user/key.c: 13: key.ext[key.name].waitRelease = 0;
      008212 1E 05            [ 2]   96 	ldw	x, (0x05, sp)
      008214 F6               [ 1]   97 	ld	a, (x)
      008215 48               [ 1]   98 	sll	a
      008216 48               [ 1]   99 	sll	a
      008217 5F               [ 1]  100 	clrw	x
      008218 97               [ 1]  101 	ld	xl, a
      008219 72 FB 03         [ 2]  102 	addw	x, (0x03, sp)
      00821C 5C               [ 2]  103 	incw	x
      00821D 5C               [ 2]  104 	incw	x
      00821E 7F               [ 1]  105 	clr	(x)
                                    106 ;	user/key.c: 14: key.ext[key.name].cnt = 0;
      00821F 1E 05            [ 2]  107 	ldw	x, (0x05, sp)
      008221 F6               [ 1]  108 	ld	a, (x)
      008222 48               [ 1]  109 	sll	a
      008223 48               [ 1]  110 	sll	a
      008224 5F               [ 1]  111 	clrw	x
      008225 97               [ 1]  112 	ld	xl, a
      008226 72 FB 03         [ 2]  113 	addw	x, (0x03, sp)
      008229 1C 00 03         [ 2]  114 	addw	x, #0x0003
      00822C 7F               [ 1]  115 	clr	(x)
                                    116 ;	user/key.c: 11: for(key.name = TP_SET; key.name < NUM_KEY; key.name++){
      00822D 1E 05            [ 2]  117 	ldw	x, (0x05, sp)
      00822F 7C               [ 1]  118 	inc	(x)
      008230 20 C8            [ 2]  119 	jra	00103$
      008232                        120 00105$:
      008232 5B 06            [ 2]  121 	addw	sp, #6
      008234 81               [ 4]  122 	ret
                                    123 ;	user/key.c: 18: void touch_get(uint8_t port_id)     
                                    124 ;	-----------------------------------------
                                    125 ;	 function touch_get
                                    126 ;	-----------------------------------------
      008235                        127 _touch_get:
      008235 52 06            [ 2]  128 	sub	sp, #6
                                    129 ;	user/key.c: 30: key.ext[port_id].press = TP_PRESS;
      008237 7B 09            [ 1]  130 	ld	a, (0x09, sp)
      008239 48               [ 1]  131 	sll	a
      00823A 48               [ 1]  132 	sll	a
      00823B 6B 06            [ 1]  133 	ld	(0x06, sp), a
                                    134 ;	user/key.c: 21: switch(port_id)
      00823D 7B 09            [ 1]  135 	ld	a, (0x09, sp)
      00823F A1 00            [ 1]  136 	cp	a, #0x00
      008241 26 2E            [ 1]  137 	jrne	00105$
                                    138 ;	user/key.c: 24: keyGet = SET_In();
      008243 4B 02            [ 1]  139 	push	#0x02
      008245 4B 0A            [ 1]  140 	push	#0x0a
      008247 4B 50            [ 1]  141 	push	#0x50
      008249 CD 8F CF         [ 4]  142 	call	_GPIO_ReadInputPin
      00824C 5B 03            [ 2]  143 	addw	sp, #3
      00824E 5F               [ 1]  144 	clrw	x
      00824F 97               [ 1]  145 	ld	xl, a
                                    146 ;	user/key.c: 26: if(keyGet != PIN_SET_KEY)
      008250 A3 00 02         [ 2]  147 	cpw	x, #0x0002
      008253 27 10            [ 1]  148 	jreq	00103$
                                    149 ;	user/key.c: 30: key.ext[port_id].press = TP_PRESS;
      008255 AE 00 02         [ 2]  150 	ldw	x, #_key+1
      008258 9F               [ 1]  151 	ld	a, xl
      008259 1B 06            [ 1]  152 	add	a, (0x06, sp)
      00825B 02               [ 1]  153 	rlwa	x
      00825C A9 00            [ 1]  154 	adc	a, #0x00
      00825E 95               [ 1]  155 	ld	xh, a
      00825F 5C               [ 2]  156 	incw	x
      008260 A6 01            [ 1]  157 	ld	a, #0x01
      008262 F7               [ 1]  158 	ld	(x), a
      008263 20 0C            [ 2]  159 	jra	00105$
      008265                        160 00103$:
                                    161 ;	user/key.c: 32: key.ext[port_id].press = TP_RELEASE;
      008265 AE 00 02         [ 2]  162 	ldw	x, #_key+1
      008268 9F               [ 1]  163 	ld	a, xl
      008269 1B 06            [ 1]  164 	add	a, (0x06, sp)
      00826B 02               [ 1]  165 	rlwa	x
      00826C A9 00            [ 1]  166 	adc	a, #0x00
      00826E 95               [ 1]  167 	ld	xh, a
      00826F 5C               [ 2]  168 	incw	x
      008270 7F               [ 1]  169 	clr	(x)
                                    170 ;	user/key.c: 34: }
      008271                        171 00105$:
                                    172 ;	user/key.c: 35: if(key.ext[port_id].press != key.ext[port_id].pressed)
      008271 AE 00 02         [ 2]  173 	ldw	x, #_key+1
      008274 9F               [ 1]  174 	ld	a, xl
      008275 1B 06            [ 1]  175 	add	a, (0x06, sp)
      008277 6B 05            [ 1]  176 	ld	(0x05, sp), a
      008279 9E               [ 1]  177 	ld	a, xh
      00827A A9 00            [ 1]  178 	adc	a, #0x00
      00827C 6B 04            [ 1]  179 	ld	(0x04, sp), a
      00827E 1E 04            [ 2]  180 	ldw	x, (0x04, sp)
      008280 5C               [ 2]  181 	incw	x
      008281 1F 02            [ 2]  182 	ldw	(0x02, sp), x
      008283 1E 02            [ 2]  183 	ldw	x, (0x02, sp)
      008285 F6               [ 1]  184 	ld	a, (x)
      008286 1E 04            [ 2]  185 	ldw	x, (0x04, sp)
      008288 88               [ 1]  186 	push	a
      008289 F6               [ 1]  187 	ld	a, (x)
      00828A 6B 02            [ 1]  188 	ld	(0x02, sp), a
      00828C 84               [ 1]  189 	pop	a
                                    190 ;	user/key.c: 37: ++(key.ext[port_id].cnt);
      00828D 1E 04            [ 2]  191 	ldw	x, (0x04, sp)
      00828F 1C 00 03         [ 2]  192 	addw	x, #0x0003
                                    193 ;	user/key.c: 35: if(key.ext[port_id].press != key.ext[port_id].pressed)
      008292 11 01            [ 1]  194 	cp	a, (0x01, sp)
      008294 27 12            [ 1]  195 	jreq	00109$
                                    196 ;	user/key.c: 37: ++(key.ext[port_id].cnt);
      008296 F6               [ 1]  197 	ld	a, (x)
      008297 4C               [ 1]  198 	inc	a
      008298 F7               [ 1]  199 	ld	(x), a
                                    200 ;	user/key.c: 38: if(key.ext[port_id].cnt == NUM_OF_SAMPLE_KEY)
      008299 A1 0A            [ 1]  201 	cp	a, #0x0a
      00829B 26 0C            [ 1]  202 	jrne	00111$
                                    203 ;	user/key.c: 40: key.ext[port_id].pressed = key.ext[port_id].press;
      00829D 16 02            [ 2]  204 	ldw	y, (0x02, sp)
      00829F 90 F6            [ 1]  205 	ld	a, (y)
      0082A1 16 04            [ 2]  206 	ldw	y, (0x04, sp)
      0082A3 90 F7            [ 1]  207 	ld	(y), a
                                    208 ;	user/key.c: 41: key.ext[port_id].cnt = 0;
      0082A5 7F               [ 1]  209 	clr	(x)
      0082A6 20 01            [ 2]  210 	jra	00111$
      0082A8                        211 00109$:
                                    212 ;	user/key.c: 46: key.ext[port_id].cnt = 0;
      0082A8 7F               [ 1]  213 	clr	(x)
      0082A9                        214 00111$:
      0082A9 5B 06            [ 2]  215 	addw	sp, #6
      0082AB 81               [ 4]  216 	ret
                                    217 ;	user/key.c: 50: uint8_t tp_get(uint8_t id)
                                    218 ;	-----------------------------------------
                                    219 ;	 function tp_get
                                    220 ;	-----------------------------------------
      0082AC                        221 _tp_get:
      0082AC 89               [ 2]  222 	pushw	x
                                    223 ;	user/key.c: 52: return key.ext[id].pressed;
      0082AD AE 00 02         [ 2]  224 	ldw	x, #_key+1
      0082B0 1F 01            [ 2]  225 	ldw	(0x01, sp), x
      0082B2 7B 05            [ 1]  226 	ld	a, (0x05, sp)
      0082B4 48               [ 1]  227 	sll	a
      0082B5 48               [ 1]  228 	sll	a
      0082B6 5F               [ 1]  229 	clrw	x
      0082B7 97               [ 1]  230 	ld	xl, a
      0082B8 72 FB 01         [ 2]  231 	addw	x, (0x01, sp)
      0082BB F6               [ 1]  232 	ld	a, (x)
      0082BC 85               [ 2]  233 	popw	x
      0082BD 81               [ 4]  234 	ret
                                    235 ;	user/key.c: 55: void tp_manager(void)
                                    236 ;	-----------------------------------------
                                    237 ;	 function tp_manager
                                    238 ;	-----------------------------------------
      0082BE                        239 _tp_manager:
      0082BE 52 05            [ 2]  240 	sub	sp, #5
                                    241 ;	user/key.c: 57: if(!TIMER_CheckTimeMS(&key.tick, 10))
      0082C0 AE 00 01         [ 2]  242 	ldw	x, #_key+0
      0082C3 1F 04            [ 2]  243 	ldw	(0x04, sp), x
      0082C5 1E 04            [ 2]  244 	ldw	x, (0x04, sp)
      0082C7 1C 00 05         [ 2]  245 	addw	x, #0x0005
      0082CA 4B 0A            [ 1]  246 	push	#0x0a
      0082CC 4B 00            [ 1]  247 	push	#0x00
      0082CE 4B 00            [ 1]  248 	push	#0x00
      0082D0 4B 00            [ 1]  249 	push	#0x00
      0082D2 89               [ 2]  250 	pushw	x
      0082D3 CD 8C FA         [ 4]  251 	call	_TIMER_CheckTimeMS
      0082D6 5B 06            [ 2]  252 	addw	sp, #6
      0082D8 6B 03            [ 1]  253 	ld	(0x03, sp), a
      0082DA 0D 03            [ 1]  254 	tnz	(0x03, sp)
      0082DC 26 3E            [ 1]  255 	jrne	00111$
                                    256 ;	user/key.c: 59: for(key.name = TP_SET;key.name < NUM_KEY;key.name++)
      0082DE 1E 04            [ 2]  257 	ldw	x, (0x04, sp)
      0082E0 7F               [ 1]  258 	clr	(x)
      0082E1 1E 04            [ 2]  259 	ldw	x, (0x04, sp)
      0082E3 5C               [ 2]  260 	incw	x
      0082E4 1F 01            [ 2]  261 	ldw	(0x01, sp), x
      0082E6                        262 00109$:
      0082E6 1E 04            [ 2]  263 	ldw	x, (0x04, sp)
      0082E8 F6               [ 1]  264 	ld	a, (x)
      0082E9 A1 01            [ 1]  265 	cp	a, #0x01
      0082EB 24 2F            [ 1]  266 	jrnc	00111$
                                    267 ;	user/key.c: 61: touch_get(key.name);
      0082ED 88               [ 1]  268 	push	a
      0082EE CD 82 35         [ 4]  269 	call	_touch_get
      0082F1 84               [ 1]  270 	pop	a
                                    271 ;	user/key.c: 62: if(key.ext[key.name].pressed == TP_PRESS)
      0082F2 1E 04            [ 2]  272 	ldw	x, (0x04, sp)
      0082F4 F6               [ 1]  273 	ld	a, (x)
      0082F5 48               [ 1]  274 	sll	a
      0082F6 48               [ 1]  275 	sll	a
      0082F7 5F               [ 1]  276 	clrw	x
      0082F8 97               [ 1]  277 	ld	xl, a
      0082F9 72 FB 01         [ 2]  278 	addw	x, (0x01, sp)
      0082FC F6               [ 1]  279 	ld	a, (x)
      0082FD A1 01            [ 1]  280 	cp	a, #0x01
      0082FF 26 05            [ 1]  281 	jrne	00102$
                                    282 ;	user/key.c: 64: key.ext[key.name].waitRelease = 1;
      008301 5C               [ 2]  283 	incw	x
      008302 5C               [ 2]  284 	incw	x
      008303 A6 01            [ 1]  285 	ld	a, #0x01
      008305 F7               [ 1]  286 	ld	(x), a
      008306                        287 00102$:
                                    288 ;	user/key.c: 67: if(key.ext[key.name].pressed == TP_RELEASE){
      008306 1E 04            [ 2]  289 	ldw	x, (0x04, sp)
      008308 F6               [ 1]  290 	ld	a, (x)
      008309 48               [ 1]  291 	sll	a
      00830A 48               [ 1]  292 	sll	a
      00830B 5F               [ 1]  293 	clrw	x
      00830C 97               [ 1]  294 	ld	xl, a
      00830D 72 FB 01         [ 2]  295 	addw	x, (0x01, sp)
      008310 F6               [ 1]  296 	ld	a, (x)
      008311 4D               [ 1]  297 	tnz	a
      008312 26 03            [ 1]  298 	jrne	00110$
                                    299 ;	user/key.c: 68: key.ext[key.name].waitRelease = 0;
      008314 5C               [ 2]  300 	incw	x
      008315 5C               [ 2]  301 	incw	x
      008316 7F               [ 1]  302 	clr	(x)
      008317                        303 00110$:
                                    304 ;	user/key.c: 59: for(key.name = TP_SET;key.name < NUM_KEY;key.name++)
      008317 1E 04            [ 2]  305 	ldw	x, (0x04, sp)
      008319 7C               [ 1]  306 	inc	(x)
      00831A 20 CA            [ 2]  307 	jra	00109$
      00831C                        308 00111$:
      00831C 5B 05            [ 2]  309 	addw	sp, #5
      00831E 81               [ 4]  310 	ret
                                    311 	.area CODE
                                    312 	.area INITIALIZER
                                    313 	.area CABS (ABS)
