                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.6.0 #9615 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8s_uart1
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
                                     16 	.globl _UART1_HalfDuplexCmd
                                     17 	.globl _UART1_IrDAConfig
                                     18 	.globl _UART1_IrDACmd
                                     19 	.globl _UART1_LINBreakDetectionConfig
                                     20 	.globl _UART1_LINCmd
                                     21 	.globl _UART1_SmartCardCmd
                                     22 	.globl _UART1_SmartCardNACKCmd
                                     23 	.globl _UART1_WakeUpConfig
                                     24 	.globl _UART1_ReceiverWakeUpCmd
                                     25 	.globl _UART1_ReceiveData8
                                     26 	.globl _UART1_ReceiveData9
                                     27 	.globl _UART1_SendData8
                                     28 	.globl _UART1_SendData9
                                     29 	.globl _UART1_SendBreak
                                     30 	.globl _UART1_SetAddress
                                     31 	.globl _UART1_SetGuardTime
                                     32 	.globl _UART1_SetPrescaler
                                     33 	.globl _UART1_GetFlagStatus
                                     34 	.globl _UART1_ClearFlag
                                     35 	.globl _UART1_GetITStatus
                                     36 	.globl _UART1_ClearITPendingBit
                                     37 ;--------------------------------------------------------
                                     38 ; ram data
                                     39 ;--------------------------------------------------------
                                     40 	.area DATA
                                     41 ;--------------------------------------------------------
                                     42 ; ram data
                                     43 ;--------------------------------------------------------
                                     44 	.area INITIALIZED
                                     45 ;--------------------------------------------------------
                                     46 ; absolute external ram data
                                     47 ;--------------------------------------------------------
                                     48 	.area DABS (ABS)
                                     49 ;--------------------------------------------------------
                                     50 ; global & static initialisations
                                     51 ;--------------------------------------------------------
                                     52 	.area HOME
                                     53 	.area GSINIT
                                     54 	.area GSFINAL
                                     55 	.area GSINIT
                                     56 ;--------------------------------------------------------
                                     57 ; Home
                                     58 ;--------------------------------------------------------
                                     59 	.area HOME
                                     60 	.area HOME
                                     61 ;--------------------------------------------------------
                                     62 ; code
                                     63 ;--------------------------------------------------------
                                     64 	.area CODE
                                     65 ;	lib/stm8s_uart1.c: 19: void UART1_DeInit(void)
                                     66 ;	-----------------------------------------
                                     67 ;	 function UART1_DeInit
                                     68 ;	-----------------------------------------
      009ADE                         69 _UART1_DeInit:
                                     70 ;	lib/stm8s_uart1.c: 23: (void)UART1->SR;
      009ADE AE 52 30         [ 2]   71 	ldw	x, #0x5230
      009AE1 F6               [ 1]   72 	ld	a, (x)
                                     73 ;	lib/stm8s_uart1.c: 24: (void)UART1->DR;
      009AE2 AE 52 31         [ 2]   74 	ldw	x, #0x5231
      009AE5 F6               [ 1]   75 	ld	a, (x)
                                     76 ;	lib/stm8s_uart1.c: 26: UART1->BRR2 = UART1_BRR2_RESET_VALUE;  /* Set UART1_BRR2 to reset value 0x00 */
      009AE6 35 00 52 33      [ 1]   77 	mov	0x5233+0, #0x00
                                     78 ;	lib/stm8s_uart1.c: 27: UART1->BRR1 = UART1_BRR1_RESET_VALUE;  /* Set UART1_BRR1 to reset value 0x00 */
      009AEA 35 00 52 32      [ 1]   79 	mov	0x5232+0, #0x00
                                     80 ;	lib/stm8s_uart1.c: 29: UART1->CR1 = UART1_CR1_RESET_VALUE;  /* Set UART1_CR1 to reset value 0x00 */
      009AEE 35 00 52 34      [ 1]   81 	mov	0x5234+0, #0x00
                                     82 ;	lib/stm8s_uart1.c: 30: UART1->CR2 = UART1_CR2_RESET_VALUE;  /* Set UART1_CR2 to reset value 0x00 */
      009AF2 35 00 52 35      [ 1]   83 	mov	0x5235+0, #0x00
                                     84 ;	lib/stm8s_uart1.c: 31: UART1->CR3 = UART1_CR3_RESET_VALUE;  /* Set UART1_CR3 to reset value 0x00 */
      009AF6 35 00 52 36      [ 1]   85 	mov	0x5236+0, #0x00
                                     86 ;	lib/stm8s_uart1.c: 32: UART1->CR4 = UART1_CR4_RESET_VALUE;  /* Set UART1_CR4 to reset value 0x00 */
      009AFA 35 00 52 37      [ 1]   87 	mov	0x5237+0, #0x00
                                     88 ;	lib/stm8s_uart1.c: 33: UART1->CR5 = UART1_CR5_RESET_VALUE;  /* Set UART1_CR5 to reset value 0x00 */
      009AFE 35 00 52 38      [ 1]   89 	mov	0x5238+0, #0x00
                                     90 ;	lib/stm8s_uart1.c: 35: UART1->GTR = UART1_GTR_RESET_VALUE;
      009B02 35 00 52 39      [ 1]   91 	mov	0x5239+0, #0x00
                                     92 ;	lib/stm8s_uart1.c: 36: UART1->PSCR = UART1_PSCR_RESET_VALUE;
      009B06 35 00 52 3A      [ 1]   93 	mov	0x523a+0, #0x00
      009B0A 81               [ 4]   94 	ret
                                     95 ;	lib/stm8s_uart1.c: 56: void UART1_Init(uint32_t BaudRate, UART1_WordLength_TypeDef WordLength, 
                                     96 ;	-----------------------------------------
                                     97 ;	 function UART1_Init
                                     98 ;	-----------------------------------------
      009B0B                         99 _UART1_Init:
      009B0B 52 25            [ 2]  100 	sub	sp, #37
                                    101 ;	lib/stm8s_uart1.c: 63: UART1->CR1 &= (uint8_t)(~UART1_CR1_M);  
      009B0D AE 52 34         [ 2]  102 	ldw	x, #0x5234
      009B10 F6               [ 1]  103 	ld	a, (x)
      009B11 A4 EF            [ 1]  104 	and	a, #0xef
      009B13 F7               [ 1]  105 	ld	(x), a
                                    106 ;	lib/stm8s_uart1.c: 66: UART1->CR1 |= (uint8_t)WordLength;
      009B14 AE 52 34         [ 2]  107 	ldw	x, #0x5234
      009B17 F6               [ 1]  108 	ld	a, (x)
      009B18 1A 2C            [ 1]  109 	or	a, (0x2c, sp)
      009B1A AE 52 34         [ 2]  110 	ldw	x, #0x5234
      009B1D F7               [ 1]  111 	ld	(x), a
                                    112 ;	lib/stm8s_uart1.c: 69: UART1->CR3 &= (uint8_t)(~UART1_CR3_STOP);  
      009B1E AE 52 36         [ 2]  113 	ldw	x, #0x5236
      009B21 F6               [ 1]  114 	ld	a, (x)
      009B22 A4 CF            [ 1]  115 	and	a, #0xcf
      009B24 F7               [ 1]  116 	ld	(x), a
                                    117 ;	lib/stm8s_uart1.c: 71: UART1->CR3 |= (uint8_t)StopBits;  
      009B25 AE 52 36         [ 2]  118 	ldw	x, #0x5236
      009B28 F6               [ 1]  119 	ld	a, (x)
      009B29 1A 2D            [ 1]  120 	or	a, (0x2d, sp)
      009B2B AE 52 36         [ 2]  121 	ldw	x, #0x5236
      009B2E F7               [ 1]  122 	ld	(x), a
                                    123 ;	lib/stm8s_uart1.c: 74: UART1->CR1 &= (uint8_t)(~(UART1_CR1_PCEN | UART1_CR1_PS  ));  
      009B2F AE 52 34         [ 2]  124 	ldw	x, #0x5234
      009B32 F6               [ 1]  125 	ld	a, (x)
      009B33 A4 F9            [ 1]  126 	and	a, #0xf9
      009B35 F7               [ 1]  127 	ld	(x), a
                                    128 ;	lib/stm8s_uart1.c: 76: UART1->CR1 |= (uint8_t)Parity;  
      009B36 AE 52 34         [ 2]  129 	ldw	x, #0x5234
      009B39 F6               [ 1]  130 	ld	a, (x)
      009B3A 1A 2E            [ 1]  131 	or	a, (0x2e, sp)
      009B3C AE 52 34         [ 2]  132 	ldw	x, #0x5234
      009B3F F7               [ 1]  133 	ld	(x), a
                                    134 ;	lib/stm8s_uart1.c: 79: UART1->BRR1 &= (uint8_t)(~UART1_BRR1_DIVM);  
      009B40 AE 52 32         [ 2]  135 	ldw	x, #0x5232
      009B43 F6               [ 1]  136 	ld	a, (x)
      009B44 35 00 52 32      [ 1]  137 	mov	0x5232+0, #0x00
                                    138 ;	lib/stm8s_uart1.c: 81: UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVM);  
      009B48 AE 52 33         [ 2]  139 	ldw	x, #0x5233
      009B4B F6               [ 1]  140 	ld	a, (x)
      009B4C A4 0F            [ 1]  141 	and	a, #0x0f
      009B4E F7               [ 1]  142 	ld	(x), a
                                    143 ;	lib/stm8s_uart1.c: 83: UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVF);  
      009B4F AE 52 33         [ 2]  144 	ldw	x, #0x5233
      009B52 F6               [ 1]  145 	ld	a, (x)
      009B53 A4 F0            [ 1]  146 	and	a, #0xf0
      009B55 F7               [ 1]  147 	ld	(x), a
                                    148 ;	lib/stm8s_uart1.c: 86: BaudRate_Mantissa    = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
      009B56 CD 97 B2         [ 4]  149 	call	_CLK_GetClockFreq
      009B59 1F 1A            [ 2]  150 	ldw	(0x1a, sp), x
      009B5B 1E 28            [ 2]  151 	ldw	x, (0x28, sp)
      009B5D 1F 11            [ 2]  152 	ldw	(0x11, sp), x
      009B5F 1E 2A            [ 2]  153 	ldw	x, (0x2a, sp)
      009B61 A6 04            [ 1]  154 	ld	a, #0x04
      009B63                        155 00124$:
      009B63 58               [ 2]  156 	sllw	x
      009B64 09 12            [ 1]  157 	rlc	(0x12, sp)
      009B66 09 11            [ 1]  158 	rlc	(0x11, sp)
      009B68 4A               [ 1]  159 	dec	a
      009B69 26 F8            [ 1]  160 	jrne	00124$
      009B6B 1F 13            [ 2]  161 	ldw	(0x13, sp), x
      009B6D 1E 13            [ 2]  162 	ldw	x, (0x13, sp)
      009B6F 89               [ 2]  163 	pushw	x
      009B70 1E 13            [ 2]  164 	ldw	x, (0x13, sp)
      009B72 89               [ 2]  165 	pushw	x
      009B73 1E 1E            [ 2]  166 	ldw	x, (0x1e, sp)
      009B75 89               [ 2]  167 	pushw	x
      009B76 90 89            [ 2]  168 	pushw	y
      009B78 CD 9F D9         [ 4]  169 	call	__divulong
      009B7B 5B 08            [ 2]  170 	addw	sp, #8
      009B7D 1F 07            [ 2]  171 	ldw	(0x07, sp), x
      009B7F 17 05            [ 2]  172 	ldw	(0x05, sp), y
                                    173 ;	lib/stm8s_uart1.c: 87: BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
      009B81 CD 97 B2         [ 4]  174 	call	_CLK_GetClockFreq
      009B84 89               [ 2]  175 	pushw	x
      009B85 90 89            [ 2]  176 	pushw	y
      009B87 4B 64            [ 1]  177 	push	#0x64
      009B89 5F               [ 1]  178 	clrw	x
      009B8A 89               [ 2]  179 	pushw	x
      009B8B 4B 00            [ 1]  180 	push	#0x00
      009B8D CD A0 CA         [ 4]  181 	call	__mullong
      009B90 5B 08            [ 2]  182 	addw	sp, #8
      009B92 1F 1E            [ 2]  183 	ldw	(0x1e, sp), x
      009B94 1E 13            [ 2]  184 	ldw	x, (0x13, sp)
      009B96 89               [ 2]  185 	pushw	x
      009B97 1E 13            [ 2]  186 	ldw	x, (0x13, sp)
      009B99 89               [ 2]  187 	pushw	x
      009B9A 1E 22            [ 2]  188 	ldw	x, (0x22, sp)
      009B9C 89               [ 2]  189 	pushw	x
      009B9D 90 89            [ 2]  190 	pushw	y
      009B9F CD 9F D9         [ 4]  191 	call	__divulong
      009BA2 5B 08            [ 2]  192 	addw	sp, #8
      009BA4 1F 03            [ 2]  193 	ldw	(0x03, sp), x
      009BA6 17 01            [ 2]  194 	ldw	(0x01, sp), y
                                    195 ;	lib/stm8s_uart1.c: 89: UART1->BRR2 |= (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100)) << 4) / 100) & (uint8_t)0x0F); 
      009BA8 AE 52 33         [ 2]  196 	ldw	x, #0x5233
      009BAB F6               [ 1]  197 	ld	a, (x)
      009BAC 6B 16            [ 1]  198 	ld	(0x16, sp), a
      009BAE 1E 07            [ 2]  199 	ldw	x, (0x07, sp)
      009BB0 89               [ 2]  200 	pushw	x
      009BB1 1E 07            [ 2]  201 	ldw	x, (0x07, sp)
      009BB3 89               [ 2]  202 	pushw	x
      009BB4 4B 64            [ 1]  203 	push	#0x64
      009BB6 5F               [ 1]  204 	clrw	x
      009BB7 89               [ 2]  205 	pushw	x
      009BB8 4B 00            [ 1]  206 	push	#0x00
      009BBA CD A0 CA         [ 4]  207 	call	__mullong
      009BBD 5B 08            [ 2]  208 	addw	sp, #8
      009BBF 1F 0F            [ 2]  209 	ldw	(0x0f, sp), x
      009BC1 17 0D            [ 2]  210 	ldw	(0x0d, sp), y
      009BC3 1E 03            [ 2]  211 	ldw	x, (0x03, sp)
      009BC5 72 F0 0F         [ 2]  212 	subw	x, (0x0f, sp)
      009BC8 1F 0B            [ 2]  213 	ldw	(0x0b, sp), x
      009BCA 7B 02            [ 1]  214 	ld	a, (0x02, sp)
      009BCC 12 0E            [ 1]  215 	sbc	a, (0x0e, sp)
      009BCE 6B 0A            [ 1]  216 	ld	(0x0a, sp), a
      009BD0 7B 01            [ 1]  217 	ld	a, (0x01, sp)
      009BD2 12 0D            [ 1]  218 	sbc	a, (0x0d, sp)
      009BD4 6B 09            [ 1]  219 	ld	(0x09, sp), a
      009BD6 1E 0B            [ 2]  220 	ldw	x, (0x0b, sp)
      009BD8 16 09            [ 2]  221 	ldw	y, (0x09, sp)
      009BDA A6 04            [ 1]  222 	ld	a, #0x04
      009BDC                        223 00126$:
      009BDC 58               [ 2]  224 	sllw	x
      009BDD 90 59            [ 2]  225 	rlcw	y
      009BDF 4A               [ 1]  226 	dec	a
      009BE0 26 FA            [ 1]  227 	jrne	00126$
      009BE2 4B 64            [ 1]  228 	push	#0x64
      009BE4 4B 00            [ 1]  229 	push	#0x00
      009BE6 4B 00            [ 1]  230 	push	#0x00
      009BE8 4B 00            [ 1]  231 	push	#0x00
      009BEA 89               [ 2]  232 	pushw	x
      009BEB 90 89            [ 2]  233 	pushw	y
      009BED CD 9F D9         [ 4]  234 	call	__divulong
      009BF0 5B 08            [ 2]  235 	addw	sp, #8
      009BF2 9F               [ 1]  236 	ld	a, xl
      009BF3 A4 0F            [ 1]  237 	and	a, #0x0f
      009BF5 1A 16            [ 1]  238 	or	a, (0x16, sp)
      009BF7 AE 52 33         [ 2]  239 	ldw	x, #0x5233
      009BFA F7               [ 1]  240 	ld	(x), a
                                    241 ;	lib/stm8s_uart1.c: 91: UART1->BRR2 |= (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0); 
      009BFB AE 52 33         [ 2]  242 	ldw	x, #0x5233
      009BFE F6               [ 1]  243 	ld	a, (x)
      009BFF 6B 17            [ 1]  244 	ld	(0x17, sp), a
      009C01 1E 07            [ 2]  245 	ldw	x, (0x07, sp)
      009C03 16 05            [ 2]  246 	ldw	y, (0x05, sp)
      009C05 90 54            [ 2]  247 	srlw	y
      009C07 56               [ 2]  248 	rrcw	x
      009C08 90 54            [ 2]  249 	srlw	y
      009C0A 56               [ 2]  250 	rrcw	x
      009C0B 90 54            [ 2]  251 	srlw	y
      009C0D 56               [ 2]  252 	rrcw	x
      009C0E 90 54            [ 2]  253 	srlw	y
      009C10 56               [ 2]  254 	rrcw	x
      009C11 9F               [ 1]  255 	ld	a, xl
      009C12 A4 F0            [ 1]  256 	and	a, #0xf0
      009C14 88               [ 1]  257 	push	a
      009C15 5F               [ 1]  258 	clrw	x
      009C16 0F 22            [ 1]  259 	clr	(0x22, sp)
      009C18 84               [ 1]  260 	pop	a
      009C19 1A 17            [ 1]  261 	or	a, (0x17, sp)
      009C1B AE 52 33         [ 2]  262 	ldw	x, #0x5233
      009C1E F7               [ 1]  263 	ld	(x), a
                                    264 ;	lib/stm8s_uart1.c: 93: UART1->BRR1 |= (uint8_t)BaudRate_Mantissa;           
      009C1F AE 52 32         [ 2]  265 	ldw	x, #0x5232
      009C22 F6               [ 1]  266 	ld	a, (x)
      009C23 6B 20            [ 1]  267 	ld	(0x20, sp), a
      009C25 7B 08            [ 1]  268 	ld	a, (0x08, sp)
      009C27 1A 20            [ 1]  269 	or	a, (0x20, sp)
      009C29 AE 52 32         [ 2]  270 	ldw	x, #0x5232
      009C2C F7               [ 1]  271 	ld	(x), a
                                    272 ;	lib/stm8s_uart1.c: 96: UART1->CR2 &= (uint8_t)~(UART1_CR2_TEN | UART1_CR2_REN); 
      009C2D AE 52 35         [ 2]  273 	ldw	x, #0x5235
      009C30 F6               [ 1]  274 	ld	a, (x)
      009C31 A4 F3            [ 1]  275 	and	a, #0xf3
      009C33 F7               [ 1]  276 	ld	(x), a
                                    277 ;	lib/stm8s_uart1.c: 98: UART1->CR3 &= (uint8_t)~(UART1_CR3_CPOL | UART1_CR3_CPHA | UART1_CR3_LBCL); 
      009C34 AE 52 36         [ 2]  278 	ldw	x, #0x5236
      009C37 F6               [ 1]  279 	ld	a, (x)
      009C38 A4 F8            [ 1]  280 	and	a, #0xf8
      009C3A F7               [ 1]  281 	ld	(x), a
                                    282 ;	lib/stm8s_uart1.c: 100: UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & (uint8_t)(UART1_CR3_CPOL | 
      009C3B AE 52 36         [ 2]  283 	ldw	x, #0x5236
      009C3E F6               [ 1]  284 	ld	a, (x)
      009C3F 6B 25            [ 1]  285 	ld	(0x25, sp), a
      009C41 7B 2F            [ 1]  286 	ld	a, (0x2f, sp)
      009C43 A4 07            [ 1]  287 	and	a, #0x07
      009C45 1A 25            [ 1]  288 	or	a, (0x25, sp)
      009C47 AE 52 36         [ 2]  289 	ldw	x, #0x5236
      009C4A F7               [ 1]  290 	ld	(x), a
                                    291 ;	lib/stm8s_uart1.c: 103: if ((uint8_t)(Mode & UART1_MODE_TX_ENABLE))
      009C4B 7B 30            [ 1]  292 	ld	a, (0x30, sp)
      009C4D A5 04            [ 1]  293 	bcp	a, #0x04
      009C4F 27 09            [ 1]  294 	jreq	00102$
                                    295 ;	lib/stm8s_uart1.c: 106: UART1->CR2 |= (uint8_t)UART1_CR2_TEN;  
      009C51 AE 52 35         [ 2]  296 	ldw	x, #0x5235
      009C54 F6               [ 1]  297 	ld	a, (x)
      009C55 AA 08            [ 1]  298 	or	a, #0x08
      009C57 F7               [ 1]  299 	ld	(x), a
      009C58 20 07            [ 2]  300 	jra	00103$
      009C5A                        301 00102$:
                                    302 ;	lib/stm8s_uart1.c: 111: UART1->CR2 &= (uint8_t)(~UART1_CR2_TEN);  
      009C5A AE 52 35         [ 2]  303 	ldw	x, #0x5235
      009C5D F6               [ 1]  304 	ld	a, (x)
      009C5E A4 F7            [ 1]  305 	and	a, #0xf7
      009C60 F7               [ 1]  306 	ld	(x), a
      009C61                        307 00103$:
                                    308 ;	lib/stm8s_uart1.c: 113: if ((uint8_t)(Mode & UART1_MODE_RX_ENABLE))
      009C61 7B 30            [ 1]  309 	ld	a, (0x30, sp)
      009C63 A5 08            [ 1]  310 	bcp	a, #0x08
      009C65 27 09            [ 1]  311 	jreq	00105$
                                    312 ;	lib/stm8s_uart1.c: 116: UART1->CR2 |= (uint8_t)UART1_CR2_REN;  
      009C67 AE 52 35         [ 2]  313 	ldw	x, #0x5235
      009C6A F6               [ 1]  314 	ld	a, (x)
      009C6B AA 04            [ 1]  315 	or	a, #0x04
      009C6D F7               [ 1]  316 	ld	(x), a
      009C6E 20 07            [ 2]  317 	jra	00106$
      009C70                        318 00105$:
                                    319 ;	lib/stm8s_uart1.c: 121: UART1->CR2 &= (uint8_t)(~UART1_CR2_REN);  
      009C70 AE 52 35         [ 2]  320 	ldw	x, #0x5235
      009C73 F6               [ 1]  321 	ld	a, (x)
      009C74 A4 FB            [ 1]  322 	and	a, #0xfb
      009C76 F7               [ 1]  323 	ld	(x), a
      009C77                        324 00106$:
                                    325 ;	lib/stm8s_uart1.c: 125: if ((uint8_t)(SyncMode & UART1_SYNCMODE_CLOCK_DISABLE))
      009C77 0D 2F            [ 1]  326 	tnz	(0x2f, sp)
      009C79 2A 09            [ 1]  327 	jrpl	00108$
                                    328 ;	lib/stm8s_uart1.c: 128: UART1->CR3 &= (uint8_t)(~UART1_CR3_CKEN); 
      009C7B AE 52 36         [ 2]  329 	ldw	x, #0x5236
      009C7E F6               [ 1]  330 	ld	a, (x)
      009C7F A4 F7            [ 1]  331 	and	a, #0xf7
      009C81 F7               [ 1]  332 	ld	(x), a
      009C82 20 10            [ 2]  333 	jra	00110$
      009C84                        334 00108$:
                                    335 ;	lib/stm8s_uart1.c: 132: UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & UART1_CR3_CKEN);
      009C84 AE 52 36         [ 2]  336 	ldw	x, #0x5236
      009C87 F6               [ 1]  337 	ld	a, (x)
      009C88 6B 15            [ 1]  338 	ld	(0x15, sp), a
      009C8A 7B 2F            [ 1]  339 	ld	a, (0x2f, sp)
      009C8C A4 08            [ 1]  340 	and	a, #0x08
      009C8E 1A 15            [ 1]  341 	or	a, (0x15, sp)
      009C90 AE 52 36         [ 2]  342 	ldw	x, #0x5236
      009C93 F7               [ 1]  343 	ld	(x), a
      009C94                        344 00110$:
      009C94 5B 25            [ 2]  345 	addw	sp, #37
      009C96 81               [ 4]  346 	ret
                                    347 ;	lib/stm8s_uart1.c: 142: void UART1_Cmd(FunctionalState NewState)
                                    348 ;	-----------------------------------------
                                    349 ;	 function UART1_Cmd
                                    350 ;	-----------------------------------------
      009C97                        351 _UART1_Cmd:
                                    352 ;	lib/stm8s_uart1.c: 144: if (NewState != DISABLE)
      009C97 0D 03            [ 1]  353 	tnz	(0x03, sp)
      009C99 27 08            [ 1]  354 	jreq	00102$
                                    355 ;	lib/stm8s_uart1.c: 147: UART1->CR1 &= (uint8_t)(~UART1_CR1_UARTD); 
      009C9B AE 52 34         [ 2]  356 	ldw	x, #0x5234
      009C9E F6               [ 1]  357 	ld	a, (x)
      009C9F A4 DF            [ 1]  358 	and	a, #0xdf
      009CA1 F7               [ 1]  359 	ld	(x), a
      009CA2 81               [ 4]  360 	ret
      009CA3                        361 00102$:
                                    362 ;	lib/stm8s_uart1.c: 152: UART1->CR1 |= UART1_CR1_UARTD;  
      009CA3 AE 52 34         [ 2]  363 	ldw	x, #0x5234
      009CA6 F6               [ 1]  364 	ld	a, (x)
      009CA7 AA 20            [ 1]  365 	or	a, #0x20
      009CA9 F7               [ 1]  366 	ld	(x), a
      009CAA 81               [ 4]  367 	ret
                                    368 ;	lib/stm8s_uart1.c: 169: void UART1_ITConfig(UART1_IT_TypeDef UART1_IT, FunctionalState NewState)
                                    369 ;	-----------------------------------------
                                    370 ;	 function UART1_ITConfig
                                    371 ;	-----------------------------------------
      009CAB                        372 _UART1_ITConfig:
      009CAB 52 03            [ 2]  373 	sub	sp, #3
                                    374 ;	lib/stm8s_uart1.c: 174: uartreg = (uint8_t)((uint16_t)UART1_IT >> 0x08);
      009CAD 7B 06            [ 1]  375 	ld	a, (0x06, sp)
      009CAF 97               [ 1]  376 	ld	xl, a
      009CB0 4F               [ 1]  377 	clr	a
                                    378 ;	lib/stm8s_uart1.c: 176: itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
      009CB1 7B 07            [ 1]  379 	ld	a, (0x07, sp)
      009CB3 A4 0F            [ 1]  380 	and	a, #0x0f
      009CB5 95               [ 1]  381 	ld	xh, a
      009CB6 A6 01            [ 1]  382 	ld	a, #0x01
      009CB8 88               [ 1]  383 	push	a
      009CB9 9E               [ 1]  384 	ld	a, xh
      009CBA 4D               [ 1]  385 	tnz	a
      009CBB 27 05            [ 1]  386 	jreq	00139$
      009CBD                        387 00138$:
      009CBD 08 01            [ 1]  388 	sll	(1, sp)
      009CBF 4A               [ 1]  389 	dec	a
      009CC0 26 FB            [ 1]  390 	jrne	00138$
      009CC2                        391 00139$:
      009CC2 84               [ 1]  392 	pop	a
      009CC3 6B 01            [ 1]  393 	ld	(0x01, sp), a
                                    394 ;	lib/stm8s_uart1.c: 181: if (uartreg == 0x01)
      009CC5 9F               [ 1]  395 	ld	a, xl
      009CC6 A1 01            [ 1]  396 	cp	a, #0x01
      009CC8 26 06            [ 1]  397 	jrne	00141$
      009CCA A6 01            [ 1]  398 	ld	a, #0x01
      009CCC 6B 02            [ 1]  399 	ld	(0x02, sp), a
      009CCE 20 02            [ 2]  400 	jra	00142$
      009CD0                        401 00141$:
      009CD0 0F 02            [ 1]  402 	clr	(0x02, sp)
      009CD2                        403 00142$:
                                    404 ;	lib/stm8s_uart1.c: 185: else if (uartreg == 0x02)
      009CD2 9F               [ 1]  405 	ld	a, xl
      009CD3 A1 02            [ 1]  406 	cp	a, #0x02
      009CD5 26 03            [ 1]  407 	jrne	00144$
      009CD7 A6 01            [ 1]  408 	ld	a, #0x01
      009CD9 21                     409 	.byte 0x21
      009CDA                        410 00144$:
      009CDA 4F               [ 1]  411 	clr	a
      009CDB                        412 00145$:
                                    413 ;	lib/stm8s_uart1.c: 178: if (NewState != DISABLE)
      009CDB 0D 08            [ 1]  414 	tnz	(0x08, sp)
      009CDD 27 2B            [ 1]  415 	jreq	00114$
                                    416 ;	lib/stm8s_uart1.c: 181: if (uartreg == 0x01)
      009CDF 0D 02            [ 1]  417 	tnz	(0x02, sp)
      009CE1 27 0C            [ 1]  418 	jreq	00105$
                                    419 ;	lib/stm8s_uart1.c: 183: UART1->CR1 |= itpos;
      009CE3 AE 52 34         [ 2]  420 	ldw	x, #0x5234
      009CE6 F6               [ 1]  421 	ld	a, (x)
      009CE7 1A 01            [ 1]  422 	or	a, (0x01, sp)
      009CE9 AE 52 34         [ 2]  423 	ldw	x, #0x5234
      009CEC F7               [ 1]  424 	ld	(x), a
      009CED 20 4B            [ 2]  425 	jra	00116$
      009CEF                        426 00105$:
                                    427 ;	lib/stm8s_uart1.c: 185: else if (uartreg == 0x02)
      009CEF 4D               [ 1]  428 	tnz	a
      009CF0 27 0C            [ 1]  429 	jreq	00102$
                                    430 ;	lib/stm8s_uart1.c: 187: UART1->CR2 |= itpos;
      009CF2 AE 52 35         [ 2]  431 	ldw	x, #0x5235
      009CF5 F6               [ 1]  432 	ld	a, (x)
      009CF6 1A 01            [ 1]  433 	or	a, (0x01, sp)
      009CF8 AE 52 35         [ 2]  434 	ldw	x, #0x5235
      009CFB F7               [ 1]  435 	ld	(x), a
      009CFC 20 3C            [ 2]  436 	jra	00116$
      009CFE                        437 00102$:
                                    438 ;	lib/stm8s_uart1.c: 191: UART1->CR4 |= itpos;
      009CFE AE 52 37         [ 2]  439 	ldw	x, #0x5237
      009D01 F6               [ 1]  440 	ld	a, (x)
      009D02 1A 01            [ 1]  441 	or	a, (0x01, sp)
      009D04 AE 52 37         [ 2]  442 	ldw	x, #0x5237
      009D07 F7               [ 1]  443 	ld	(x), a
      009D08 20 30            [ 2]  444 	jra	00116$
      009D0A                        445 00114$:
                                    446 ;	lib/stm8s_uart1.c: 199: UART1->CR1 &= (uint8_t)(~itpos);
      009D0A 88               [ 1]  447 	push	a
      009D0B 7B 02            [ 1]  448 	ld	a, (0x02, sp)
      009D0D 43               [ 1]  449 	cpl	a
      009D0E 6B 04            [ 1]  450 	ld	(0x04, sp), a
      009D10 84               [ 1]  451 	pop	a
                                    452 ;	lib/stm8s_uart1.c: 197: if (uartreg == 0x01)
      009D11 0D 02            [ 1]  453 	tnz	(0x02, sp)
      009D13 27 0C            [ 1]  454 	jreq	00111$
                                    455 ;	lib/stm8s_uart1.c: 199: UART1->CR1 &= (uint8_t)(~itpos);
      009D15 AE 52 34         [ 2]  456 	ldw	x, #0x5234
      009D18 F6               [ 1]  457 	ld	a, (x)
      009D19 14 03            [ 1]  458 	and	a, (0x03, sp)
      009D1B AE 52 34         [ 2]  459 	ldw	x, #0x5234
      009D1E F7               [ 1]  460 	ld	(x), a
      009D1F 20 19            [ 2]  461 	jra	00116$
      009D21                        462 00111$:
                                    463 ;	lib/stm8s_uart1.c: 201: else if (uartreg == 0x02)
      009D21 4D               [ 1]  464 	tnz	a
      009D22 27 0C            [ 1]  465 	jreq	00108$
                                    466 ;	lib/stm8s_uart1.c: 203: UART1->CR2 &= (uint8_t)(~itpos);
      009D24 AE 52 35         [ 2]  467 	ldw	x, #0x5235
      009D27 F6               [ 1]  468 	ld	a, (x)
      009D28 14 03            [ 1]  469 	and	a, (0x03, sp)
      009D2A AE 52 35         [ 2]  470 	ldw	x, #0x5235
      009D2D F7               [ 1]  471 	ld	(x), a
      009D2E 20 0A            [ 2]  472 	jra	00116$
      009D30                        473 00108$:
                                    474 ;	lib/stm8s_uart1.c: 207: UART1->CR4 &= (uint8_t)(~itpos);
      009D30 AE 52 37         [ 2]  475 	ldw	x, #0x5237
      009D33 F6               [ 1]  476 	ld	a, (x)
      009D34 14 03            [ 1]  477 	and	a, (0x03, sp)
      009D36 AE 52 37         [ 2]  478 	ldw	x, #0x5237
      009D39 F7               [ 1]  479 	ld	(x), a
      009D3A                        480 00116$:
      009D3A 5B 03            [ 2]  481 	addw	sp, #3
      009D3C 81               [ 4]  482 	ret
                                    483 ;	lib/stm8s_uart1.c: 219: void UART1_HalfDuplexCmd(FunctionalState NewState)
                                    484 ;	-----------------------------------------
                                    485 ;	 function UART1_HalfDuplexCmd
                                    486 ;	-----------------------------------------
      009D3D                        487 _UART1_HalfDuplexCmd:
                                    488 ;	lib/stm8s_uart1.c: 222: if (NewState != DISABLE)
      009D3D 0D 03            [ 1]  489 	tnz	(0x03, sp)
      009D3F 27 08            [ 1]  490 	jreq	00102$
                                    491 ;	lib/stm8s_uart1.c: 224: UART1->CR5 |= UART1_CR5_HDSEL;  /**< UART1 Half Duplex Enable  */
      009D41 AE 52 38         [ 2]  492 	ldw	x, #0x5238
      009D44 F6               [ 1]  493 	ld	a, (x)
      009D45 AA 08            [ 1]  494 	or	a, #0x08
      009D47 F7               [ 1]  495 	ld	(x), a
      009D48 81               [ 4]  496 	ret
      009D49                        497 00102$:
                                    498 ;	lib/stm8s_uart1.c: 228: UART1->CR5 &= (uint8_t)~UART1_CR5_HDSEL; /**< UART1 Half Duplex Disable */
      009D49 AE 52 38         [ 2]  499 	ldw	x, #0x5238
      009D4C F6               [ 1]  500 	ld	a, (x)
      009D4D A4 F7            [ 1]  501 	and	a, #0xf7
      009D4F F7               [ 1]  502 	ld	(x), a
      009D50 81               [ 4]  503 	ret
                                    504 ;	lib/stm8s_uart1.c: 238: void UART1_IrDAConfig(UART1_IrDAMode_TypeDef UART1_IrDAMode)
                                    505 ;	-----------------------------------------
                                    506 ;	 function UART1_IrDAConfig
                                    507 ;	-----------------------------------------
      009D51                        508 _UART1_IrDAConfig:
                                    509 ;	lib/stm8s_uart1.c: 241: if (UART1_IrDAMode != UART1_IRDAMODE_NORMAL)
      009D51 0D 03            [ 1]  510 	tnz	(0x03, sp)
      009D53 27 08            [ 1]  511 	jreq	00102$
                                    512 ;	lib/stm8s_uart1.c: 243: UART1->CR5 |= UART1_CR5_IRLP;
      009D55 AE 52 38         [ 2]  513 	ldw	x, #0x5238
      009D58 F6               [ 1]  514 	ld	a, (x)
      009D59 AA 04            [ 1]  515 	or	a, #0x04
      009D5B F7               [ 1]  516 	ld	(x), a
      009D5C 81               [ 4]  517 	ret
      009D5D                        518 00102$:
                                    519 ;	lib/stm8s_uart1.c: 247: UART1->CR5 &= ((uint8_t)~UART1_CR5_IRLP);
      009D5D AE 52 38         [ 2]  520 	ldw	x, #0x5238
      009D60 F6               [ 1]  521 	ld	a, (x)
      009D61 A4 FB            [ 1]  522 	and	a, #0xfb
      009D63 F7               [ 1]  523 	ld	(x), a
      009D64 81               [ 4]  524 	ret
                                    525 ;	lib/stm8s_uart1.c: 257: void UART1_IrDACmd(FunctionalState NewState)
                                    526 ;	-----------------------------------------
                                    527 ;	 function UART1_IrDACmd
                                    528 ;	-----------------------------------------
      009D65                        529 _UART1_IrDACmd:
                                    530 ;	lib/stm8s_uart1.c: 259: if (NewState != DISABLE)
      009D65 0D 03            [ 1]  531 	tnz	(0x03, sp)
      009D67 27 08            [ 1]  532 	jreq	00102$
                                    533 ;	lib/stm8s_uart1.c: 262: UART1->CR5 |= UART1_CR5_IREN;
      009D69 AE 52 38         [ 2]  534 	ldw	x, #0x5238
      009D6C F6               [ 1]  535 	ld	a, (x)
      009D6D AA 02            [ 1]  536 	or	a, #0x02
      009D6F F7               [ 1]  537 	ld	(x), a
      009D70 81               [ 4]  538 	ret
      009D71                        539 00102$:
                                    540 ;	lib/stm8s_uart1.c: 267: UART1->CR5 &= ((uint8_t)~UART1_CR5_IREN);
      009D71 AE 52 38         [ 2]  541 	ldw	x, #0x5238
      009D74 F6               [ 1]  542 	ld	a, (x)
      009D75 A4 FD            [ 1]  543 	and	a, #0xfd
      009D77 F7               [ 1]  544 	ld	(x), a
      009D78 81               [ 4]  545 	ret
                                    546 ;	lib/stm8s_uart1.c: 278: void UART1_LINBreakDetectionConfig(UART1_LINBreakDetectionLength_TypeDef UART1_LINBreakDetectionLength)
                                    547 ;	-----------------------------------------
                                    548 ;	 function UART1_LINBreakDetectionConfig
                                    549 ;	-----------------------------------------
      009D79                        550 _UART1_LINBreakDetectionConfig:
                                    551 ;	lib/stm8s_uart1.c: 281: if (UART1_LINBreakDetectionLength != UART1_LINBREAKDETECTIONLENGTH_10BITS)
      009D79 0D 03            [ 1]  552 	tnz	(0x03, sp)
      009D7B 27 08            [ 1]  553 	jreq	00102$
                                    554 ;	lib/stm8s_uart1.c: 283: UART1->CR4 |= UART1_CR4_LBDL;
      009D7D AE 52 37         [ 2]  555 	ldw	x, #0x5237
      009D80 F6               [ 1]  556 	ld	a, (x)
      009D81 AA 20            [ 1]  557 	or	a, #0x20
      009D83 F7               [ 1]  558 	ld	(x), a
      009D84 81               [ 4]  559 	ret
      009D85                        560 00102$:
                                    561 ;	lib/stm8s_uart1.c: 287: UART1->CR4 &= ((uint8_t)~UART1_CR4_LBDL);
      009D85 AE 52 37         [ 2]  562 	ldw	x, #0x5237
      009D88 F6               [ 1]  563 	ld	a, (x)
      009D89 A4 DF            [ 1]  564 	and	a, #0xdf
      009D8B F7               [ 1]  565 	ld	(x), a
      009D8C 81               [ 4]  566 	ret
                                    567 ;	lib/stm8s_uart1.c: 297: void UART1_LINCmd(FunctionalState NewState)
                                    568 ;	-----------------------------------------
                                    569 ;	 function UART1_LINCmd
                                    570 ;	-----------------------------------------
      009D8D                        571 _UART1_LINCmd:
                                    572 ;	lib/stm8s_uart1.c: 300: if (NewState != DISABLE)
      009D8D 0D 03            [ 1]  573 	tnz	(0x03, sp)
      009D8F 27 08            [ 1]  574 	jreq	00102$
                                    575 ;	lib/stm8s_uart1.c: 303: UART1->CR3 |= UART1_CR3_LINEN;
      009D91 AE 52 36         [ 2]  576 	ldw	x, #0x5236
      009D94 F6               [ 1]  577 	ld	a, (x)
      009D95 AA 40            [ 1]  578 	or	a, #0x40
      009D97 F7               [ 1]  579 	ld	(x), a
      009D98 81               [ 4]  580 	ret
      009D99                        581 00102$:
                                    582 ;	lib/stm8s_uart1.c: 308: UART1->CR3 &= ((uint8_t)~UART1_CR3_LINEN);
      009D99 AE 52 36         [ 2]  583 	ldw	x, #0x5236
      009D9C F6               [ 1]  584 	ld	a, (x)
      009D9D A4 BF            [ 1]  585 	and	a, #0xbf
      009D9F F7               [ 1]  586 	ld	(x), a
      009DA0 81               [ 4]  587 	ret
                                    588 ;	lib/stm8s_uart1.c: 318: void UART1_SmartCardCmd(FunctionalState NewState)
                                    589 ;	-----------------------------------------
                                    590 ;	 function UART1_SmartCardCmd
                                    591 ;	-----------------------------------------
      009DA1                        592 _UART1_SmartCardCmd:
                                    593 ;	lib/stm8s_uart1.c: 321: if (NewState != DISABLE)
      009DA1 0D 03            [ 1]  594 	tnz	(0x03, sp)
      009DA3 27 08            [ 1]  595 	jreq	00102$
                                    596 ;	lib/stm8s_uart1.c: 324: UART1->CR5 |= UART1_CR5_SCEN;
      009DA5 AE 52 38         [ 2]  597 	ldw	x, #0x5238
      009DA8 F6               [ 1]  598 	ld	a, (x)
      009DA9 AA 20            [ 1]  599 	or	a, #0x20
      009DAB F7               [ 1]  600 	ld	(x), a
      009DAC 81               [ 4]  601 	ret
      009DAD                        602 00102$:
                                    603 ;	lib/stm8s_uart1.c: 329: UART1->CR5 &= ((uint8_t)(~UART1_CR5_SCEN));
      009DAD AE 52 38         [ 2]  604 	ldw	x, #0x5238
      009DB0 F6               [ 1]  605 	ld	a, (x)
      009DB1 A4 DF            [ 1]  606 	and	a, #0xdf
      009DB3 F7               [ 1]  607 	ld	(x), a
      009DB4 81               [ 4]  608 	ret
                                    609 ;	lib/stm8s_uart1.c: 340: void UART1_SmartCardNACKCmd(FunctionalState NewState)
                                    610 ;	-----------------------------------------
                                    611 ;	 function UART1_SmartCardNACKCmd
                                    612 ;	-----------------------------------------
      009DB5                        613 _UART1_SmartCardNACKCmd:
                                    614 ;	lib/stm8s_uart1.c: 342: if (NewState != DISABLE)
      009DB5 0D 03            [ 1]  615 	tnz	(0x03, sp)
      009DB7 27 08            [ 1]  616 	jreq	00102$
                                    617 ;	lib/stm8s_uart1.c: 345: UART1->CR5 |= UART1_CR5_NACK;
      009DB9 AE 52 38         [ 2]  618 	ldw	x, #0x5238
      009DBC F6               [ 1]  619 	ld	a, (x)
      009DBD AA 10            [ 1]  620 	or	a, #0x10
      009DBF F7               [ 1]  621 	ld	(x), a
      009DC0 81               [ 4]  622 	ret
      009DC1                        623 00102$:
                                    624 ;	lib/stm8s_uart1.c: 350: UART1->CR5 &= ((uint8_t)~(UART1_CR5_NACK));
      009DC1 AE 52 38         [ 2]  625 	ldw	x, #0x5238
      009DC4 F6               [ 1]  626 	ld	a, (x)
      009DC5 A4 EF            [ 1]  627 	and	a, #0xef
      009DC7 F7               [ 1]  628 	ld	(x), a
      009DC8 81               [ 4]  629 	ret
                                    630 ;	lib/stm8s_uart1.c: 360: void UART1_WakeUpConfig(UART1_WakeUp_TypeDef UART1_WakeUp)
                                    631 ;	-----------------------------------------
                                    632 ;	 function UART1_WakeUpConfig
                                    633 ;	-----------------------------------------
      009DC9                        634 _UART1_WakeUpConfig:
                                    635 ;	lib/stm8s_uart1.c: 363: UART1->CR1 &= ((uint8_t)~UART1_CR1_WAKE);
      009DC9 AE 52 34         [ 2]  636 	ldw	x, #0x5234
      009DCC F6               [ 1]  637 	ld	a, (x)
      009DCD A4 F7            [ 1]  638 	and	a, #0xf7
      009DCF F7               [ 1]  639 	ld	(x), a
                                    640 ;	lib/stm8s_uart1.c: 364: UART1->CR1 |= (uint8_t)UART1_WakeUp;
      009DD0 AE 52 34         [ 2]  641 	ldw	x, #0x5234
      009DD3 F6               [ 1]  642 	ld	a, (x)
      009DD4 1A 03            [ 1]  643 	or	a, (0x03, sp)
      009DD6 AE 52 34         [ 2]  644 	ldw	x, #0x5234
      009DD9 F7               [ 1]  645 	ld	(x), a
      009DDA 81               [ 4]  646 	ret
                                    647 ;	lib/stm8s_uart1.c: 373: void UART1_ReceiverWakeUpCmd(FunctionalState NewState)
                                    648 ;	-----------------------------------------
                                    649 ;	 function UART1_ReceiverWakeUpCmd
                                    650 ;	-----------------------------------------
      009DDB                        651 _UART1_ReceiverWakeUpCmd:
                                    652 ;	lib/stm8s_uart1.c: 376: if (NewState != DISABLE)
      009DDB 0D 03            [ 1]  653 	tnz	(0x03, sp)
      009DDD 27 08            [ 1]  654 	jreq	00102$
                                    655 ;	lib/stm8s_uart1.c: 379: UART1->CR2 |= UART1_CR2_RWU;
      009DDF AE 52 35         [ 2]  656 	ldw	x, #0x5235
      009DE2 F6               [ 1]  657 	ld	a, (x)
      009DE3 AA 02            [ 1]  658 	or	a, #0x02
      009DE5 F7               [ 1]  659 	ld	(x), a
      009DE6 81               [ 4]  660 	ret
      009DE7                        661 00102$:
                                    662 ;	lib/stm8s_uart1.c: 384: UART1->CR2 &= ((uint8_t)~UART1_CR2_RWU);
      009DE7 AE 52 35         [ 2]  663 	ldw	x, #0x5235
      009DEA F6               [ 1]  664 	ld	a, (x)
      009DEB A4 FD            [ 1]  665 	and	a, #0xfd
      009DED F7               [ 1]  666 	ld	(x), a
      009DEE 81               [ 4]  667 	ret
                                    668 ;	lib/stm8s_uart1.c: 393: uint8_t UART1_ReceiveData8(void)
                                    669 ;	-----------------------------------------
                                    670 ;	 function UART1_ReceiveData8
                                    671 ;	-----------------------------------------
      009DEF                        672 _UART1_ReceiveData8:
                                    673 ;	lib/stm8s_uart1.c: 395: return ((uint8_t)UART1->DR);
      009DEF AE 52 31         [ 2]  674 	ldw	x, #0x5231
      009DF2 F6               [ 1]  675 	ld	a, (x)
      009DF3 81               [ 4]  676 	ret
                                    677 ;	lib/stm8s_uart1.c: 403: uint16_t UART1_ReceiveData9(void)
                                    678 ;	-----------------------------------------
                                    679 ;	 function UART1_ReceiveData9
                                    680 ;	-----------------------------------------
      009DF4                        681 _UART1_ReceiveData9:
      009DF4 52 04            [ 2]  682 	sub	sp, #4
                                    683 ;	lib/stm8s_uart1.c: 407: temp = (uint16_t)(((uint16_t)( (uint16_t)UART1->CR1 & (uint16_t)UART1_CR1_R8)) << 1);
      009DF6 AE 52 34         [ 2]  684 	ldw	x, #0x5234
      009DF9 F6               [ 1]  685 	ld	a, (x)
      009DFA 0F 03            [ 1]  686 	clr	(0x03, sp)
      009DFC A4 80            [ 1]  687 	and	a, #0x80
      009DFE 97               [ 1]  688 	ld	xl, a
      009DFF 4F               [ 1]  689 	clr	a
      009E00 95               [ 1]  690 	ld	xh, a
      009E01 58               [ 2]  691 	sllw	x
      009E02 1F 01            [ 2]  692 	ldw	(0x01, sp), x
                                    693 ;	lib/stm8s_uart1.c: 408: return (uint16_t)( (((uint16_t) UART1->DR) | temp ) & ((uint16_t)0x01FF));
      009E04 AE 52 31         [ 2]  694 	ldw	x, #0x5231
      009E07 F6               [ 1]  695 	ld	a, (x)
      009E08 02               [ 1]  696 	rlwa	x
      009E09 4F               [ 1]  697 	clr	a
      009E0A 01               [ 1]  698 	rrwa	x
      009E0B 1A 02            [ 1]  699 	or	a, (0x02, sp)
      009E0D 02               [ 1]  700 	rlwa	x
      009E0E 1A 01            [ 1]  701 	or	a, (0x01, sp)
      009E10 A4 01            [ 1]  702 	and	a, #0x01
      009E12 95               [ 1]  703 	ld	xh, a
      009E13 5B 04            [ 2]  704 	addw	sp, #4
      009E15 81               [ 4]  705 	ret
                                    706 ;	lib/stm8s_uart1.c: 416: void UART1_SendData8(uint8_t Data)
                                    707 ;	-----------------------------------------
                                    708 ;	 function UART1_SendData8
                                    709 ;	-----------------------------------------
      009E16                        710 _UART1_SendData8:
                                    711 ;	lib/stm8s_uart1.c: 419: UART1->DR = Data;
      009E16 AE 52 31         [ 2]  712 	ldw	x, #0x5231
      009E19 7B 03            [ 1]  713 	ld	a, (0x03, sp)
      009E1B F7               [ 1]  714 	ld	(x), a
      009E1C 81               [ 4]  715 	ret
                                    716 ;	lib/stm8s_uart1.c: 428: void UART1_SendData9(uint16_t Data)
                                    717 ;	-----------------------------------------
                                    718 ;	 function UART1_SendData9
                                    719 ;	-----------------------------------------
      009E1D                        720 _UART1_SendData9:
      009E1D 88               [ 1]  721 	push	a
                                    722 ;	lib/stm8s_uart1.c: 431: UART1->CR1 &= ((uint8_t)~UART1_CR1_T8);
      009E1E AE 52 34         [ 2]  723 	ldw	x, #0x5234
      009E21 F6               [ 1]  724 	ld	a, (x)
      009E22 A4 BF            [ 1]  725 	and	a, #0xbf
      009E24 F7               [ 1]  726 	ld	(x), a
                                    727 ;	lib/stm8s_uart1.c: 433: UART1->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & UART1_CR1_T8);
      009E25 AE 52 34         [ 2]  728 	ldw	x, #0x5234
      009E28 F6               [ 1]  729 	ld	a, (x)
      009E29 6B 01            [ 1]  730 	ld	(0x01, sp), a
      009E2B 1E 04            [ 2]  731 	ldw	x, (0x04, sp)
      009E2D 54               [ 2]  732 	srlw	x
      009E2E 54               [ 2]  733 	srlw	x
      009E2F 9F               [ 1]  734 	ld	a, xl
      009E30 A4 40            [ 1]  735 	and	a, #0x40
      009E32 1A 01            [ 1]  736 	or	a, (0x01, sp)
      009E34 AE 52 34         [ 2]  737 	ldw	x, #0x5234
      009E37 F7               [ 1]  738 	ld	(x), a
                                    739 ;	lib/stm8s_uart1.c: 435: UART1->DR   = (uint8_t)(Data);
      009E38 7B 05            [ 1]  740 	ld	a, (0x05, sp)
      009E3A AE 52 31         [ 2]  741 	ldw	x, #0x5231
      009E3D F7               [ 1]  742 	ld	(x), a
      009E3E 84               [ 1]  743 	pop	a
      009E3F 81               [ 4]  744 	ret
                                    745 ;	lib/stm8s_uart1.c: 443: void UART1_SendBreak(void)
                                    746 ;	-----------------------------------------
                                    747 ;	 function UART1_SendBreak
                                    748 ;	-----------------------------------------
      009E40                        749 _UART1_SendBreak:
                                    750 ;	lib/stm8s_uart1.c: 445: UART1->CR2 |= UART1_CR2_SBK;
      009E40 72 10 52 35      [ 1]  751 	bset	0x5235, #0
      009E44 81               [ 4]  752 	ret
                                    753 ;	lib/stm8s_uart1.c: 453: void UART1_SetAddress(uint8_t UART1_Address)
                                    754 ;	-----------------------------------------
                                    755 ;	 function UART1_SetAddress
                                    756 ;	-----------------------------------------
      009E45                        757 _UART1_SetAddress:
                                    758 ;	lib/stm8s_uart1.c: 457: UART1->CR4 &= ((uint8_t)~UART1_CR4_ADD);
      009E45 AE 52 37         [ 2]  759 	ldw	x, #0x5237
      009E48 F6               [ 1]  760 	ld	a, (x)
      009E49 A4 F0            [ 1]  761 	and	a, #0xf0
      009E4B F7               [ 1]  762 	ld	(x), a
                                    763 ;	lib/stm8s_uart1.c: 459: UART1->CR4 |= UART1_Address;
      009E4C AE 52 37         [ 2]  764 	ldw	x, #0x5237
      009E4F F6               [ 1]  765 	ld	a, (x)
      009E50 1A 03            [ 1]  766 	or	a, (0x03, sp)
      009E52 AE 52 37         [ 2]  767 	ldw	x, #0x5237
      009E55 F7               [ 1]  768 	ld	(x), a
      009E56 81               [ 4]  769 	ret
                                    770 ;	lib/stm8s_uart1.c: 468: void UART1_SetGuardTime(uint8_t UART1_GuardTime)
                                    771 ;	-----------------------------------------
                                    772 ;	 function UART1_SetGuardTime
                                    773 ;	-----------------------------------------
      009E57                        774 _UART1_SetGuardTime:
                                    775 ;	lib/stm8s_uart1.c: 471: UART1->GTR = UART1_GuardTime;
      009E57 AE 52 39         [ 2]  776 	ldw	x, #0x5239
      009E5A 7B 03            [ 1]  777 	ld	a, (0x03, sp)
      009E5C F7               [ 1]  778 	ld	(x), a
      009E5D 81               [ 4]  779 	ret
                                    780 ;	lib/stm8s_uart1.c: 496: void UART1_SetPrescaler(uint8_t UART1_Prescaler)
                                    781 ;	-----------------------------------------
                                    782 ;	 function UART1_SetPrescaler
                                    783 ;	-----------------------------------------
      009E5E                        784 _UART1_SetPrescaler:
                                    785 ;	lib/stm8s_uart1.c: 499: UART1->PSCR = UART1_Prescaler;
      009E5E AE 52 3A         [ 2]  786 	ldw	x, #0x523a
      009E61 7B 03            [ 1]  787 	ld	a, (0x03, sp)
      009E63 F7               [ 1]  788 	ld	(x), a
      009E64 81               [ 4]  789 	ret
                                    790 ;	lib/stm8s_uart1.c: 508: FlagStatus UART1_GetFlagStatus(UART1_Flag_TypeDef UART1_FLAG)
                                    791 ;	-----------------------------------------
                                    792 ;	 function UART1_GetFlagStatus
                                    793 ;	-----------------------------------------
      009E65                        794 _UART1_GetFlagStatus:
      009E65 88               [ 1]  795 	push	a
                                    796 ;	lib/stm8s_uart1.c: 516: if ((UART1->CR4 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
      009E66 7B 05            [ 1]  797 	ld	a, (0x05, sp)
      009E68 6B 01            [ 1]  798 	ld	(0x01, sp), a
                                    799 ;	lib/stm8s_uart1.c: 514: if (UART1_FLAG == UART1_FLAG_LBDF)
      009E6A 1E 04            [ 2]  800 	ldw	x, (0x04, sp)
      009E6C A3 02 10         [ 2]  801 	cpw	x, #0x0210
      009E6F 26 10            [ 1]  802 	jrne	00114$
                                    803 ;	lib/stm8s_uart1.c: 516: if ((UART1->CR4 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
      009E71 AE 52 37         [ 2]  804 	ldw	x, #0x5237
      009E74 F6               [ 1]  805 	ld	a, (x)
      009E75 14 01            [ 1]  806 	and	a, (0x01, sp)
      009E77 4D               [ 1]  807 	tnz	a
      009E78 27 04            [ 1]  808 	jreq	00102$
                                    809 ;	lib/stm8s_uart1.c: 519: status = SET;
      009E7A A6 01            [ 1]  810 	ld	a, #0x01
      009E7C 20 27            [ 2]  811 	jra	00115$
      009E7E                        812 00102$:
                                    813 ;	lib/stm8s_uart1.c: 524: status = RESET;
      009E7E 4F               [ 1]  814 	clr	a
      009E7F 20 24            [ 2]  815 	jra	00115$
      009E81                        816 00114$:
                                    817 ;	lib/stm8s_uart1.c: 527: else if (UART1_FLAG == UART1_FLAG_SBK)
      009E81 1E 04            [ 2]  818 	ldw	x, (0x04, sp)
      009E83 A3 01 01         [ 2]  819 	cpw	x, #0x0101
      009E86 26 10            [ 1]  820 	jrne	00111$
                                    821 ;	lib/stm8s_uart1.c: 529: if ((UART1->CR2 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
      009E88 AE 52 35         [ 2]  822 	ldw	x, #0x5235
      009E8B F6               [ 1]  823 	ld	a, (x)
      009E8C 14 01            [ 1]  824 	and	a, (0x01, sp)
      009E8E 4D               [ 1]  825 	tnz	a
      009E8F 27 04            [ 1]  826 	jreq	00105$
                                    827 ;	lib/stm8s_uart1.c: 532: status = SET;
      009E91 A6 01            [ 1]  828 	ld	a, #0x01
      009E93 20 10            [ 2]  829 	jra	00115$
      009E95                        830 00105$:
                                    831 ;	lib/stm8s_uart1.c: 537: status = RESET;
      009E95 4F               [ 1]  832 	clr	a
      009E96 20 0D            [ 2]  833 	jra	00115$
      009E98                        834 00111$:
                                    835 ;	lib/stm8s_uart1.c: 542: if ((UART1->SR & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
      009E98 AE 52 30         [ 2]  836 	ldw	x, #0x5230
      009E9B F6               [ 1]  837 	ld	a, (x)
      009E9C 14 01            [ 1]  838 	and	a, (0x01, sp)
      009E9E 4D               [ 1]  839 	tnz	a
      009E9F 27 03            [ 1]  840 	jreq	00108$
                                    841 ;	lib/stm8s_uart1.c: 545: status = SET;
      009EA1 A6 01            [ 1]  842 	ld	a, #0x01
                                    843 ;	lib/stm8s_uart1.c: 550: status = RESET;
      009EA3 21                     844 	.byte 0x21
      009EA4                        845 00108$:
      009EA4 4F               [ 1]  846 	clr	a
      009EA5                        847 00115$:
                                    848 ;	lib/stm8s_uart1.c: 554: return status;
      009EA5 5B 01            [ 2]  849 	addw	sp, #1
      009EA7 81               [ 4]  850 	ret
                                    851 ;	lib/stm8s_uart1.c: 583: void UART1_ClearFlag(UART1_Flag_TypeDef UART1_FLAG)
                                    852 ;	-----------------------------------------
                                    853 ;	 function UART1_ClearFlag
                                    854 ;	-----------------------------------------
      009EA8                        855 _UART1_ClearFlag:
                                    856 ;	lib/stm8s_uart1.c: 587: if (UART1_FLAG == UART1_FLAG_RXNE)
      009EA8 1E 03            [ 2]  857 	ldw	x, (0x03, sp)
      009EAA A3 00 20         [ 2]  858 	cpw	x, #0x0020
      009EAD 26 05            [ 1]  859 	jrne	00102$
                                    860 ;	lib/stm8s_uart1.c: 589: UART1->SR = (uint8_t)~(UART1_SR_RXNE);
      009EAF 35 DF 52 30      [ 1]  861 	mov	0x5230+0, #0xdf
      009EB3 81               [ 4]  862 	ret
      009EB4                        863 00102$:
                                    864 ;	lib/stm8s_uart1.c: 594: UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
      009EB4 AE 52 37         [ 2]  865 	ldw	x, #0x5237
      009EB7 F6               [ 1]  866 	ld	a, (x)
      009EB8 A4 EF            [ 1]  867 	and	a, #0xef
      009EBA F7               [ 1]  868 	ld	(x), a
      009EBB 81               [ 4]  869 	ret
                                    870 ;	lib/stm8s_uart1.c: 611: ITStatus UART1_GetITStatus(UART1_IT_TypeDef UART1_IT)
                                    871 ;	-----------------------------------------
                                    872 ;	 function UART1_GetITStatus
                                    873 ;	-----------------------------------------
      009EBC                        874 _UART1_GetITStatus:
      009EBC 52 05            [ 2]  875 	sub	sp, #5
                                    876 ;	lib/stm8s_uart1.c: 620: itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
      009EBE 7B 09            [ 1]  877 	ld	a, (0x09, sp)
      009EC0 97               [ 1]  878 	ld	xl, a
      009EC1 A4 0F            [ 1]  879 	and	a, #0x0f
      009EC3 95               [ 1]  880 	ld	xh, a
      009EC4 A6 01            [ 1]  881 	ld	a, #0x01
      009EC6 88               [ 1]  882 	push	a
      009EC7 9E               [ 1]  883 	ld	a, xh
      009EC8 4D               [ 1]  884 	tnz	a
      009EC9 27 05            [ 1]  885 	jreq	00154$
      009ECB                        886 00153$:
      009ECB 08 01            [ 1]  887 	sll	(1, sp)
      009ECD 4A               [ 1]  888 	dec	a
      009ECE 26 FB            [ 1]  889 	jrne	00153$
      009ED0                        890 00154$:
      009ED0 84               [ 1]  891 	pop	a
      009ED1 6B 03            [ 1]  892 	ld	(0x03, sp), a
                                    893 ;	lib/stm8s_uart1.c: 622: itmask1 = (uint8_t)((uint8_t)UART1_IT >> (uint8_t)4);
      009ED3 9F               [ 1]  894 	ld	a, xl
      009ED4 4E               [ 1]  895 	swap	a
      009ED5 A4 0F            [ 1]  896 	and	a, #0x0f
      009ED7 97               [ 1]  897 	ld	xl, a
                                    898 ;	lib/stm8s_uart1.c: 624: itmask2 = (uint8_t)((uint8_t)1 << itmask1);
      009ED8 A6 01            [ 1]  899 	ld	a, #0x01
      009EDA 88               [ 1]  900 	push	a
      009EDB 9F               [ 1]  901 	ld	a, xl
      009EDC 4D               [ 1]  902 	tnz	a
      009EDD 27 05            [ 1]  903 	jreq	00156$
      009EDF                        904 00155$:
      009EDF 08 01            [ 1]  905 	sll	(1, sp)
      009EE1 4A               [ 1]  906 	dec	a
      009EE2 26 FB            [ 1]  907 	jrne	00155$
      009EE4                        908 00156$:
      009EE4 84               [ 1]  909 	pop	a
      009EE5 6B 01            [ 1]  910 	ld	(0x01, sp), a
                                    911 ;	lib/stm8s_uart1.c: 628: if (UART1_IT == UART1_IT_PE)
      009EE7 1E 08            [ 2]  912 	ldw	x, (0x08, sp)
      009EE9 A3 01 00         [ 2]  913 	cpw	x, #0x0100
      009EEC 26 1C            [ 1]  914 	jrne	00117$
                                    915 ;	lib/stm8s_uart1.c: 631: enablestatus = (uint8_t)((uint8_t)UART1->CR1 & itmask2);
      009EEE AE 52 34         [ 2]  916 	ldw	x, #0x5234
      009EF1 F6               [ 1]  917 	ld	a, (x)
      009EF2 14 01            [ 1]  918 	and	a, (0x01, sp)
      009EF4 6B 05            [ 1]  919 	ld	(0x05, sp), a
                                    920 ;	lib/stm8s_uart1.c: 634: if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
      009EF6 AE 52 30         [ 2]  921 	ldw	x, #0x5230
      009EF9 F6               [ 1]  922 	ld	a, (x)
      009EFA 14 03            [ 1]  923 	and	a, (0x03, sp)
      009EFC 4D               [ 1]  924 	tnz	a
      009EFD 27 08            [ 1]  925 	jreq	00102$
      009EFF 0D 05            [ 1]  926 	tnz	(0x05, sp)
      009F01 27 04            [ 1]  927 	jreq	00102$
                                    928 ;	lib/stm8s_uart1.c: 637: pendingbitstatus = SET;
      009F03 A6 01            [ 1]  929 	ld	a, #0x01
      009F05 20 3F            [ 2]  930 	jra	00118$
      009F07                        931 00102$:
                                    932 ;	lib/stm8s_uart1.c: 642: pendingbitstatus = RESET;
      009F07 4F               [ 1]  933 	clr	a
      009F08 20 3C            [ 2]  934 	jra	00118$
      009F0A                        935 00117$:
                                    936 ;	lib/stm8s_uart1.c: 646: else if (UART1_IT == UART1_IT_LBDF)
      009F0A 1E 08            [ 2]  937 	ldw	x, (0x08, sp)
      009F0C A3 03 46         [ 2]  938 	cpw	x, #0x0346
      009F0F 26 1C            [ 1]  939 	jrne	00114$
                                    940 ;	lib/stm8s_uart1.c: 649: enablestatus = (uint8_t)((uint8_t)UART1->CR4 & itmask2);
      009F11 AE 52 37         [ 2]  941 	ldw	x, #0x5237
      009F14 F6               [ 1]  942 	ld	a, (x)
      009F15 14 01            [ 1]  943 	and	a, (0x01, sp)
      009F17 6B 02            [ 1]  944 	ld	(0x02, sp), a
                                    945 ;	lib/stm8s_uart1.c: 651: if (((UART1->CR4 & itpos) != (uint8_t)0x00) && enablestatus)
      009F19 AE 52 37         [ 2]  946 	ldw	x, #0x5237
      009F1C F6               [ 1]  947 	ld	a, (x)
      009F1D 14 03            [ 1]  948 	and	a, (0x03, sp)
      009F1F 4D               [ 1]  949 	tnz	a
      009F20 27 08            [ 1]  950 	jreq	00106$
      009F22 0D 02            [ 1]  951 	tnz	(0x02, sp)
      009F24 27 04            [ 1]  952 	jreq	00106$
                                    953 ;	lib/stm8s_uart1.c: 654: pendingbitstatus = SET;
      009F26 A6 01            [ 1]  954 	ld	a, #0x01
      009F28 20 1C            [ 2]  955 	jra	00118$
      009F2A                        956 00106$:
                                    957 ;	lib/stm8s_uart1.c: 659: pendingbitstatus = RESET;
      009F2A 4F               [ 1]  958 	clr	a
      009F2B 20 19            [ 2]  959 	jra	00118$
      009F2D                        960 00114$:
                                    961 ;	lib/stm8s_uart1.c: 665: enablestatus = (uint8_t)((uint8_t)UART1->CR2 & itmask2);
      009F2D AE 52 35         [ 2]  962 	ldw	x, #0x5235
      009F30 F6               [ 1]  963 	ld	a, (x)
      009F31 14 01            [ 1]  964 	and	a, (0x01, sp)
      009F33 6B 04            [ 1]  965 	ld	(0x04, sp), a
                                    966 ;	lib/stm8s_uart1.c: 667: if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
      009F35 AE 52 30         [ 2]  967 	ldw	x, #0x5230
      009F38 F6               [ 1]  968 	ld	a, (x)
      009F39 14 03            [ 1]  969 	and	a, (0x03, sp)
      009F3B 4D               [ 1]  970 	tnz	a
      009F3C 27 07            [ 1]  971 	jreq	00110$
      009F3E 0D 04            [ 1]  972 	tnz	(0x04, sp)
      009F40 27 03            [ 1]  973 	jreq	00110$
                                    974 ;	lib/stm8s_uart1.c: 670: pendingbitstatus = SET;
      009F42 A6 01            [ 1]  975 	ld	a, #0x01
                                    976 ;	lib/stm8s_uart1.c: 675: pendingbitstatus = RESET;
      009F44 21                     977 	.byte 0x21
      009F45                        978 00110$:
      009F45 4F               [ 1]  979 	clr	a
      009F46                        980 00118$:
                                    981 ;	lib/stm8s_uart1.c: 680: return  pendingbitstatus;
      009F46 5B 05            [ 2]  982 	addw	sp, #5
      009F48 81               [ 4]  983 	ret
                                    984 ;	lib/stm8s_uart1.c: 708: void UART1_ClearITPendingBit(UART1_IT_TypeDef UART1_IT)
                                    985 ;	-----------------------------------------
                                    986 ;	 function UART1_ClearITPendingBit
                                    987 ;	-----------------------------------------
      009F49                        988 _UART1_ClearITPendingBit:
                                    989 ;	lib/stm8s_uart1.c: 712: if (UART1_IT == UART1_IT_RXNE)
      009F49 1E 03            [ 2]  990 	ldw	x, (0x03, sp)
      009F4B A3 02 55         [ 2]  991 	cpw	x, #0x0255
      009F4E 26 05            [ 1]  992 	jrne	00102$
                                    993 ;	lib/stm8s_uart1.c: 714: UART1->SR = (uint8_t)~(UART1_SR_RXNE);
      009F50 35 DF 52 30      [ 1]  994 	mov	0x5230+0, #0xdf
      009F54 81               [ 4]  995 	ret
      009F55                        996 00102$:
                                    997 ;	lib/stm8s_uart1.c: 719: UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
      009F55 AE 52 37         [ 2]  998 	ldw	x, #0x5237
      009F58 F6               [ 1]  999 	ld	a, (x)
      009F59 A4 EF            [ 1] 1000 	and	a, #0xef
      009F5B F7               [ 1] 1001 	ld	(x), a
      009F5C 81               [ 4] 1002 	ret
                                   1003 	.area CODE
                                   1004 	.area INITIALIZER
                                   1005 	.area CABS (ABS)
