                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.6.0 #9615 (Mac OS X x86_64)
                                      4 ;--------------------------------------------------------
                                      5 	.module tim1
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _TIM1_DeInit
                                     12 	.globl _TIM1_TimeBaseInit
                                     13 	.globl _TIM1_Cmd
                                     14 	.globl _TIM1_ITConfig
                                     15 	.globl _TIM1_SetCounter
                                     16 	.globl _TIM1_GetCounter
                                     17 	.globl _TIM1_ClearFlag
                                     18 	.globl _TIM1_ClearITPendingBit
                                     19 ;--------------------------------------------------------
                                     20 ; ram data
                                     21 ;--------------------------------------------------------
                                     22 	.area DATA
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
                                     47 ;	lib/tim1.c: 4: void TIM1_DeInit(void)
                                     48 ;	-----------------------------------------
                                     49 ;	 function TIM1_DeInit
                                     50 ;	-----------------------------------------
      009010                         51 _TIM1_DeInit:
                                     52 ;	lib/tim1.c: 6: TIM1->CR1  = TIM1_CR1_RESET_VALUE;
      009010 35 00 52 50      [ 1]   53 	mov	0x5250+0, #0x00
                                     54 ;	lib/tim1.c: 7: TIM1->CR2  = TIM1_CR2_RESET_VALUE;
      009014 35 00 52 51      [ 1]   55 	mov	0x5251+0, #0x00
                                     56 ;	lib/tim1.c: 8: TIM1->SMCR = TIM1_SMCR_RESET_VALUE;
      009018 35 00 52 52      [ 1]   57 	mov	0x5252+0, #0x00
                                     58 ;	lib/tim1.c: 9: TIM1->ETR  = TIM1_ETR_RESET_VALUE;
      00901C 35 00 52 53      [ 1]   59 	mov	0x5253+0, #0x00
                                     60 ;	lib/tim1.c: 10: TIM1->IER  = TIM1_IER_RESET_VALUE;
      009020 35 00 52 54      [ 1]   61 	mov	0x5254+0, #0x00
                                     62 ;	lib/tim1.c: 11: TIM1->SR2  = TIM1_SR2_RESET_VALUE;
      009024 35 00 52 56      [ 1]   63 	mov	0x5256+0, #0x00
                                     64 ;	lib/tim1.c: 13: TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
      009028 35 00 52 5C      [ 1]   65 	mov	0x525c+0, #0x00
                                     66 ;	lib/tim1.c: 14: TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
      00902C 35 00 52 5D      [ 1]   67 	mov	0x525d+0, #0x00
                                     68 ;	lib/tim1.c: 16: TIM1->CCMR1 = 0x01;
      009030 35 01 52 58      [ 1]   69 	mov	0x5258+0, #0x01
                                     70 ;	lib/tim1.c: 17: TIM1->CCMR2 = 0x01;
      009034 35 01 52 59      [ 1]   71 	mov	0x5259+0, #0x01
                                     72 ;	lib/tim1.c: 18: TIM1->CCMR3 = 0x01;
      009038 35 01 52 5A      [ 1]   73 	mov	0x525a+0, #0x01
                                     74 ;	lib/tim1.c: 19: TIM1->CCMR4 = 0x01;
      00903C 35 01 52 5B      [ 1]   75 	mov	0x525b+0, #0x01
                                     76 ;	lib/tim1.c: 21: TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
      009040 35 00 52 5C      [ 1]   77 	mov	0x525c+0, #0x00
                                     78 ;	lib/tim1.c: 22: TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
      009044 35 00 52 5D      [ 1]   79 	mov	0x525d+0, #0x00
                                     80 ;	lib/tim1.c: 23: TIM1->CCMR1 = TIM1_CCMR1_RESET_VALUE;
      009048 35 00 52 58      [ 1]   81 	mov	0x5258+0, #0x00
                                     82 ;	lib/tim1.c: 24: TIM1->CCMR2 = TIM1_CCMR2_RESET_VALUE;
      00904C 35 00 52 59      [ 1]   83 	mov	0x5259+0, #0x00
                                     84 ;	lib/tim1.c: 25: TIM1->CCMR3 = TIM1_CCMR3_RESET_VALUE;
      009050 35 00 52 5A      [ 1]   85 	mov	0x525a+0, #0x00
                                     86 ;	lib/tim1.c: 26: TIM1->CCMR4 = TIM1_CCMR4_RESET_VALUE;
      009054 35 00 52 5B      [ 1]   87 	mov	0x525b+0, #0x00
                                     88 ;	lib/tim1.c: 27: TIM1->CNTRH = TIM1_CNTRH_RESET_VALUE;
      009058 35 00 52 5E      [ 1]   89 	mov	0x525e+0, #0x00
                                     90 ;	lib/tim1.c: 28: TIM1->CNTRL = TIM1_CNTRL_RESET_VALUE;
      00905C 35 00 52 5F      [ 1]   91 	mov	0x525f+0, #0x00
                                     92 ;	lib/tim1.c: 29: TIM1->PSCRH = TIM1_PSCRH_RESET_VALUE;
      009060 35 00 52 60      [ 1]   93 	mov	0x5260+0, #0x00
                                     94 ;	lib/tim1.c: 30: TIM1->PSCRL = TIM1_PSCRL_RESET_VALUE;
      009064 35 00 52 61      [ 1]   95 	mov	0x5261+0, #0x00
                                     96 ;	lib/tim1.c: 31: TIM1->ARRH  = TIM1_ARRH_RESET_VALUE;
      009068 35 FF 52 62      [ 1]   97 	mov	0x5262+0, #0xff
                                     98 ;	lib/tim1.c: 32: TIM1->ARRL  = TIM1_ARRL_RESET_VALUE;
      00906C 35 FF 52 63      [ 1]   99 	mov	0x5263+0, #0xff
                                    100 ;	lib/tim1.c: 33: TIM1->CCR1H = TIM1_CCR1H_RESET_VALUE;
      009070 35 00 52 65      [ 1]  101 	mov	0x5265+0, #0x00
                                    102 ;	lib/tim1.c: 34: TIM1->CCR1L = TIM1_CCR1L_RESET_VALUE;
      009074 35 00 52 66      [ 1]  103 	mov	0x5266+0, #0x00
                                    104 ;	lib/tim1.c: 35: TIM1->CCR2H = TIM1_CCR2H_RESET_VALUE;
      009078 35 00 52 67      [ 1]  105 	mov	0x5267+0, #0x00
                                    106 ;	lib/tim1.c: 36: TIM1->CCR2L = TIM1_CCR2L_RESET_VALUE;
      00907C 35 00 52 68      [ 1]  107 	mov	0x5268+0, #0x00
                                    108 ;	lib/tim1.c: 37: TIM1->CCR3H = TIM1_CCR3H_RESET_VALUE;
      009080 35 00 52 69      [ 1]  109 	mov	0x5269+0, #0x00
                                    110 ;	lib/tim1.c: 38: TIM1->CCR3L = TIM1_CCR3L_RESET_VALUE;
      009084 35 00 52 6A      [ 1]  111 	mov	0x526a+0, #0x00
                                    112 ;	lib/tim1.c: 39: TIM1->CCR4H = TIM1_CCR4H_RESET_VALUE;
      009088 35 00 52 6B      [ 1]  113 	mov	0x526b+0, #0x00
                                    114 ;	lib/tim1.c: 40: TIM1->CCR4L = TIM1_CCR4L_RESET_VALUE;
      00908C 35 00 52 6C      [ 1]  115 	mov	0x526c+0, #0x00
                                    116 ;	lib/tim1.c: 41: TIM1->OISR  = TIM1_OISR_RESET_VALUE;
      009090 35 00 52 6F      [ 1]  117 	mov	0x526f+0, #0x00
                                    118 ;	lib/tim1.c: 42: TIM1->EGR   = 0x01; /* TIM1_EGR_UG */
      009094 35 01 52 57      [ 1]  119 	mov	0x5257+0, #0x01
                                    120 ;	lib/tim1.c: 43: TIM1->DTR   = TIM1_DTR_RESET_VALUE;
      009098 35 00 52 6E      [ 1]  121 	mov	0x526e+0, #0x00
                                    122 ;	lib/tim1.c: 44: TIM1->BKR   = TIM1_BKR_RESET_VALUE;
      00909C 35 00 52 6D      [ 1]  123 	mov	0x526d+0, #0x00
                                    124 ;	lib/tim1.c: 45: TIM1->RCR   = TIM1_RCR_RESET_VALUE;
      0090A0 35 00 52 64      [ 1]  125 	mov	0x5264+0, #0x00
                                    126 ;	lib/tim1.c: 46: TIM1->SR1   = TIM1_SR1_RESET_VALUE;
      0090A4 35 00 52 55      [ 1]  127 	mov	0x5255+0, #0x00
      0090A8 81               [ 4]  128 	ret
                                    129 ;	lib/tim1.c: 49: void TIM1_TimeBaseInit(uint16_t TIM1_Prescaler,
                                    130 ;	-----------------------------------------
                                    131 ;	 function TIM1_TimeBaseInit
                                    132 ;	-----------------------------------------
      0090A9                        133 _TIM1_TimeBaseInit:
      0090A9 52 04            [ 2]  134 	sub	sp, #4
                                    135 ;	lib/tim1.c: 56: TIM1->ARRH = (uint8_t)(TIM1_Period >> 8);
      0090AB 7B 0A            [ 1]  136 	ld	a, (0x0a, sp)
      0090AD 0F 01            [ 1]  137 	clr	(0x01, sp)
      0090AF AE 52 62         [ 2]  138 	ldw	x, #0x5262
      0090B2 F7               [ 1]  139 	ld	(x), a
                                    140 ;	lib/tim1.c: 57: TIM1->ARRL = (uint8_t)(TIM1_Period);
      0090B3 7B 0B            [ 1]  141 	ld	a, (0x0b, sp)
      0090B5 AE 52 63         [ 2]  142 	ldw	x, #0x5263
      0090B8 F7               [ 1]  143 	ld	(x), a
                                    144 ;	lib/tim1.c: 60: TIM1->PSCRH = (uint8_t)(TIM1_Prescaler >> 8);
      0090B9 7B 07            [ 1]  145 	ld	a, (0x07, sp)
      0090BB 0F 03            [ 1]  146 	clr	(0x03, sp)
      0090BD AE 52 60         [ 2]  147 	ldw	x, #0x5260
      0090C0 F7               [ 1]  148 	ld	(x), a
                                    149 ;	lib/tim1.c: 61: TIM1->PSCRL = (uint8_t)(TIM1_Prescaler);
      0090C1 7B 08            [ 1]  150 	ld	a, (0x08, sp)
      0090C3 AE 52 61         [ 2]  151 	ldw	x, #0x5261
      0090C6 F7               [ 1]  152 	ld	(x), a
                                    153 ;	lib/tim1.c: 64: TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)(~(TIM1_CR1_CMS | TIM1_CR1_DIR)))
      0090C7 AE 52 50         [ 2]  154 	ldw	x, #0x5250
      0090CA F6               [ 1]  155 	ld	a, (x)
      0090CB A4 8F            [ 1]  156 	and	a, #0x8f
                                    157 ;	lib/tim1.c: 65: | (uint8_t)(TIM1_CounterMode));
      0090CD 1A 09            [ 1]  158 	or	a, (0x09, sp)
      0090CF AE 52 50         [ 2]  159 	ldw	x, #0x5250
      0090D2 F7               [ 1]  160 	ld	(x), a
                                    161 ;	lib/tim1.c: 68: TIM1->RCR = TIM1_RepetitionCounter;
      0090D3 AE 52 64         [ 2]  162 	ldw	x, #0x5264
      0090D6 7B 0C            [ 1]  163 	ld	a, (0x0c, sp)
      0090D8 F7               [ 1]  164 	ld	(x), a
      0090D9 5B 04            [ 2]  165 	addw	sp, #4
      0090DB 81               [ 4]  166 	ret
                                    167 ;	lib/tim1.c: 71: void TIM1_Cmd(FunctionalState NewState)
                                    168 ;	-----------------------------------------
                                    169 ;	 function TIM1_Cmd
                                    170 ;	-----------------------------------------
      0090DC                        171 _TIM1_Cmd:
                                    172 ;	lib/tim1.c: 74: if (NewState != DISABLE)
      0090DC 0D 03            [ 1]  173 	tnz	(0x03, sp)
      0090DE 27 05            [ 1]  174 	jreq	00102$
                                    175 ;	lib/tim1.c: 76: TIM1->CR1 |= TIM1_CR1_CEN;
      0090E0 72 10 52 50      [ 1]  176 	bset	0x5250, #0
      0090E4 81               [ 4]  177 	ret
      0090E5                        178 00102$:
                                    179 ;	lib/tim1.c: 80: TIM1->CR1 &= (uint8_t)(~TIM1_CR1_CEN);
      0090E5 72 11 52 50      [ 1]  180 	bres	0x5250, #0
      0090E9 81               [ 4]  181 	ret
                                    182 ;	lib/tim1.c: 84: void TIM1_ITConfig(TIM1_IT_TypeDef  TIM1_IT, FunctionalState NewState)
                                    183 ;	-----------------------------------------
                                    184 ;	 function TIM1_ITConfig
                                    185 ;	-----------------------------------------
      0090EA                        186 _TIM1_ITConfig:
      0090EA 88               [ 1]  187 	push	a
                                    188 ;	lib/tim1.c: 86: if (NewState != DISABLE)
      0090EB 0D 05            [ 1]  189 	tnz	(0x05, sp)
      0090ED 27 0C            [ 1]  190 	jreq	00102$
                                    191 ;	lib/tim1.c: 89: TIM1->IER |= (uint8_t)TIM1_IT;
      0090EF AE 52 54         [ 2]  192 	ldw	x, #0x5254
      0090F2 F6               [ 1]  193 	ld	a, (x)
      0090F3 1A 04            [ 1]  194 	or	a, (0x04, sp)
      0090F5 AE 52 54         [ 2]  195 	ldw	x, #0x5254
      0090F8 F7               [ 1]  196 	ld	(x), a
      0090F9 20 0F            [ 2]  197 	jra	00104$
      0090FB                        198 00102$:
                                    199 ;	lib/tim1.c: 94: TIM1->IER &= (uint8_t)(~(uint8_t)TIM1_IT);
      0090FB AE 52 54         [ 2]  200 	ldw	x, #0x5254
      0090FE F6               [ 1]  201 	ld	a, (x)
      0090FF 6B 01            [ 1]  202 	ld	(0x01, sp), a
      009101 7B 04            [ 1]  203 	ld	a, (0x04, sp)
      009103 43               [ 1]  204 	cpl	a
      009104 14 01            [ 1]  205 	and	a, (0x01, sp)
      009106 AE 52 54         [ 2]  206 	ldw	x, #0x5254
      009109 F7               [ 1]  207 	ld	(x), a
      00910A                        208 00104$:
      00910A 84               [ 1]  209 	pop	a
      00910B 81               [ 4]  210 	ret
                                    211 ;	lib/tim1.c: 98: void TIM1_SetCounter(uint16_t Counter)
                                    212 ;	-----------------------------------------
                                    213 ;	 function TIM1_SetCounter
                                    214 ;	-----------------------------------------
      00910C                        215 _TIM1_SetCounter:
      00910C 89               [ 2]  216 	pushw	x
                                    217 ;	lib/tim1.c: 101: TIM1->CNTRH = (uint8_t)(Counter >> 8);
      00910D 7B 05            [ 1]  218 	ld	a, (0x05, sp)
      00910F 0F 01            [ 1]  219 	clr	(0x01, sp)
      009111 AE 52 5E         [ 2]  220 	ldw	x, #0x525e
      009114 F7               [ 1]  221 	ld	(x), a
                                    222 ;	lib/tim1.c: 102: TIM1->CNTRL = (uint8_t)(Counter);
      009115 7B 06            [ 1]  223 	ld	a, (0x06, sp)
      009117 AE 52 5F         [ 2]  224 	ldw	x, #0x525f
      00911A F7               [ 1]  225 	ld	(x), a
      00911B 85               [ 2]  226 	popw	x
      00911C 81               [ 4]  227 	ret
                                    228 ;	lib/tim1.c: 112: uint16_t TIM1_GetCounter(void)
                                    229 ;	-----------------------------------------
                                    230 ;	 function TIM1_GetCounter
                                    231 ;	-----------------------------------------
      00911D                        232 _TIM1_GetCounter:
      00911D 52 04            [ 2]  233 	sub	sp, #4
                                    234 ;	lib/tim1.c: 116: tmpcntr = ((uint16_t)TIM1->CNTRH << 8);
      00911F AE 52 5E         [ 2]  235 	ldw	x, #0x525e
      009122 F6               [ 1]  236 	ld	a, (x)
      009123 95               [ 1]  237 	ld	xh, a
      009124 4F               [ 1]  238 	clr	a
      009125 4F               [ 1]  239 	clr	a
      009126 6B 02            [ 1]  240 	ld	(0x02, sp), a
                                    241 ;	lib/tim1.c: 119: return (uint16_t)(tmpcntr | (uint16_t)(TIM1->CNTRL));
      009128 90 AE 52 5F      [ 2]  242 	ldw	y, #0x525f
      00912C 90 F6            [ 1]  243 	ld	a, (y)
      00912E 0F 03            [ 1]  244 	clr	(0x03, sp)
      009130 1A 02            [ 1]  245 	or	a, (0x02, sp)
      009132 02               [ 1]  246 	rlwa	x
      009133 1A 03            [ 1]  247 	or	a, (0x03, sp)
      009135 95               [ 1]  248 	ld	xh, a
      009136 5B 04            [ 2]  249 	addw	sp, #4
      009138 81               [ 4]  250 	ret
                                    251 ;	lib/tim1.c: 141: void TIM1_ClearFlag(TIM1_FLAG_TypeDef TIM1_FLAG)
                                    252 ;	-----------------------------------------
                                    253 ;	 function TIM1_ClearFlag
                                    254 ;	-----------------------------------------
      009139                        255 _TIM1_ClearFlag:
      009139 89               [ 2]  256 	pushw	x
                                    257 ;	lib/tim1.c: 144: TIM1->SR1 = (uint8_t)(~(uint8_t)(TIM1_FLAG));
      00913A 7B 06            [ 1]  258 	ld	a, (0x06, sp)
      00913C 43               [ 1]  259 	cpl	a
      00913D AE 52 55         [ 2]  260 	ldw	x, #0x5255
      009140 F7               [ 1]  261 	ld	(x), a
                                    262 ;	lib/tim1.c: 145: TIM1->SR2 = (uint8_t)((uint8_t)(~((uint8_t)((uint16_t)TIM1_FLAG >> 8))) & 
      009141 7B 05            [ 1]  263 	ld	a, (0x05, sp)
      009143 0F 01            [ 1]  264 	clr	(0x01, sp)
      009145 43               [ 1]  265 	cpl	a
      009146 A4 1E            [ 1]  266 	and	a, #0x1e
      009148 AE 52 56         [ 2]  267 	ldw	x, #0x5256
      00914B F7               [ 1]  268 	ld	(x), a
      00914C 85               [ 2]  269 	popw	x
      00914D 81               [ 4]  270 	ret
                                    271 ;	lib/tim1.c: 169: void TIM1_ClearITPendingBit(TIM1_IT_TypeDef TIM1_IT)
                                    272 ;	-----------------------------------------
                                    273 ;	 function TIM1_ClearITPendingBit
                                    274 ;	-----------------------------------------
      00914E                        275 _TIM1_ClearITPendingBit:
                                    276 ;	lib/tim1.c: 172: TIM1->SR1 = (uint8_t)(~(uint8_t)TIM1_IT);
      00914E 7B 03            [ 1]  277 	ld	a, (0x03, sp)
      009150 43               [ 1]  278 	cpl	a
      009151 AE 52 55         [ 2]  279 	ldw	x, #0x5255
      009154 F7               [ 1]  280 	ld	(x), a
      009155 81               [ 4]  281 	ret
                                    282 	.area CODE
                                    283 	.area INITIALIZER
                                    284 	.area CABS (ABS)
