                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.6.0 #9615 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module clk
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
                                     44 ;	lib/clk.c: 6: void CLK_Config(void)
                                     45 ;	-----------------------------------------
                                     46 ;	 function CLK_Config
                                     47 ;	-----------------------------------------
      008D5C                         48 _CLK_Config:
                                     49 ;	lib/clk.c: 9: CLK->ICKR = CLK_ICKR_RESET_VALUE;
      008D5C 35 01 50 C0      [ 1]   50 	mov	0x50c0+0, #0x01
                                     51 ;	lib/clk.c: 10: CLK->ECKR = CLK_ECKR_RESET_VALUE;
      008D60 35 00 50 C1      [ 1]   52 	mov	0x50c1+0, #0x00
                                     53 ;	lib/clk.c: 11: CLK->SWR  = CLK_SWR_RESET_VALUE;
      008D64 35 E1 50 C4      [ 1]   54 	mov	0x50c4+0, #0xe1
                                     55 ;	lib/clk.c: 12: CLK->SWCR = CLK_SWCR_RESET_VALUE;
      008D68 35 00 50 C5      [ 1]   56 	mov	0x50c5+0, #0x00
                                     57 ;	lib/clk.c: 13: CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
      008D6C 35 18 50 C6      [ 1]   58 	mov	0x50c6+0, #0x18
                                     59 ;	lib/clk.c: 14: CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
      008D70 35 FF 50 C7      [ 1]   60 	mov	0x50c7+0, #0xff
                                     61 ;	lib/clk.c: 15: CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
      008D74 35 FF 50 CA      [ 1]   62 	mov	0x50ca+0, #0xff
                                     63 ;	lib/clk.c: 16: CLK->CSSR = CLK_CSSR_RESET_VALUE;
      008D78 35 00 50 C8      [ 1]   64 	mov	0x50c8+0, #0x00
                                     65 ;	lib/clk.c: 17: CLK->CCOR = CLK_CCOR_RESET_VALUE;
      008D7C 35 00 50 C9      [ 1]   66 	mov	0x50c9+0, #0x00
                                     67 ;	lib/clk.c: 18: while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
      008D80                         68 00101$:
      008D80 AE 50 C9         [ 2]   69 	ldw	x, #0x50c9
      008D83 F6               [ 1]   70 	ld	a, (x)
      008D84 44               [ 1]   71 	srl	a
      008D85 25 F9            [ 1]   72 	jrc	00101$
                                     73 ;	lib/clk.c: 20: CLK->CCOR = CLK_CCOR_RESET_VALUE;
      008D87 35 00 50 C9      [ 1]   74 	mov	0x50c9+0, #0x00
                                     75 ;	lib/clk.c: 21: CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
      008D8B 35 00 50 CC      [ 1]   76 	mov	0x50cc+0, #0x00
                                     77 ;	lib/clk.c: 22: CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
      008D8F 35 00 50 CD      [ 1]   78 	mov	0x50cd+0, #0x00
                                     79 ;	lib/clk.c: 24: CLK->ICKR |= CLK_ICKR_HSIEN;
      008D93 72 10 50 C0      [ 1]   80 	bset	0x50c0, #0
                                     81 ;	lib/clk.c: 26: CLK->ICKR |= CLK_ICKR_LSIEN;
      008D97 AE 50 C0         [ 2]   82 	ldw	x, #0x50c0
      008D9A F6               [ 1]   83 	ld	a, (x)
      008D9B AA 08            [ 1]   84 	or	a, #0x08
      008D9D F7               [ 1]   85 	ld	(x), a
                                     86 ;	lib/clk.c: 29: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV); 
      008D9E AE 50 C6         [ 2]   87 	ldw	x, #0x50c6
      008DA1 F6               [ 1]   88 	ld	a, (x)
      008DA2 A4 E7            [ 1]   89 	and	a, #0xe7
      008DA4 F7               [ 1]   90 	ld	(x), a
                                     91 ;	lib/clk.c: 31: CLK->CKDIVR |= (uint8_t)CLK_PRESCALER_HSIDIV1;
      008DA5 AE 50 C6         [ 2]   92 	ldw	x, #0x50c6
      008DA8 F6               [ 1]   93 	ld	a, (x)
      008DA9 AE 50 C6         [ 2]   94 	ldw	x, #0x50c6
      008DAC F7               [ 1]   95 	ld	(x), a
                                     96 ;	lib/clk.c: 33: CLK_SYSCLKConfig(CLK_PRESCALER_HSIDIV1);
      008DAD 4B 00            [ 1]   97 	push	#0x00
      008DAF CD 8D E5         [ 4]   98 	call	_CLK_SYSCLKConfig
      008DB2 84               [ 1]   99 	pop	a
      008DB3 81               [ 4]  100 	ret
                                    101 ;	lib/clk.c: 36: void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
                                    102 ;	-----------------------------------------
                                    103 ;	 function CLK_PeripheralClockConfig
                                    104 ;	-----------------------------------------
      008DB4                        105 _CLK_PeripheralClockConfig:
      008DB4 88               [ 1]  106 	push	a
                                    107 ;	lib/clk.c: 42: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      008DB5 7B 04            [ 1]  108 	ld	a, (0x04, sp)
      008DB7 A4 0F            [ 1]  109 	and	a, #0x0f
      008DB9 88               [ 1]  110 	push	a
      008DBA A6 01            [ 1]  111 	ld	a, #0x01
      008DBC 6B 02            [ 1]  112 	ld	(0x02, sp), a
      008DBE 84               [ 1]  113 	pop	a
      008DBF 4D               [ 1]  114 	tnz	a
      008DC0 27 05            [ 1]  115 	jreq	00111$
      008DC2                        116 00110$:
      008DC2 08 01            [ 1]  117 	sll	(0x01, sp)
      008DC4 4A               [ 1]  118 	dec	a
      008DC5 26 FB            [ 1]  119 	jrne	00110$
      008DC7                        120 00111$:
                                    121 ;	lib/clk.c: 40: if(((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
      008DC7 7B 04            [ 1]  122 	ld	a, (0x04, sp)
      008DC9 A5 10            [ 1]  123 	bcp	a, #0x10
      008DCB 26 0C            [ 1]  124 	jrne	00102$
                                    125 ;	lib/clk.c: 42: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      008DCD AE 50 C7         [ 2]  126 	ldw	x, #0x50c7
      008DD0 F6               [ 1]  127 	ld	a, (x)
      008DD1 1A 01            [ 1]  128 	or	a, (0x01, sp)
      008DD3 AE 50 C7         [ 2]  129 	ldw	x, #0x50c7
      008DD6 F7               [ 1]  130 	ld	(x), a
      008DD7 20 0A            [ 2]  131 	jra	00104$
      008DD9                        132 00102$:
                                    133 ;	lib/clk.c: 45: CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      008DD9 AE 50 CA         [ 2]  134 	ldw	x, #0x50ca
      008DDC F6               [ 1]  135 	ld	a, (x)
      008DDD 1A 01            [ 1]  136 	or	a, (0x01, sp)
      008DDF AE 50 CA         [ 2]  137 	ldw	x, #0x50ca
      008DE2 F7               [ 1]  138 	ld	(x), a
      008DE3                        139 00104$:
      008DE3 84               [ 1]  140 	pop	a
      008DE4 81               [ 4]  141 	ret
                                    142 ;	lib/clk.c: 48: void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
                                    143 ;	-----------------------------------------
                                    144 ;	 function CLK_SYSCLKConfig
                                    145 ;	-----------------------------------------
      008DE5                        146 _CLK_SYSCLKConfig:
      008DE5 89               [ 2]  147 	pushw	x
                                    148 ;	lib/clk.c: 51: if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
      008DE6 0D 05            [ 1]  149 	tnz	(0x05, sp)
      008DE8 2B 19            [ 1]  150 	jrmi	00102$
                                    151 ;	lib/clk.c: 53: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
      008DEA AE 50 C6         [ 2]  152 	ldw	x, #0x50c6
      008DED F6               [ 1]  153 	ld	a, (x)
      008DEE A4 E7            [ 1]  154 	and	a, #0xe7
      008DF0 F7               [ 1]  155 	ld	(x), a
                                    156 ;	lib/clk.c: 54: CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
      008DF1 AE 50 C6         [ 2]  157 	ldw	x, #0x50c6
      008DF4 F6               [ 1]  158 	ld	a, (x)
      008DF5 6B 01            [ 1]  159 	ld	(0x01, sp), a
      008DF7 7B 05            [ 1]  160 	ld	a, (0x05, sp)
      008DF9 A4 18            [ 1]  161 	and	a, #0x18
      008DFB 1A 01            [ 1]  162 	or	a, (0x01, sp)
      008DFD AE 50 C6         [ 2]  163 	ldw	x, #0x50c6
      008E00 F7               [ 1]  164 	ld	(x), a
      008E01 20 17            [ 2]  165 	jra	00104$
      008E03                        166 00102$:
                                    167 ;	lib/clk.c: 58: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
      008E03 AE 50 C6         [ 2]  168 	ldw	x, #0x50c6
      008E06 F6               [ 1]  169 	ld	a, (x)
      008E07 A4 F8            [ 1]  170 	and	a, #0xf8
      008E09 F7               [ 1]  171 	ld	(x), a
                                    172 ;	lib/clk.c: 59: CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
      008E0A AE 50 C6         [ 2]  173 	ldw	x, #0x50c6
      008E0D F6               [ 1]  174 	ld	a, (x)
      008E0E 6B 02            [ 1]  175 	ld	(0x02, sp), a
      008E10 7B 05            [ 1]  176 	ld	a, (0x05, sp)
      008E12 A4 07            [ 1]  177 	and	a, #0x07
      008E14 1A 02            [ 1]  178 	or	a, (0x02, sp)
      008E16 AE 50 C6         [ 2]  179 	ldw	x, #0x50c6
      008E19 F7               [ 1]  180 	ld	(x), a
      008E1A                        181 00104$:
      008E1A 85               [ 2]  182 	popw	x
      008E1B 81               [ 4]  183 	ret
                                    184 ;	lib/clk.c: 63: uint32_t CLK_GetClockFreq(void)
                                    185 ;	-----------------------------------------
                                    186 ;	 function CLK_GetClockFreq
                                    187 ;	-----------------------------------------
      008E1C                        188 _CLK_GetClockFreq:
      008E1C 52 07            [ 2]  189 	sub	sp, #7
                                    190 ;	lib/clk.c: 69: clocksource = (CLK_Source_TypeDef)CLK->CMSR; 
      008E1E AE 50 C3         [ 2]  191 	ldw	x, #0x50c3
      008E21 F6               [ 1]  192 	ld	a, (x)
      008E22 6B 01            [ 1]  193 	ld	(0x01, sp), a
                                    194 ;	lib/clk.c: 70: if (clocksource == CLK_SOURCE_HSI)
      008E24 7B 01            [ 1]  195 	ld	a, (0x01, sp)
      008E26 A1 E1            [ 1]  196 	cp	a, #0xe1
      008E28 26 2C            [ 1]  197 	jrne	00105$
                                    198 ;	lib/clk.c: 72: tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
      008E2A AE 50 C6         [ 2]  199 	ldw	x, #0x50c6
      008E2D F6               [ 1]  200 	ld	a, (x)
      008E2E A4 18            [ 1]  201 	and	a, #0x18
                                    202 ;	lib/clk.c: 73: tmp = (uint8_t)(tmp >> 3);
      008E30 44               [ 1]  203 	srl	a
      008E31 44               [ 1]  204 	srl	a
      008E32 44               [ 1]  205 	srl	a
                                    206 ;	lib/clk.c: 74: presc = HSIDivFactor[tmp];
      008E33 AE 8E 75         [ 2]  207 	ldw	x, #_HSIDivFactor+0
      008E36 1F 06            [ 2]  208 	ldw	(0x06, sp), x
      008E38 5F               [ 1]  209 	clrw	x
      008E39 97               [ 1]  210 	ld	xl, a
      008E3A 72 FB 06         [ 2]  211 	addw	x, (0x06, sp)
      008E3D F6               [ 1]  212 	ld	a, (x)
                                    213 ;	lib/clk.c: 75: clockfrequency = HSI_VALUE / presc;
      008E3E 5F               [ 1]  214 	clrw	x
      008E3F 97               [ 1]  215 	ld	xl, a
      008E40 90 5F            [ 1]  216 	clrw	y
      008E42 89               [ 2]  217 	pushw	x
      008E43 90 89            [ 2]  218 	pushw	y
      008E45 4B 00            [ 1]  219 	push	#0x00
      008E47 4B 24            [ 1]  220 	push	#0x24
      008E49 4B F4            [ 1]  221 	push	#0xf4
      008E4B 4B 00            [ 1]  222 	push	#0x00
      008E4D CD 95 05         [ 4]  223 	call	__divulong
      008E50 5B 08            [ 2]  224 	addw	sp, #8
      008E52 1F 04            [ 2]  225 	ldw	(0x04, sp), x
      008E54 20 1A            [ 2]  226 	jra	00106$
      008E56                        227 00105$:
                                    228 ;	lib/clk.c: 77: else if ( clocksource == CLK_SOURCE_LSI)
      008E56 7B 01            [ 1]  229 	ld	a, (0x01, sp)
      008E58 A1 D2            [ 1]  230 	cp	a, #0xd2
      008E5A 26 0B            [ 1]  231 	jrne	00102$
                                    232 ;	lib/clk.c: 79: clockfrequency = LSI_VALUE;
      008E5C AE F4 00         [ 2]  233 	ldw	x, #0xf400
      008E5F 1F 04            [ 2]  234 	ldw	(0x04, sp), x
      008E61 90 AE 00 01      [ 2]  235 	ldw	y, #0x0001
      008E65 20 09            [ 2]  236 	jra	00106$
      008E67                        237 00102$:
                                    238 ;	lib/clk.c: 83: clockfrequency = HSE_VALUE;
      008E67 AE 24 00         [ 2]  239 	ldw	x, #0x2400
      008E6A 1F 04            [ 2]  240 	ldw	(0x04, sp), x
      008E6C 90 AE 00 F4      [ 2]  241 	ldw	y, #0x00f4
      008E70                        242 00106$:
                                    243 ;	lib/clk.c: 85: return((uint32_t)clockfrequency);
      008E70 1E 04            [ 2]  244 	ldw	x, (0x04, sp)
      008E72 5B 07            [ 2]  245 	addw	sp, #7
      008E74 81               [ 4]  246 	ret
                                    247 	.area CODE
      008E75                        248 _HSIDivFactor:
      008E75 01                     249 	.db #0x01	; 1
      008E76 02                     250 	.db #0x02	; 2
      008E77 04                     251 	.db #0x04	; 4
      008E78 08                     252 	.db #0x08	; 8
                                    253 	.area INITIALIZER
                                    254 	.area CABS (ABS)
