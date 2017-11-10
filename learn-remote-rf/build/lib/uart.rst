                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.6.0 #9615 (MINGW64)
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
      0091A2                         54 _UART1_DeInit:
                                     55 ;	lib/uart.c: 9: (void)UART1->SR;
      0091A2 AE 52 30         [ 2]   56 	ldw	x, #0x5230
      0091A5 F6               [ 1]   57 	ld	a, (x)
                                     58 ;	lib/uart.c: 10: (void)UART1->DR;
      0091A6 AE 52 31         [ 2]   59 	ldw	x, #0x5231
      0091A9 F6               [ 1]   60 	ld	a, (x)
                                     61 ;	lib/uart.c: 12: UART1->BRR2 = UART1_BRR2_RESET_VALUE;  /* Set UART1_BRR2 to reset value 0x00 */
      0091AA 35 00 52 33      [ 1]   62 	mov	0x5233+0, #0x00
                                     63 ;	lib/uart.c: 13: UART1->BRR1 = UART1_BRR1_RESET_VALUE;  /* Set UART1_BRR1 to reset value 0x00 */
      0091AE 35 00 52 32      [ 1]   64 	mov	0x5232+0, #0x00
                                     65 ;	lib/uart.c: 15: UART1->CR1 = UART1_CR1_RESET_VALUE;  /* Set UART1_CR1 to reset value 0x00 */
      0091B2 35 00 52 34      [ 1]   66 	mov	0x5234+0, #0x00
                                     67 ;	lib/uart.c: 16: UART1->CR2 = UART1_CR2_RESET_VALUE;  /* Set UART1_CR2 to reset value 0x00 */
      0091B6 35 00 52 35      [ 1]   68 	mov	0x5235+0, #0x00
                                     69 ;	lib/uart.c: 17: UART1->CR3 = UART1_CR3_RESET_VALUE;  /* Set UART1_CR3 to reset value 0x00 */
      0091BA 35 00 52 36      [ 1]   70 	mov	0x5236+0, #0x00
                                     71 ;	lib/uart.c: 18: UART1->CR4 = UART1_CR4_RESET_VALUE;  /* Set UART1_CR4 to reset value 0x00 */
      0091BE 35 00 52 37      [ 1]   72 	mov	0x5237+0, #0x00
                                     73 ;	lib/uart.c: 19: UART1->CR5 = UART1_CR5_RESET_VALUE;  /* Set UART1_CR5 to reset value 0x00 */
      0091C2 35 00 52 38      [ 1]   74 	mov	0x5238+0, #0x00
                                     75 ;	lib/uart.c: 21: UART1->GTR = UART1_GTR_RESET_VALUE;
      0091C6 35 00 52 39      [ 1]   76 	mov	0x5239+0, #0x00
                                     77 ;	lib/uart.c: 22: UART1->PSCR = UART1_PSCR_RESET_VALUE;
      0091CA 35 00 52 3A      [ 1]   78 	mov	0x523a+0, #0x00
      0091CE 81               [ 4]   79 	ret
                                     80 ;	lib/uart.c: 25: void UART1_Init(uint32_t BaudRate, UART1_WordLength_TypeDef WordLength, 
                                     81 ;	-----------------------------------------
                                     82 ;	 function UART1_Init
                                     83 ;	-----------------------------------------
      0091CF                         84 _UART1_Init:
      0091CF 52 25            [ 2]   85 	sub	sp, #37
                                     86 ;	lib/uart.c: 32: UART1->CR1 &= (uint8_t)(~UART1_CR1_M);  
      0091D1 AE 52 34         [ 2]   87 	ldw	x, #0x5234
      0091D4 F6               [ 1]   88 	ld	a, (x)
      0091D5 A4 EF            [ 1]   89 	and	a, #0xef
      0091D7 F7               [ 1]   90 	ld	(x), a
                                     91 ;	lib/uart.c: 35: UART1->CR1 |= (uint8_t)WordLength;
      0091D8 AE 52 34         [ 2]   92 	ldw	x, #0x5234
      0091DB F6               [ 1]   93 	ld	a, (x)
      0091DC 1A 2C            [ 1]   94 	or	a, (0x2c, sp)
      0091DE AE 52 34         [ 2]   95 	ldw	x, #0x5234
      0091E1 F7               [ 1]   96 	ld	(x), a
                                     97 ;	lib/uart.c: 38: UART1->CR3 &= (uint8_t)(~UART1_CR3_STOP);  
      0091E2 AE 52 36         [ 2]   98 	ldw	x, #0x5236
      0091E5 F6               [ 1]   99 	ld	a, (x)
      0091E6 A4 CF            [ 1]  100 	and	a, #0xcf
      0091E8 F7               [ 1]  101 	ld	(x), a
                                    102 ;	lib/uart.c: 40: UART1->CR3 |= (uint8_t)StopBits;  
      0091E9 AE 52 36         [ 2]  103 	ldw	x, #0x5236
      0091EC F6               [ 1]  104 	ld	a, (x)
      0091ED 1A 2D            [ 1]  105 	or	a, (0x2d, sp)
      0091EF AE 52 36         [ 2]  106 	ldw	x, #0x5236
      0091F2 F7               [ 1]  107 	ld	(x), a
                                    108 ;	lib/uart.c: 43: UART1->CR1 &= (uint8_t)(~(UART1_CR1_PCEN | UART1_CR1_PS  ));  
      0091F3 AE 52 34         [ 2]  109 	ldw	x, #0x5234
      0091F6 F6               [ 1]  110 	ld	a, (x)
      0091F7 A4 F9            [ 1]  111 	and	a, #0xf9
      0091F9 F7               [ 1]  112 	ld	(x), a
                                    113 ;	lib/uart.c: 45: UART1->CR1 |= (uint8_t)Parity;  
      0091FA AE 52 34         [ 2]  114 	ldw	x, #0x5234
      0091FD F6               [ 1]  115 	ld	a, (x)
      0091FE 1A 2E            [ 1]  116 	or	a, (0x2e, sp)
      009200 AE 52 34         [ 2]  117 	ldw	x, #0x5234
      009203 F7               [ 1]  118 	ld	(x), a
                                    119 ;	lib/uart.c: 48: UART1->BRR1 &= (uint8_t)(~UART1_BRR1_DIVM);  
      009204 AE 52 32         [ 2]  120 	ldw	x, #0x5232
      009207 F6               [ 1]  121 	ld	a, (x)
      009208 35 00 52 32      [ 1]  122 	mov	0x5232+0, #0x00
                                    123 ;	lib/uart.c: 50: UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVM);  
      00920C AE 52 33         [ 2]  124 	ldw	x, #0x5233
      00920F F6               [ 1]  125 	ld	a, (x)
      009210 A4 0F            [ 1]  126 	and	a, #0x0f
      009212 F7               [ 1]  127 	ld	(x), a
                                    128 ;	lib/uart.c: 52: UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVF);  
      009213 AE 52 33         [ 2]  129 	ldw	x, #0x5233
      009216 F6               [ 1]  130 	ld	a, (x)
      009217 A4 F0            [ 1]  131 	and	a, #0xf0
      009219 F7               [ 1]  132 	ld	(x), a
                                    133 ;	lib/uart.c: 55: BaudRate_Mantissa    = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
      00921A CD 8E 1C         [ 4]  134 	call	_CLK_GetClockFreq
      00921D 1F 13            [ 2]  135 	ldw	(0x13, sp), x
      00921F 1E 28            [ 2]  136 	ldw	x, (0x28, sp)
      009221 1F 22            [ 2]  137 	ldw	(0x22, sp), x
      009223 1E 2A            [ 2]  138 	ldw	x, (0x2a, sp)
      009225 A6 04            [ 1]  139 	ld	a, #0x04
      009227                        140 00124$:
      009227 58               [ 2]  141 	sllw	x
      009228 09 23            [ 1]  142 	rlc	(0x23, sp)
      00922A 09 22            [ 1]  143 	rlc	(0x22, sp)
      00922C 4A               [ 1]  144 	dec	a
      00922D 26 F8            [ 1]  145 	jrne	00124$
      00922F 1F 24            [ 2]  146 	ldw	(0x24, sp), x
      009231 1E 24            [ 2]  147 	ldw	x, (0x24, sp)
      009233 89               [ 2]  148 	pushw	x
      009234 1E 24            [ 2]  149 	ldw	x, (0x24, sp)
      009236 89               [ 2]  150 	pushw	x
      009237 1E 17            [ 2]  151 	ldw	x, (0x17, sp)
      009239 89               [ 2]  152 	pushw	x
      00923A 90 89            [ 2]  153 	pushw	y
      00923C CD 95 05         [ 4]  154 	call	__divulong
      00923F 5B 08            [ 2]  155 	addw	sp, #8
      009241 1F 07            [ 2]  156 	ldw	(0x07, sp), x
      009243 17 05            [ 2]  157 	ldw	(0x05, sp), y
                                    158 ;	lib/uart.c: 56: BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
      009245 CD 8E 1C         [ 4]  159 	call	_CLK_GetClockFreq
      009248 89               [ 2]  160 	pushw	x
      009249 90 89            [ 2]  161 	pushw	y
      00924B 4B 64            [ 1]  162 	push	#0x64
      00924D 5F               [ 1]  163 	clrw	x
      00924E 89               [ 2]  164 	pushw	x
      00924F 4B 00            [ 1]  165 	push	#0x00
      009251 CD 95 5F         [ 4]  166 	call	__mullong
      009254 5B 08            [ 2]  167 	addw	sp, #8
      009256 1F 20            [ 2]  168 	ldw	(0x20, sp), x
      009258 1E 24            [ 2]  169 	ldw	x, (0x24, sp)
      00925A 89               [ 2]  170 	pushw	x
      00925B 1E 24            [ 2]  171 	ldw	x, (0x24, sp)
      00925D 89               [ 2]  172 	pushw	x
      00925E 1E 24            [ 2]  173 	ldw	x, (0x24, sp)
      009260 89               [ 2]  174 	pushw	x
      009261 90 89            [ 2]  175 	pushw	y
      009263 CD 95 05         [ 4]  176 	call	__divulong
      009266 5B 08            [ 2]  177 	addw	sp, #8
      009268 1F 03            [ 2]  178 	ldw	(0x03, sp), x
      00926A 17 01            [ 2]  179 	ldw	(0x01, sp), y
                                    180 ;	lib/uart.c: 58: UART1->BRR2 |= (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100)) << 4) / 100) & (uint8_t)0x0F); 
      00926C AE 52 33         [ 2]  181 	ldw	x, #0x5233
      00926F F6               [ 1]  182 	ld	a, (x)
      009270 6B 1B            [ 1]  183 	ld	(0x1b, sp), a
      009272 1E 07            [ 2]  184 	ldw	x, (0x07, sp)
      009274 89               [ 2]  185 	pushw	x
      009275 1E 07            [ 2]  186 	ldw	x, (0x07, sp)
      009277 89               [ 2]  187 	pushw	x
      009278 4B 64            [ 1]  188 	push	#0x64
      00927A 5F               [ 1]  189 	clrw	x
      00927B 89               [ 2]  190 	pushw	x
      00927C 4B 00            [ 1]  191 	push	#0x00
      00927E CD 95 5F         [ 4]  192 	call	__mullong
      009281 5B 08            [ 2]  193 	addw	sp, #8
      009283 1F 0F            [ 2]  194 	ldw	(0x0f, sp), x
      009285 17 0D            [ 2]  195 	ldw	(0x0d, sp), y
      009287 1E 03            [ 2]  196 	ldw	x, (0x03, sp)
      009289 72 F0 0F         [ 2]  197 	subw	x, (0x0f, sp)
      00928C 1F 0B            [ 2]  198 	ldw	(0x0b, sp), x
      00928E 7B 02            [ 1]  199 	ld	a, (0x02, sp)
      009290 12 0E            [ 1]  200 	sbc	a, (0x0e, sp)
      009292 6B 0A            [ 1]  201 	ld	(0x0a, sp), a
      009294 7B 01            [ 1]  202 	ld	a, (0x01, sp)
      009296 12 0D            [ 1]  203 	sbc	a, (0x0d, sp)
      009298 6B 09            [ 1]  204 	ld	(0x09, sp), a
      00929A 1E 0B            [ 2]  205 	ldw	x, (0x0b, sp)
      00929C 16 09            [ 2]  206 	ldw	y, (0x09, sp)
      00929E A6 04            [ 1]  207 	ld	a, #0x04
      0092A0                        208 00126$:
      0092A0 58               [ 2]  209 	sllw	x
      0092A1 90 59            [ 2]  210 	rlcw	y
      0092A3 4A               [ 1]  211 	dec	a
      0092A4 26 FA            [ 1]  212 	jrne	00126$
      0092A6 4B 64            [ 1]  213 	push	#0x64
      0092A8 4B 00            [ 1]  214 	push	#0x00
      0092AA 4B 00            [ 1]  215 	push	#0x00
      0092AC 4B 00            [ 1]  216 	push	#0x00
      0092AE 89               [ 2]  217 	pushw	x
      0092AF 90 89            [ 2]  218 	pushw	y
      0092B1 CD 95 05         [ 4]  219 	call	__divulong
      0092B4 5B 08            [ 2]  220 	addw	sp, #8
      0092B6 9F               [ 1]  221 	ld	a, xl
      0092B7 A4 0F            [ 1]  222 	and	a, #0x0f
      0092B9 1A 1B            [ 1]  223 	or	a, (0x1b, sp)
      0092BB AE 52 33         [ 2]  224 	ldw	x, #0x5233
      0092BE F7               [ 1]  225 	ld	(x), a
                                    226 ;	lib/uart.c: 60: UART1->BRR2 |= (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0); 
      0092BF AE 52 33         [ 2]  227 	ldw	x, #0x5233
      0092C2 F6               [ 1]  228 	ld	a, (x)
      0092C3 6B 1C            [ 1]  229 	ld	(0x1c, sp), a
      0092C5 1E 07            [ 2]  230 	ldw	x, (0x07, sp)
      0092C7 16 05            [ 2]  231 	ldw	y, (0x05, sp)
      0092C9 90 54            [ 2]  232 	srlw	y
      0092CB 56               [ 2]  233 	rrcw	x
      0092CC 90 54            [ 2]  234 	srlw	y
      0092CE 56               [ 2]  235 	rrcw	x
      0092CF 90 54            [ 2]  236 	srlw	y
      0092D1 56               [ 2]  237 	rrcw	x
      0092D2 90 54            [ 2]  238 	srlw	y
      0092D4 56               [ 2]  239 	rrcw	x
      0092D5 9F               [ 1]  240 	ld	a, xl
      0092D6 A4 F0            [ 1]  241 	and	a, #0xf0
      0092D8 88               [ 1]  242 	push	a
      0092D9 5F               [ 1]  243 	clrw	x
      0092DA 0F 17            [ 1]  244 	clr	(0x17, sp)
      0092DC 84               [ 1]  245 	pop	a
      0092DD 1A 1C            [ 1]  246 	or	a, (0x1c, sp)
      0092DF AE 52 33         [ 2]  247 	ldw	x, #0x5233
      0092E2 F7               [ 1]  248 	ld	(x), a
                                    249 ;	lib/uart.c: 62: UART1->BRR1 |= (uint8_t)BaudRate_Mantissa;           
      0092E3 AE 52 32         [ 2]  250 	ldw	x, #0x5232
      0092E6 F6               [ 1]  251 	ld	a, (x)
      0092E7 6B 1A            [ 1]  252 	ld	(0x1a, sp), a
      0092E9 7B 08            [ 1]  253 	ld	a, (0x08, sp)
      0092EB 1A 1A            [ 1]  254 	or	a, (0x1a, sp)
      0092ED AE 52 32         [ 2]  255 	ldw	x, #0x5232
      0092F0 F7               [ 1]  256 	ld	(x), a
                                    257 ;	lib/uart.c: 65: UART1->CR2 &= (uint8_t)~(UART1_CR2_TEN | UART1_CR2_REN); 
      0092F1 AE 52 35         [ 2]  258 	ldw	x, #0x5235
      0092F4 F6               [ 1]  259 	ld	a, (x)
      0092F5 A4 F3            [ 1]  260 	and	a, #0xf3
      0092F7 F7               [ 1]  261 	ld	(x), a
                                    262 ;	lib/uart.c: 67: UART1->CR3 &= (uint8_t)~(UART1_CR3_CPOL | UART1_CR3_CPHA | UART1_CR3_LBCL); 
      0092F8 AE 52 36         [ 2]  263 	ldw	x, #0x5236
      0092FB F6               [ 1]  264 	ld	a, (x)
      0092FC A4 F8            [ 1]  265 	and	a, #0xf8
      0092FE F7               [ 1]  266 	ld	(x), a
                                    267 ;	lib/uart.c: 69: UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & (uint8_t)(UART1_CR3_CPOL | 
      0092FF AE 52 36         [ 2]  268 	ldw	x, #0x5236
      009302 F6               [ 1]  269 	ld	a, (x)
      009303 6B 15            [ 1]  270 	ld	(0x15, sp), a
      009305 7B 2F            [ 1]  271 	ld	a, (0x2f, sp)
      009307 A4 07            [ 1]  272 	and	a, #0x07
      009309 1A 15            [ 1]  273 	or	a, (0x15, sp)
      00930B AE 52 36         [ 2]  274 	ldw	x, #0x5236
      00930E F7               [ 1]  275 	ld	(x), a
                                    276 ;	lib/uart.c: 72: if ((uint8_t)(Mode & UART1_MODE_TX_ENABLE))
      00930F 7B 30            [ 1]  277 	ld	a, (0x30, sp)
      009311 A5 04            [ 1]  278 	bcp	a, #0x04
      009313 27 09            [ 1]  279 	jreq	00102$
                                    280 ;	lib/uart.c: 75: UART1->CR2 |= (uint8_t)UART1_CR2_TEN;  
      009315 AE 52 35         [ 2]  281 	ldw	x, #0x5235
      009318 F6               [ 1]  282 	ld	a, (x)
      009319 AA 08            [ 1]  283 	or	a, #0x08
      00931B F7               [ 1]  284 	ld	(x), a
      00931C 20 07            [ 2]  285 	jra	00103$
      00931E                        286 00102$:
                                    287 ;	lib/uart.c: 80: UART1->CR2 &= (uint8_t)(~UART1_CR2_TEN);  
      00931E AE 52 35         [ 2]  288 	ldw	x, #0x5235
      009321 F6               [ 1]  289 	ld	a, (x)
      009322 A4 F7            [ 1]  290 	and	a, #0xf7
      009324 F7               [ 1]  291 	ld	(x), a
      009325                        292 00103$:
                                    293 ;	lib/uart.c: 82: if ((uint8_t)(Mode & UART1_MODE_RX_ENABLE))
      009325 7B 30            [ 1]  294 	ld	a, (0x30, sp)
      009327 A5 08            [ 1]  295 	bcp	a, #0x08
      009329 27 09            [ 1]  296 	jreq	00105$
                                    297 ;	lib/uart.c: 85: UART1->CR2 |= (uint8_t)UART1_CR2_REN;  
      00932B AE 52 35         [ 2]  298 	ldw	x, #0x5235
      00932E F6               [ 1]  299 	ld	a, (x)
      00932F AA 04            [ 1]  300 	or	a, #0x04
      009331 F7               [ 1]  301 	ld	(x), a
      009332 20 07            [ 2]  302 	jra	00106$
      009334                        303 00105$:
                                    304 ;	lib/uart.c: 90: UART1->CR2 &= (uint8_t)(~UART1_CR2_REN);  
      009334 AE 52 35         [ 2]  305 	ldw	x, #0x5235
      009337 F6               [ 1]  306 	ld	a, (x)
      009338 A4 FB            [ 1]  307 	and	a, #0xfb
      00933A F7               [ 1]  308 	ld	(x), a
      00933B                        309 00106$:
                                    310 ;	lib/uart.c: 94: if ((uint8_t)(SyncMode & UART1_SYNCMODE_CLOCK_DISABLE))
      00933B 0D 2F            [ 1]  311 	tnz	(0x2f, sp)
      00933D 2A 09            [ 1]  312 	jrpl	00108$
                                    313 ;	lib/uart.c: 97: UART1->CR3 &= (uint8_t)(~UART1_CR3_CKEN); 
      00933F AE 52 36         [ 2]  314 	ldw	x, #0x5236
      009342 F6               [ 1]  315 	ld	a, (x)
      009343 A4 F7            [ 1]  316 	and	a, #0xf7
      009345 F7               [ 1]  317 	ld	(x), a
      009346 20 10            [ 2]  318 	jra	00110$
      009348                        319 00108$:
                                    320 ;	lib/uart.c: 101: UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & UART1_CR3_CKEN);
      009348 AE 52 36         [ 2]  321 	ldw	x, #0x5236
      00934B F6               [ 1]  322 	ld	a, (x)
      00934C 6B 1D            [ 1]  323 	ld	(0x1d, sp), a
      00934E 7B 2F            [ 1]  324 	ld	a, (0x2f, sp)
      009350 A4 08            [ 1]  325 	and	a, #0x08
      009352 1A 1D            [ 1]  326 	or	a, (0x1d, sp)
      009354 AE 52 36         [ 2]  327 	ldw	x, #0x5236
      009357 F7               [ 1]  328 	ld	(x), a
      009358                        329 00110$:
      009358 5B 25            [ 2]  330 	addw	sp, #37
      00935A 81               [ 4]  331 	ret
                                    332 ;	lib/uart.c: 105: void UART1_Cmd(FunctionalState NewState)
                                    333 ;	-----------------------------------------
                                    334 ;	 function UART1_Cmd
                                    335 ;	-----------------------------------------
      00935B                        336 _UART1_Cmd:
                                    337 ;	lib/uart.c: 107: if (NewState != DISABLE)
      00935B 0D 03            [ 1]  338 	tnz	(0x03, sp)
      00935D 27 08            [ 1]  339 	jreq	00102$
                                    340 ;	lib/uart.c: 110: UART1->CR1 &= (uint8_t)(~UART1_CR1_UARTD); 
      00935F AE 52 34         [ 2]  341 	ldw	x, #0x5234
      009362 F6               [ 1]  342 	ld	a, (x)
      009363 A4 DF            [ 1]  343 	and	a, #0xdf
      009365 F7               [ 1]  344 	ld	(x), a
      009366 81               [ 4]  345 	ret
      009367                        346 00102$:
                                    347 ;	lib/uart.c: 115: UART1->CR1 |= UART1_CR1_UARTD;  
      009367 AE 52 34         [ 2]  348 	ldw	x, #0x5234
      00936A F6               [ 1]  349 	ld	a, (x)
      00936B AA 20            [ 1]  350 	or	a, #0x20
      00936D F7               [ 1]  351 	ld	(x), a
      00936E 81               [ 4]  352 	ret
                                    353 ;	lib/uart.c: 119: void UART1_ITConfig(UART1_IT_TypeDef UART1_IT, FunctionalState NewState)
                                    354 ;	-----------------------------------------
                                    355 ;	 function UART1_ITConfig
                                    356 ;	-----------------------------------------
      00936F                        357 _UART1_ITConfig:
      00936F 52 03            [ 2]  358 	sub	sp, #3
                                    359 ;	lib/uart.c: 124: uartreg = (uint8_t)((uint16_t)UART1_IT >> 0x08);
      009371 7B 06            [ 1]  360 	ld	a, (0x06, sp)
      009373 97               [ 1]  361 	ld	xl, a
      009374 4F               [ 1]  362 	clr	a
                                    363 ;	lib/uart.c: 126: itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
      009375 7B 07            [ 1]  364 	ld	a, (0x07, sp)
      009377 A4 0F            [ 1]  365 	and	a, #0x0f
      009379 95               [ 1]  366 	ld	xh, a
      00937A A6 01            [ 1]  367 	ld	a, #0x01
      00937C 88               [ 1]  368 	push	a
      00937D 9E               [ 1]  369 	ld	a, xh
      00937E 4D               [ 1]  370 	tnz	a
      00937F 27 05            [ 1]  371 	jreq	00139$
      009381                        372 00138$:
      009381 08 01            [ 1]  373 	sll	(1, sp)
      009383 4A               [ 1]  374 	dec	a
      009384 26 FB            [ 1]  375 	jrne	00138$
      009386                        376 00139$:
      009386 84               [ 1]  377 	pop	a
      009387 6B 01            [ 1]  378 	ld	(0x01, sp), a
                                    379 ;	lib/uart.c: 131: if (uartreg == 0x01)
      009389 9F               [ 1]  380 	ld	a, xl
      00938A A1 01            [ 1]  381 	cp	a, #0x01
      00938C 26 06            [ 1]  382 	jrne	00141$
      00938E A6 01            [ 1]  383 	ld	a, #0x01
      009390 6B 03            [ 1]  384 	ld	(0x03, sp), a
      009392 20 02            [ 2]  385 	jra	00142$
      009394                        386 00141$:
      009394 0F 03            [ 1]  387 	clr	(0x03, sp)
      009396                        388 00142$:
                                    389 ;	lib/uart.c: 135: else if (uartreg == 0x02)
      009396 9F               [ 1]  390 	ld	a, xl
      009397 A1 02            [ 1]  391 	cp	a, #0x02
      009399 26 03            [ 1]  392 	jrne	00144$
      00939B A6 01            [ 1]  393 	ld	a, #0x01
      00939D 21                     394 	.byte 0x21
      00939E                        395 00144$:
      00939E 4F               [ 1]  396 	clr	a
      00939F                        397 00145$:
                                    398 ;	lib/uart.c: 128: if (NewState != DISABLE)
      00939F 0D 08            [ 1]  399 	tnz	(0x08, sp)
      0093A1 27 2B            [ 1]  400 	jreq	00114$
                                    401 ;	lib/uart.c: 131: if (uartreg == 0x01)
      0093A3 0D 03            [ 1]  402 	tnz	(0x03, sp)
      0093A5 27 0C            [ 1]  403 	jreq	00105$
                                    404 ;	lib/uart.c: 133: UART1->CR1 |= itpos;
      0093A7 AE 52 34         [ 2]  405 	ldw	x, #0x5234
      0093AA F6               [ 1]  406 	ld	a, (x)
      0093AB 1A 01            [ 1]  407 	or	a, (0x01, sp)
      0093AD AE 52 34         [ 2]  408 	ldw	x, #0x5234
      0093B0 F7               [ 1]  409 	ld	(x), a
      0093B1 20 4B            [ 2]  410 	jra	00116$
      0093B3                        411 00105$:
                                    412 ;	lib/uart.c: 135: else if (uartreg == 0x02)
      0093B3 4D               [ 1]  413 	tnz	a
      0093B4 27 0C            [ 1]  414 	jreq	00102$
                                    415 ;	lib/uart.c: 137: UART1->CR2 |= itpos;
      0093B6 AE 52 35         [ 2]  416 	ldw	x, #0x5235
      0093B9 F6               [ 1]  417 	ld	a, (x)
      0093BA 1A 01            [ 1]  418 	or	a, (0x01, sp)
      0093BC AE 52 35         [ 2]  419 	ldw	x, #0x5235
      0093BF F7               [ 1]  420 	ld	(x), a
      0093C0 20 3C            [ 2]  421 	jra	00116$
      0093C2                        422 00102$:
                                    423 ;	lib/uart.c: 141: UART1->CR4 |= itpos;
      0093C2 AE 52 37         [ 2]  424 	ldw	x, #0x5237
      0093C5 F6               [ 1]  425 	ld	a, (x)
      0093C6 1A 01            [ 1]  426 	or	a, (0x01, sp)
      0093C8 AE 52 37         [ 2]  427 	ldw	x, #0x5237
      0093CB F7               [ 1]  428 	ld	(x), a
      0093CC 20 30            [ 2]  429 	jra	00116$
      0093CE                        430 00114$:
                                    431 ;	lib/uart.c: 149: UART1->CR1 &= (uint8_t)(~itpos);
      0093CE 88               [ 1]  432 	push	a
      0093CF 7B 02            [ 1]  433 	ld	a, (0x02, sp)
      0093D1 43               [ 1]  434 	cpl	a
      0093D2 6B 03            [ 1]  435 	ld	(0x03, sp), a
      0093D4 84               [ 1]  436 	pop	a
                                    437 ;	lib/uart.c: 147: if (uartreg == 0x01)
      0093D5 0D 03            [ 1]  438 	tnz	(0x03, sp)
      0093D7 27 0C            [ 1]  439 	jreq	00111$
                                    440 ;	lib/uart.c: 149: UART1->CR1 &= (uint8_t)(~itpos);
      0093D9 AE 52 34         [ 2]  441 	ldw	x, #0x5234
      0093DC F6               [ 1]  442 	ld	a, (x)
      0093DD 14 02            [ 1]  443 	and	a, (0x02, sp)
      0093DF AE 52 34         [ 2]  444 	ldw	x, #0x5234
      0093E2 F7               [ 1]  445 	ld	(x), a
      0093E3 20 19            [ 2]  446 	jra	00116$
      0093E5                        447 00111$:
                                    448 ;	lib/uart.c: 151: else if (uartreg == 0x02)
      0093E5 4D               [ 1]  449 	tnz	a
      0093E6 27 0C            [ 1]  450 	jreq	00108$
                                    451 ;	lib/uart.c: 153: UART1->CR2 &= (uint8_t)(~itpos);
      0093E8 AE 52 35         [ 2]  452 	ldw	x, #0x5235
      0093EB F6               [ 1]  453 	ld	a, (x)
      0093EC 14 02            [ 1]  454 	and	a, (0x02, sp)
      0093EE AE 52 35         [ 2]  455 	ldw	x, #0x5235
      0093F1 F7               [ 1]  456 	ld	(x), a
      0093F2 20 0A            [ 2]  457 	jra	00116$
      0093F4                        458 00108$:
                                    459 ;	lib/uart.c: 157: UART1->CR4 &= (uint8_t)(~itpos);
      0093F4 AE 52 37         [ 2]  460 	ldw	x, #0x5237
      0093F7 F6               [ 1]  461 	ld	a, (x)
      0093F8 14 02            [ 1]  462 	and	a, (0x02, sp)
      0093FA AE 52 37         [ 2]  463 	ldw	x, #0x5237
      0093FD F7               [ 1]  464 	ld	(x), a
      0093FE                        465 00116$:
      0093FE 5B 03            [ 2]  466 	addw	sp, #3
      009400 81               [ 4]  467 	ret
                                    468 ;	lib/uart.c: 163: uint8_t UART1_ReceiveData8(void)
                                    469 ;	-----------------------------------------
                                    470 ;	 function UART1_ReceiveData8
                                    471 ;	-----------------------------------------
      009401                        472 _UART1_ReceiveData8:
                                    473 ;	lib/uart.c: 165: return ((uint8_t)UART1->DR);
      009401 AE 52 31         [ 2]  474 	ldw	x, #0x5231
      009404 F6               [ 1]  475 	ld	a, (x)
      009405 81               [ 4]  476 	ret
                                    477 ;	lib/uart.c: 168: void UART1_SendData8(uint8_t Data)
                                    478 ;	-----------------------------------------
                                    479 ;	 function UART1_SendData8
                                    480 ;	-----------------------------------------
      009406                        481 _UART1_SendData8:
                                    482 ;	lib/uart.c: 171: UART1->DR = Data;
      009406 AE 52 31         [ 2]  483 	ldw	x, #0x5231
      009409 7B 03            [ 1]  484 	ld	a, (0x03, sp)
      00940B F7               [ 1]  485 	ld	(x), a
      00940C 81               [ 4]  486 	ret
                                    487 ;	lib/uart.c: 174: FlagStatus UART1_GetFlagStatus(UART1_Flag_TypeDef UART1_FLAG)
                                    488 ;	-----------------------------------------
                                    489 ;	 function UART1_GetFlagStatus
                                    490 ;	-----------------------------------------
      00940D                        491 _UART1_GetFlagStatus:
      00940D 88               [ 1]  492 	push	a
                                    493 ;	lib/uart.c: 180: if ((UART1->CR4 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
      00940E 7B 05            [ 1]  494 	ld	a, (0x05, sp)
      009410 6B 01            [ 1]  495 	ld	(0x01, sp), a
                                    496 ;	lib/uart.c: 178: if (UART1_FLAG == UART1_FLAG_LBDF)
      009412 1E 04            [ 2]  497 	ldw	x, (0x04, sp)
      009414 A3 02 10         [ 2]  498 	cpw	x, #0x0210
      009417 26 10            [ 1]  499 	jrne	00114$
                                    500 ;	lib/uart.c: 180: if ((UART1->CR4 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
      009419 AE 52 37         [ 2]  501 	ldw	x, #0x5237
      00941C F6               [ 1]  502 	ld	a, (x)
      00941D 14 01            [ 1]  503 	and	a, (0x01, sp)
      00941F 4D               [ 1]  504 	tnz	a
      009420 27 04            [ 1]  505 	jreq	00102$
                                    506 ;	lib/uart.c: 183: status = SET;
      009422 A6 01            [ 1]  507 	ld	a, #0x01
      009424 20 27            [ 2]  508 	jra	00115$
      009426                        509 00102$:
                                    510 ;	lib/uart.c: 188: status = RESET;
      009426 4F               [ 1]  511 	clr	a
      009427 20 24            [ 2]  512 	jra	00115$
      009429                        513 00114$:
                                    514 ;	lib/uart.c: 191: else if (UART1_FLAG == UART1_FLAG_SBK)
      009429 1E 04            [ 2]  515 	ldw	x, (0x04, sp)
      00942B A3 01 01         [ 2]  516 	cpw	x, #0x0101
      00942E 26 10            [ 1]  517 	jrne	00111$
                                    518 ;	lib/uart.c: 193: if ((UART1->CR2 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
      009430 AE 52 35         [ 2]  519 	ldw	x, #0x5235
      009433 F6               [ 1]  520 	ld	a, (x)
      009434 14 01            [ 1]  521 	and	a, (0x01, sp)
      009436 4D               [ 1]  522 	tnz	a
      009437 27 04            [ 1]  523 	jreq	00105$
                                    524 ;	lib/uart.c: 196: status = SET;
      009439 A6 01            [ 1]  525 	ld	a, #0x01
      00943B 20 10            [ 2]  526 	jra	00115$
      00943D                        527 00105$:
                                    528 ;	lib/uart.c: 201: status = RESET;
      00943D 4F               [ 1]  529 	clr	a
      00943E 20 0D            [ 2]  530 	jra	00115$
      009440                        531 00111$:
                                    532 ;	lib/uart.c: 206: if ((UART1->SR & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
      009440 AE 52 30         [ 2]  533 	ldw	x, #0x5230
      009443 F6               [ 1]  534 	ld	a, (x)
      009444 14 01            [ 1]  535 	and	a, (0x01, sp)
      009446 4D               [ 1]  536 	tnz	a
      009447 27 03            [ 1]  537 	jreq	00108$
                                    538 ;	lib/uart.c: 209: status = SET;
      009449 A6 01            [ 1]  539 	ld	a, #0x01
                                    540 ;	lib/uart.c: 214: status = RESET;
      00944B 21                     541 	.byte 0x21
      00944C                        542 00108$:
      00944C 4F               [ 1]  543 	clr	a
      00944D                        544 00115$:
                                    545 ;	lib/uart.c: 218: return status;
      00944D 5B 01            [ 2]  546 	addw	sp, #1
      00944F 81               [ 4]  547 	ret
                                    548 ;	lib/uart.c: 221: void UART1_ClearFlag(UART1_Flag_TypeDef UART1_FLAG)
                                    549 ;	-----------------------------------------
                                    550 ;	 function UART1_ClearFlag
                                    551 ;	-----------------------------------------
      009450                        552 _UART1_ClearFlag:
                                    553 ;	lib/uart.c: 224: if (UART1_FLAG == UART1_FLAG_RXNE)
      009450 1E 03            [ 2]  554 	ldw	x, (0x03, sp)
      009452 A3 00 20         [ 2]  555 	cpw	x, #0x0020
      009455 26 05            [ 1]  556 	jrne	00102$
                                    557 ;	lib/uart.c: 226: UART1->SR = (uint8_t)~(UART1_SR_RXNE);
      009457 35 DF 52 30      [ 1]  558 	mov	0x5230+0, #0xdf
      00945B 81               [ 4]  559 	ret
      00945C                        560 00102$:
                                    561 ;	lib/uart.c: 231: UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
      00945C AE 52 37         [ 2]  562 	ldw	x, #0x5237
      00945F F6               [ 1]  563 	ld	a, (x)
      009460 A4 EF            [ 1]  564 	and	a, #0xef
      009462 F7               [ 1]  565 	ld	(x), a
      009463 81               [ 4]  566 	ret
                                    567 ;	lib/uart.c: 235: ITStatus UART1_GetITStatus(UART1_IT_TypeDef UART1_IT)
                                    568 ;	-----------------------------------------
                                    569 ;	 function UART1_GetITStatus
                                    570 ;	-----------------------------------------
      009464                        571 _UART1_GetITStatus:
      009464 52 05            [ 2]  572 	sub	sp, #5
                                    573 ;	lib/uart.c: 244: itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
      009466 7B 09            [ 1]  574 	ld	a, (0x09, sp)
      009468 97               [ 1]  575 	ld	xl, a
      009469 A4 0F            [ 1]  576 	and	a, #0x0f
      00946B 95               [ 1]  577 	ld	xh, a
      00946C A6 01            [ 1]  578 	ld	a, #0x01
      00946E 88               [ 1]  579 	push	a
      00946F 9E               [ 1]  580 	ld	a, xh
      009470 4D               [ 1]  581 	tnz	a
      009471 27 05            [ 1]  582 	jreq	00154$
      009473                        583 00153$:
      009473 08 01            [ 1]  584 	sll	(1, sp)
      009475 4A               [ 1]  585 	dec	a
      009476 26 FB            [ 1]  586 	jrne	00153$
      009478                        587 00154$:
      009478 84               [ 1]  588 	pop	a
      009479 6B 02            [ 1]  589 	ld	(0x02, sp), a
                                    590 ;	lib/uart.c: 246: itmask1 = (uint8_t)((uint8_t)UART1_IT >> (uint8_t)4);
      00947B 9F               [ 1]  591 	ld	a, xl
      00947C 4E               [ 1]  592 	swap	a
      00947D A4 0F            [ 1]  593 	and	a, #0x0f
      00947F 97               [ 1]  594 	ld	xl, a
                                    595 ;	lib/uart.c: 248: itmask2 = (uint8_t)((uint8_t)1 << itmask1);
      009480 A6 01            [ 1]  596 	ld	a, #0x01
      009482 88               [ 1]  597 	push	a
      009483 9F               [ 1]  598 	ld	a, xl
      009484 4D               [ 1]  599 	tnz	a
      009485 27 05            [ 1]  600 	jreq	00156$
      009487                        601 00155$:
      009487 08 01            [ 1]  602 	sll	(1, sp)
      009489 4A               [ 1]  603 	dec	a
      00948A 26 FB            [ 1]  604 	jrne	00155$
      00948C                        605 00156$:
      00948C 84               [ 1]  606 	pop	a
      00948D 6B 03            [ 1]  607 	ld	(0x03, sp), a
                                    608 ;	lib/uart.c: 251: if (UART1_IT == UART1_IT_PE)
      00948F 1E 08            [ 2]  609 	ldw	x, (0x08, sp)
      009491 A3 01 00         [ 2]  610 	cpw	x, #0x0100
      009494 26 1C            [ 1]  611 	jrne	00117$
                                    612 ;	lib/uart.c: 254: enablestatus = (uint8_t)((uint8_t)UART1->CR1 & itmask2);
      009496 AE 52 34         [ 2]  613 	ldw	x, #0x5234
      009499 F6               [ 1]  614 	ld	a, (x)
      00949A 14 03            [ 1]  615 	and	a, (0x03, sp)
      00949C 6B 04            [ 1]  616 	ld	(0x04, sp), a
                                    617 ;	lib/uart.c: 257: if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
      00949E AE 52 30         [ 2]  618 	ldw	x, #0x5230
      0094A1 F6               [ 1]  619 	ld	a, (x)
      0094A2 14 02            [ 1]  620 	and	a, (0x02, sp)
      0094A4 4D               [ 1]  621 	tnz	a
      0094A5 27 08            [ 1]  622 	jreq	00102$
      0094A7 0D 04            [ 1]  623 	tnz	(0x04, sp)
      0094A9 27 04            [ 1]  624 	jreq	00102$
                                    625 ;	lib/uart.c: 260: pendingbitstatus = SET;
      0094AB A6 01            [ 1]  626 	ld	a, #0x01
      0094AD 20 3F            [ 2]  627 	jra	00118$
      0094AF                        628 00102$:
                                    629 ;	lib/uart.c: 265: pendingbitstatus = RESET;
      0094AF 4F               [ 1]  630 	clr	a
      0094B0 20 3C            [ 2]  631 	jra	00118$
      0094B2                        632 00117$:
                                    633 ;	lib/uart.c: 269: else if (UART1_IT == UART1_IT_LBDF)
      0094B2 1E 08            [ 2]  634 	ldw	x, (0x08, sp)
      0094B4 A3 03 46         [ 2]  635 	cpw	x, #0x0346
      0094B7 26 1C            [ 1]  636 	jrne	00114$
                                    637 ;	lib/uart.c: 272: enablestatus = (uint8_t)((uint8_t)UART1->CR4 & itmask2);
      0094B9 AE 52 37         [ 2]  638 	ldw	x, #0x5237
      0094BC F6               [ 1]  639 	ld	a, (x)
      0094BD 14 03            [ 1]  640 	and	a, (0x03, sp)
      0094BF 6B 01            [ 1]  641 	ld	(0x01, sp), a
                                    642 ;	lib/uart.c: 274: if (((UART1->CR4 & itpos) != (uint8_t)0x00) && enablestatus)
      0094C1 AE 52 37         [ 2]  643 	ldw	x, #0x5237
      0094C4 F6               [ 1]  644 	ld	a, (x)
      0094C5 14 02            [ 1]  645 	and	a, (0x02, sp)
      0094C7 4D               [ 1]  646 	tnz	a
      0094C8 27 08            [ 1]  647 	jreq	00106$
      0094CA 0D 01            [ 1]  648 	tnz	(0x01, sp)
      0094CC 27 04            [ 1]  649 	jreq	00106$
                                    650 ;	lib/uart.c: 277: pendingbitstatus = SET;
      0094CE A6 01            [ 1]  651 	ld	a, #0x01
      0094D0 20 1C            [ 2]  652 	jra	00118$
      0094D2                        653 00106$:
                                    654 ;	lib/uart.c: 282: pendingbitstatus = RESET;
      0094D2 4F               [ 1]  655 	clr	a
      0094D3 20 19            [ 2]  656 	jra	00118$
      0094D5                        657 00114$:
                                    658 ;	lib/uart.c: 288: enablestatus = (uint8_t)((uint8_t)UART1->CR2 & itmask2);
      0094D5 AE 52 35         [ 2]  659 	ldw	x, #0x5235
      0094D8 F6               [ 1]  660 	ld	a, (x)
      0094D9 14 03            [ 1]  661 	and	a, (0x03, sp)
      0094DB 6B 05            [ 1]  662 	ld	(0x05, sp), a
                                    663 ;	lib/uart.c: 290: if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
      0094DD AE 52 30         [ 2]  664 	ldw	x, #0x5230
      0094E0 F6               [ 1]  665 	ld	a, (x)
      0094E1 14 02            [ 1]  666 	and	a, (0x02, sp)
      0094E3 4D               [ 1]  667 	tnz	a
      0094E4 27 07            [ 1]  668 	jreq	00110$
      0094E6 0D 05            [ 1]  669 	tnz	(0x05, sp)
      0094E8 27 03            [ 1]  670 	jreq	00110$
                                    671 ;	lib/uart.c: 293: pendingbitstatus = SET;
      0094EA A6 01            [ 1]  672 	ld	a, #0x01
                                    673 ;	lib/uart.c: 298: pendingbitstatus = RESET;
      0094EC 21                     674 	.byte 0x21
      0094ED                        675 00110$:
      0094ED 4F               [ 1]  676 	clr	a
      0094EE                        677 00118$:
                                    678 ;	lib/uart.c: 303: return  pendingbitstatus;
      0094EE 5B 05            [ 2]  679 	addw	sp, #5
      0094F0 81               [ 4]  680 	ret
                                    681 ;	lib/uart.c: 306: void UART1_ClearITPendingBit(UART1_IT_TypeDef UART1_IT)
                                    682 ;	-----------------------------------------
                                    683 ;	 function UART1_ClearITPendingBit
                                    684 ;	-----------------------------------------
      0094F1                        685 _UART1_ClearITPendingBit:
                                    686 ;	lib/uart.c: 309: if (UART1_IT == UART1_IT_RXNE)
      0094F1 1E 03            [ 2]  687 	ldw	x, (0x03, sp)
      0094F3 A3 02 55         [ 2]  688 	cpw	x, #0x0255
      0094F6 26 05            [ 1]  689 	jrne	00102$
                                    690 ;	lib/uart.c: 311: UART1->SR = (uint8_t)~(UART1_SR_RXNE);
      0094F8 35 DF 52 30      [ 1]  691 	mov	0x5230+0, #0xdf
      0094FC 81               [ 4]  692 	ret
      0094FD                        693 00102$:
                                    694 ;	lib/uart.c: 316: UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
      0094FD AE 52 37         [ 2]  695 	ldw	x, #0x5237
      009500 F6               [ 1]  696 	ld	a, (x)
      009501 A4 EF            [ 1]  697 	and	a, #0xef
      009503 F7               [ 1]  698 	ld	(x), a
      009504 81               [ 4]  699 	ret
                                    700 	.area CODE
                                    701 	.area INITIALIZER
                                    702 	.area CABS (ABS)
