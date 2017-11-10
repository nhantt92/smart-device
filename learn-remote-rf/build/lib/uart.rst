                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.6.0 #9615 (Mac OS X x86_64)
                                      4 ;--------------------------------------------------------
                                      5 	.module uart
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _CLK_GetClockFreq
                                     12 	.globl _UART1_DeInit
                                     13 	.globl _UART1_Init
                                     14 	.globl _UART1_Cmd
                                     15 	.globl _UART1_ITConfig
                                     16 	.globl _UART1_ReceiveData8
                                     17 	.globl _UART1_SendData8
                                     18 	.globl _UART1_GetFlagStatus
                                     19 	.globl _UART1_ClearFlag
                                     20 	.globl _UART1_GetITStatus
                                     21 	.globl _UART1_ClearITPendingBit
                                     22 ;--------------------------------------------------------
                                     23 ; ram data
                                     24 ;--------------------------------------------------------
                                     25 	.area DATA
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
                                     50 ;	lib/uart.c: 5: void UART1_DeInit(void)
                                     51 ;	-----------------------------------------
                                     52 ;	 function UART1_DeInit
                                     53 ;	-----------------------------------------
      0091AF                         54 _UART1_DeInit:
                                     55 ;	lib/uart.c: 9: (void)UART1->SR;
      0091AF AE 52 30         [ 2]   56 	ldw	x, #0x5230
      0091B2 F6               [ 1]   57 	ld	a, (x)
                                     58 ;	lib/uart.c: 10: (void)UART1->DR;
      0091B3 AE 52 31         [ 2]   59 	ldw	x, #0x5231
      0091B6 F6               [ 1]   60 	ld	a, (x)
                                     61 ;	lib/uart.c: 12: UART1->BRR2 = UART1_BRR2_RESET_VALUE;  /* Set UART1_BRR2 to reset value 0x00 */
      0091B7 35 00 52 33      [ 1]   62 	mov	0x5233+0, #0x00
                                     63 ;	lib/uart.c: 13: UART1->BRR1 = UART1_BRR1_RESET_VALUE;  /* Set UART1_BRR1 to reset value 0x00 */
      0091BB 35 00 52 32      [ 1]   64 	mov	0x5232+0, #0x00
                                     65 ;	lib/uart.c: 15: UART1->CR1 = UART1_CR1_RESET_VALUE;  /* Set UART1_CR1 to reset value 0x00 */
      0091BF 35 00 52 34      [ 1]   66 	mov	0x5234+0, #0x00
                                     67 ;	lib/uart.c: 16: UART1->CR2 = UART1_CR2_RESET_VALUE;  /* Set UART1_CR2 to reset value 0x00 */
      0091C3 35 00 52 35      [ 1]   68 	mov	0x5235+0, #0x00
                                     69 ;	lib/uart.c: 17: UART1->CR3 = UART1_CR3_RESET_VALUE;  /* Set UART1_CR3 to reset value 0x00 */
      0091C7 35 00 52 36      [ 1]   70 	mov	0x5236+0, #0x00
                                     71 ;	lib/uart.c: 18: UART1->CR4 = UART1_CR4_RESET_VALUE;  /* Set UART1_CR4 to reset value 0x00 */
      0091CB 35 00 52 37      [ 1]   72 	mov	0x5237+0, #0x00
                                     73 ;	lib/uart.c: 19: UART1->CR5 = UART1_CR5_RESET_VALUE;  /* Set UART1_CR5 to reset value 0x00 */
      0091CF 35 00 52 38      [ 1]   74 	mov	0x5238+0, #0x00
                                     75 ;	lib/uart.c: 21: UART1->GTR = UART1_GTR_RESET_VALUE;
      0091D3 35 00 52 39      [ 1]   76 	mov	0x5239+0, #0x00
                                     77 ;	lib/uart.c: 22: UART1->PSCR = UART1_PSCR_RESET_VALUE;
      0091D7 35 00 52 3A      [ 1]   78 	mov	0x523a+0, #0x00
      0091DB 81               [ 4]   79 	ret
                                     80 ;	lib/uart.c: 25: void UART1_Init(uint32_t BaudRate, UART1_WordLength_TypeDef WordLength, 
                                     81 ;	-----------------------------------------
                                     82 ;	 function UART1_Init
                                     83 ;	-----------------------------------------
      0091DC                         84 _UART1_Init:
      0091DC 52 25            [ 2]   85 	sub	sp, #37
                                     86 ;	lib/uart.c: 32: UART1->CR1 &= (uint8_t)(~UART1_CR1_M);  
      0091DE AE 52 34         [ 2]   87 	ldw	x, #0x5234
      0091E1 F6               [ 1]   88 	ld	a, (x)
      0091E2 A4 EF            [ 1]   89 	and	a, #0xef
      0091E4 F7               [ 1]   90 	ld	(x), a
                                     91 ;	lib/uart.c: 35: UART1->CR1 |= (uint8_t)WordLength;
      0091E5 AE 52 34         [ 2]   92 	ldw	x, #0x5234
      0091E8 F6               [ 1]   93 	ld	a, (x)
      0091E9 1A 2C            [ 1]   94 	or	a, (0x2c, sp)
      0091EB AE 52 34         [ 2]   95 	ldw	x, #0x5234
      0091EE F7               [ 1]   96 	ld	(x), a
                                     97 ;	lib/uart.c: 38: UART1->CR3 &= (uint8_t)(~UART1_CR3_STOP);  
      0091EF AE 52 36         [ 2]   98 	ldw	x, #0x5236
      0091F2 F6               [ 1]   99 	ld	a, (x)
      0091F3 A4 CF            [ 1]  100 	and	a, #0xcf
      0091F5 F7               [ 1]  101 	ld	(x), a
                                    102 ;	lib/uart.c: 40: UART1->CR3 |= (uint8_t)StopBits;  
      0091F6 AE 52 36         [ 2]  103 	ldw	x, #0x5236
      0091F9 F6               [ 1]  104 	ld	a, (x)
      0091FA 1A 2D            [ 1]  105 	or	a, (0x2d, sp)
      0091FC AE 52 36         [ 2]  106 	ldw	x, #0x5236
      0091FF F7               [ 1]  107 	ld	(x), a
                                    108 ;	lib/uart.c: 43: UART1->CR1 &= (uint8_t)(~(UART1_CR1_PCEN | UART1_CR1_PS  ));  
      009200 AE 52 34         [ 2]  109 	ldw	x, #0x5234
      009203 F6               [ 1]  110 	ld	a, (x)
      009204 A4 F9            [ 1]  111 	and	a, #0xf9
      009206 F7               [ 1]  112 	ld	(x), a
                                    113 ;	lib/uart.c: 45: UART1->CR1 |= (uint8_t)Parity;  
      009207 AE 52 34         [ 2]  114 	ldw	x, #0x5234
      00920A F6               [ 1]  115 	ld	a, (x)
      00920B 1A 2E            [ 1]  116 	or	a, (0x2e, sp)
      00920D AE 52 34         [ 2]  117 	ldw	x, #0x5234
      009210 F7               [ 1]  118 	ld	(x), a
                                    119 ;	lib/uart.c: 48: UART1->BRR1 &= (uint8_t)(~UART1_BRR1_DIVM);  
      009211 AE 52 32         [ 2]  120 	ldw	x, #0x5232
      009214 F6               [ 1]  121 	ld	a, (x)
      009215 35 00 52 32      [ 1]  122 	mov	0x5232+0, #0x00
                                    123 ;	lib/uart.c: 50: UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVM);  
      009219 AE 52 33         [ 2]  124 	ldw	x, #0x5233
      00921C F6               [ 1]  125 	ld	a, (x)
      00921D A4 0F            [ 1]  126 	and	a, #0x0f
      00921F F7               [ 1]  127 	ld	(x), a
                                    128 ;	lib/uart.c: 52: UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVF);  
      009220 AE 52 33         [ 2]  129 	ldw	x, #0x5233
      009223 F6               [ 1]  130 	ld	a, (x)
      009224 A4 F0            [ 1]  131 	and	a, #0xf0
      009226 F7               [ 1]  132 	ld	(x), a
                                    133 ;	lib/uart.c: 55: BaudRate_Mantissa    = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
      009227 CD 8E 30         [ 4]  134 	call	_CLK_GetClockFreq
      00922A 1F 24            [ 2]  135 	ldw	(0x24, sp), x
      00922C 1E 28            [ 2]  136 	ldw	x, (0x28, sp)
      00922E 1F 1E            [ 2]  137 	ldw	(0x1e, sp), x
      009230 1E 2A            [ 2]  138 	ldw	x, (0x2a, sp)
      009232 A6 04            [ 1]  139 	ld	a, #0x04
      009234                        140 00124$:
      009234 58               [ 2]  141 	sllw	x
      009235 09 1F            [ 1]  142 	rlc	(0x1f, sp)
      009237 09 1E            [ 1]  143 	rlc	(0x1e, sp)
      009239 4A               [ 1]  144 	dec	a
      00923A 26 F8            [ 1]  145 	jrne	00124$
      00923C 1F 20            [ 2]  146 	ldw	(0x20, sp), x
      00923E 1E 20            [ 2]  147 	ldw	x, (0x20, sp)
      009240 89               [ 2]  148 	pushw	x
      009241 1E 20            [ 2]  149 	ldw	x, (0x20, sp)
      009243 89               [ 2]  150 	pushw	x
      009244 1E 28            [ 2]  151 	ldw	x, (0x28, sp)
      009246 89               [ 2]  152 	pushw	x
      009247 90 89            [ 2]  153 	pushw	y
      009249 CD 95 13         [ 4]  154 	call	__divulong
      00924C 5B 08            [ 2]  155 	addw	sp, #8
      00924E 1F 03            [ 2]  156 	ldw	(0x03, sp), x
      009250 17 01            [ 2]  157 	ldw	(0x01, sp), y
                                    158 ;	lib/uart.c: 56: BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
      009252 CD 8E 30         [ 4]  159 	call	_CLK_GetClockFreq
      009255 51               [ 1]  160 	exgw	x, y
      009256 90 89            [ 2]  161 	pushw	y
      009258 89               [ 2]  162 	pushw	x
      009259 4B 64            [ 1]  163 	push	#0x64
      00925B 5F               [ 1]  164 	clrw	x
      00925C 89               [ 2]  165 	pushw	x
      00925D 4B 00            [ 1]  166 	push	#0x00
      00925F CD 95 6D         [ 4]  167 	call	__mullong
      009262 5B 08            [ 2]  168 	addw	sp, #8
      009264 1F 1C            [ 2]  169 	ldw	(0x1c, sp), x
      009266 1E 20            [ 2]  170 	ldw	x, (0x20, sp)
      009268 89               [ 2]  171 	pushw	x
      009269 1E 20            [ 2]  172 	ldw	x, (0x20, sp)
      00926B 89               [ 2]  173 	pushw	x
      00926C 1E 20            [ 2]  174 	ldw	x, (0x20, sp)
      00926E 89               [ 2]  175 	pushw	x
      00926F 90 89            [ 2]  176 	pushw	y
      009271 CD 95 13         [ 4]  177 	call	__divulong
      009274 5B 08            [ 2]  178 	addw	sp, #8
      009276 1F 07            [ 2]  179 	ldw	(0x07, sp), x
      009278 17 05            [ 2]  180 	ldw	(0x05, sp), y
                                    181 ;	lib/uart.c: 58: UART1->BRR2 |= (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100)) << 4) / 100) & (uint8_t)0x0F); 
      00927A AE 52 33         [ 2]  182 	ldw	x, #0x5233
      00927D F6               [ 1]  183 	ld	a, (x)
      00927E 6B 19            [ 1]  184 	ld	(0x19, sp), a
      009280 1E 03            [ 2]  185 	ldw	x, (0x03, sp)
      009282 89               [ 2]  186 	pushw	x
      009283 1E 03            [ 2]  187 	ldw	x, (0x03, sp)
      009285 89               [ 2]  188 	pushw	x
      009286 4B 64            [ 1]  189 	push	#0x64
      009288 5F               [ 1]  190 	clrw	x
      009289 89               [ 2]  191 	pushw	x
      00928A 4B 00            [ 1]  192 	push	#0x00
      00928C CD 95 6D         [ 4]  193 	call	__mullong
      00928F 5B 08            [ 2]  194 	addw	sp, #8
      009291 1F 17            [ 2]  195 	ldw	(0x17, sp), x
      009293 17 15            [ 2]  196 	ldw	(0x15, sp), y
      009295 1E 07            [ 2]  197 	ldw	x, (0x07, sp)
      009297 72 F0 17         [ 2]  198 	subw	x, (0x17, sp)
      00929A 1F 13            [ 2]  199 	ldw	(0x13, sp), x
      00929C 7B 06            [ 1]  200 	ld	a, (0x06, sp)
      00929E 12 16            [ 1]  201 	sbc	a, (0x16, sp)
      0092A0 6B 12            [ 1]  202 	ld	(0x12, sp), a
      0092A2 7B 05            [ 1]  203 	ld	a, (0x05, sp)
      0092A4 12 15            [ 1]  204 	sbc	a, (0x15, sp)
      0092A6 6B 11            [ 1]  205 	ld	(0x11, sp), a
      0092A8 1E 13            [ 2]  206 	ldw	x, (0x13, sp)
      0092AA 16 11            [ 2]  207 	ldw	y, (0x11, sp)
      0092AC A6 04            [ 1]  208 	ld	a, #0x04
      0092AE                        209 00126$:
      0092AE 58               [ 2]  210 	sllw	x
      0092AF 90 59            [ 2]  211 	rlcw	y
      0092B1 4A               [ 1]  212 	dec	a
      0092B2 26 FA            [ 1]  213 	jrne	00126$
      0092B4 4B 64            [ 1]  214 	push	#0x64
      0092B6 4B 00            [ 1]  215 	push	#0x00
      0092B8 4B 00            [ 1]  216 	push	#0x00
      0092BA 4B 00            [ 1]  217 	push	#0x00
      0092BC 89               [ 2]  218 	pushw	x
      0092BD 90 89            [ 2]  219 	pushw	y
      0092BF CD 95 13         [ 4]  220 	call	__divulong
      0092C2 5B 08            [ 2]  221 	addw	sp, #8
      0092C4 9F               [ 1]  222 	ld	a, xl
      0092C5 A4 0F            [ 1]  223 	and	a, #0x0f
      0092C7 1A 19            [ 1]  224 	or	a, (0x19, sp)
      0092C9 AE 52 33         [ 2]  225 	ldw	x, #0x5233
      0092CC F7               [ 1]  226 	ld	(x), a
                                    227 ;	lib/uart.c: 60: UART1->BRR2 |= (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0); 
      0092CD AE 52 33         [ 2]  228 	ldw	x, #0x5233
      0092D0 F6               [ 1]  229 	ld	a, (x)
      0092D1 6B 10            [ 1]  230 	ld	(0x10, sp), a
      0092D3 1E 03            [ 2]  231 	ldw	x, (0x03, sp)
      0092D5 16 01            [ 2]  232 	ldw	y, (0x01, sp)
      0092D7 90 54            [ 2]  233 	srlw	y
      0092D9 56               [ 2]  234 	rrcw	x
      0092DA 90 54            [ 2]  235 	srlw	y
      0092DC 56               [ 2]  236 	rrcw	x
      0092DD 90 54            [ 2]  237 	srlw	y
      0092DF 56               [ 2]  238 	rrcw	x
      0092E0 90 54            [ 2]  239 	srlw	y
      0092E2 56               [ 2]  240 	rrcw	x
      0092E3 9F               [ 1]  241 	ld	a, xl
      0092E4 A4 F0            [ 1]  242 	and	a, #0xf0
      0092E6 88               [ 1]  243 	push	a
      0092E7 5F               [ 1]  244 	clrw	x
      0092E8 0F 0D            [ 1]  245 	clr	(0x0d, sp)
      0092EA 84               [ 1]  246 	pop	a
      0092EB 1A 10            [ 1]  247 	or	a, (0x10, sp)
      0092ED AE 52 33         [ 2]  248 	ldw	x, #0x5233
      0092F0 F7               [ 1]  249 	ld	(x), a
                                    250 ;	lib/uart.c: 62: UART1->BRR1 |= (uint8_t)BaudRate_Mantissa;           
      0092F1 AE 52 32         [ 2]  251 	ldw	x, #0x5232
      0092F4 F6               [ 1]  252 	ld	a, (x)
      0092F5 6B 0B            [ 1]  253 	ld	(0x0b, sp), a
      0092F7 7B 04            [ 1]  254 	ld	a, (0x04, sp)
      0092F9 1A 0B            [ 1]  255 	or	a, (0x0b, sp)
      0092FB AE 52 32         [ 2]  256 	ldw	x, #0x5232
      0092FE F7               [ 1]  257 	ld	(x), a
                                    258 ;	lib/uart.c: 65: UART1->CR2 &= (uint8_t)~(UART1_CR2_TEN | UART1_CR2_REN); 
      0092FF AE 52 35         [ 2]  259 	ldw	x, #0x5235
      009302 F6               [ 1]  260 	ld	a, (x)
      009303 A4 F3            [ 1]  261 	and	a, #0xf3
      009305 F7               [ 1]  262 	ld	(x), a
                                    263 ;	lib/uart.c: 67: UART1->CR3 &= (uint8_t)~(UART1_CR3_CPOL | UART1_CR3_CPHA | UART1_CR3_LBCL); 
      009306 AE 52 36         [ 2]  264 	ldw	x, #0x5236
      009309 F6               [ 1]  265 	ld	a, (x)
      00930A A4 F8            [ 1]  266 	and	a, #0xf8
      00930C F7               [ 1]  267 	ld	(x), a
                                    268 ;	lib/uart.c: 69: UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & (uint8_t)(UART1_CR3_CPOL | 
      00930D AE 52 36         [ 2]  269 	ldw	x, #0x5236
      009310 F6               [ 1]  270 	ld	a, (x)
      009311 6B 0A            [ 1]  271 	ld	(0x0a, sp), a
      009313 7B 2F            [ 1]  272 	ld	a, (0x2f, sp)
      009315 A4 07            [ 1]  273 	and	a, #0x07
      009317 1A 0A            [ 1]  274 	or	a, (0x0a, sp)
      009319 AE 52 36         [ 2]  275 	ldw	x, #0x5236
      00931C F7               [ 1]  276 	ld	(x), a
                                    277 ;	lib/uart.c: 72: if ((uint8_t)(Mode & UART1_MODE_TX_ENABLE))
      00931D 7B 30            [ 1]  278 	ld	a, (0x30, sp)
      00931F A5 04            [ 1]  279 	bcp	a, #0x04
      009321 27 09            [ 1]  280 	jreq	00102$
                                    281 ;	lib/uart.c: 75: UART1->CR2 |= (uint8_t)UART1_CR2_TEN;  
      009323 AE 52 35         [ 2]  282 	ldw	x, #0x5235
      009326 F6               [ 1]  283 	ld	a, (x)
      009327 AA 08            [ 1]  284 	or	a, #0x08
      009329 F7               [ 1]  285 	ld	(x), a
      00932A 20 07            [ 2]  286 	jra	00103$
      00932C                        287 00102$:
                                    288 ;	lib/uart.c: 80: UART1->CR2 &= (uint8_t)(~UART1_CR2_TEN);  
      00932C AE 52 35         [ 2]  289 	ldw	x, #0x5235
      00932F F6               [ 1]  290 	ld	a, (x)
      009330 A4 F7            [ 1]  291 	and	a, #0xf7
      009332 F7               [ 1]  292 	ld	(x), a
      009333                        293 00103$:
                                    294 ;	lib/uart.c: 82: if ((uint8_t)(Mode & UART1_MODE_RX_ENABLE))
      009333 7B 30            [ 1]  295 	ld	a, (0x30, sp)
      009335 A5 08            [ 1]  296 	bcp	a, #0x08
      009337 27 09            [ 1]  297 	jreq	00105$
                                    298 ;	lib/uart.c: 85: UART1->CR2 |= (uint8_t)UART1_CR2_REN;  
      009339 AE 52 35         [ 2]  299 	ldw	x, #0x5235
      00933C F6               [ 1]  300 	ld	a, (x)
      00933D AA 04            [ 1]  301 	or	a, #0x04
      00933F F7               [ 1]  302 	ld	(x), a
      009340 20 07            [ 2]  303 	jra	00106$
      009342                        304 00105$:
                                    305 ;	lib/uart.c: 90: UART1->CR2 &= (uint8_t)(~UART1_CR2_REN);  
      009342 AE 52 35         [ 2]  306 	ldw	x, #0x5235
      009345 F6               [ 1]  307 	ld	a, (x)
      009346 A4 FB            [ 1]  308 	and	a, #0xfb
      009348 F7               [ 1]  309 	ld	(x), a
      009349                        310 00106$:
                                    311 ;	lib/uart.c: 94: if ((uint8_t)(SyncMode & UART1_SYNCMODE_CLOCK_DISABLE))
      009349 0D 2F            [ 1]  312 	tnz	(0x2f, sp)
      00934B 2A 09            [ 1]  313 	jrpl	00108$
                                    314 ;	lib/uart.c: 97: UART1->CR3 &= (uint8_t)(~UART1_CR3_CKEN); 
      00934D AE 52 36         [ 2]  315 	ldw	x, #0x5236
      009350 F6               [ 1]  316 	ld	a, (x)
      009351 A4 F7            [ 1]  317 	and	a, #0xf7
      009353 F7               [ 1]  318 	ld	(x), a
      009354 20 10            [ 2]  319 	jra	00110$
      009356                        320 00108$:
                                    321 ;	lib/uart.c: 101: UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & UART1_CR3_CKEN);
      009356 AE 52 36         [ 2]  322 	ldw	x, #0x5236
      009359 F6               [ 1]  323 	ld	a, (x)
      00935A 6B 09            [ 1]  324 	ld	(0x09, sp), a
      00935C 7B 2F            [ 1]  325 	ld	a, (0x2f, sp)
      00935E A4 08            [ 1]  326 	and	a, #0x08
      009360 1A 09            [ 1]  327 	or	a, (0x09, sp)
      009362 AE 52 36         [ 2]  328 	ldw	x, #0x5236
      009365 F7               [ 1]  329 	ld	(x), a
      009366                        330 00110$:
      009366 5B 25            [ 2]  331 	addw	sp, #37
      009368 81               [ 4]  332 	ret
                                    333 ;	lib/uart.c: 105: void UART1_Cmd(FunctionalState NewState)
                                    334 ;	-----------------------------------------
                                    335 ;	 function UART1_Cmd
                                    336 ;	-----------------------------------------
      009369                        337 _UART1_Cmd:
                                    338 ;	lib/uart.c: 107: if (NewState != DISABLE)
      009369 0D 03            [ 1]  339 	tnz	(0x03, sp)
      00936B 27 08            [ 1]  340 	jreq	00102$
                                    341 ;	lib/uart.c: 110: UART1->CR1 &= (uint8_t)(~UART1_CR1_UARTD); 
      00936D AE 52 34         [ 2]  342 	ldw	x, #0x5234
      009370 F6               [ 1]  343 	ld	a, (x)
      009371 A4 DF            [ 1]  344 	and	a, #0xdf
      009373 F7               [ 1]  345 	ld	(x), a
      009374 81               [ 4]  346 	ret
      009375                        347 00102$:
                                    348 ;	lib/uart.c: 115: UART1->CR1 |= UART1_CR1_UARTD;  
      009375 AE 52 34         [ 2]  349 	ldw	x, #0x5234
      009378 F6               [ 1]  350 	ld	a, (x)
      009379 AA 20            [ 1]  351 	or	a, #0x20
      00937B F7               [ 1]  352 	ld	(x), a
      00937C 81               [ 4]  353 	ret
                                    354 ;	lib/uart.c: 119: void UART1_ITConfig(UART1_IT_TypeDef UART1_IT, FunctionalState NewState)
                                    355 ;	-----------------------------------------
                                    356 ;	 function UART1_ITConfig
                                    357 ;	-----------------------------------------
      00937D                        358 _UART1_ITConfig:
      00937D 52 03            [ 2]  359 	sub	sp, #3
                                    360 ;	lib/uart.c: 124: uartreg = (uint8_t)((uint16_t)UART1_IT >> 0x08);
      00937F 7B 06            [ 1]  361 	ld	a, (0x06, sp)
      009381 97               [ 1]  362 	ld	xl, a
      009382 4F               [ 1]  363 	clr	a
                                    364 ;	lib/uart.c: 126: itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
      009383 7B 07            [ 1]  365 	ld	a, (0x07, sp)
      009385 A4 0F            [ 1]  366 	and	a, #0x0f
      009387 95               [ 1]  367 	ld	xh, a
      009388 A6 01            [ 1]  368 	ld	a, #0x01
      00938A 88               [ 1]  369 	push	a
      00938B 9E               [ 1]  370 	ld	a, xh
      00938C 4D               [ 1]  371 	tnz	a
      00938D 27 05            [ 1]  372 	jreq	00139$
      00938F                        373 00138$:
      00938F 08 01            [ 1]  374 	sll	(1, sp)
      009391 4A               [ 1]  375 	dec	a
      009392 26 FB            [ 1]  376 	jrne	00138$
      009394                        377 00139$:
      009394 84               [ 1]  378 	pop	a
      009395 6B 01            [ 1]  379 	ld	(0x01, sp), a
                                    380 ;	lib/uart.c: 131: if (uartreg == 0x01)
      009397 9F               [ 1]  381 	ld	a, xl
      009398 A1 01            [ 1]  382 	cp	a, #0x01
      00939A 26 06            [ 1]  383 	jrne	00141$
      00939C A6 01            [ 1]  384 	ld	a, #0x01
      00939E 6B 03            [ 1]  385 	ld	(0x03, sp), a
      0093A0 20 02            [ 2]  386 	jra	00142$
      0093A2                        387 00141$:
      0093A2 0F 03            [ 1]  388 	clr	(0x03, sp)
      0093A4                        389 00142$:
                                    390 ;	lib/uart.c: 135: else if (uartreg == 0x02)
      0093A4 9F               [ 1]  391 	ld	a, xl
      0093A5 A1 02            [ 1]  392 	cp	a, #0x02
      0093A7 26 03            [ 1]  393 	jrne	00144$
      0093A9 A6 01            [ 1]  394 	ld	a, #0x01
      0093AB 21                     395 	.byte 0x21
      0093AC                        396 00144$:
      0093AC 4F               [ 1]  397 	clr	a
      0093AD                        398 00145$:
                                    399 ;	lib/uart.c: 128: if (NewState != DISABLE)
      0093AD 0D 08            [ 1]  400 	tnz	(0x08, sp)
      0093AF 27 2B            [ 1]  401 	jreq	00114$
                                    402 ;	lib/uart.c: 131: if (uartreg == 0x01)
      0093B1 0D 03            [ 1]  403 	tnz	(0x03, sp)
      0093B3 27 0C            [ 1]  404 	jreq	00105$
                                    405 ;	lib/uart.c: 133: UART1->CR1 |= itpos;
      0093B5 AE 52 34         [ 2]  406 	ldw	x, #0x5234
      0093B8 F6               [ 1]  407 	ld	a, (x)
      0093B9 1A 01            [ 1]  408 	or	a, (0x01, sp)
      0093BB AE 52 34         [ 2]  409 	ldw	x, #0x5234
      0093BE F7               [ 1]  410 	ld	(x), a
      0093BF 20 4B            [ 2]  411 	jra	00116$
      0093C1                        412 00105$:
                                    413 ;	lib/uart.c: 135: else if (uartreg == 0x02)
      0093C1 4D               [ 1]  414 	tnz	a
      0093C2 27 0C            [ 1]  415 	jreq	00102$
                                    416 ;	lib/uart.c: 137: UART1->CR2 |= itpos;
      0093C4 AE 52 35         [ 2]  417 	ldw	x, #0x5235
      0093C7 F6               [ 1]  418 	ld	a, (x)
      0093C8 1A 01            [ 1]  419 	or	a, (0x01, sp)
      0093CA AE 52 35         [ 2]  420 	ldw	x, #0x5235
      0093CD F7               [ 1]  421 	ld	(x), a
      0093CE 20 3C            [ 2]  422 	jra	00116$
      0093D0                        423 00102$:
                                    424 ;	lib/uart.c: 141: UART1->CR4 |= itpos;
      0093D0 AE 52 37         [ 2]  425 	ldw	x, #0x5237
      0093D3 F6               [ 1]  426 	ld	a, (x)
      0093D4 1A 01            [ 1]  427 	or	a, (0x01, sp)
      0093D6 AE 52 37         [ 2]  428 	ldw	x, #0x5237
      0093D9 F7               [ 1]  429 	ld	(x), a
      0093DA 20 30            [ 2]  430 	jra	00116$
      0093DC                        431 00114$:
                                    432 ;	lib/uart.c: 149: UART1->CR1 &= (uint8_t)(~itpos);
      0093DC 88               [ 1]  433 	push	a
      0093DD 7B 02            [ 1]  434 	ld	a, (0x02, sp)
      0093DF 43               [ 1]  435 	cpl	a
      0093E0 6B 03            [ 1]  436 	ld	(0x03, sp), a
      0093E2 84               [ 1]  437 	pop	a
                                    438 ;	lib/uart.c: 147: if (uartreg == 0x01)
      0093E3 0D 03            [ 1]  439 	tnz	(0x03, sp)
      0093E5 27 0C            [ 1]  440 	jreq	00111$
                                    441 ;	lib/uart.c: 149: UART1->CR1 &= (uint8_t)(~itpos);
      0093E7 AE 52 34         [ 2]  442 	ldw	x, #0x5234
      0093EA F6               [ 1]  443 	ld	a, (x)
      0093EB 14 02            [ 1]  444 	and	a, (0x02, sp)
      0093ED AE 52 34         [ 2]  445 	ldw	x, #0x5234
      0093F0 F7               [ 1]  446 	ld	(x), a
      0093F1 20 19            [ 2]  447 	jra	00116$
      0093F3                        448 00111$:
                                    449 ;	lib/uart.c: 151: else if (uartreg == 0x02)
      0093F3 4D               [ 1]  450 	tnz	a
      0093F4 27 0C            [ 1]  451 	jreq	00108$
                                    452 ;	lib/uart.c: 153: UART1->CR2 &= (uint8_t)(~itpos);
      0093F6 AE 52 35         [ 2]  453 	ldw	x, #0x5235
      0093F9 F6               [ 1]  454 	ld	a, (x)
      0093FA 14 02            [ 1]  455 	and	a, (0x02, sp)
      0093FC AE 52 35         [ 2]  456 	ldw	x, #0x5235
      0093FF F7               [ 1]  457 	ld	(x), a
      009400 20 0A            [ 2]  458 	jra	00116$
      009402                        459 00108$:
                                    460 ;	lib/uart.c: 157: UART1->CR4 &= (uint8_t)(~itpos);
      009402 AE 52 37         [ 2]  461 	ldw	x, #0x5237
      009405 F6               [ 1]  462 	ld	a, (x)
      009406 14 02            [ 1]  463 	and	a, (0x02, sp)
      009408 AE 52 37         [ 2]  464 	ldw	x, #0x5237
      00940B F7               [ 1]  465 	ld	(x), a
      00940C                        466 00116$:
      00940C 5B 03            [ 2]  467 	addw	sp, #3
      00940E 81               [ 4]  468 	ret
                                    469 ;	lib/uart.c: 163: uint8_t UART1_ReceiveData8(void)
                                    470 ;	-----------------------------------------
                                    471 ;	 function UART1_ReceiveData8
                                    472 ;	-----------------------------------------
      00940F                        473 _UART1_ReceiveData8:
                                    474 ;	lib/uart.c: 165: return ((uint8_t)UART1->DR);
      00940F AE 52 31         [ 2]  475 	ldw	x, #0x5231
      009412 F6               [ 1]  476 	ld	a, (x)
      009413 81               [ 4]  477 	ret
                                    478 ;	lib/uart.c: 168: void UART1_SendData8(uint8_t Data)
                                    479 ;	-----------------------------------------
                                    480 ;	 function UART1_SendData8
                                    481 ;	-----------------------------------------
      009414                        482 _UART1_SendData8:
                                    483 ;	lib/uart.c: 171: UART1->DR = Data;
      009414 AE 52 31         [ 2]  484 	ldw	x, #0x5231
      009417 7B 03            [ 1]  485 	ld	a, (0x03, sp)
      009419 F7               [ 1]  486 	ld	(x), a
      00941A 81               [ 4]  487 	ret
                                    488 ;	lib/uart.c: 174: FlagStatus UART1_GetFlagStatus(UART1_Flag_TypeDef UART1_FLAG)
                                    489 ;	-----------------------------------------
                                    490 ;	 function UART1_GetFlagStatus
                                    491 ;	-----------------------------------------
      00941B                        492 _UART1_GetFlagStatus:
      00941B 88               [ 1]  493 	push	a
                                    494 ;	lib/uart.c: 180: if ((UART1->CR4 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
      00941C 7B 05            [ 1]  495 	ld	a, (0x05, sp)
      00941E 6B 01            [ 1]  496 	ld	(0x01, sp), a
                                    497 ;	lib/uart.c: 178: if (UART1_FLAG == UART1_FLAG_LBDF)
      009420 1E 04            [ 2]  498 	ldw	x, (0x04, sp)
      009422 A3 02 10         [ 2]  499 	cpw	x, #0x0210
      009425 26 10            [ 1]  500 	jrne	00114$
                                    501 ;	lib/uart.c: 180: if ((UART1->CR4 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
      009427 AE 52 37         [ 2]  502 	ldw	x, #0x5237
      00942A F6               [ 1]  503 	ld	a, (x)
      00942B 14 01            [ 1]  504 	and	a, (0x01, sp)
      00942D 4D               [ 1]  505 	tnz	a
      00942E 27 04            [ 1]  506 	jreq	00102$
                                    507 ;	lib/uart.c: 183: status = SET;
      009430 A6 01            [ 1]  508 	ld	a, #0x01
      009432 20 27            [ 2]  509 	jra	00115$
      009434                        510 00102$:
                                    511 ;	lib/uart.c: 188: status = RESET;
      009434 4F               [ 1]  512 	clr	a
      009435 20 24            [ 2]  513 	jra	00115$
      009437                        514 00114$:
                                    515 ;	lib/uart.c: 191: else if (UART1_FLAG == UART1_FLAG_SBK)
      009437 1E 04            [ 2]  516 	ldw	x, (0x04, sp)
      009439 A3 01 01         [ 2]  517 	cpw	x, #0x0101
      00943C 26 10            [ 1]  518 	jrne	00111$
                                    519 ;	lib/uart.c: 193: if ((UART1->CR2 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
      00943E AE 52 35         [ 2]  520 	ldw	x, #0x5235
      009441 F6               [ 1]  521 	ld	a, (x)
      009442 14 01            [ 1]  522 	and	a, (0x01, sp)
      009444 4D               [ 1]  523 	tnz	a
      009445 27 04            [ 1]  524 	jreq	00105$
                                    525 ;	lib/uart.c: 196: status = SET;
      009447 A6 01            [ 1]  526 	ld	a, #0x01
      009449 20 10            [ 2]  527 	jra	00115$
      00944B                        528 00105$:
                                    529 ;	lib/uart.c: 201: status = RESET;
      00944B 4F               [ 1]  530 	clr	a
      00944C 20 0D            [ 2]  531 	jra	00115$
      00944E                        532 00111$:
                                    533 ;	lib/uart.c: 206: if ((UART1->SR & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
      00944E AE 52 30         [ 2]  534 	ldw	x, #0x5230
      009451 F6               [ 1]  535 	ld	a, (x)
      009452 14 01            [ 1]  536 	and	a, (0x01, sp)
      009454 4D               [ 1]  537 	tnz	a
      009455 27 03            [ 1]  538 	jreq	00108$
                                    539 ;	lib/uart.c: 209: status = SET;
      009457 A6 01            [ 1]  540 	ld	a, #0x01
                                    541 ;	lib/uart.c: 214: status = RESET;
      009459 21                     542 	.byte 0x21
      00945A                        543 00108$:
      00945A 4F               [ 1]  544 	clr	a
      00945B                        545 00115$:
                                    546 ;	lib/uart.c: 218: return status;
      00945B 5B 01            [ 2]  547 	addw	sp, #1
      00945D 81               [ 4]  548 	ret
                                    549 ;	lib/uart.c: 221: void UART1_ClearFlag(UART1_Flag_TypeDef UART1_FLAG)
                                    550 ;	-----------------------------------------
                                    551 ;	 function UART1_ClearFlag
                                    552 ;	-----------------------------------------
      00945E                        553 _UART1_ClearFlag:
                                    554 ;	lib/uart.c: 224: if (UART1_FLAG == UART1_FLAG_RXNE)
      00945E 1E 03            [ 2]  555 	ldw	x, (0x03, sp)
      009460 A3 00 20         [ 2]  556 	cpw	x, #0x0020
      009463 26 05            [ 1]  557 	jrne	00102$
                                    558 ;	lib/uart.c: 226: UART1->SR = (uint8_t)~(UART1_SR_RXNE);
      009465 35 DF 52 30      [ 1]  559 	mov	0x5230+0, #0xdf
      009469 81               [ 4]  560 	ret
      00946A                        561 00102$:
                                    562 ;	lib/uart.c: 231: UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
      00946A AE 52 37         [ 2]  563 	ldw	x, #0x5237
      00946D F6               [ 1]  564 	ld	a, (x)
      00946E A4 EF            [ 1]  565 	and	a, #0xef
      009470 F7               [ 1]  566 	ld	(x), a
      009471 81               [ 4]  567 	ret
                                    568 ;	lib/uart.c: 235: ITStatus UART1_GetITStatus(UART1_IT_TypeDef UART1_IT)
                                    569 ;	-----------------------------------------
                                    570 ;	 function UART1_GetITStatus
                                    571 ;	-----------------------------------------
      009472                        572 _UART1_GetITStatus:
      009472 52 05            [ 2]  573 	sub	sp, #5
                                    574 ;	lib/uart.c: 244: itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
      009474 7B 09            [ 1]  575 	ld	a, (0x09, sp)
      009476 97               [ 1]  576 	ld	xl, a
      009477 A4 0F            [ 1]  577 	and	a, #0x0f
      009479 95               [ 1]  578 	ld	xh, a
      00947A A6 01            [ 1]  579 	ld	a, #0x01
      00947C 88               [ 1]  580 	push	a
      00947D 9E               [ 1]  581 	ld	a, xh
      00947E 4D               [ 1]  582 	tnz	a
      00947F 27 05            [ 1]  583 	jreq	00154$
      009481                        584 00153$:
      009481 08 01            [ 1]  585 	sll	(1, sp)
      009483 4A               [ 1]  586 	dec	a
      009484 26 FB            [ 1]  587 	jrne	00153$
      009486                        588 00154$:
      009486 84               [ 1]  589 	pop	a
      009487 6B 03            [ 1]  590 	ld	(0x03, sp), a
                                    591 ;	lib/uart.c: 246: itmask1 = (uint8_t)((uint8_t)UART1_IT >> (uint8_t)4);
      009489 9F               [ 1]  592 	ld	a, xl
      00948A 4E               [ 1]  593 	swap	a
      00948B A4 0F            [ 1]  594 	and	a, #0x0f
      00948D 97               [ 1]  595 	ld	xl, a
                                    596 ;	lib/uart.c: 248: itmask2 = (uint8_t)((uint8_t)1 << itmask1);
      00948E A6 01            [ 1]  597 	ld	a, #0x01
      009490 88               [ 1]  598 	push	a
      009491 9F               [ 1]  599 	ld	a, xl
      009492 4D               [ 1]  600 	tnz	a
      009493 27 05            [ 1]  601 	jreq	00156$
      009495                        602 00155$:
      009495 08 01            [ 1]  603 	sll	(1, sp)
      009497 4A               [ 1]  604 	dec	a
      009498 26 FB            [ 1]  605 	jrne	00155$
      00949A                        606 00156$:
      00949A 84               [ 1]  607 	pop	a
      00949B 6B 02            [ 1]  608 	ld	(0x02, sp), a
                                    609 ;	lib/uart.c: 251: if (UART1_IT == UART1_IT_PE)
      00949D 1E 08            [ 2]  610 	ldw	x, (0x08, sp)
      00949F A3 01 00         [ 2]  611 	cpw	x, #0x0100
      0094A2 26 1C            [ 1]  612 	jrne	00117$
                                    613 ;	lib/uart.c: 254: enablestatus = (uint8_t)((uint8_t)UART1->CR1 & itmask2);
      0094A4 AE 52 34         [ 2]  614 	ldw	x, #0x5234
      0094A7 F6               [ 1]  615 	ld	a, (x)
      0094A8 14 02            [ 1]  616 	and	a, (0x02, sp)
      0094AA 6B 04            [ 1]  617 	ld	(0x04, sp), a
                                    618 ;	lib/uart.c: 257: if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
      0094AC AE 52 30         [ 2]  619 	ldw	x, #0x5230
      0094AF F6               [ 1]  620 	ld	a, (x)
      0094B0 14 03            [ 1]  621 	and	a, (0x03, sp)
      0094B2 4D               [ 1]  622 	tnz	a
      0094B3 27 08            [ 1]  623 	jreq	00102$
      0094B5 0D 04            [ 1]  624 	tnz	(0x04, sp)
      0094B7 27 04            [ 1]  625 	jreq	00102$
                                    626 ;	lib/uart.c: 260: pendingbitstatus = SET;
      0094B9 A6 01            [ 1]  627 	ld	a, #0x01
      0094BB 20 3F            [ 2]  628 	jra	00118$
      0094BD                        629 00102$:
                                    630 ;	lib/uart.c: 265: pendingbitstatus = RESET;
      0094BD 4F               [ 1]  631 	clr	a
      0094BE 20 3C            [ 2]  632 	jra	00118$
      0094C0                        633 00117$:
                                    634 ;	lib/uart.c: 269: else if (UART1_IT == UART1_IT_LBDF)
      0094C0 1E 08            [ 2]  635 	ldw	x, (0x08, sp)
      0094C2 A3 03 46         [ 2]  636 	cpw	x, #0x0346
      0094C5 26 1C            [ 1]  637 	jrne	00114$
                                    638 ;	lib/uart.c: 272: enablestatus = (uint8_t)((uint8_t)UART1->CR4 & itmask2);
      0094C7 AE 52 37         [ 2]  639 	ldw	x, #0x5237
      0094CA F6               [ 1]  640 	ld	a, (x)
      0094CB 14 02            [ 1]  641 	and	a, (0x02, sp)
      0094CD 6B 01            [ 1]  642 	ld	(0x01, sp), a
                                    643 ;	lib/uart.c: 274: if (((UART1->CR4 & itpos) != (uint8_t)0x00) && enablestatus)
      0094CF AE 52 37         [ 2]  644 	ldw	x, #0x5237
      0094D2 F6               [ 1]  645 	ld	a, (x)
      0094D3 14 03            [ 1]  646 	and	a, (0x03, sp)
      0094D5 4D               [ 1]  647 	tnz	a
      0094D6 27 08            [ 1]  648 	jreq	00106$
      0094D8 0D 01            [ 1]  649 	tnz	(0x01, sp)
      0094DA 27 04            [ 1]  650 	jreq	00106$
                                    651 ;	lib/uart.c: 277: pendingbitstatus = SET;
      0094DC A6 01            [ 1]  652 	ld	a, #0x01
      0094DE 20 1C            [ 2]  653 	jra	00118$
      0094E0                        654 00106$:
                                    655 ;	lib/uart.c: 282: pendingbitstatus = RESET;
      0094E0 4F               [ 1]  656 	clr	a
      0094E1 20 19            [ 2]  657 	jra	00118$
      0094E3                        658 00114$:
                                    659 ;	lib/uart.c: 288: enablestatus = (uint8_t)((uint8_t)UART1->CR2 & itmask2);
      0094E3 AE 52 35         [ 2]  660 	ldw	x, #0x5235
      0094E6 F6               [ 1]  661 	ld	a, (x)
      0094E7 14 02            [ 1]  662 	and	a, (0x02, sp)
      0094E9 6B 05            [ 1]  663 	ld	(0x05, sp), a
                                    664 ;	lib/uart.c: 290: if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
      0094EB AE 52 30         [ 2]  665 	ldw	x, #0x5230
      0094EE F6               [ 1]  666 	ld	a, (x)
      0094EF 14 03            [ 1]  667 	and	a, (0x03, sp)
      0094F1 4D               [ 1]  668 	tnz	a
      0094F2 27 07            [ 1]  669 	jreq	00110$
      0094F4 0D 05            [ 1]  670 	tnz	(0x05, sp)
      0094F6 27 03            [ 1]  671 	jreq	00110$
                                    672 ;	lib/uart.c: 293: pendingbitstatus = SET;
      0094F8 A6 01            [ 1]  673 	ld	a, #0x01
                                    674 ;	lib/uart.c: 298: pendingbitstatus = RESET;
      0094FA 21                     675 	.byte 0x21
      0094FB                        676 00110$:
      0094FB 4F               [ 1]  677 	clr	a
      0094FC                        678 00118$:
                                    679 ;	lib/uart.c: 303: return  pendingbitstatus;
      0094FC 5B 05            [ 2]  680 	addw	sp, #5
      0094FE 81               [ 4]  681 	ret
                                    682 ;	lib/uart.c: 306: void UART1_ClearITPendingBit(UART1_IT_TypeDef UART1_IT)
                                    683 ;	-----------------------------------------
                                    684 ;	 function UART1_ClearITPendingBit
                                    685 ;	-----------------------------------------
      0094FF                        686 _UART1_ClearITPendingBit:
                                    687 ;	lib/uart.c: 309: if (UART1_IT == UART1_IT_RXNE)
      0094FF 1E 03            [ 2]  688 	ldw	x, (0x03, sp)
      009501 A3 02 55         [ 2]  689 	cpw	x, #0x0255
      009504 26 05            [ 1]  690 	jrne	00102$
                                    691 ;	lib/uart.c: 311: UART1->SR = (uint8_t)~(UART1_SR_RXNE);
      009506 35 DF 52 30      [ 1]  692 	mov	0x5230+0, #0xdf
      00950A 81               [ 4]  693 	ret
      00950B                        694 00102$:
                                    695 ;	lib/uart.c: 316: UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
      00950B AE 52 37         [ 2]  696 	ldw	x, #0x5237
      00950E F6               [ 1]  697 	ld	a, (x)
      00950F A4 EF            [ 1]  698 	and	a, #0xef
      009511 F7               [ 1]  699 	ld	(x), a
      009512 81               [ 4]  700 	ret
                                    701 	.area CODE
                                    702 	.area INITIALIZER
                                    703 	.area CABS (ABS)
