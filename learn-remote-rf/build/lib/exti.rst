                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.6.0 #9615 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module exti
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _EXTI_SetExtIntSensitivity
                                     12 ;--------------------------------------------------------
                                     13 ; ram data
                                     14 ;--------------------------------------------------------
                                     15 	.area DATA
                                     16 ;--------------------------------------------------------
                                     17 ; ram data
                                     18 ;--------------------------------------------------------
                                     19 	.area INITIALIZED
                                     20 ;--------------------------------------------------------
                                     21 ; absolute external ram data
                                     22 ;--------------------------------------------------------
                                     23 	.area DABS (ABS)
                                     24 ;--------------------------------------------------------
                                     25 ; global & static initialisations
                                     26 ;--------------------------------------------------------
                                     27 	.area HOME
                                     28 	.area GSINIT
                                     29 	.area GSFINAL
                                     30 	.area GSINIT
                                     31 ;--------------------------------------------------------
                                     32 ; Home
                                     33 ;--------------------------------------------------------
                                     34 	.area HOME
                                     35 	.area HOME
                                     36 ;--------------------------------------------------------
                                     37 ; code
                                     38 ;--------------------------------------------------------
                                     39 	.area CODE
                                     40 ;	lib/exti.c: 4: void EXTI_SetExtIntSensitivity(EXTI_Port_TypeDef Port, EXTI_Sensitivity_TypeDef SensitivityValue)
                                     41 ;	-----------------------------------------
                                     42 ;	 function EXTI_SetExtIntSensitivity
                                     43 ;	-----------------------------------------
      008E79                         44 _EXTI_SetExtIntSensitivity:
      008E79 52 03            [ 2]   45 	sub	sp, #3
                                     46 ;	lib/exti.c: 7: switch (Port)
      008E7B 7B 06            [ 1]   47 	ld	a, (0x06, sp)
      008E7D A1 04            [ 1]   48 	cp	a, #0x04
      008E7F 23 03            [ 2]   49 	jrule	00114$
      008E81 CC 8F 0A         [ 2]   50 	jp	00108$
      008E84                         51 00114$:
      008E84 5F               [ 1]   52 	clrw	x
      008E85 7B 06            [ 1]   53 	ld	a, (0x06, sp)
      008E87 97               [ 1]   54 	ld	xl, a
      008E88 58               [ 2]   55 	sllw	x
      008E89 DE 8E 8D         [ 2]   56 	ldw	x, (#00115$, x)
      008E8C FC               [ 2]   57 	jp	(x)
      008E8D                         58 00115$:
      008E8D 8E 97                   59 	.dw	#00101$
      008E8F 8E AA                   60 	.dw	#00102$
      008E91 8E C3                   61 	.dw	#00103$
      008E93 8E DD                   62 	.dw	#00104$
      008E95 8E F9                   63 	.dw	#00105$
                                     64 ;	lib/exti.c: 9: case EXTI_PORT_GPIOA:
      008E97                         65 00101$:
                                     66 ;	lib/exti.c: 10: EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PAIS);
      008E97 AE 50 A0         [ 2]   67 	ldw	x, #0x50a0
      008E9A F6               [ 1]   68 	ld	a, (x)
      008E9B A4 FC            [ 1]   69 	and	a, #0xfc
      008E9D F7               [ 1]   70 	ld	(x), a
                                     71 ;	lib/exti.c: 11: EXTI->CR1 |= (uint8_t)(SensitivityValue);
      008E9E AE 50 A0         [ 2]   72 	ldw	x, #0x50a0
      008EA1 F6               [ 1]   73 	ld	a, (x)
      008EA2 1A 07            [ 1]   74 	or	a, (0x07, sp)
      008EA4 AE 50 A0         [ 2]   75 	ldw	x, #0x50a0
      008EA7 F7               [ 1]   76 	ld	(x), a
                                     77 ;	lib/exti.c: 12: break;
      008EA8 20 60            [ 2]   78 	jra	00108$
                                     79 ;	lib/exti.c: 13: case EXTI_PORT_GPIOB:
      008EAA                         80 00102$:
                                     81 ;	lib/exti.c: 14: EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PBIS);
      008EAA AE 50 A0         [ 2]   82 	ldw	x, #0x50a0
      008EAD F6               [ 1]   83 	ld	a, (x)
      008EAE A4 F3            [ 1]   84 	and	a, #0xf3
      008EB0 F7               [ 1]   85 	ld	(x), a
                                     86 ;	lib/exti.c: 15: EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 2);
      008EB1 AE 50 A0         [ 2]   87 	ldw	x, #0x50a0
      008EB4 F6               [ 1]   88 	ld	a, (x)
      008EB5 6B 03            [ 1]   89 	ld	(0x03, sp), a
      008EB7 7B 07            [ 1]   90 	ld	a, (0x07, sp)
      008EB9 48               [ 1]   91 	sll	a
      008EBA 48               [ 1]   92 	sll	a
      008EBB 1A 03            [ 1]   93 	or	a, (0x03, sp)
      008EBD AE 50 A0         [ 2]   94 	ldw	x, #0x50a0
      008EC0 F7               [ 1]   95 	ld	(x), a
                                     96 ;	lib/exti.c: 16: break;
      008EC1 20 47            [ 2]   97 	jra	00108$
                                     98 ;	lib/exti.c: 17: case EXTI_PORT_GPIOC:
      008EC3                         99 00103$:
                                    100 ;	lib/exti.c: 18: EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PCIS);
      008EC3 AE 50 A0         [ 2]  101 	ldw	x, #0x50a0
      008EC6 F6               [ 1]  102 	ld	a, (x)
      008EC7 A4 CF            [ 1]  103 	and	a, #0xcf
      008EC9 F7               [ 1]  104 	ld	(x), a
                                    105 ;	lib/exti.c: 19: EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 4);
      008ECA AE 50 A0         [ 2]  106 	ldw	x, #0x50a0
      008ECD F6               [ 1]  107 	ld	a, (x)
      008ECE 6B 02            [ 1]  108 	ld	(0x02, sp), a
      008ED0 7B 07            [ 1]  109 	ld	a, (0x07, sp)
      008ED2 4E               [ 1]  110 	swap	a
      008ED3 A4 F0            [ 1]  111 	and	a, #0xf0
      008ED5 1A 02            [ 1]  112 	or	a, (0x02, sp)
      008ED7 AE 50 A0         [ 2]  113 	ldw	x, #0x50a0
      008EDA F7               [ 1]  114 	ld	(x), a
                                    115 ;	lib/exti.c: 20: break;
      008EDB 20 2D            [ 2]  116 	jra	00108$
                                    117 ;	lib/exti.c: 21: case EXTI_PORT_GPIOD:
      008EDD                        118 00104$:
                                    119 ;	lib/exti.c: 22: EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PDIS);
      008EDD AE 50 A0         [ 2]  120 	ldw	x, #0x50a0
      008EE0 F6               [ 1]  121 	ld	a, (x)
      008EE1 A4 3F            [ 1]  122 	and	a, #0x3f
      008EE3 F7               [ 1]  123 	ld	(x), a
                                    124 ;	lib/exti.c: 23: EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 6);
      008EE4 AE 50 A0         [ 2]  125 	ldw	x, #0x50a0
      008EE7 F6               [ 1]  126 	ld	a, (x)
      008EE8 6B 01            [ 1]  127 	ld	(0x01, sp), a
      008EEA 7B 07            [ 1]  128 	ld	a, (0x07, sp)
      008EEC 4E               [ 1]  129 	swap	a
      008EED A4 F0            [ 1]  130 	and	a, #0xf0
      008EEF 48               [ 1]  131 	sll	a
      008EF0 48               [ 1]  132 	sll	a
      008EF1 1A 01            [ 1]  133 	or	a, (0x01, sp)
      008EF3 AE 50 A0         [ 2]  134 	ldw	x, #0x50a0
      008EF6 F7               [ 1]  135 	ld	(x), a
                                    136 ;	lib/exti.c: 24: break;
      008EF7 20 11            [ 2]  137 	jra	00108$
                                    138 ;	lib/exti.c: 25: case EXTI_PORT_GPIOE:
      008EF9                        139 00105$:
                                    140 ;	lib/exti.c: 26: EXTI->CR2 &= (uint8_t)(~EXTI_CR2_PEIS);
      008EF9 AE 50 A1         [ 2]  141 	ldw	x, #0x50a1
      008EFC F6               [ 1]  142 	ld	a, (x)
      008EFD A4 FC            [ 1]  143 	and	a, #0xfc
      008EFF F7               [ 1]  144 	ld	(x), a
                                    145 ;	lib/exti.c: 27: EXTI->CR2 |= (uint8_t)(SensitivityValue);
      008F00 AE 50 A1         [ 2]  146 	ldw	x, #0x50a1
      008F03 F6               [ 1]  147 	ld	a, (x)
      008F04 1A 07            [ 1]  148 	or	a, (0x07, sp)
      008F06 AE 50 A1         [ 2]  149 	ldw	x, #0x50a1
      008F09 F7               [ 1]  150 	ld	(x), a
                                    151 ;	lib/exti.c: 31: }
      008F0A                        152 00108$:
      008F0A 5B 03            [ 2]  153 	addw	sp, #3
      008F0C 81               [ 4]  154 	ret
                                    155 	.area CODE
                                    156 	.area INITIALIZER
                                    157 	.area CABS (ABS)
