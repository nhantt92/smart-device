                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.6.0 #9615 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module tim4
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _TIM4_DeInit
                                     12 	.globl _TIM4_TimeBaseInit
                                     13 	.globl _TIM4_Cmd
                                     14 	.globl _TIM4_ITConfig
                                     15 	.globl _TIM4_GetCounter
                                     16 	.globl _TIM4_GetFlagStatus
                                     17 	.globl _TIM4_ClearFlag
                                     18 	.globl _TIM4_ClearITPendingBit
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
                                     47 ;	lib/tim4.c: 3: void TIM4_DeInit(void)
                                     48 ;	-----------------------------------------
                                     49 ;	 function TIM4_DeInit
                                     50 ;	-----------------------------------------
      009149                         51 _TIM4_DeInit:
                                     52 ;	lib/tim4.c: 5: TIM4->CR1 = TIM4_CR1_RESET_VALUE;
      009149 35 00 53 40      [ 1]   53 	mov	0x5340+0, #0x00
                                     54 ;	lib/tim4.c: 6: TIM4->IER = TIM4_IER_RESET_VALUE;
      00914D 35 00 53 43      [ 1]   55 	mov	0x5343+0, #0x00
                                     56 ;	lib/tim4.c: 7: TIM4->CNTR = TIM4_CNTR_RESET_VALUE;
      009151 35 00 53 46      [ 1]   57 	mov	0x5346+0, #0x00
                                     58 ;	lib/tim4.c: 8: TIM4->PSCR = TIM4_PSCR_RESET_VALUE;
      009155 35 00 53 47      [ 1]   59 	mov	0x5347+0, #0x00
                                     60 ;	lib/tim4.c: 9: TIM4->ARR = TIM4_ARR_RESET_VALUE;
      009159 35 FF 53 48      [ 1]   61 	mov	0x5348+0, #0xff
                                     62 ;	lib/tim4.c: 10: TIM4->SR1 = TIM4_SR1_RESET_VALUE;
      00915D 35 00 53 44      [ 1]   63 	mov	0x5344+0, #0x00
      009161 81               [ 4]   64 	ret
                                     65 ;	lib/tim4.c: 13: void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler, uint8_t TIM4_Period)
                                     66 ;	-----------------------------------------
                                     67 ;	 function TIM4_TimeBaseInit
                                     68 ;	-----------------------------------------
      009162                         69 _TIM4_TimeBaseInit:
                                     70 ;	lib/tim4.c: 16: TIM4->PSCR = (uint8_t)(TIM4_Prescaler);
      009162 AE 53 47         [ 2]   71 	ldw	x, #0x5347
      009165 7B 03            [ 1]   72 	ld	a, (0x03, sp)
      009167 F7               [ 1]   73 	ld	(x), a
                                     74 ;	lib/tim4.c: 18: TIM4->ARR = (uint8_t)(TIM4_Period);
      009168 AE 53 48         [ 2]   75 	ldw	x, #0x5348
      00916B 7B 04            [ 1]   76 	ld	a, (0x04, sp)
      00916D F7               [ 1]   77 	ld	(x), a
      00916E 81               [ 4]   78 	ret
                                     79 ;	lib/tim4.c: 21: void TIM4_Cmd(FunctionalState NewState)
                                     80 ;	-----------------------------------------
                                     81 ;	 function TIM4_Cmd
                                     82 ;	-----------------------------------------
      00916F                         83 _TIM4_Cmd:
                                     84 ;	lib/tim4.c: 24: TIM4->CR1 |= TIM4_CR1_CEN;
      00916F 72 10 53 40      [ 1]   85 	bset	0x5340, #0
      009173 81               [ 4]   86 	ret
                                     87 ;	lib/tim4.c: 27: void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, FunctionalState NewState)
                                     88 ;	-----------------------------------------
                                     89 ;	 function TIM4_ITConfig
                                     90 ;	-----------------------------------------
      009174                         91 _TIM4_ITConfig:
                                     92 ;	lib/tim4.c: 31: TIM4->IER |= (uint8_t)TIM4_IT;
      009174 AE 53 43         [ 2]   93 	ldw	x, #0x5343
      009177 F6               [ 1]   94 	ld	a, (x)
      009178 1A 03            [ 1]   95 	or	a, (0x03, sp)
      00917A AE 53 43         [ 2]   96 	ldw	x, #0x5343
      00917D F7               [ 1]   97 	ld	(x), a
      00917E 81               [ 4]   98 	ret
                                     99 ;	lib/tim4.c: 34: uint8_t TIM4_GetCounter(void)
                                    100 ;	-----------------------------------------
                                    101 ;	 function TIM4_GetCounter
                                    102 ;	-----------------------------------------
      00917F                        103 _TIM4_GetCounter:
                                    104 ;	lib/tim4.c: 37: return (uint8_t)(TIM4->CNTR);
      00917F AE 53 46         [ 2]  105 	ldw	x, #0x5346
      009182 F6               [ 1]  106 	ld	a, (x)
      009183 81               [ 4]  107 	ret
                                    108 ;	lib/tim4.c: 40: FlagStatus TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG)
                                    109 ;	-----------------------------------------
                                    110 ;	 function TIM4_GetFlagStatus
                                    111 ;	-----------------------------------------
      009184                        112 _TIM4_GetFlagStatus:
                                    113 ;	lib/tim4.c: 43: if ((TIM4->SR1 & (uint8_t)TIM4_FLAG)  != 0)
      009184 AE 53 44         [ 2]  114 	ldw	x, #0x5344
      009187 F6               [ 1]  115 	ld	a, (x)
      009188 14 03            [ 1]  116 	and	a, (0x03, sp)
      00918A 4D               [ 1]  117 	tnz	a
      00918B 27 03            [ 1]  118 	jreq	00102$
                                    119 ;	lib/tim4.c: 45: bitstatus = SET;
      00918D A6 01            [ 1]  120 	ld	a, #0x01
      00918F 81               [ 4]  121 	ret
      009190                        122 00102$:
                                    123 ;	lib/tim4.c: 49: bitstatus = RESET;
      009190 4F               [ 1]  124 	clr	a
                                    125 ;	lib/tim4.c: 51: return ((FlagStatus)bitstatus);
      009191 81               [ 4]  126 	ret
                                    127 ;	lib/tim4.c: 54: void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
                                    128 ;	-----------------------------------------
                                    129 ;	 function TIM4_ClearFlag
                                    130 ;	-----------------------------------------
      009192                        131 _TIM4_ClearFlag:
                                    132 ;	lib/tim4.c: 57: TIM4->SR1 = (uint8_t)(~TIM4_FLAG);
      009192 7B 03            [ 1]  133 	ld	a, (0x03, sp)
      009194 43               [ 1]  134 	cpl	a
      009195 AE 53 44         [ 2]  135 	ldw	x, #0x5344
      009198 F7               [ 1]  136 	ld	(x), a
      009199 81               [ 4]  137 	ret
                                    138 ;	lib/tim4.c: 60: void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
                                    139 ;	-----------------------------------------
                                    140 ;	 function TIM4_ClearITPendingBit
                                    141 ;	-----------------------------------------
      00919A                        142 _TIM4_ClearITPendingBit:
                                    143 ;	lib/tim4.c: 63: TIM4->SR1 = (uint8_t)(~TIM4_IT);
      00919A 7B 03            [ 1]  144 	ld	a, (0x03, sp)
      00919C 43               [ 1]  145 	cpl	a
      00919D AE 53 44         [ 2]  146 	ldw	x, #0x5344
      0091A0 F7               [ 1]  147 	ld	(x), a
      0091A1 81               [ 4]  148 	ret
                                    149 	.area CODE
                                    150 	.area INITIALIZER
                                    151 	.area CABS (ABS)
