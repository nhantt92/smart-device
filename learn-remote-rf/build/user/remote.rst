                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.6.0 #9615 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module remote
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _remote_Decode
                                     12 	.globl _GPIO_Configuration
                                     13 	.globl _TIM1_Config
                                     14 	.globl _TIM1_DisIn
                                     15 	.globl _TIM1_EnIn
                                     16 	.globl _system_checkID
                                     17 	.globl _debugInfo
                                     18 	.globl _info
                                     19 	.globl _TIMER_CheckTimeMS
                                     20 	.globl _TIM1_ClearFlag
                                     21 	.globl _TIM1_GetCounter
                                     22 	.globl _TIM1_SetCounter
                                     23 	.globl _TIM1_ITConfig
                                     24 	.globl _TIM1_Cmd
                                     25 	.globl _TIM1_TimeBaseInit
                                     26 	.globl _TIM1_DeInit
                                     27 	.globl _GPIO_WriteReverse
                                     28 	.globl _GPIO_Init
                                     29 	.globl _EXTI_SetExtIntSensitivity
                                     30 	.globl _CLK_PeripheralClockConfig
                                     31 	.globl _ctrCnt
                                     32 	.globl _ctrFlag
                                     33 	.globl _remote
                                     34 	.globl _remote_Init
                                     35 	.globl _remote_CheckCompare
                                     36 	.globl _remote_Clear
                                     37 	.globl _remote_Process
                                     38 	.globl _remote_Manager
                                     39 ;--------------------------------------------------------
                                     40 ; ram data
                                     41 ;--------------------------------------------------------
                                     42 	.area DATA
      000015                         43 _remote::
      000015                         44 	.ds 159
                                     45 ;--------------------------------------------------------
                                     46 ; ram data
                                     47 ;--------------------------------------------------------
                                     48 	.area INITIALIZED
      0000E7                         49 _ctrFlag::
      0000E7                         50 	.ds 1
      0000E8                         51 _ctrCnt::
      0000E8                         52 	.ds 1
                                     53 ;--------------------------------------------------------
                                     54 ; absolute external ram data
                                     55 ;--------------------------------------------------------
                                     56 	.area DABS (ABS)
                                     57 ;--------------------------------------------------------
                                     58 ; global & static initialisations
                                     59 ;--------------------------------------------------------
                                     60 	.area HOME
                                     61 	.area GSINIT
                                     62 	.area GSFINAL
                                     63 	.area GSINIT
                                     64 ;--------------------------------------------------------
                                     65 ; Home
                                     66 ;--------------------------------------------------------
                                     67 	.area HOME
                                     68 	.area HOME
                                     69 ;--------------------------------------------------------
                                     70 ; code
                                     71 ;--------------------------------------------------------
                                     72 	.area CODE
                                     73 ;	user/remote.c: 21: void TIM1_EnIn(void)
                                     74 ;	-----------------------------------------
                                     75 ;	 function TIM1_EnIn
                                     76 ;	-----------------------------------------
      00846D                         77 _TIM1_EnIn:
                                     78 ;	user/remote.c: 23: TIM1_ClearFlag(TIM1_FLAG_UPDATE); 
      00846D 4B 01            [ 1]   79 	push	#0x01
      00846F 4B 00            [ 1]   80 	push	#0x00
      008471 CD 91 2C         [ 4]   81 	call	_TIM1_ClearFlag
      008474 85               [ 2]   82 	popw	x
                                     83 ;	user/remote.c: 24: TIM1_ITConfig(TIM1_IT_UPDATE, ENABLE);
      008475 4B 01            [ 1]   84 	push	#0x01
      008477 4B 01            [ 1]   85 	push	#0x01
      008479 CD 90 DD         [ 4]   86 	call	_TIM1_ITConfig
      00847C 85               [ 2]   87 	popw	x
                                     88 ;	user/remote.c: 25: TIM1_SetCounter(0);
      00847D 5F               [ 1]   89 	clrw	x
      00847E 89               [ 2]   90 	pushw	x
      00847F CD 90 FF         [ 4]   91 	call	_TIM1_SetCounter
      008482 85               [ 2]   92 	popw	x
      008483 81               [ 4]   93 	ret
                                     94 ;	user/remote.c: 28: void TIM1_DisIn(void)
                                     95 ;	-----------------------------------------
                                     96 ;	 function TIM1_DisIn
                                     97 ;	-----------------------------------------
      008484                         98 _TIM1_DisIn:
                                     99 ;	user/remote.c: 30: TIM1_ClearFlag(TIM1_FLAG_UPDATE); 
      008484 4B 01            [ 1]  100 	push	#0x01
      008486 4B 00            [ 1]  101 	push	#0x00
      008488 CD 91 2C         [ 4]  102 	call	_TIM1_ClearFlag
      00848B 85               [ 2]  103 	popw	x
                                    104 ;	user/remote.c: 31: TIM1_ITConfig(TIM1_IT_UPDATE, DISABLE); 
      00848C 4B 00            [ 1]  105 	push	#0x00
      00848E 4B 01            [ 1]  106 	push	#0x01
      008490 CD 90 DD         [ 4]  107 	call	_TIM1_ITConfig
      008493 85               [ 2]  108 	popw	x
      008494 81               [ 4]  109 	ret
                                    110 ;	user/remote.c: 34: void TIM1_Config(void)
                                    111 ;	-----------------------------------------
                                    112 ;	 function TIM1_Config
                                    113 ;	-----------------------------------------
      008495                        114 _TIM1_Config:
                                    115 ;	user/remote.c: 36: CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1 , ENABLE); 
      008495 4B 01            [ 1]  116 	push	#0x01
      008497 4B 07            [ 1]  117 	push	#0x07
      008499 CD 8D B4         [ 4]  118 	call	_CLK_PeripheralClockConfig
      00849C 85               [ 2]  119 	popw	x
                                    120 ;	user/remote.c: 38: TIM1_DeInit();
      00849D CD 90 03         [ 4]  121 	call	_TIM1_DeInit
                                    122 ;	user/remote.c: 39: TIM1_TimeBaseInit(15, TIM1_COUNTERMODE_UP, 65535, 0);
      0084A0 4B 00            [ 1]  123 	push	#0x00
      0084A2 4B FF            [ 1]  124 	push	#0xff
      0084A4 4B FF            [ 1]  125 	push	#0xff
      0084A6 4B 00            [ 1]  126 	push	#0x00
      0084A8 4B 0F            [ 1]  127 	push	#0x0f
      0084AA 4B 00            [ 1]  128 	push	#0x00
      0084AC CD 90 9C         [ 4]  129 	call	_TIM1_TimeBaseInit
      0084AF 5B 06            [ 2]  130 	addw	sp, #6
                                    131 ;	user/remote.c: 40: TIM1_SetCounter(0);
      0084B1 5F               [ 1]  132 	clrw	x
      0084B2 89               [ 2]  133 	pushw	x
      0084B3 CD 90 FF         [ 4]  134 	call	_TIM1_SetCounter
      0084B6 85               [ 2]  135 	popw	x
                                    136 ;	user/remote.c: 42: TIM1_Cmd(ENABLE);
      0084B7 4B 01            [ 1]  137 	push	#0x01
      0084B9 CD 90 CF         [ 4]  138 	call	_TIM1_Cmd
      0084BC 84               [ 1]  139 	pop	a
      0084BD 81               [ 4]  140 	ret
                                    141 ;	user/remote.c: 45: void GPIO_Configuration(void)
                                    142 ;	-----------------------------------------
                                    143 ;	 function GPIO_Configuration
                                    144 ;	-----------------------------------------
      0084BE                        145 _GPIO_Configuration:
                                    146 ;	user/remote.c: 47: GPIO_Init(GPIOD, GPIO_PIN_3, GPIO_MODE_IN_FL_IT);
      0084BE 4B 20            [ 1]  147 	push	#0x20
      0084C0 4B 08            [ 1]  148 	push	#0x08
      0084C2 4B 0F            [ 1]  149 	push	#0x0f
      0084C4 4B 50            [ 1]  150 	push	#0x50
      0084C6 CD 8F 28         [ 4]  151 	call	_GPIO_Init
      0084C9 5B 04            [ 2]  152 	addw	sp, #4
                                    153 ;	user/remote.c: 49: EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOD, EXTI_SENSITIVITY_RISE_FALL);
      0084CB 4B 03            [ 1]  154 	push	#0x03
      0084CD 4B 03            [ 1]  155 	push	#0x03
      0084CF CD 8E 79         [ 4]  156 	call	_EXTI_SetExtIntSensitivity
      0084D2 85               [ 2]  157 	popw	x
      0084D3 81               [ 4]  158 	ret
                                    159 ;	user/remote.c: 52: void remote_Init(void)
                                    160 ;	-----------------------------------------
                                    161 ;	 function remote_Init
                                    162 ;	-----------------------------------------
      0084D4                        163 _remote_Init:
                                    164 ;	user/remote.c: 54: remote_Clear();
      0084D4 CD 85 E2         [ 4]  165 	call	_remote_Clear
                                    166 ;	user/remote.c: 55: remote.command = 0;
      0084D7 AE 00 AA         [ 2]  167 	ldw	x, #_remote+149
      0084DA 90 5F            [ 1]  168 	clrw	y
      0084DC EF 02            [ 2]  169 	ldw	(0x2, x), y
      0084DE FF               [ 2]  170 	ldw	(x), y
                                    171 ;	user/remote.c: 56: TIM1_Config();
      0084DF CD 84 95         [ 4]  172 	call	_TIM1_Config
                                    173 ;	user/remote.c: 57: GPIO_Configuration();
      0084E2 CC 84 BE         [ 2]  174 	jp	_GPIO_Configuration
                                    175 ;	user/remote.c: 60: uint32_t remote_CheckCompare(uint32_t dat, uint32_t *buf, uint8_t offset, uint8_t len)
                                    176 ;	-----------------------------------------
                                    177 ;	 function remote_CheckCompare
                                    178 ;	-----------------------------------------
      0084E5                        179 _remote_CheckCompare:
      0084E5 52 04            [ 2]  180 	sub	sp, #4
                                    181 ;	user/remote.c: 64: for(add = 0;add < len;add++)
      0084E7 4F               [ 1]  182 	clr	a
      0084E8                        183 00107$:
      0084E8 11 0E            [ 1]  184 	cp	a, (0x0e, sp)
      0084EA 24 2E            [ 1]  185 	jrnc	00105$
                                    186 ;	user/remote.c: 66: if(add == offset)
      0084EC 11 0D            [ 1]  187 	cp	a, (0x0d, sp)
      0084EE 26 01            [ 1]  188 	jrne	00102$
                                    189 ;	user/remote.c: 67: add++;
      0084F0 4C               [ 1]  190 	inc	a
      0084F1                        191 00102$:
                                    192 ;	user/remote.c: 68: if(dat == buf[add])
      0084F1 5F               [ 1]  193 	clrw	x
      0084F2 97               [ 1]  194 	ld	xl, a
      0084F3 58               [ 2]  195 	sllw	x
      0084F4 58               [ 2]  196 	sllw	x
      0084F5 72 FB 0B         [ 2]  197 	addw	x, (0x0b, sp)
      0084F8 88               [ 1]  198 	push	a
      0084F9 E6 03            [ 1]  199 	ld	a, (0x3, x)
      0084FB 6B 05            [ 1]  200 	ld	(0x05, sp), a
      0084FD E6 02            [ 1]  201 	ld	a, (0x2, x)
      0084FF 6B 04            [ 1]  202 	ld	(0x04, sp), a
      008501 FE               [ 2]  203 	ldw	x, (x)
      008502 1F 02            [ 2]  204 	ldw	(0x02, sp), x
      008504 84               [ 1]  205 	pop	a
      008505 1E 09            [ 2]  206 	ldw	x, (0x09, sp)
      008507 13 03            [ 2]  207 	cpw	x, (0x03, sp)
      008509 26 0C            [ 1]  208 	jrne	00108$
      00850B 1E 07            [ 2]  209 	ldw	x, (0x07, sp)
      00850D 13 01            [ 2]  210 	cpw	x, (0x01, sp)
      00850F 26 06            [ 1]  211 	jrne	00108$
                                    212 ;	user/remote.c: 69: return dat;
      008511 1E 09            [ 2]  213 	ldw	x, (0x09, sp)
      008513 16 07            [ 2]  214 	ldw	y, (0x07, sp)
      008515 20 06            [ 2]  215 	jra	00109$
      008517                        216 00108$:
                                    217 ;	user/remote.c: 64: for(add = 0;add < len;add++)
      008517 4C               [ 1]  218 	inc	a
      008518 20 CE            [ 2]  219 	jra	00107$
      00851A                        220 00105$:
                                    221 ;	user/remote.c: 71: return 0;
      00851A 5F               [ 1]  222 	clrw	x
      00851B 90 5F            [ 1]  223 	clrw	y
      00851D                        224 00109$:
      00851D 5B 04            [ 2]  225 	addw	sp, #4
      00851F 81               [ 4]  226 	ret
                                    227 ;	user/remote.c: 74: void remote_Decode(void)
                                    228 ;	-----------------------------------------
                                    229 ;	 function remote_Decode
                                    230 ;	-----------------------------------------
      008520                        231 _remote_Decode:
      008520 52 11            [ 2]  232 	sub	sp, #17
                                    233 ;	user/remote.c: 76: uint32_t RC_dataIndex = 0;
      008522 5F               [ 1]  234 	clrw	x
      008523 1F 03            [ 2]  235 	ldw	(0x03, sp), x
      008525 1F 01            [ 2]  236 	ldw	(0x01, sp), x
                                    237 ;	user/remote.c: 78: for(add = 1;add < (BIT_READ*2)+1;add+=2)
      008527 AE 00 15         [ 2]  238 	ldw	x, #_remote+0
      00852A 1F 08            [ 2]  239 	ldw	(0x08, sp), x
      00852C 1E 08            [ 2]  240 	ldw	x, (0x08, sp)
      00852E 1C 00 03         [ 2]  241 	addw	x, #0x0003
      008531 1F 0C            [ 2]  242 	ldw	(0x0c, sp), x
      008533 A6 01            [ 1]  243 	ld	a, #0x01
      008535 6B 05            [ 1]  244 	ld	(0x05, sp), a
      008537                        245 00117$:
                                    246 ;	user/remote.c: 80: if((remote.buff[add] >= MIN_LSB_BIT_TIME_US)&&(remote.buff[add] < MAX_LSB_BIT_TIME_US)&&(remote.buff[add+1] >= MIN_MSB_BIT_TIME_US)&&(remote.buff[add+1] < MAX_MSB_BIT_TIME_US))
      008537 7B 05            [ 1]  247 	ld	a, (0x05, sp)
      008539 48               [ 1]  248 	sll	a
      00853A 5F               [ 1]  249 	clrw	x
      00853B 97               [ 1]  250 	ld	xl, a
      00853C 72 FB 0C         [ 2]  251 	addw	x, (0x0c, sp)
      00853F FE               [ 2]  252 	ldw	x, (x)
      008540 1F 0E            [ 2]  253 	ldw	(0x0e, sp), x
      008542 7B 05            [ 1]  254 	ld	a, (0x05, sp)
      008544 4C               [ 1]  255 	inc	a
      008545 48               [ 1]  256 	sll	a
      008546 97               [ 1]  257 	ld	xl, a
      008547 4F               [ 1]  258 	clr	a
      008548 95               [ 1]  259 	ld	xh, a
      008549 72 FB 0C         [ 2]  260 	addw	x, (0x0c, sp)
      00854C 1F 06            [ 2]  261 	ldw	(0x06, sp), x
      00854E 1E 0E            [ 2]  262 	ldw	x, (0x0e, sp)
      008550 A3 01 2C         [ 2]  263 	cpw	x, #0x012c
      008553 25 14            [ 1]  264 	jrc	00108$
      008555 1E 0E            [ 2]  265 	ldw	x, (0x0e, sp)
      008557 A3 01 F4         [ 2]  266 	cpw	x, #0x01f4
      00855A 24 0D            [ 1]  267 	jrnc	00108$
      00855C 1E 06            [ 2]  268 	ldw	x, (0x06, sp)
      00855E FE               [ 2]  269 	ldw	x, (x)
      00855F A3 02 BC         [ 2]  270 	cpw	x, #0x02bc
      008562 25 05            [ 1]  271 	jrc	00108$
      008564 A3 04 B0         [ 2]  272 	cpw	x, #0x04b0
      008567 25 2E            [ 1]  273 	jrc	00109$
                                    274 ;	user/remote.c: 81: RC_dataIndex |= 0;
      008569                        275 00108$:
                                    276 ;	user/remote.c: 82: else if((remote.buff[add] >= MIN_MSB_BIT_TIME_US)&&(remote.buff[add] < MAX_MSB_BIT_TIME_US)&&(remote.buff[add+1] >= MIN_LSB_BIT_TIME_US)&&(remote.buff[add+1] < MAX_LSB_BIT_TIME_US))
      008569 1E 0E            [ 2]  277 	ldw	x, (0x0e, sp)
      00856B A3 02 BC         [ 2]  278 	cpw	x, #0x02bc
      00856E 25 6F            [ 1]  279 	jrc	00119$
      008570 1E 0E            [ 2]  280 	ldw	x, (0x0e, sp)
      008572 A3 04 B0         [ 2]  281 	cpw	x, #0x04b0
      008575 24 68            [ 1]  282 	jrnc	00119$
      008577 1E 06            [ 2]  283 	ldw	x, (0x06, sp)
      008579 FE               [ 2]  284 	ldw	x, (x)
      00857A A3 01 2C         [ 2]  285 	cpw	x, #0x012c
      00857D 25 60            [ 1]  286 	jrc	00119$
      00857F A3 01 F4         [ 2]  287 	cpw	x, #0x01f4
      008582 24 5B            [ 1]  288 	jrnc	00119$
                                    289 ;	user/remote.c: 83: RC_dataIndex |= 1;
      008584 1E 03            [ 2]  290 	ldw	x, (0x03, sp)
      008586 54               [ 2]  291 	srlw	x
      008587 99               [ 1]  292 	scf
      008588 59               [ 2]  293 	rlcw	x
      008589 7B 02            [ 1]  294 	ld	a, (0x02, sp)
      00858B 90 97            [ 1]  295 	ld	yl, a
      00858D 7B 01            [ 1]  296 	ld	a, (0x01, sp)
      00858F 90 95            [ 1]  297 	ld	yh, a
      008591 1F 03            [ 2]  298 	ldw	(0x03, sp), x
      008593 17 01            [ 2]  299 	ldw	(0x01, sp), y
                                    300 ;	user/remote.c: 85: return;
      008595 20 00            [ 2]  301 	jra	00109$
      008597                        302 00109$:
                                    303 ;	user/remote.c: 86: RC_dataIndex <<= 1;
      008597 1E 03            [ 2]  304 	ldw	x, (0x03, sp)
      008599 16 01            [ 2]  305 	ldw	y, (0x01, sp)
      00859B 58               [ 2]  306 	sllw	x
      00859C 90 59            [ 2]  307 	rlcw	y
      00859E 1F 03            [ 2]  308 	ldw	(0x03, sp), x
      0085A0 17 01            [ 2]  309 	ldw	(0x01, sp), y
                                    310 ;	user/remote.c: 78: for(add = 1;add < (BIT_READ*2)+1;add+=2)
      0085A2 0C 05            [ 1]  311 	inc	(0x05, sp)
      0085A4 0C 05            [ 1]  312 	inc	(0x05, sp)
      0085A6 7B 05            [ 1]  313 	ld	a, (0x05, sp)
      0085A8 A1 31            [ 1]  314 	cp	a, #0x31
      0085AA 25 8B            [ 1]  315 	jrc	00117$
                                    316 ;	user/remote.c: 88: remote.cmdBuff[remote.cntCmd] = RC_dataIndex;
      0085AC 1E 08            [ 2]  317 	ldw	x, (0x08, sp)
      0085AE 1C 00 7C         [ 2]  318 	addw	x, #0x007c
      0085B1 1F 10            [ 2]  319 	ldw	(0x10, sp), x
      0085B3 1E 08            [ 2]  320 	ldw	x, (0x08, sp)
      0085B5 1C 00 7B         [ 2]  321 	addw	x, #0x007b
      0085B8 1F 0A            [ 2]  322 	ldw	(0x0a, sp), x
      0085BA 1E 0A            [ 2]  323 	ldw	x, (0x0a, sp)
      0085BC F6               [ 1]  324 	ld	a, (x)
      0085BD 48               [ 1]  325 	sll	a
      0085BE 48               [ 1]  326 	sll	a
      0085BF 5F               [ 1]  327 	clrw	x
      0085C0 97               [ 1]  328 	ld	xl, a
      0085C1 72 FB 10         [ 2]  329 	addw	x, (0x10, sp)
      0085C4 16 03            [ 2]  330 	ldw	y, (0x03, sp)
      0085C6 EF 02            [ 2]  331 	ldw	(0x2, x), y
      0085C8 16 01            [ 2]  332 	ldw	y, (0x01, sp)
      0085CA FF               [ 2]  333 	ldw	(x), y
                                    334 ;	user/remote.c: 89: if(remote.cntCmd < (MAX_BUFF_CMD-1))
      0085CB 1E 0A            [ 2]  335 	ldw	x, (0x0a, sp)
      0085CD F6               [ 1]  336 	ld	a, (x)
      0085CE A1 04            [ 1]  337 	cp	a, #0x04
      0085D0 24 06            [ 1]  338 	jrnc	00115$
                                    339 ;	user/remote.c: 90: remote.cntCmd++;
      0085D2 4C               [ 1]  340 	inc	a
      0085D3 1E 0A            [ 2]  341 	ldw	x, (0x0a, sp)
      0085D5 F7               [ 1]  342 	ld	(x), a
      0085D6 20 07            [ 2]  343 	jra	00119$
      0085D8                        344 00115$:
                                    345 ;	user/remote.c: 92: remote.flag = 1;
      0085D8 1E 08            [ 2]  346 	ldw	x, (0x08, sp)
      0085DA 5C               [ 2]  347 	incw	x
      0085DB 5C               [ 2]  348 	incw	x
      0085DC A6 01            [ 1]  349 	ld	a, #0x01
      0085DE F7               [ 1]  350 	ld	(x), a
      0085DF                        351 00119$:
      0085DF 5B 11            [ 2]  352 	addw	sp, #17
      0085E1 81               [ 4]  353 	ret
                                    354 ;	user/remote.c: 95: void remote_Clear(void)
                                    355 ;	-----------------------------------------
                                    356 ;	 function remote_Clear
                                    357 ;	-----------------------------------------
      0085E2                        358 _remote_Clear:
      0085E2 89               [ 2]  359 	pushw	x
                                    360 ;	user/remote.c: 97: remote.startBit = 0;
      0085E3 AE 00 15         [ 2]  361 	ldw	x, #_remote+0
      0085E6 7F               [ 1]  362 	clr	(x)
                                    363 ;	user/remote.c: 98: remote.cnt = 0;
      0085E7 AE 00 15         [ 2]  364 	ldw	x, #_remote+0
      0085EA 1F 01            [ 2]  365 	ldw	(0x01, sp), x
      0085EC 1E 01            [ 2]  366 	ldw	x, (0x01, sp)
      0085EE 5C               [ 2]  367 	incw	x
      0085EF 7F               [ 1]  368 	clr	(x)
                                    369 ;	user/remote.c: 99: remote.cntCmd = 0;
      0085F0 1E 01            [ 2]  370 	ldw	x, (0x01, sp)
      0085F2 1C 00 7B         [ 2]  371 	addw	x, #0x007b
      0085F5 7F               [ 1]  372 	clr	(x)
                                    373 ;	user/remote.c: 100: remote.flag = 0;
      0085F6 1E 01            [ 2]  374 	ldw	x, (0x01, sp)
      0085F8 5C               [ 2]  375 	incw	x
      0085F9 5C               [ 2]  376 	incw	x
      0085FA 7F               [ 1]  377 	clr	(x)
                                    378 ;	user/remote.c: 101: remote.lastCmd = 0;
      0085FB 1E 01            [ 2]  379 	ldw	x, (0x01, sp)
      0085FD 1C 00 90         [ 2]  380 	addw	x, #0x0090
      008600 90 5F            [ 1]  381 	clrw	y
      008602 EF 02            [ 2]  382 	ldw	(0x2, x), y
      008604 FF               [ 2]  383 	ldw	(x), y
                                    384 ;	user/remote.c: 102: remote.compareCnt = 0;
      008605 1E 01            [ 2]  385 	ldw	x, (0x01, sp)
      008607 1C 00 94         [ 2]  386 	addw	x, #0x0094
      00860A 7F               [ 1]  387 	clr	(x)
      00860B 85               [ 2]  388 	popw	x
      00860C 81               [ 4]  389 	ret
                                    390 ;	user/remote.c: 105: void remote_Process(void)
                                    391 ;	-----------------------------------------
                                    392 ;	 function remote_Process
                                    393 ;	-----------------------------------------
      00860D                        394 _remote_Process:
      00860D 52 08            [ 2]  395 	sub	sp, #8
                                    396 ;	user/remote.c: 108: TIM1_DisIn();
      00860F CD 84 84         [ 4]  397 	call	_TIM1_DisIn
                                    398 ;	user/remote.c: 109: dat = TIM1_GetCounter();
      008612 CD 91 10         [ 4]  399 	call	_TIM1_GetCounter
      008615 1F 01            [ 2]  400 	ldw	(0x01, sp), x
      008617 16 01            [ 2]  401 	ldw	y, (0x01, sp)
                                    402 ;	user/remote.c: 110: if((dat >= MIN_SYN_BIT_TIME_US)&&(dat < MAX_SYN_BIT_TIME_US))
      008619 90 A3 15 7C      [ 2]  403 	cpw	y, #0x157c
      00861D 25 14            [ 1]  404 	jrc	00104$
      00861F 90 A3 2E E0      [ 2]  405 	cpw	y, #0x2ee0
      008623 24 0E            [ 1]  406 	jrnc	00104$
                                    407 ;	user/remote.c: 112: if(remote.startBit == 0)
      008625 AE 00 15         [ 2]  408 	ldw	x, #_remote+0
      008628 F6               [ 1]  409 	ld	a, (x)
      008629 4D               [ 1]  410 	tnz	a
      00862A 26 07            [ 1]  411 	jrne	00104$
                                    412 ;	user/remote.c: 114: remote.startBit = 1;
      00862C A6 01            [ 1]  413 	ld	a, #0x01
      00862E F7               [ 1]  414 	ld	(x), a
                                    415 ;	user/remote.c: 115: remote.cnt = 0;
      00862F AE 00 16         [ 2]  416 	ldw	x, #_remote+1
      008632 7F               [ 1]  417 	clr	(x)
      008633                        418 00104$:
                                    419 ;	user/remote.c: 118: if(remote.startBit == 1)
      008633 AE 00 15         [ 2]  420 	ldw	x, #_remote+0
      008636 F6               [ 1]  421 	ld	a, (x)
      008637 A1 01            [ 1]  422 	cp	a, #0x01
      008639 26 2D            [ 1]  423 	jrne	00109$
                                    424 ;	user/remote.c: 120: remote.buff[remote.cnt] = dat;
      00863B AE 00 15         [ 2]  425 	ldw	x, #_remote+0
      00863E 1F 07            [ 2]  426 	ldw	(0x07, sp), x
      008640 1E 07            [ 2]  427 	ldw	x, (0x07, sp)
      008642 1C 00 03         [ 2]  428 	addw	x, #0x0003
      008645 1F 05            [ 2]  429 	ldw	(0x05, sp), x
      008647 1E 07            [ 2]  430 	ldw	x, (0x07, sp)
      008649 5C               [ 2]  431 	incw	x
      00864A 1F 03            [ 2]  432 	ldw	(0x03, sp), x
      00864C 1E 03            [ 2]  433 	ldw	x, (0x03, sp)
      00864E F6               [ 1]  434 	ld	a, (x)
      00864F 48               [ 1]  435 	sll	a
      008650 5F               [ 1]  436 	clrw	x
      008651 97               [ 1]  437 	ld	xl, a
      008652 72 FB 05         [ 2]  438 	addw	x, (0x05, sp)
      008655 FF               [ 2]  439 	ldw	(x), y
                                    440 ;	user/remote.c: 121: if(++remote.cnt > (MAX_BIT_READ*2))
      008656 1E 03            [ 2]  441 	ldw	x, (0x03, sp)
      008658 F6               [ 1]  442 	ld	a, (x)
      008659 4C               [ 1]  443 	inc	a
      00865A F7               [ 1]  444 	ld	(x), a
      00865B A1 32            [ 1]  445 	cp	a, #0x32
      00865D 23 09            [ 2]  446 	jrule	00109$
                                    447 ;	user/remote.c: 123: remote.startBit = 0;
      00865F 1E 07            [ 2]  448 	ldw	x, (0x07, sp)
      008661 7F               [ 1]  449 	clr	(x)
                                    450 ;	user/remote.c: 124: remote.cnt = 0;
      008662 1E 03            [ 2]  451 	ldw	x, (0x03, sp)
      008664 7F               [ 1]  452 	clr	(x)
                                    453 ;	user/remote.c: 125: remote_Decode();
      008665 CD 85 20         [ 4]  454 	call	_remote_Decode
      008668                        455 00109$:
                                    456 ;	user/remote.c: 128: TIM1_EnIn();
      008668 CD 84 6D         [ 4]  457 	call	_TIM1_EnIn
      00866B 5B 08            [ 2]  458 	addw	sp, #8
      00866D 81               [ 4]  459 	ret
                                    460 ;	user/remote.c: 133: void remote_Manager(void)
                                    461 ;	-----------------------------------------
                                    462 ;	 function remote_Manager
                                    463 ;	-----------------------------------------
      00866E                        464 _remote_Manager:
      00866E 52 33            [ 2]  465 	sub	sp, #51
                                    466 ;	user/remote.c: 138: if(TIMER_CheckTimeMS(&remote.time, 100) == 0)
      008670 AE 00 15         [ 2]  467 	ldw	x, #_remote+0
      008673 1F 32            [ 2]  468 	ldw	(0x32, sp), x
      008675 1E 32            [ 2]  469 	ldw	x, (0x32, sp)
      008677 1C 00 99         [ 2]  470 	addw	x, #0x0099
      00867A 4B 64            [ 1]  471 	push	#0x64
      00867C 4B 00            [ 1]  472 	push	#0x00
      00867E 4B 00            [ 1]  473 	push	#0x00
      008680 4B 00            [ 1]  474 	push	#0x00
      008682 89               [ 2]  475 	pushw	x
      008683 CD 8C E6         [ 4]  476 	call	_TIMER_CheckTimeMS
      008686 5B 06            [ 2]  477 	addw	sp, #6
      008688 4D               [ 1]  478 	tnz	a
      008689 27 03            [ 1]  479 	jreq	00162$
      00868B CC 88 0C         [ 2]  480 	jp	00119$
      00868E                        481 00162$:
                                    482 ;	user/remote.c: 141: if(ctrCnt != 0)ctrCnt--;
      00868E 72 5D 00 E8      [ 1]  483 	tnz	_ctrCnt+0
      008692 27 04            [ 1]  484 	jreq	00102$
      008694 72 5A 00 E8      [ 1]  485 	dec	_ctrCnt+0
      008698                        486 00102$:
                                    487 ;	user/remote.c: 146: if(remote.flag == 1)
      008698 1E 32            [ 2]  488 	ldw	x, (0x32, sp)
      00869A E6 02            [ 1]  489 	ld	a, (0x2, x)
      00869C A1 01            [ 1]  490 	cp	a, #0x01
      00869E 27 03            [ 1]  491 	jreq	00166$
      0086A0 CC 88 0C         [ 2]  492 	jp	00119$
      0086A3                        493 00166$:
                                    494 ;	user/remote.c: 148: disableInterrupts();
      0086A3 9B               [ 1]  495 	sim
                                    496 ;	user/remote.c: 149: remote.compareCnt = 0;
      0086A4 1E 32            [ 2]  497 	ldw	x, (0x32, sp)
      0086A6 1C 00 94         [ 2]  498 	addw	x, #0x0094
      0086A9 1F 30            [ 2]  499 	ldw	(0x30, sp), x
      0086AB 1E 30            [ 2]  500 	ldw	x, (0x30, sp)
      0086AD 7F               [ 1]  501 	clr	(x)
                                    502 ;	user/remote.c: 150: for(add = 0;add < MAX_BUFF_CMD;add++)
      0086AE AE 88 2B         [ 2]  503 	ldw	x, #___str_2+0
      0086B1 1F 2E            [ 2]  504 	ldw	(0x2e, sp), x
      0086B3 AE 88 1E         [ 2]  505 	ldw	x, #___str_1+0
      0086B6 1F 2C            [ 2]  506 	ldw	(0x2c, sp), x
      0086B8 1E 32            [ 2]  507 	ldw	x, (0x32, sp)
      0086BA 1C 00 7C         [ 2]  508 	addw	x, #0x007c
      0086BD 1F 24            [ 2]  509 	ldw	(0x24, sp), x
      0086BF AE 88 0F         [ 2]  510 	ldw	x, #___str_0+0
      0086C2 1F 2A            [ 2]  511 	ldw	(0x2a, sp), x
      0086C4 0F 05            [ 1]  512 	clr	(0x05, sp)
      0086C6                        513 00117$:
                                    514 ;	user/remote.c: 152: cm[0] = (remote.cmdBuff[add]&0xFF000000)>>24;
      0086C6 96               [ 1]  515 	ldw	x, sp
      0086C7 5C               [ 2]  516 	incw	x
      0086C8 1F 1C            [ 2]  517 	ldw	(0x1c, sp), x
      0086CA 7B 05            [ 1]  518 	ld	a, (0x05, sp)
      0086CC 97               [ 1]  519 	ld	xl, a
      0086CD 58               [ 2]  520 	sllw	x
      0086CE 58               [ 2]  521 	sllw	x
      0086CF 4F               [ 1]  522 	clr	a
      0086D0 95               [ 1]  523 	ld	xh, a
      0086D1 72 FB 24         [ 2]  524 	addw	x, (0x24, sp)
      0086D4 1F 1E            [ 2]  525 	ldw	(0x1e, sp), x
      0086D6 1E 1E            [ 2]  526 	ldw	x, (0x1e, sp)
      0086D8 89               [ 2]  527 	pushw	x
      0086D9 EE 02            [ 2]  528 	ldw	x, (0x2, x)
      0086DB 51               [ 1]  529 	exgw	x, y
      0086DC 85               [ 2]  530 	popw	x
      0086DD FE               [ 2]  531 	ldw	x, (x)
      0086DE 4F               [ 1]  532 	clr	a
      0086DF 90 5F            [ 1]  533 	clrw	y
      0086E1 9E               [ 1]  534 	ld	a, xh
      0086E2 5F               [ 1]  535 	clrw	x
      0086E3 0F 0A            [ 1]  536 	clr	(0x0a, sp)
      0086E5 1E 1C            [ 2]  537 	ldw	x, (0x1c, sp)
      0086E7 F7               [ 1]  538 	ld	(x), a
                                    539 ;	user/remote.c: 153: cm[1] = (remote.cmdBuff[add]&0x00FF0000)>>16;
      0086E8 1E 1C            [ 2]  540 	ldw	x, (0x1c, sp)
      0086EA 5C               [ 2]  541 	incw	x
      0086EB 1F 1A            [ 2]  542 	ldw	(0x1a, sp), x
      0086ED 1E 1E            [ 2]  543 	ldw	x, (0x1e, sp)
      0086EF 89               [ 2]  544 	pushw	x
      0086F0 EE 02            [ 2]  545 	ldw	x, (0x2, x)
      0086F2 51               [ 1]  546 	exgw	x, y
      0086F3 85               [ 2]  547 	popw	x
      0086F4 FE               [ 2]  548 	ldw	x, (x)
      0086F5 90 5F            [ 1]  549 	clrw	y
      0086F7 4F               [ 1]  550 	clr	a
      0086F8 90 5F            [ 1]  551 	clrw	y
      0086FA 9F               [ 1]  552 	ld	a, xl
      0086FB 1E 1A            [ 2]  553 	ldw	x, (0x1a, sp)
      0086FD F7               [ 1]  554 	ld	(x), a
                                    555 ;	user/remote.c: 154: cm[2] = (remote.cmdBuff[add]&0x0000FF00)>>8;
      0086FE 1E 1C            [ 2]  556 	ldw	x, (0x1c, sp)
      008700 5C               [ 2]  557 	incw	x
      008701 5C               [ 2]  558 	incw	x
      008702 1F 28            [ 2]  559 	ldw	(0x28, sp), x
      008704 1E 1E            [ 2]  560 	ldw	x, (0x1e, sp)
      008706 89               [ 2]  561 	pushw	x
      008707 EE 02            [ 2]  562 	ldw	x, (0x2, x)
      008709 51               [ 1]  563 	exgw	x, y
      00870A 85               [ 2]  564 	popw	x
      00870B FE               [ 2]  565 	ldw	x, (x)
      00870C 0F 19            [ 1]  566 	clr	(0x19, sp)
      00870E 5F               [ 1]  567 	clrw	x
      00870F 4F               [ 1]  568 	clr	a
      008710 90 9E            [ 1]  569 	ld	a, yh
      008712 1E 28            [ 2]  570 	ldw	x, (0x28, sp)
      008714 F7               [ 1]  571 	ld	(x), a
                                    572 ;	user/remote.c: 155: cm[3] = (remote.cmdBuff[add]&0x000000FF)>>0;
      008715 1E 1C            [ 2]  573 	ldw	x, (0x1c, sp)
      008717 1C 00 03         [ 2]  574 	addw	x, #0x0003
      00871A 1F 20            [ 2]  575 	ldw	(0x20, sp), x
      00871C 1E 1E            [ 2]  576 	ldw	x, (0x1e, sp)
      00871E 89               [ 2]  577 	pushw	x
      00871F EE 02            [ 2]  578 	ldw	x, (0x2, x)
      008721 51               [ 1]  579 	exgw	x, y
      008722 85               [ 2]  580 	popw	x
      008723 FE               [ 2]  581 	ldw	x, (x)
      008724 4F               [ 1]  582 	clr	a
      008725 5F               [ 1]  583 	clrw	x
      008726 90 9F            [ 1]  584 	ld	a, yl
      008728 1E 20            [ 2]  585 	ldw	x, (0x20, sp)
      00872A F7               [ 1]  586 	ld	(x), a
                                    587 ;	user/remote.c: 156: debugInfo("Data decoder: ", cm, 4);
      00872B 16 1C            [ 2]  588 	ldw	y, (0x1c, sp)
      00872D 1E 2A            [ 2]  589 	ldw	x, (0x2a, sp)
      00872F 4B 04            [ 1]  590 	push	#0x04
      008731 90 89            [ 2]  591 	pushw	y
      008733 89               [ 2]  592 	pushw	x
      008734 CD 81 33         [ 4]  593 	call	_debugInfo
      008737 5B 05            [ 2]  594 	addw	sp, #5
                                    595 ;	user/remote.c: 157: if(remote.cmdBuff[add] != 0)
      008739 1E 1E            [ 2]  596 	ldw	x, (0x1e, sp)
      00873B E6 03            [ 1]  597 	ld	a, (0x3, x)
      00873D 6B 09            [ 1]  598 	ld	(0x09, sp), a
      00873F E6 02            [ 1]  599 	ld	a, (0x2, x)
      008741 6B 08            [ 1]  600 	ld	(0x08, sp), a
      008743 FE               [ 2]  601 	ldw	x, (x)
      008744 1F 06            [ 2]  602 	ldw	(0x06, sp), x
      008746 1E 08            [ 2]  603 	ldw	x, (0x08, sp)
      008748 26 07            [ 1]  604 	jrne	00167$
      00874A 1E 06            [ 2]  605 	ldw	x, (0x06, sp)
      00874C 26 03            [ 1]  606 	jrne	00167$
      00874E CC 87 FD         [ 2]  607 	jp	00118$
      008751                        608 00167$:
                                    609 ;	user/remote.c: 159: if(remote_CheckCompare(remote.cmdBuff[add], remote.cmdBuff, add, MAX_BUFF_CMD))
      008751 1E 24            [ 2]  610 	ldw	x, (0x24, sp)
      008753 4B 05            [ 1]  611 	push	#0x05
      008755 7B 06            [ 1]  612 	ld	a, (0x06, sp)
      008757 88               [ 1]  613 	push	a
      008758 89               [ 2]  614 	pushw	x
      008759 1E 0C            [ 2]  615 	ldw	x, (0x0c, sp)
      00875B 89               [ 2]  616 	pushw	x
      00875C 1E 0C            [ 2]  617 	ldw	x, (0x0c, sp)
      00875E 89               [ 2]  618 	pushw	x
      00875F CD 84 E5         [ 4]  619 	call	_remote_CheckCompare
      008762 5B 08            [ 2]  620 	addw	sp, #8
      008764 5D               [ 2]  621 	tnzw	x
      008765 26 07            [ 1]  622 	jrne	00168$
      008767 90 5D            [ 2]  623 	tnzw	y
      008769 26 03            [ 1]  624 	jrne	00168$
      00876B CC 87 FD         [ 2]  625 	jp	00118$
      00876E                        626 00168$:
                                    627 ;	user/remote.c: 161: remote.lastCmd = remote.cmdBuff[add];
      00876E 1E 32            [ 2]  628 	ldw	x, (0x32, sp)
      008770 1C 00 90         [ 2]  629 	addw	x, #0x0090
      008773 1F 26            [ 2]  630 	ldw	(0x26, sp), x
      008775 1E 1E            [ 2]  631 	ldw	x, (0x1e, sp)
      008777 89               [ 2]  632 	pushw	x
      008778 EE 02            [ 2]  633 	ldw	x, (0x2, x)
      00877A 51               [ 1]  634 	exgw	x, y
      00877B 85               [ 2]  635 	popw	x
      00877C FE               [ 2]  636 	ldw	x, (x)
      00877D 1F 12            [ 2]  637 	ldw	(0x12, sp), x
      00877F 1E 26            [ 2]  638 	ldw	x, (0x26, sp)
      008781 EF 02            [ 2]  639 	ldw	(0x2, x), y
      008783 16 12            [ 2]  640 	ldw	y, (0x12, sp)
      008785 FF               [ 2]  641 	ldw	(x), y
                                    642 ;	user/remote.c: 162: remote.compareCnt++;
      008786 1E 30            [ 2]  643 	ldw	x, (0x30, sp)
      008788 F6               [ 1]  644 	ld	a, (x)
      008789 4C               [ 1]  645 	inc	a
      00878A F7               [ 1]  646 	ld	(x), a
                                    647 ;	user/remote.c: 163: if(remote.compareCnt >= (MAX_BUFF_CMD - 2))
      00878B A1 03            [ 1]  648 	cp	a, #0x03
      00878D 25 6E            [ 1]  649 	jrc	00118$
                                    650 ;	user/remote.c: 165: remote.compareCnt = 0;
      00878F 1E 30            [ 2]  651 	ldw	x, (0x30, sp)
      008791 7F               [ 1]  652 	clr	(x)
                                    653 ;	user/remote.c: 166: remote.command = remote.lastCmd;
      008792 1E 32            [ 2]  654 	ldw	x, (0x32, sp)
      008794 1C 00 95         [ 2]  655 	addw	x, #0x0095
      008797 1F 22            [ 2]  656 	ldw	(0x22, sp), x
      008799 1E 26            [ 2]  657 	ldw	x, (0x26, sp)
      00879B 89               [ 2]  658 	pushw	x
      00879C EE 02            [ 2]  659 	ldw	x, (0x2, x)
      00879E 51               [ 1]  660 	exgw	x, y
      00879F 85               [ 2]  661 	popw	x
      0087A0 FE               [ 2]  662 	ldw	x, (x)
      0087A1 1F 0E            [ 2]  663 	ldw	(0x0e, sp), x
      0087A3 1E 22            [ 2]  664 	ldw	x, (0x22, sp)
      0087A5 EF 02            [ 2]  665 	ldw	(0x2, x), y
      0087A7 7B 0F            [ 1]  666 	ld	a, (0x0f, sp)
      0087A9 E7 01            [ 1]  667 	ld	(0x1, x), a
      0087AB 7B 0E            [ 1]  668 	ld	a, (0x0e, sp)
      0087AD F7               [ 1]  669 	ld	(x), a
                                    670 ;	user/remote.c: 167: remote.lastCmd = 0;
      0087AE 1E 26            [ 2]  671 	ldw	x, (0x26, sp)
      0087B0 6F 03            [ 1]  672 	clr	(0x3, x)
      0087B2 6F 02            [ 1]  673 	clr	(0x2, x)
      0087B4 6F 01            [ 1]  674 	clr	(0x1, x)
      0087B6 7F               [ 1]  675 	clr	(x)
                                    676 ;	user/remote.c: 168: sys.idKeyGet = remote.command;
      0087B7 AE 00 CD         [ 2]  677 	ldw	x, #_sys+1
      0087BA EF 02            [ 2]  678 	ldw	(0x2, x), y
      0087BC 16 0E            [ 2]  679 	ldw	y, (0x0e, sp)
      0087BE FF               [ 2]  680 	ldw	(x), y
                                    681 ;	user/remote.c: 169: info("Key press \r\n");
      0087BF 1E 2C            [ 2]  682 	ldw	x, (0x2c, sp)
      0087C1 89               [ 2]  683 	pushw	x
      0087C2 CD 81 2B         [ 4]  684 	call	_info
      0087C5 85               [ 2]  685 	popw	x
                                    686 ;	user/remote.c: 175: checkCmd = system_checkID(remote.command);
      0087C6 1E 22            [ 2]  687 	ldw	x, (0x22, sp)
      0087C8 89               [ 2]  688 	pushw	x
      0087C9 EE 02            [ 2]  689 	ldw	x, (0x2, x)
      0087CB 51               [ 1]  690 	exgw	x, y
      0087CC 85               [ 2]  691 	popw	x
      0087CD FE               [ 2]  692 	ldw	x, (x)
      0087CE 90 89            [ 2]  693 	pushw	y
      0087D0 89               [ 2]  694 	pushw	x
      0087D1 CD 89 D1         [ 4]  695 	call	_system_checkID
      0087D4 5B 04            [ 2]  696 	addw	sp, #4
                                    697 ;	user/remote.c: 176: if((checkCmd == 1)&&(ctrCnt == 0))
      0087D6 A1 01            [ 1]  698 	cp	a, #0x01
      0087D8 26 23            [ 1]  699 	jrne	00118$
      0087DA 72 5D 00 E8      [ 1]  700 	tnz	_ctrCnt+0
      0087DE 26 1D            [ 1]  701 	jrne	00118$
                                    702 ;	user/remote.c: 178: GPIO_WriteReverse(CTR_GPIO, CTR_PIN);
      0087E0 4B 04            [ 1]  703 	push	#0x04
      0087E2 4B 0F            [ 1]  704 	push	#0x0f
      0087E4 4B 50            [ 1]  705 	push	#0x50
      0087E6 CD 8F A6         [ 4]  706 	call	_GPIO_WriteReverse
      0087E9 5B 03            [ 2]  707 	addw	sp, #3
                                    708 ;	user/remote.c: 179: info("TurnOn A \r\n");
      0087EB 1E 2E            [ 2]  709 	ldw	x, (0x2e, sp)
      0087ED 89               [ 2]  710 	pushw	x
      0087EE CD 81 2B         [ 4]  711 	call	_info
      0087F1 85               [ 2]  712 	popw	x
                                    713 ;	user/remote.c: 180: ctrCnt = 20;
      0087F2 35 14 00 E8      [ 1]  714 	mov	_ctrCnt+0, #0x14
                                    715 ;	user/remote.c: 181: remote.command = 0;
      0087F6 1E 22            [ 2]  716 	ldw	x, (0x22, sp)
      0087F8 90 5F            [ 1]  717 	clrw	y
      0087FA EF 02            [ 2]  718 	ldw	(0x2, x), y
      0087FC FF               [ 2]  719 	ldw	(x), y
      0087FD                        720 00118$:
                                    721 ;	user/remote.c: 150: for(add = 0;add < MAX_BUFF_CMD;add++)
      0087FD 0C 05            [ 1]  722 	inc	(0x05, sp)
      0087FF 7B 05            [ 1]  723 	ld	a, (0x05, sp)
      008801 A1 05            [ 1]  724 	cp	a, #0x05
      008803 24 03            [ 1]  725 	jrnc	00174$
      008805 CC 86 C6         [ 2]  726 	jp	00117$
      008808                        727 00174$:
                                    728 ;	user/remote.c: 187: remote_Clear();
      008808 CD 85 E2         [ 4]  729 	call	_remote_Clear
                                    730 ;	user/remote.c: 188: enableInterrupts();
      00880B 9A               [ 1]  731 	rim
      00880C                        732 00119$:
      00880C 5B 33            [ 2]  733 	addw	sp, #51
      00880E 81               [ 4]  734 	ret
                                    735 	.area CODE
      00880F                        736 ___str_0:
      00880F 44 61 74 61 20 64 65   737 	.ascii "Data decoder: "
             63 6F 64 65 72 3A 20
      00881D 00                     738 	.db 0x00
      00881E                        739 ___str_1:
      00881E 4B 65 79 20 70 72 65   740 	.ascii "Key press "
             73 73 20
      008828 0D                     741 	.db 0x0d
      008829 0A                     742 	.db 0x0a
      00882A 00                     743 	.db 0x00
      00882B                        744 ___str_2:
      00882B 54 75 72 6E 4F 6E 20   745 	.ascii "TurnOn A "
             41 20
      008834 0D                     746 	.db 0x0d
      008835 0A                     747 	.db 0x0a
      008836 00                     748 	.db 0x00
                                    749 	.area INITIALIZER
      0095DB                        750 __xinit__ctrFlag:
      0095DB 00                     751 	.db #0x00	; 0
      0095DC                        752 __xinit__ctrCnt:
      0095DC 00                     753 	.db #0x00	; 0
                                    754 	.area CABS (ABS)
