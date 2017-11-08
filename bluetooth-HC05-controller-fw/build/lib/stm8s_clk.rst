                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.6.0 #9615 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8s_clk
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _HSIDivFactor
                                     12 	.globl _CLK_Config
                                     13 	.globl _CLK_PeripheralClockConfig
                                     14 	.globl _CLK_SYSCLKConfig
                                     15 	.globl _CLK_GetClockFreq
                                     16 ;--------------------------------------------------------
                                     17 ; ram data
                                     18 ;--------------------------------------------------------
                                     19 	.area DATA
                                     20 ;--------------------------------------------------------
                                     21 ; ram data
                                     22 ;--------------------------------------------------------
                                     23 	.area INITIALIZED
                                     24 ;--------------------------------------------------------
                                     25 ; absolute external ram data
                                     26 ;--------------------------------------------------------
                                     27 	.area DABS (ABS)
                                     28 ;--------------------------------------------------------
                                     29 ; global & static initialisations
                                     30 ;--------------------------------------------------------
                                     31 	.area HOME
                                     32 	.area GSINIT
                                     33 	.area GSFINAL
                                     34 	.area GSINIT
                                     35 ;--------------------------------------------------------
                                     36 ; Home
                                     37 ;--------------------------------------------------------
                                     38 	.area HOME
                                     39 	.area HOME
                                     40 ;--------------------------------------------------------
                                     41 ; code
                                     42 ;--------------------------------------------------------
                                     43 	.area CODE
                                     44 ;	lib/stm8s_clk.c: 15: void CLK_Config(void)
                                     45 ;	-----------------------------------------
                                     46 ;	 function CLK_Config
                                     47 ;	-----------------------------------------
      0096D4                         48 _CLK_Config:
                                     49 ;	lib/stm8s_clk.c: 18: CLK->ICKR = CLK_ICKR_RESET_VALUE;
      0096D4 35 01 50 C0      [ 1]   50 	mov	0x50c0+0, #0x01
                                     51 ;	lib/stm8s_clk.c: 19: CLK->ECKR = CLK_ECKR_RESET_VALUE;
      0096D8 35 00 50 C1      [ 1]   52 	mov	0x50c1+0, #0x00
                                     53 ;	lib/stm8s_clk.c: 20: CLK->SWR  = CLK_SWR_RESET_VALUE;
      0096DC 35 E1 50 C4      [ 1]   54 	mov	0x50c4+0, #0xe1
                                     55 ;	lib/stm8s_clk.c: 21: CLK->SWCR = CLK_SWCR_RESET_VALUE;
      0096E0 35 00 50 C5      [ 1]   56 	mov	0x50c5+0, #0x00
                                     57 ;	lib/stm8s_clk.c: 22: CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
      0096E4 35 18 50 C6      [ 1]   58 	mov	0x50c6+0, #0x18
                                     59 ;	lib/stm8s_clk.c: 23: CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
      0096E8 35 FF 50 C7      [ 1]   60 	mov	0x50c7+0, #0xff
                                     61 ;	lib/stm8s_clk.c: 24: CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
      0096EC 35 FF 50 CA      [ 1]   62 	mov	0x50ca+0, #0xff
                                     63 ;	lib/stm8s_clk.c: 25: CLK->CSSR = CLK_CSSR_RESET_VALUE;
      0096F0 35 00 50 C8      [ 1]   64 	mov	0x50c8+0, #0x00
                                     65 ;	lib/stm8s_clk.c: 26: CLK->CCOR = CLK_CCOR_RESET_VALUE;
      0096F4 35 00 50 C9      [ 1]   66 	mov	0x50c9+0, #0x00
                                     67 ;	lib/stm8s_clk.c: 27: while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
      0096F8                         68 00101$:
      0096F8 AE 50 C9         [ 2]   69 	ldw	x, #0x50c9
      0096FB F6               [ 1]   70 	ld	a, (x)
      0096FC 44               [ 1]   71 	srl	a
      0096FD 25 F9            [ 1]   72 	jrc	00101$
                                     73 ;	lib/stm8s_clk.c: 29: CLK->CCOR = CLK_CCOR_RESET_VALUE;
      0096FF 35 00 50 C9      [ 1]   74 	mov	0x50c9+0, #0x00
                                     75 ;	lib/stm8s_clk.c: 30: CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
      009703 35 00 50 CC      [ 1]   76 	mov	0x50cc+0, #0x00
                                     77 ;	lib/stm8s_clk.c: 31: CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
      009707 35 00 50 CD      [ 1]   78 	mov	0x50cd+0, #0x00
                                     79 ;	lib/stm8s_clk.c: 35: CLK->ICKR |= CLK_ICKR_HSIEN; /* Set HSIEN bit */
      00970B 72 10 50 C0      [ 1]   80 	bset	0x50c0, #0
                                     81 ;	lib/stm8s_clk.c: 42: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV); /* Clear High speed internal clock prescaler */
      00970F AE 50 C6         [ 2]   82 	ldw	x, #0x50c6
      009712 F6               [ 1]   83 	ld	a, (x)
      009713 A4 E7            [ 1]   84 	and	a, #0xe7
      009715 F7               [ 1]   85 	ld	(x), a
                                     86 ;	lib/stm8s_clk.c: 43: CLK->CKDIVR |= (uint8_t)CLK_PRESCALER_HSIDIV1; /* Set High speed internal clock prescaler */
      009716 AE 50 C6         [ 2]   87 	ldw	x, #0x50c6
      009719 F6               [ 1]   88 	ld	a, (x)
      00971A AE 50 C6         [ 2]   89 	ldw	x, #0x50c6
      00971D F7               [ 1]   90 	ld	(x), a
                                     91 ;	lib/stm8s_clk.c: 45: CLK_SYSCLKConfig(CLK_PRESCALER_HSIDIV1);
      00971E 4B 00            [ 1]   92 	push	#0x00
      009720 CD 97 7B         [ 4]   93 	call	_CLK_SYSCLKConfig
      009723 84               [ 1]   94 	pop	a
      009724 81               [ 4]   95 	ret
                                     96 ;	lib/stm8s_clk.c: 48: void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
                                     97 ;	-----------------------------------------
                                     98 ;	 function CLK_PeripheralClockConfig
                                     99 ;	-----------------------------------------
      009725                        100 _CLK_PeripheralClockConfig:
      009725 89               [ 2]  101 	pushw	x
                                    102 ;	lib/stm8s_clk.c: 55: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      009726 7B 05            [ 1]  103 	ld	a, (0x05, sp)
      009728 A4 0F            [ 1]  104 	and	a, #0x0f
      00972A 88               [ 1]  105 	push	a
      00972B A6 01            [ 1]  106 	ld	a, #0x01
      00972D 6B 03            [ 1]  107 	ld	(0x03, sp), a
      00972F 84               [ 1]  108 	pop	a
      009730 4D               [ 1]  109 	tnz	a
      009731 27 05            [ 1]  110 	jreq	00125$
      009733                        111 00124$:
      009733 08 02            [ 1]  112 	sll	(0x02, sp)
      009735 4A               [ 1]  113 	dec	a
      009736 26 FB            [ 1]  114 	jrne	00124$
      009738                        115 00125$:
                                    116 ;	lib/stm8s_clk.c: 60: CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      009738 7B 02            [ 1]  117 	ld	a, (0x02, sp)
      00973A 43               [ 1]  118 	cpl	a
      00973B 6B 01            [ 1]  119 	ld	(0x01, sp), a
                                    120 ;	lib/stm8s_clk.c: 50: if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
      00973D 7B 05            [ 1]  121 	ld	a, (0x05, sp)
      00973F A5 10            [ 1]  122 	bcp	a, #0x10
      009741 26 1C            [ 1]  123 	jrne	00108$
                                    124 ;	lib/stm8s_clk.c: 52: if (NewState != DISABLE)
      009743 0D 06            [ 1]  125 	tnz	(0x06, sp)
      009745 27 0C            [ 1]  126 	jreq	00102$
                                    127 ;	lib/stm8s_clk.c: 55: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      009747 AE 50 C7         [ 2]  128 	ldw	x, #0x50c7
      00974A F6               [ 1]  129 	ld	a, (x)
      00974B 1A 02            [ 1]  130 	or	a, (0x02, sp)
      00974D AE 50 C7         [ 2]  131 	ldw	x, #0x50c7
      009750 F7               [ 1]  132 	ld	(x), a
      009751 20 26            [ 2]  133 	jra	00110$
      009753                        134 00102$:
                                    135 ;	lib/stm8s_clk.c: 60: CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      009753 AE 50 C7         [ 2]  136 	ldw	x, #0x50c7
      009756 F6               [ 1]  137 	ld	a, (x)
      009757 14 01            [ 1]  138 	and	a, (0x01, sp)
      009759 AE 50 C7         [ 2]  139 	ldw	x, #0x50c7
      00975C F7               [ 1]  140 	ld	(x), a
      00975D 20 1A            [ 2]  141 	jra	00110$
      00975F                        142 00108$:
                                    143 ;	lib/stm8s_clk.c: 65: if (NewState != DISABLE)
      00975F 0D 06            [ 1]  144 	tnz	(0x06, sp)
      009761 27 0C            [ 1]  145 	jreq	00105$
                                    146 ;	lib/stm8s_clk.c: 68: CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      009763 AE 50 CA         [ 2]  147 	ldw	x, #0x50ca
      009766 F6               [ 1]  148 	ld	a, (x)
      009767 1A 02            [ 1]  149 	or	a, (0x02, sp)
      009769 AE 50 CA         [ 2]  150 	ldw	x, #0x50ca
      00976C F7               [ 1]  151 	ld	(x), a
      00976D 20 0A            [ 2]  152 	jra	00110$
      00976F                        153 00105$:
                                    154 ;	lib/stm8s_clk.c: 73: CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      00976F AE 50 CA         [ 2]  155 	ldw	x, #0x50ca
      009772 F6               [ 1]  156 	ld	a, (x)
      009773 14 01            [ 1]  157 	and	a, (0x01, sp)
      009775 AE 50 CA         [ 2]  158 	ldw	x, #0x50ca
      009778 F7               [ 1]  159 	ld	(x), a
      009779                        160 00110$:
      009779 85               [ 2]  161 	popw	x
      00977A 81               [ 4]  162 	ret
                                    163 ;	lib/stm8s_clk.c: 78: void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
                                    164 ;	-----------------------------------------
                                    165 ;	 function CLK_SYSCLKConfig
                                    166 ;	-----------------------------------------
      00977B                        167 _CLK_SYSCLKConfig:
      00977B 89               [ 2]  168 	pushw	x
                                    169 ;	lib/stm8s_clk.c: 80: if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
      00977C 0D 05            [ 1]  170 	tnz	(0x05, sp)
      00977E 2B 19            [ 1]  171 	jrmi	00102$
                                    172 ;	lib/stm8s_clk.c: 82: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
      009780 AE 50 C6         [ 2]  173 	ldw	x, #0x50c6
      009783 F6               [ 1]  174 	ld	a, (x)
      009784 A4 E7            [ 1]  175 	and	a, #0xe7
      009786 F7               [ 1]  176 	ld	(x), a
                                    177 ;	lib/stm8s_clk.c: 83: CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
      009787 AE 50 C6         [ 2]  178 	ldw	x, #0x50c6
      00978A F6               [ 1]  179 	ld	a, (x)
      00978B 6B 01            [ 1]  180 	ld	(0x01, sp), a
      00978D 7B 05            [ 1]  181 	ld	a, (0x05, sp)
      00978F A4 18            [ 1]  182 	and	a, #0x18
      009791 1A 01            [ 1]  183 	or	a, (0x01, sp)
      009793 AE 50 C6         [ 2]  184 	ldw	x, #0x50c6
      009796 F7               [ 1]  185 	ld	(x), a
      009797 20 17            [ 2]  186 	jra	00104$
      009799                        187 00102$:
                                    188 ;	lib/stm8s_clk.c: 87: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
      009799 AE 50 C6         [ 2]  189 	ldw	x, #0x50c6
      00979C F6               [ 1]  190 	ld	a, (x)
      00979D A4 F8            [ 1]  191 	and	a, #0xf8
      00979F F7               [ 1]  192 	ld	(x), a
                                    193 ;	lib/stm8s_clk.c: 88: CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
      0097A0 AE 50 C6         [ 2]  194 	ldw	x, #0x50c6
      0097A3 F6               [ 1]  195 	ld	a, (x)
      0097A4 6B 02            [ 1]  196 	ld	(0x02, sp), a
      0097A6 7B 05            [ 1]  197 	ld	a, (0x05, sp)
      0097A8 A4 07            [ 1]  198 	and	a, #0x07
      0097AA 1A 02            [ 1]  199 	or	a, (0x02, sp)
      0097AC AE 50 C6         [ 2]  200 	ldw	x, #0x50c6
      0097AF F7               [ 1]  201 	ld	(x), a
      0097B0                        202 00104$:
      0097B0 85               [ 2]  203 	popw	x
      0097B1 81               [ 4]  204 	ret
                                    205 ;	lib/stm8s_clk.c: 92: uint32_t CLK_GetClockFreq(void)
                                    206 ;	-----------------------------------------
                                    207 ;	 function CLK_GetClockFreq
                                    208 ;	-----------------------------------------
      0097B2                        209 _CLK_GetClockFreq:
      0097B2 52 07            [ 2]  210 	sub	sp, #7
                                    211 ;	lib/stm8s_clk.c: 99: clocksource = (CLK_Source_TypeDef)CLK->CMSR;
      0097B4 AE 50 C3         [ 2]  212 	ldw	x, #0x50c3
      0097B7 F6               [ 1]  213 	ld	a, (x)
      0097B8 6B 05            [ 1]  214 	ld	(0x05, sp), a
                                    215 ;	lib/stm8s_clk.c: 100: if (clocksource == CLK_SOURCE_HSI)
      0097BA 7B 05            [ 1]  216 	ld	a, (0x05, sp)
      0097BC A1 E1            [ 1]  217 	cp	a, #0xe1
      0097BE 26 2C            [ 1]  218 	jrne	00105$
                                    219 ;	lib/stm8s_clk.c: 102: tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
      0097C0 AE 50 C6         [ 2]  220 	ldw	x, #0x50c6
      0097C3 F6               [ 1]  221 	ld	a, (x)
      0097C4 A4 18            [ 1]  222 	and	a, #0x18
                                    223 ;	lib/stm8s_clk.c: 103: tmp = (uint8_t)(tmp >> 3);
      0097C6 44               [ 1]  224 	srl	a
      0097C7 44               [ 1]  225 	srl	a
      0097C8 44               [ 1]  226 	srl	a
                                    227 ;	lib/stm8s_clk.c: 104: presc = HSIDivFactor[tmp];
      0097C9 AE 98 0B         [ 2]  228 	ldw	x, #_HSIDivFactor+0
      0097CC 1F 06            [ 2]  229 	ldw	(0x06, sp), x
      0097CE 5F               [ 1]  230 	clrw	x
      0097CF 97               [ 1]  231 	ld	xl, a
      0097D0 72 FB 06         [ 2]  232 	addw	x, (0x06, sp)
      0097D3 F6               [ 1]  233 	ld	a, (x)
                                    234 ;	lib/stm8s_clk.c: 105: clockfrequency = HSI_VALUE / presc;
      0097D4 5F               [ 1]  235 	clrw	x
      0097D5 97               [ 1]  236 	ld	xl, a
      0097D6 90 5F            [ 1]  237 	clrw	y
      0097D8 89               [ 2]  238 	pushw	x
      0097D9 90 89            [ 2]  239 	pushw	y
      0097DB 4B 00            [ 1]  240 	push	#0x00
      0097DD 4B 24            [ 1]  241 	push	#0x24
      0097DF 4B F4            [ 1]  242 	push	#0xf4
      0097E1 4B 00            [ 1]  243 	push	#0x00
      0097E3 CD 9F D9         [ 4]  244 	call	__divulong
      0097E6 5B 08            [ 2]  245 	addw	sp, #8
      0097E8 1F 03            [ 2]  246 	ldw	(0x03, sp), x
      0097EA 20 1A            [ 2]  247 	jra	00106$
      0097EC                        248 00105$:
                                    249 ;	lib/stm8s_clk.c: 107: else if ( clocksource == CLK_SOURCE_LSI)
      0097EC 7B 05            [ 1]  250 	ld	a, (0x05, sp)
      0097EE A1 D2            [ 1]  251 	cp	a, #0xd2
      0097F0 26 0B            [ 1]  252 	jrne	00102$
                                    253 ;	lib/stm8s_clk.c: 109: clockfrequency = LSI_VALUE;
      0097F2 AE F4 00         [ 2]  254 	ldw	x, #0xf400
      0097F5 1F 03            [ 2]  255 	ldw	(0x03, sp), x
      0097F7 90 AE 00 01      [ 2]  256 	ldw	y, #0x0001
      0097FB 20 09            [ 2]  257 	jra	00106$
      0097FD                        258 00102$:
                                    259 ;	lib/stm8s_clk.c: 113: clockfrequency = HSE_VALUE;
      0097FD AE 24 00         [ 2]  260 	ldw	x, #0x2400
      009800 1F 03            [ 2]  261 	ldw	(0x03, sp), x
      009802 90 AE 00 F4      [ 2]  262 	ldw	y, #0x00f4
      009806                        263 00106$:
                                    264 ;	lib/stm8s_clk.c: 115: return((uint32_t)clockfrequency);
      009806 1E 03            [ 2]  265 	ldw	x, (0x03, sp)
      009808 5B 07            [ 2]  266 	addw	sp, #7
      00980A 81               [ 4]  267 	ret
                                    268 	.area CODE
      00980B                        269 _HSIDivFactor:
      00980B 01                     270 	.db #0x01	; 1
      00980C 02                     271 	.db #0x02	; 2
      00980D 04                     272 	.db #0x04	; 4
      00980E 08                     273 	.db #0x08	; 8
                                    274 	.area INITIALIZER
                                    275 	.area CABS (ABS)
