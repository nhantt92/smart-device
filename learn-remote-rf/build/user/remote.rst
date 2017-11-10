                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.6.0 #9615 (Mac OS X x86_64)
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
                                     27 	.globl _GPIO_WriteLow
                                     28 	.globl _GPIO_WriteHigh
                                     29 	.globl _GPIO_Init
                                     30 	.globl _EXTI_SetExtIntSensitivity
                                     31 	.globl _CLK_PeripheralClockConfig
                                     32 	.globl _ctrCnt
                                     33 	.globl _ctrFlag
                                     34 	.globl _remote
                                     35 	.globl _remote_Init
                                     36 	.globl _remote_CheckCompare
                                     37 	.globl _remote_Clear
                                     38 	.globl _remote_Process
                                     39 	.globl _remote_Manager
                                     40 ;--------------------------------------------------------
                                     41 ; ram data
                                     42 ;--------------------------------------------------------
                                     43 	.area DATA
      000015                         44 _remote::
      000015                         45 	.ds 159
                                     46 ;--------------------------------------------------------
                                     47 ; ram data
                                     48 ;--------------------------------------------------------
                                     49 	.area INITIALIZED
      0000E7                         50 _ctrFlag::
      0000E7                         51 	.ds 1
      0000E8                         52 _ctrCnt::
      0000E8                         53 	.ds 1
                                     54 ;--------------------------------------------------------
                                     55 ; absolute external ram data
                                     56 ;--------------------------------------------------------
                                     57 	.area DABS (ABS)
                                     58 ;--------------------------------------------------------
                                     59 ; global & static initialisations
                                     60 ;--------------------------------------------------------
                                     61 	.area HOME
                                     62 	.area GSINIT
                                     63 	.area GSFINAL
                                     64 	.area GSINIT
                                     65 ;--------------------------------------------------------
                                     66 ; Home
                                     67 ;--------------------------------------------------------
                                     68 	.area HOME
                                     69 	.area HOME
                                     70 ;--------------------------------------------------------
                                     71 ; code
                                     72 ;--------------------------------------------------------
                                     73 	.area CODE
                                     74 ;	user/remote.c: 19: void TIM1_EnIn(void)
                                     75 ;	-----------------------------------------
                                     76 ;	 function TIM1_EnIn
                                     77 ;	-----------------------------------------
      00846E                         78 _TIM1_EnIn:
                                     79 ;	user/remote.c: 21: TIM1_ClearFlag(TIM1_FLAG_UPDATE); 
      00846E 4B 01            [ 1]   80 	push	#0x01
      008470 4B 00            [ 1]   81 	push	#0x00
      008472 CD 91 39         [ 4]   82 	call	_TIM1_ClearFlag
      008475 85               [ 2]   83 	popw	x
                                     84 ;	user/remote.c: 22: TIM1_ITConfig(TIM1_IT_UPDATE, ENABLE);
      008476 4B 01            [ 1]   85 	push	#0x01
      008478 4B 01            [ 1]   86 	push	#0x01
      00847A CD 90 EA         [ 4]   87 	call	_TIM1_ITConfig
      00847D 85               [ 2]   88 	popw	x
                                     89 ;	user/remote.c: 23: TIM1_SetCounter(0);
      00847E 5F               [ 1]   90 	clrw	x
      00847F 89               [ 2]   91 	pushw	x
      008480 CD 91 0C         [ 4]   92 	call	_TIM1_SetCounter
      008483 85               [ 2]   93 	popw	x
      008484 81               [ 4]   94 	ret
                                     95 ;	user/remote.c: 26: void TIM1_DisIn(void)
                                     96 ;	-----------------------------------------
                                     97 ;	 function TIM1_DisIn
                                     98 ;	-----------------------------------------
      008485                         99 _TIM1_DisIn:
                                    100 ;	user/remote.c: 28: TIM1_ClearFlag(TIM1_FLAG_UPDATE); 
      008485 4B 01            [ 1]  101 	push	#0x01
      008487 4B 00            [ 1]  102 	push	#0x00
      008489 CD 91 39         [ 4]  103 	call	_TIM1_ClearFlag
      00848C 85               [ 2]  104 	popw	x
                                    105 ;	user/remote.c: 29: TIM1_ITConfig(TIM1_IT_UPDATE, DISABLE); 
      00848D 4B 00            [ 1]  106 	push	#0x00
      00848F 4B 01            [ 1]  107 	push	#0x01
      008491 CD 90 EA         [ 4]  108 	call	_TIM1_ITConfig
      008494 85               [ 2]  109 	popw	x
      008495 81               [ 4]  110 	ret
                                    111 ;	user/remote.c: 32: void TIM1_Config(void)
                                    112 ;	-----------------------------------------
                                    113 ;	 function TIM1_Config
                                    114 ;	-----------------------------------------
      008496                        115 _TIM1_Config:
                                    116 ;	user/remote.c: 34: CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1 , ENABLE); 
      008496 4B 01            [ 1]  117 	push	#0x01
      008498 4B 07            [ 1]  118 	push	#0x07
      00849A CD 8D C8         [ 4]  119 	call	_CLK_PeripheralClockConfig
      00849D 85               [ 2]  120 	popw	x
                                    121 ;	user/remote.c: 36: TIM1_DeInit();
      00849E CD 90 10         [ 4]  122 	call	_TIM1_DeInit
                                    123 ;	user/remote.c: 37: TIM1_TimeBaseInit(15, TIM1_COUNTERMODE_UP, 65535, 0);
      0084A1 4B 00            [ 1]  124 	push	#0x00
      0084A3 4B FF            [ 1]  125 	push	#0xff
      0084A5 4B FF            [ 1]  126 	push	#0xff
      0084A7 4B 00            [ 1]  127 	push	#0x00
      0084A9 4B 0F            [ 1]  128 	push	#0x0f
      0084AB 4B 00            [ 1]  129 	push	#0x00
      0084AD CD 90 A9         [ 4]  130 	call	_TIM1_TimeBaseInit
      0084B0 5B 06            [ 2]  131 	addw	sp, #6
                                    132 ;	user/remote.c: 38: TIM1_SetCounter(0);
      0084B2 5F               [ 1]  133 	clrw	x
      0084B3 89               [ 2]  134 	pushw	x
      0084B4 CD 91 0C         [ 4]  135 	call	_TIM1_SetCounter
      0084B7 85               [ 2]  136 	popw	x
                                    137 ;	user/remote.c: 40: TIM1_Cmd(ENABLE);
      0084B8 4B 01            [ 1]  138 	push	#0x01
      0084BA CD 90 DC         [ 4]  139 	call	_TIM1_Cmd
      0084BD 84               [ 1]  140 	pop	a
      0084BE 81               [ 4]  141 	ret
                                    142 ;	user/remote.c: 43: void GPIO_Configuration(void)
                                    143 ;	-----------------------------------------
                                    144 ;	 function GPIO_Configuration
                                    145 ;	-----------------------------------------
      0084BF                        146 _GPIO_Configuration:
                                    147 ;	user/remote.c: 45: GPIO_Init(GPIOD, GPIO_PIN_3, GPIO_MODE_IN_FL_IT);
      0084BF 4B 20            [ 1]  148 	push	#0x20
      0084C1 4B 08            [ 1]  149 	push	#0x08
      0084C3 4B 0F            [ 1]  150 	push	#0x0f
      0084C5 4B 50            [ 1]  151 	push	#0x50
      0084C7 CD 8F 3C         [ 4]  152 	call	_GPIO_Init
      0084CA 5B 04            [ 2]  153 	addw	sp, #4
                                    154 ;	user/remote.c: 47: EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOD, EXTI_SENSITIVITY_RISE_FALL);
      0084CC 4B 03            [ 1]  155 	push	#0x03
      0084CE 4B 03            [ 1]  156 	push	#0x03
      0084D0 CD 8E 8D         [ 4]  157 	call	_EXTI_SetExtIntSensitivity
      0084D3 85               [ 2]  158 	popw	x
      0084D4 81               [ 4]  159 	ret
                                    160 ;	user/remote.c: 50: void remote_Init(void)
                                    161 ;	-----------------------------------------
                                    162 ;	 function remote_Init
                                    163 ;	-----------------------------------------
      0084D5                        164 _remote_Init:
                                    165 ;	user/remote.c: 52: remote_Clear();
      0084D5 CD 85 E3         [ 4]  166 	call	_remote_Clear
                                    167 ;	user/remote.c: 53: remote.command = 0;
      0084D8 AE 00 AA         [ 2]  168 	ldw	x, #_remote+149
      0084DB 90 5F            [ 1]  169 	clrw	y
      0084DD EF 02            [ 2]  170 	ldw	(0x2, x), y
      0084DF FF               [ 2]  171 	ldw	(x), y
                                    172 ;	user/remote.c: 54: TIM1_Config();
      0084E0 CD 84 96         [ 4]  173 	call	_TIM1_Config
                                    174 ;	user/remote.c: 55: GPIO_Configuration();
      0084E3 CC 84 BF         [ 2]  175 	jp	_GPIO_Configuration
                                    176 ;	user/remote.c: 58: uint32_t remote_CheckCompare(uint32_t dat, uint32_t *buf, uint8_t offset, uint8_t len)
                                    177 ;	-----------------------------------------
                                    178 ;	 function remote_CheckCompare
                                    179 ;	-----------------------------------------
      0084E6                        180 _remote_CheckCompare:
      0084E6 52 04            [ 2]  181 	sub	sp, #4
                                    182 ;	user/remote.c: 62: for(add = 0;add < len;add++)
      0084E8 4F               [ 1]  183 	clr	a
      0084E9                        184 00107$:
      0084E9 11 0E            [ 1]  185 	cp	a, (0x0e, sp)
      0084EB 24 2E            [ 1]  186 	jrnc	00105$
                                    187 ;	user/remote.c: 64: if(add == offset)
      0084ED 11 0D            [ 1]  188 	cp	a, (0x0d, sp)
      0084EF 26 01            [ 1]  189 	jrne	00102$
                                    190 ;	user/remote.c: 65: add++;
      0084F1 4C               [ 1]  191 	inc	a
      0084F2                        192 00102$:
                                    193 ;	user/remote.c: 66: if(dat == buf[add])
      0084F2 5F               [ 1]  194 	clrw	x
      0084F3 97               [ 1]  195 	ld	xl, a
      0084F4 58               [ 2]  196 	sllw	x
      0084F5 58               [ 2]  197 	sllw	x
      0084F6 72 FB 0B         [ 2]  198 	addw	x, (0x0b, sp)
      0084F9 88               [ 1]  199 	push	a
      0084FA E6 03            [ 1]  200 	ld	a, (0x3, x)
      0084FC 6B 05            [ 1]  201 	ld	(0x05, sp), a
      0084FE E6 02            [ 1]  202 	ld	a, (0x2, x)
      008500 6B 04            [ 1]  203 	ld	(0x04, sp), a
      008502 FE               [ 2]  204 	ldw	x, (x)
      008503 1F 02            [ 2]  205 	ldw	(0x02, sp), x
      008505 84               [ 1]  206 	pop	a
      008506 1E 09            [ 2]  207 	ldw	x, (0x09, sp)
      008508 13 03            [ 2]  208 	cpw	x, (0x03, sp)
      00850A 26 0C            [ 1]  209 	jrne	00108$
      00850C 1E 07            [ 2]  210 	ldw	x, (0x07, sp)
      00850E 13 01            [ 2]  211 	cpw	x, (0x01, sp)
      008510 26 06            [ 1]  212 	jrne	00108$
                                    213 ;	user/remote.c: 67: return dat;
      008512 1E 09            [ 2]  214 	ldw	x, (0x09, sp)
      008514 16 07            [ 2]  215 	ldw	y, (0x07, sp)
      008516 20 06            [ 2]  216 	jra	00109$
      008518                        217 00108$:
                                    218 ;	user/remote.c: 62: for(add = 0;add < len;add++)
      008518 4C               [ 1]  219 	inc	a
      008519 20 CE            [ 2]  220 	jra	00107$
      00851B                        221 00105$:
                                    222 ;	user/remote.c: 69: return 0;
      00851B 5F               [ 1]  223 	clrw	x
      00851C 90 5F            [ 1]  224 	clrw	y
      00851E                        225 00109$:
      00851E 5B 04            [ 2]  226 	addw	sp, #4
      008520 81               [ 4]  227 	ret
                                    228 ;	user/remote.c: 72: void remote_Decode(void)
                                    229 ;	-----------------------------------------
                                    230 ;	 function remote_Decode
                                    231 ;	-----------------------------------------
      008521                        232 _remote_Decode:
      008521 52 11            [ 2]  233 	sub	sp, #17
                                    234 ;	user/remote.c: 74: uint32_t RC_dataIndex = 0;
      008523 5F               [ 1]  235 	clrw	x
      008524 1F 04            [ 2]  236 	ldw	(0x04, sp), x
      008526 1F 02            [ 2]  237 	ldw	(0x02, sp), x
                                    238 ;	user/remote.c: 76: for(add = 1;add < (BIT_READ*2)+1;add+=2)
      008528 AE 00 15         [ 2]  239 	ldw	x, #_remote+0
      00852B 1F 10            [ 2]  240 	ldw	(0x10, sp), x
      00852D 1E 10            [ 2]  241 	ldw	x, (0x10, sp)
      00852F 1C 00 03         [ 2]  242 	addw	x, #0x0003
      008532 1F 0E            [ 2]  243 	ldw	(0x0e, sp), x
      008534 A6 01            [ 1]  244 	ld	a, #0x01
      008536 6B 01            [ 1]  245 	ld	(0x01, sp), a
      008538                        246 00117$:
                                    247 ;	user/remote.c: 78: if((remote.buff[add] >= MIN_LSB_BIT_TIME_US)&&(remote.buff[add] < MAX_LSB_BIT_TIME_US)&&(remote.buff[add+1] >= MIN_MSB_BIT_TIME_US)&&(remote.buff[add+1] < MAX_MSB_BIT_TIME_US))
      008538 7B 01            [ 1]  248 	ld	a, (0x01, sp)
      00853A 48               [ 1]  249 	sll	a
      00853B 5F               [ 1]  250 	clrw	x
      00853C 97               [ 1]  251 	ld	xl, a
      00853D 72 FB 0E         [ 2]  252 	addw	x, (0x0e, sp)
      008540 FE               [ 2]  253 	ldw	x, (x)
      008541 1F 0C            [ 2]  254 	ldw	(0x0c, sp), x
      008543 7B 01            [ 1]  255 	ld	a, (0x01, sp)
      008545 4C               [ 1]  256 	inc	a
      008546 48               [ 1]  257 	sll	a
      008547 97               [ 1]  258 	ld	xl, a
      008548 4F               [ 1]  259 	clr	a
      008549 95               [ 1]  260 	ld	xh, a
      00854A 72 FB 0E         [ 2]  261 	addw	x, (0x0e, sp)
      00854D 1F 0A            [ 2]  262 	ldw	(0x0a, sp), x
      00854F 1E 0C            [ 2]  263 	ldw	x, (0x0c, sp)
      008551 A3 00 64         [ 2]  264 	cpw	x, #0x0064
      008554 25 14            [ 1]  265 	jrc	00108$
      008556 1E 0C            [ 2]  266 	ldw	x, (0x0c, sp)
      008558 A3 01 2C         [ 2]  267 	cpw	x, #0x012c
      00855B 24 0D            [ 1]  268 	jrnc	00108$
      00855D 1E 0A            [ 2]  269 	ldw	x, (0x0a, sp)
      00855F FE               [ 2]  270 	ldw	x, (x)
      008560 A3 01 F4         [ 2]  271 	cpw	x, #0x01f4
      008563 25 05            [ 1]  272 	jrc	00108$
      008565 A3 02 BC         [ 2]  273 	cpw	x, #0x02bc
      008568 25 2E            [ 1]  274 	jrc	00109$
                                    275 ;	user/remote.c: 79: RC_dataIndex |= 0;
      00856A                        276 00108$:
                                    277 ;	user/remote.c: 80: else if((remote.buff[add] >= MIN_MSB_BIT_TIME_US)&&(remote.buff[add] < MAX_MSB_BIT_TIME_US)&&(remote.buff[add+1] >= MIN_LSB_BIT_TIME_US)&&(remote.buff[add+1] < MAX_LSB_BIT_TIME_US))
      00856A 1E 0C            [ 2]  278 	ldw	x, (0x0c, sp)
      00856C A3 01 F4         [ 2]  279 	cpw	x, #0x01f4
      00856F 25 6F            [ 1]  280 	jrc	00119$
      008571 1E 0C            [ 2]  281 	ldw	x, (0x0c, sp)
      008573 A3 02 BC         [ 2]  282 	cpw	x, #0x02bc
      008576 24 68            [ 1]  283 	jrnc	00119$
      008578 1E 0A            [ 2]  284 	ldw	x, (0x0a, sp)
      00857A FE               [ 2]  285 	ldw	x, (x)
      00857B A3 00 64         [ 2]  286 	cpw	x, #0x0064
      00857E 25 60            [ 1]  287 	jrc	00119$
      008580 A3 01 2C         [ 2]  288 	cpw	x, #0x012c
      008583 24 5B            [ 1]  289 	jrnc	00119$
                                    290 ;	user/remote.c: 81: RC_dataIndex |= 1;
      008585 1E 04            [ 2]  291 	ldw	x, (0x04, sp)
      008587 54               [ 2]  292 	srlw	x
      008588 99               [ 1]  293 	scf
      008589 59               [ 2]  294 	rlcw	x
      00858A 7B 03            [ 1]  295 	ld	a, (0x03, sp)
      00858C 90 97            [ 1]  296 	ld	yl, a
      00858E 7B 02            [ 1]  297 	ld	a, (0x02, sp)
      008590 90 95            [ 1]  298 	ld	yh, a
      008592 1F 04            [ 2]  299 	ldw	(0x04, sp), x
      008594 17 02            [ 2]  300 	ldw	(0x02, sp), y
                                    301 ;	user/remote.c: 83: return;
      008596 20 00            [ 2]  302 	jra	00109$
      008598                        303 00109$:
                                    304 ;	user/remote.c: 84: RC_dataIndex <<= 1;
      008598 1E 04            [ 2]  305 	ldw	x, (0x04, sp)
      00859A 16 02            [ 2]  306 	ldw	y, (0x02, sp)
      00859C 58               [ 2]  307 	sllw	x
      00859D 90 59            [ 2]  308 	rlcw	y
      00859F 1F 04            [ 2]  309 	ldw	(0x04, sp), x
      0085A1 17 02            [ 2]  310 	ldw	(0x02, sp), y
                                    311 ;	user/remote.c: 76: for(add = 1;add < (BIT_READ*2)+1;add+=2)
      0085A3 0C 01            [ 1]  312 	inc	(0x01, sp)
      0085A5 0C 01            [ 1]  313 	inc	(0x01, sp)
      0085A7 7B 01            [ 1]  314 	ld	a, (0x01, sp)
      0085A9 A1 31            [ 1]  315 	cp	a, #0x31
      0085AB 25 8B            [ 1]  316 	jrc	00117$
                                    317 ;	user/remote.c: 86: remote.cmdBuff[remote.cntCmd] = RC_dataIndex;
      0085AD 1E 10            [ 2]  318 	ldw	x, (0x10, sp)
      0085AF 1C 00 7C         [ 2]  319 	addw	x, #0x007c
      0085B2 1F 08            [ 2]  320 	ldw	(0x08, sp), x
      0085B4 1E 10            [ 2]  321 	ldw	x, (0x10, sp)
      0085B6 1C 00 7B         [ 2]  322 	addw	x, #0x007b
      0085B9 1F 06            [ 2]  323 	ldw	(0x06, sp), x
      0085BB 1E 06            [ 2]  324 	ldw	x, (0x06, sp)
      0085BD F6               [ 1]  325 	ld	a, (x)
      0085BE 48               [ 1]  326 	sll	a
      0085BF 48               [ 1]  327 	sll	a
      0085C0 5F               [ 1]  328 	clrw	x
      0085C1 97               [ 1]  329 	ld	xl, a
      0085C2 72 FB 08         [ 2]  330 	addw	x, (0x08, sp)
      0085C5 16 04            [ 2]  331 	ldw	y, (0x04, sp)
      0085C7 EF 02            [ 2]  332 	ldw	(0x2, x), y
      0085C9 16 02            [ 2]  333 	ldw	y, (0x02, sp)
      0085CB FF               [ 2]  334 	ldw	(x), y
                                    335 ;	user/remote.c: 87: if(remote.cntCmd < (MAX_BUFF_CMD-1))
      0085CC 1E 06            [ 2]  336 	ldw	x, (0x06, sp)
      0085CE F6               [ 1]  337 	ld	a, (x)
      0085CF A1 04            [ 1]  338 	cp	a, #0x04
      0085D1 24 06            [ 1]  339 	jrnc	00115$
                                    340 ;	user/remote.c: 88: remote.cntCmd++;
      0085D3 4C               [ 1]  341 	inc	a
      0085D4 1E 06            [ 2]  342 	ldw	x, (0x06, sp)
      0085D6 F7               [ 1]  343 	ld	(x), a
      0085D7 20 07            [ 2]  344 	jra	00119$
      0085D9                        345 00115$:
                                    346 ;	user/remote.c: 90: remote.flag = 1;
      0085D9 1E 10            [ 2]  347 	ldw	x, (0x10, sp)
      0085DB 5C               [ 2]  348 	incw	x
      0085DC 5C               [ 2]  349 	incw	x
      0085DD A6 01            [ 1]  350 	ld	a, #0x01
      0085DF F7               [ 1]  351 	ld	(x), a
      0085E0                        352 00119$:
      0085E0 5B 11            [ 2]  353 	addw	sp, #17
      0085E2 81               [ 4]  354 	ret
                                    355 ;	user/remote.c: 93: void remote_Clear(void)
                                    356 ;	-----------------------------------------
                                    357 ;	 function remote_Clear
                                    358 ;	-----------------------------------------
      0085E3                        359 _remote_Clear:
      0085E3 89               [ 2]  360 	pushw	x
                                    361 ;	user/remote.c: 95: remote.startBit = 0;
      0085E4 AE 00 15         [ 2]  362 	ldw	x, #_remote+0
      0085E7 7F               [ 1]  363 	clr	(x)
                                    364 ;	user/remote.c: 96: remote.cnt = 0;
      0085E8 AE 00 15         [ 2]  365 	ldw	x, #_remote+0
      0085EB 1F 01            [ 2]  366 	ldw	(0x01, sp), x
      0085ED 1E 01            [ 2]  367 	ldw	x, (0x01, sp)
      0085EF 5C               [ 2]  368 	incw	x
      0085F0 7F               [ 1]  369 	clr	(x)
                                    370 ;	user/remote.c: 97: remote.cntCmd = 0;
      0085F1 1E 01            [ 2]  371 	ldw	x, (0x01, sp)
      0085F3 1C 00 7B         [ 2]  372 	addw	x, #0x007b
      0085F6 7F               [ 1]  373 	clr	(x)
                                    374 ;	user/remote.c: 98: remote.flag = 0;
      0085F7 1E 01            [ 2]  375 	ldw	x, (0x01, sp)
      0085F9 5C               [ 2]  376 	incw	x
      0085FA 5C               [ 2]  377 	incw	x
      0085FB 7F               [ 1]  378 	clr	(x)
                                    379 ;	user/remote.c: 99: remote.lastCmd = 0;
      0085FC 1E 01            [ 2]  380 	ldw	x, (0x01, sp)
      0085FE 1C 00 90         [ 2]  381 	addw	x, #0x0090
      008601 90 5F            [ 1]  382 	clrw	y
      008603 EF 02            [ 2]  383 	ldw	(0x2, x), y
      008605 FF               [ 2]  384 	ldw	(x), y
                                    385 ;	user/remote.c: 100: remote.compareCnt = 0;
      008606 1E 01            [ 2]  386 	ldw	x, (0x01, sp)
      008608 1C 00 94         [ 2]  387 	addw	x, #0x0094
      00860B 7F               [ 1]  388 	clr	(x)
      00860C 85               [ 2]  389 	popw	x
      00860D 81               [ 4]  390 	ret
                                    391 ;	user/remote.c: 103: void remote_Process(void)
                                    392 ;	-----------------------------------------
                                    393 ;	 function remote_Process
                                    394 ;	-----------------------------------------
      00860E                        395 _remote_Process:
      00860E 52 08            [ 2]  396 	sub	sp, #8
                                    397 ;	user/remote.c: 106: TIM1_DisIn();
      008610 CD 84 85         [ 4]  398 	call	_TIM1_DisIn
                                    399 ;	user/remote.c: 107: dat = TIM1_GetCounter();
      008613 CD 91 1D         [ 4]  400 	call	_TIM1_GetCounter
      008616 1F 01            [ 2]  401 	ldw	(0x01, sp), x
      008618 16 01            [ 2]  402 	ldw	y, (0x01, sp)
                                    403 ;	user/remote.c: 108: if((dat >= MIN_SYN_BIT_TIME_US)&&(dat < MAX_SYN_BIT_TIME_US))
      00861A 90 A3 15 7C      [ 2]  404 	cpw	y, #0x157c
      00861E 25 14            [ 1]  405 	jrc	00104$
      008620 90 A3 19 64      [ 2]  406 	cpw	y, #0x1964
      008624 24 0E            [ 1]  407 	jrnc	00104$
                                    408 ;	user/remote.c: 110: if(remote.startBit == 0)
      008626 AE 00 15         [ 2]  409 	ldw	x, #_remote+0
      008629 F6               [ 1]  410 	ld	a, (x)
      00862A 4D               [ 1]  411 	tnz	a
      00862B 26 07            [ 1]  412 	jrne	00104$
                                    413 ;	user/remote.c: 112: remote.startBit = 1;
      00862D A6 01            [ 1]  414 	ld	a, #0x01
      00862F F7               [ 1]  415 	ld	(x), a
                                    416 ;	user/remote.c: 113: remote.cnt = 0;
      008630 AE 00 16         [ 2]  417 	ldw	x, #_remote+1
      008633 7F               [ 1]  418 	clr	(x)
      008634                        419 00104$:
                                    420 ;	user/remote.c: 116: if(remote.startBit == 1)
      008634 AE 00 15         [ 2]  421 	ldw	x, #_remote+0
      008637 F6               [ 1]  422 	ld	a, (x)
      008638 A1 01            [ 1]  423 	cp	a, #0x01
      00863A 26 2D            [ 1]  424 	jrne	00109$
                                    425 ;	user/remote.c: 118: remote.buff[remote.cnt] = dat;
      00863C AE 00 15         [ 2]  426 	ldw	x, #_remote+0
      00863F 1F 07            [ 2]  427 	ldw	(0x07, sp), x
      008641 1E 07            [ 2]  428 	ldw	x, (0x07, sp)
      008643 1C 00 03         [ 2]  429 	addw	x, #0x0003
      008646 1F 05            [ 2]  430 	ldw	(0x05, sp), x
      008648 1E 07            [ 2]  431 	ldw	x, (0x07, sp)
      00864A 5C               [ 2]  432 	incw	x
      00864B 1F 03            [ 2]  433 	ldw	(0x03, sp), x
      00864D 1E 03            [ 2]  434 	ldw	x, (0x03, sp)
      00864F F6               [ 1]  435 	ld	a, (x)
      008650 48               [ 1]  436 	sll	a
      008651 5F               [ 1]  437 	clrw	x
      008652 97               [ 1]  438 	ld	xl, a
      008653 72 FB 05         [ 2]  439 	addw	x, (0x05, sp)
      008656 FF               [ 2]  440 	ldw	(x), y
                                    441 ;	user/remote.c: 119: if(++remote.cnt > (MAX_BIT_READ*2))
      008657 1E 03            [ 2]  442 	ldw	x, (0x03, sp)
      008659 F6               [ 1]  443 	ld	a, (x)
      00865A 4C               [ 1]  444 	inc	a
      00865B F7               [ 1]  445 	ld	(x), a
      00865C A1 32            [ 1]  446 	cp	a, #0x32
      00865E 23 09            [ 2]  447 	jrule	00109$
                                    448 ;	user/remote.c: 121: remote.startBit = 0;
      008660 1E 07            [ 2]  449 	ldw	x, (0x07, sp)
      008662 7F               [ 1]  450 	clr	(x)
                                    451 ;	user/remote.c: 122: remote.cnt = 0;
      008663 1E 03            [ 2]  452 	ldw	x, (0x03, sp)
      008665 7F               [ 1]  453 	clr	(x)
                                    454 ;	user/remote.c: 123: remote_Decode();
      008666 CD 85 21         [ 4]  455 	call	_remote_Decode
      008669                        456 00109$:
                                    457 ;	user/remote.c: 126: TIM1_EnIn();
      008669 CD 84 6E         [ 4]  458 	call	_TIM1_EnIn
      00866C 5B 08            [ 2]  459 	addw	sp, #8
      00866E 81               [ 4]  460 	ret
                                    461 ;	user/remote.c: 131: void remote_Manager(void)
                                    462 ;	-----------------------------------------
                                    463 ;	 function remote_Manager
                                    464 ;	-----------------------------------------
      00866F                        465 _remote_Manager:
      00866F 52 33            [ 2]  466 	sub	sp, #51
                                    467 ;	user/remote.c: 136: if(TIMER_CheckTimeMS(&remote.time, 100) == 0)
      008671 AE 00 15         [ 2]  468 	ldw	x, #_remote+0
      008674 1F 32            [ 2]  469 	ldw	(0x32, sp), x
      008676 1E 32            [ 2]  470 	ldw	x, (0x32, sp)
      008678 1C 00 99         [ 2]  471 	addw	x, #0x0099
      00867B 4B 64            [ 1]  472 	push	#0x64
      00867D 4B 00            [ 1]  473 	push	#0x00
      00867F 4B 00            [ 1]  474 	push	#0x00
      008681 4B 00            [ 1]  475 	push	#0x00
      008683 89               [ 2]  476 	pushw	x
      008684 CD 8C FA         [ 4]  477 	call	_TIMER_CheckTimeMS
      008687 5B 06            [ 2]  478 	addw	sp, #6
      008689 4D               [ 1]  479 	tnz	a
      00868A 27 03            [ 1]  480 	jreq	00163$
      00868C CC 88 1A         [ 2]  481 	jp	00120$
      00868F                        482 00163$:
                                    483 ;	user/remote.c: 139: if(ctrCnt != 0)ctrCnt--;
      00868F 72 5D 00 E8      [ 1]  484 	tnz	_ctrCnt+0
      008693 27 06            [ 1]  485 	jreq	00102$
      008695 72 5A 00 E8      [ 1]  486 	dec	_ctrCnt+0
      008699 20 0B            [ 2]  487 	jra	00103$
      00869B                        488 00102$:
                                    489 ;	user/remote.c: 142: GPIO_WriteLow(CTR_GPIO, CTR_PIN);
      00869B 4B 04            [ 1]  490 	push	#0x04
      00869D 4B 0F            [ 1]  491 	push	#0x0f
      00869F 4B 50            [ 1]  492 	push	#0x50
      0086A1 CD 8F C1         [ 4]  493 	call	_GPIO_WriteLow
      0086A4 5B 03            [ 2]  494 	addw	sp, #3
      0086A6                        495 00103$:
                                    496 ;	user/remote.c: 144: if(remote.flag == 1)
      0086A6 1E 32            [ 2]  497 	ldw	x, (0x32, sp)
      0086A8 E6 02            [ 1]  498 	ld	a, (0x2, x)
      0086AA A1 01            [ 1]  499 	cp	a, #0x01
      0086AC 27 03            [ 1]  500 	jreq	00167$
      0086AE CC 88 1A         [ 2]  501 	jp	00120$
      0086B1                        502 00167$:
                                    503 ;	user/remote.c: 146: disableInterrupts();
      0086B1 9B               [ 1]  504 	sim
                                    505 ;	user/remote.c: 147: remote.compareCnt = 0;
      0086B2 1E 32            [ 2]  506 	ldw	x, (0x32, sp)
      0086B4 1C 00 94         [ 2]  507 	addw	x, #0x0094
      0086B7 1F 30            [ 2]  508 	ldw	(0x30, sp), x
      0086B9 1E 30            [ 2]  509 	ldw	x, (0x30, sp)
      0086BB 7F               [ 1]  510 	clr	(x)
                                    511 ;	user/remote.c: 148: for(add = 0;add < MAX_BUFF_CMD;add++)
      0086BC AE 88 39         [ 2]  512 	ldw	x, #___str_2+0
      0086BF 1F 2E            [ 2]  513 	ldw	(0x2e, sp), x
      0086C1 AE 88 2C         [ 2]  514 	ldw	x, #___str_1+0
      0086C4 1F 2C            [ 2]  515 	ldw	(0x2c, sp), x
      0086C6 1E 32            [ 2]  516 	ldw	x, (0x32, sp)
      0086C8 1C 00 7C         [ 2]  517 	addw	x, #0x007c
      0086CB 1F 2A            [ 2]  518 	ldw	(0x2a, sp), x
      0086CD AE 88 1D         [ 2]  519 	ldw	x, #___str_0+0
      0086D0 1F 28            [ 2]  520 	ldw	(0x28, sp), x
      0086D2 0F 05            [ 1]  521 	clr	(0x05, sp)
      0086D4                        522 00118$:
                                    523 ;	user/remote.c: 150: cm[0] = (remote.cmdBuff[add]&0xFF000000)>>24;
      0086D4 96               [ 1]  524 	ldw	x, sp
      0086D5 5C               [ 2]  525 	incw	x
      0086D6 1F 26            [ 2]  526 	ldw	(0x26, sp), x
      0086D8 7B 05            [ 1]  527 	ld	a, (0x05, sp)
      0086DA 97               [ 1]  528 	ld	xl, a
      0086DB 58               [ 2]  529 	sllw	x
      0086DC 58               [ 2]  530 	sllw	x
      0086DD 4F               [ 1]  531 	clr	a
      0086DE 95               [ 1]  532 	ld	xh, a
      0086DF 72 FB 2A         [ 2]  533 	addw	x, (0x2a, sp)
      0086E2 1F 24            [ 2]  534 	ldw	(0x24, sp), x
      0086E4 1E 24            [ 2]  535 	ldw	x, (0x24, sp)
      0086E6 89               [ 2]  536 	pushw	x
      0086E7 EE 02            [ 2]  537 	ldw	x, (0x2, x)
      0086E9 51               [ 1]  538 	exgw	x, y
      0086EA 85               [ 2]  539 	popw	x
      0086EB FE               [ 2]  540 	ldw	x, (x)
      0086EC 4F               [ 1]  541 	clr	a
      0086ED 90 5F            [ 1]  542 	clrw	y
      0086EF 9E               [ 1]  543 	ld	a, xh
      0086F0 5F               [ 1]  544 	clrw	x
      0086F1 0F 20            [ 1]  545 	clr	(0x20, sp)
      0086F3 1E 26            [ 2]  546 	ldw	x, (0x26, sp)
      0086F5 F7               [ 1]  547 	ld	(x), a
                                    548 ;	user/remote.c: 151: cm[1] = (remote.cmdBuff[add]&0x00FF0000)>>16;
      0086F6 1E 26            [ 2]  549 	ldw	x, (0x26, sp)
      0086F8 5C               [ 2]  550 	incw	x
      0086F9 1F 1E            [ 2]  551 	ldw	(0x1e, sp), x
      0086FB 1E 24            [ 2]  552 	ldw	x, (0x24, sp)
      0086FD 89               [ 2]  553 	pushw	x
      0086FE EE 02            [ 2]  554 	ldw	x, (0x2, x)
      008700 51               [ 1]  555 	exgw	x, y
      008701 85               [ 2]  556 	popw	x
      008702 FE               [ 2]  557 	ldw	x, (x)
      008703 90 5F            [ 1]  558 	clrw	y
      008705 4F               [ 1]  559 	clr	a
      008706 90 5F            [ 1]  560 	clrw	y
      008708 9F               [ 1]  561 	ld	a, xl
      008709 1E 1E            [ 2]  562 	ldw	x, (0x1e, sp)
      00870B F7               [ 1]  563 	ld	(x), a
                                    564 ;	user/remote.c: 152: cm[2] = (remote.cmdBuff[add]&0x0000FF00)>>8;
      00870C 1E 26            [ 2]  565 	ldw	x, (0x26, sp)
      00870E 5C               [ 2]  566 	incw	x
      00870F 5C               [ 2]  567 	incw	x
      008710 1F 1C            [ 2]  568 	ldw	(0x1c, sp), x
      008712 1E 24            [ 2]  569 	ldw	x, (0x24, sp)
      008714 89               [ 2]  570 	pushw	x
      008715 EE 02            [ 2]  571 	ldw	x, (0x2, x)
      008717 51               [ 1]  572 	exgw	x, y
      008718 85               [ 2]  573 	popw	x
      008719 FE               [ 2]  574 	ldw	x, (x)
      00871A 0F 1B            [ 1]  575 	clr	(0x1b, sp)
      00871C 5F               [ 1]  576 	clrw	x
      00871D 4F               [ 1]  577 	clr	a
      00871E 90 9E            [ 1]  578 	ld	a, yh
      008720 1E 1C            [ 2]  579 	ldw	x, (0x1c, sp)
      008722 F7               [ 1]  580 	ld	(x), a
                                    581 ;	user/remote.c: 153: cm[3] = (remote.cmdBuff[add]&0x000000FF)>>0;
      008723 1E 26            [ 2]  582 	ldw	x, (0x26, sp)
      008725 1C 00 03         [ 2]  583 	addw	x, #0x0003
      008728 1F 16            [ 2]  584 	ldw	(0x16, sp), x
      00872A 1E 24            [ 2]  585 	ldw	x, (0x24, sp)
      00872C 89               [ 2]  586 	pushw	x
      00872D EE 02            [ 2]  587 	ldw	x, (0x2, x)
      00872F 51               [ 1]  588 	exgw	x, y
      008730 85               [ 2]  589 	popw	x
      008731 FE               [ 2]  590 	ldw	x, (x)
      008732 4F               [ 1]  591 	clr	a
      008733 5F               [ 1]  592 	clrw	x
      008734 90 9F            [ 1]  593 	ld	a, yl
      008736 1E 16            [ 2]  594 	ldw	x, (0x16, sp)
      008738 F7               [ 1]  595 	ld	(x), a
                                    596 ;	user/remote.c: 154: debugInfo("Data decoder: ", cm, 4);
      008739 16 26            [ 2]  597 	ldw	y, (0x26, sp)
      00873B 1E 28            [ 2]  598 	ldw	x, (0x28, sp)
      00873D 4B 04            [ 1]  599 	push	#0x04
      00873F 90 89            [ 2]  600 	pushw	y
      008741 89               [ 2]  601 	pushw	x
      008742 CD 81 33         [ 4]  602 	call	_debugInfo
      008745 5B 05            [ 2]  603 	addw	sp, #5
                                    604 ;	user/remote.c: 155: if(remote.cmdBuff[add] != 0)
      008747 1E 24            [ 2]  605 	ldw	x, (0x24, sp)
      008749 E6 03            [ 1]  606 	ld	a, (0x3, x)
      00874B 6B 15            [ 1]  607 	ld	(0x15, sp), a
      00874D E6 02            [ 1]  608 	ld	a, (0x2, x)
      00874F 6B 14            [ 1]  609 	ld	(0x14, sp), a
      008751 FE               [ 2]  610 	ldw	x, (x)
      008752 1F 12            [ 2]  611 	ldw	(0x12, sp), x
      008754 1E 14            [ 2]  612 	ldw	x, (0x14, sp)
      008756 26 07            [ 1]  613 	jrne	00168$
      008758 1E 12            [ 2]  614 	ldw	x, (0x12, sp)
      00875A 26 03            [ 1]  615 	jrne	00168$
      00875C CC 88 0B         [ 2]  616 	jp	00119$
      00875F                        617 00168$:
                                    618 ;	user/remote.c: 157: if(remote_CheckCompare(remote.cmdBuff[add], remote.cmdBuff, add, MAX_BUFF_CMD))
      00875F 1E 2A            [ 2]  619 	ldw	x, (0x2a, sp)
      008761 4B 05            [ 1]  620 	push	#0x05
      008763 7B 06            [ 1]  621 	ld	a, (0x06, sp)
      008765 88               [ 1]  622 	push	a
      008766 89               [ 2]  623 	pushw	x
      008767 1E 18            [ 2]  624 	ldw	x, (0x18, sp)
      008769 89               [ 2]  625 	pushw	x
      00876A 1E 18            [ 2]  626 	ldw	x, (0x18, sp)
      00876C 89               [ 2]  627 	pushw	x
      00876D CD 84 E6         [ 4]  628 	call	_remote_CheckCompare
      008770 5B 08            [ 2]  629 	addw	sp, #8
      008772 5D               [ 2]  630 	tnzw	x
      008773 26 07            [ 1]  631 	jrne	00169$
      008775 90 5D            [ 2]  632 	tnzw	y
      008777 26 03            [ 1]  633 	jrne	00169$
      008779 CC 88 0B         [ 2]  634 	jp	00119$
      00877C                        635 00169$:
                                    636 ;	user/remote.c: 159: remote.lastCmd = remote.cmdBuff[add];
      00877C 1E 32            [ 2]  637 	ldw	x, (0x32, sp)
      00877E 1C 00 90         [ 2]  638 	addw	x, #0x0090
      008781 1F 10            [ 2]  639 	ldw	(0x10, sp), x
      008783 1E 24            [ 2]  640 	ldw	x, (0x24, sp)
      008785 89               [ 2]  641 	pushw	x
      008786 EE 02            [ 2]  642 	ldw	x, (0x2, x)
      008788 51               [ 1]  643 	exgw	x, y
      008789 85               [ 2]  644 	popw	x
      00878A FE               [ 2]  645 	ldw	x, (x)
      00878B 1F 0C            [ 2]  646 	ldw	(0x0c, sp), x
      00878D 1E 10            [ 2]  647 	ldw	x, (0x10, sp)
      00878F EF 02            [ 2]  648 	ldw	(0x2, x), y
      008791 16 0C            [ 2]  649 	ldw	y, (0x0c, sp)
      008793 FF               [ 2]  650 	ldw	(x), y
                                    651 ;	user/remote.c: 160: remote.compareCnt++;
      008794 1E 30            [ 2]  652 	ldw	x, (0x30, sp)
      008796 F6               [ 1]  653 	ld	a, (x)
      008797 4C               [ 1]  654 	inc	a
      008798 F7               [ 1]  655 	ld	(x), a
                                    656 ;	user/remote.c: 161: if(remote.compareCnt >= (MAX_BUFF_CMD - 2))
      008799 A1 03            [ 1]  657 	cp	a, #0x03
      00879B 25 6E            [ 1]  658 	jrc	00119$
                                    659 ;	user/remote.c: 163: remote.compareCnt = 0;
      00879D 1E 30            [ 2]  660 	ldw	x, (0x30, sp)
      00879F 7F               [ 1]  661 	clr	(x)
                                    662 ;	user/remote.c: 164: remote.command = remote.lastCmd;
      0087A0 1E 32            [ 2]  663 	ldw	x, (0x32, sp)
      0087A2 1C 00 95         [ 2]  664 	addw	x, #0x0095
      0087A5 1F 0A            [ 2]  665 	ldw	(0x0a, sp), x
      0087A7 1E 10            [ 2]  666 	ldw	x, (0x10, sp)
      0087A9 89               [ 2]  667 	pushw	x
      0087AA EE 02            [ 2]  668 	ldw	x, (0x2, x)
      0087AC 51               [ 1]  669 	exgw	x, y
      0087AD 85               [ 2]  670 	popw	x
      0087AE FE               [ 2]  671 	ldw	x, (x)
      0087AF 1F 06            [ 2]  672 	ldw	(0x06, sp), x
      0087B1 1E 0A            [ 2]  673 	ldw	x, (0x0a, sp)
      0087B3 EF 02            [ 2]  674 	ldw	(0x2, x), y
      0087B5 7B 07            [ 1]  675 	ld	a, (0x07, sp)
      0087B7 E7 01            [ 1]  676 	ld	(0x1, x), a
      0087B9 7B 06            [ 1]  677 	ld	a, (0x06, sp)
      0087BB F7               [ 1]  678 	ld	(x), a
                                    679 ;	user/remote.c: 165: remote.lastCmd = 0;
      0087BC 1E 10            [ 2]  680 	ldw	x, (0x10, sp)
      0087BE 6F 03            [ 1]  681 	clr	(0x3, x)
      0087C0 6F 02            [ 1]  682 	clr	(0x2, x)
      0087C2 6F 01            [ 1]  683 	clr	(0x1, x)
      0087C4 7F               [ 1]  684 	clr	(x)
                                    685 ;	user/remote.c: 166: sys.idKeyGet = remote.command;
      0087C5 AE 00 CD         [ 2]  686 	ldw	x, #_sys+1
      0087C8 EF 02            [ 2]  687 	ldw	(0x2, x), y
      0087CA 16 06            [ 2]  688 	ldw	y, (0x06, sp)
      0087CC FF               [ 2]  689 	ldw	(x), y
                                    690 ;	user/remote.c: 167: info("Key press \r\n");
      0087CD 1E 2C            [ 2]  691 	ldw	x, (0x2c, sp)
      0087CF 89               [ 2]  692 	pushw	x
      0087D0 CD 81 2B         [ 4]  693 	call	_info
      0087D3 85               [ 2]  694 	popw	x
                                    695 ;	user/remote.c: 173: checkCmd = system_checkID(remote.command);
      0087D4 1E 0A            [ 2]  696 	ldw	x, (0x0a, sp)
      0087D6 89               [ 2]  697 	pushw	x
      0087D7 EE 02            [ 2]  698 	ldw	x, (0x2, x)
      0087D9 51               [ 1]  699 	exgw	x, y
      0087DA 85               [ 2]  700 	popw	x
      0087DB FE               [ 2]  701 	ldw	x, (x)
      0087DC 90 89            [ 2]  702 	pushw	y
      0087DE 89               [ 2]  703 	pushw	x
      0087DF CD 89 DF         [ 4]  704 	call	_system_checkID
      0087E2 5B 04            [ 2]  705 	addw	sp, #4
                                    706 ;	user/remote.c: 174: if((checkCmd == 1)&&(ctrCnt == 0))
      0087E4 A1 01            [ 1]  707 	cp	a, #0x01
      0087E6 26 23            [ 1]  708 	jrne	00119$
      0087E8 72 5D 00 E8      [ 1]  709 	tnz	_ctrCnt+0
      0087EC 26 1D            [ 1]  710 	jrne	00119$
                                    711 ;	user/remote.c: 176: GPIO_WriteHigh(CTR_GPIO, CTR_PIN);
      0087EE 4B 04            [ 1]  712 	push	#0x04
      0087F0 4B 0F            [ 1]  713 	push	#0x0f
      0087F2 4B 50            [ 1]  714 	push	#0x50
      0087F4 CD 8F BA         [ 4]  715 	call	_GPIO_WriteHigh
      0087F7 5B 03            [ 2]  716 	addw	sp, #3
                                    717 ;	user/remote.c: 177: info("TurnOn A \r\n");
      0087F9 1E 2E            [ 2]  718 	ldw	x, (0x2e, sp)
      0087FB 89               [ 2]  719 	pushw	x
      0087FC CD 81 2B         [ 4]  720 	call	_info
      0087FF 85               [ 2]  721 	popw	x
                                    722 ;	user/remote.c: 178: ctrCnt = 20;
      008800 35 14 00 E8      [ 1]  723 	mov	_ctrCnt+0, #0x14
                                    724 ;	user/remote.c: 179: remote.command = 0;
      008804 1E 0A            [ 2]  725 	ldw	x, (0x0a, sp)
      008806 90 5F            [ 1]  726 	clrw	y
      008808 EF 02            [ 2]  727 	ldw	(0x2, x), y
      00880A FF               [ 2]  728 	ldw	(x), y
      00880B                        729 00119$:
                                    730 ;	user/remote.c: 148: for(add = 0;add < MAX_BUFF_CMD;add++)
      00880B 0C 05            [ 1]  731 	inc	(0x05, sp)
      00880D 7B 05            [ 1]  732 	ld	a, (0x05, sp)
      00880F A1 05            [ 1]  733 	cp	a, #0x05
      008811 24 03            [ 1]  734 	jrnc	00175$
      008813 CC 86 D4         [ 2]  735 	jp	00118$
      008816                        736 00175$:
                                    737 ;	user/remote.c: 185: remote_Clear();
      008816 CD 85 E3         [ 4]  738 	call	_remote_Clear
                                    739 ;	user/remote.c: 186: enableInterrupts();
      008819 9A               [ 1]  740 	rim
      00881A                        741 00120$:
      00881A 5B 33            [ 2]  742 	addw	sp, #51
      00881C 81               [ 4]  743 	ret
                                    744 	.area CODE
      00881D                        745 ___str_0:
      00881D 44 61 74 61 20 64 65   746 	.ascii "Data decoder: "
             63 6F 64 65 72 3A 20
      00882B 00                     747 	.db 0x00
      00882C                        748 ___str_1:
      00882C 4B 65 79 20 70 72 65   749 	.ascii "Key press "
             73 73 20
      008836 0D                     750 	.db 0x0d
      008837 0A                     751 	.db 0x0a
      008838 00                     752 	.db 0x00
      008839                        753 ___str_2:
      008839 54 75 72 6E 4F 6E 20   754 	.ascii "TurnOn A "
             41 20
      008842 0D                     755 	.db 0x0d
      008843 0A                     756 	.db 0x0a
      008844 00                     757 	.db 0x00
                                    758 	.area INITIALIZER
      0095E9                        759 __xinit__ctrFlag:
      0095E9 00                     760 	.db #0x00	; 0
      0095EA                        761 __xinit__ctrCnt:
      0095EA 00                     762 	.db #0x00	; 0
                                    763 	.area CABS (ABS)
