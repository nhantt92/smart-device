                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.6.0 #9615 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module timerTick
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _TIM4_ClearFlag
                                     12 	.globl _TIM4_GetCounter
                                     13 	.globl _TIM4_ITConfig
                                     14 	.globl _TIM4_Cmd
                                     15 	.globl _TIM4_TimeBaseInit
                                     16 	.globl _TIM4_DeInit
                                     17 	.globl _CLK_PeripheralClockConfig
                                     18 	.globl _timeTickUs
                                     19 	.globl _timeTickMs
                                     20 	.globl _timeBack
                                     21 	.globl _timeGet
                                     22 	.globl _TIMER_Init
                                     23 	.globl _TIMER_Inc
                                     24 	.globl _TIMER_InitTime
                                     25 	.globl _TIMER_CheckTimeUS
                                     26 	.globl _TIMER_CheckTimeMS
                                     27 ;--------------------------------------------------------
                                     28 ; ram data
                                     29 ;--------------------------------------------------------
                                     30 	.area DATA
      0000DD                         31 _timeGet::
      0000DD                         32 	.ds 2
      0000DF                         33 _timeBack::
      0000DF                         34 	.ds 2
      0000E1                         35 _timeTickMs::
      0000E1                         36 	.ds 4
      0000E5                         37 _timeTickUs::
      0000E5                         38 	.ds 2
                                     39 ;--------------------------------------------------------
                                     40 ; ram data
                                     41 ;--------------------------------------------------------
                                     42 	.area INITIALIZED
                                     43 ;--------------------------------------------------------
                                     44 ; absolute external ram data
                                     45 ;--------------------------------------------------------
                                     46 	.area DABS (ABS)
                                     47 ;--------------------------------------------------------
                                     48 ; global & static initialisations
                                     49 ;--------------------------------------------------------
                                     50 	.area HOME
                                     51 	.area GSINIT
                                     52 	.area GSFINAL
                                     53 	.area GSINIT
                                     54 ;--------------------------------------------------------
                                     55 ; Home
                                     56 ;--------------------------------------------------------
                                     57 	.area HOME
                                     58 	.area HOME
                                     59 ;--------------------------------------------------------
                                     60 ; code
                                     61 ;--------------------------------------------------------
                                     62 	.area CODE
                                     63 ;	user/timerTick.c: 9: void TIMER_Init(void)
                                     64 ;	-----------------------------------------
                                     65 ;	 function TIMER_Init
                                     66 ;	-----------------------------------------
      008C2F                         67 _TIMER_Init:
                                     68 ;	user/timerTick.c: 11: CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4 , ENABLE); 
      008C2F 4B 01            [ 1]   69 	push	#0x01
      008C31 4B 04            [ 1]   70 	push	#0x04
      008C33 CD 8D B4         [ 4]   71 	call	_CLK_PeripheralClockConfig
      008C36 85               [ 2]   72 	popw	x
                                     73 ;	user/timerTick.c: 12: TIM4_DeInit(); 
      008C37 CD 91 49         [ 4]   74 	call	_TIM4_DeInit
                                     75 ;	user/timerTick.c: 14: TIM4_TimeBaseInit(TIM4_PRESCALER_16, CYCLE_US);
      008C3A 4B C8            [ 1]   76 	push	#0xc8
      008C3C 4B 04            [ 1]   77 	push	#0x04
      008C3E CD 91 62         [ 4]   78 	call	_TIM4_TimeBaseInit
      008C41 85               [ 2]   79 	popw	x
                                     80 ;	user/timerTick.c: 15: TIM4_ClearFlag(TIM4_FLAG_UPDATE); 
      008C42 4B 01            [ 1]   81 	push	#0x01
      008C44 CD 91 92         [ 4]   82 	call	_TIM4_ClearFlag
      008C47 84               [ 1]   83 	pop	a
                                     84 ;	user/timerTick.c: 16: TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
      008C48 4B 01            [ 1]   85 	push	#0x01
      008C4A 4B 01            [ 1]   86 	push	#0x01
      008C4C CD 91 74         [ 4]   87 	call	_TIM4_ITConfig
      008C4F 85               [ 2]   88 	popw	x
                                     89 ;	user/timerTick.c: 17: TIM4_Cmd(ENABLE);    // Enable TIM4 
      008C50 4B 01            [ 1]   90 	push	#0x01
      008C52 CD 91 6F         [ 4]   91 	call	_TIM4_Cmd
      008C55 84               [ 1]   92 	pop	a
                                     93 ;	user/timerTick.c: 18: timeTickMs = 0;
      008C56 5F               [ 1]   94 	clrw	x
      008C57 CF 00 E3         [ 2]   95 	ldw	_timeTickMs+2, x
      008C5A CF 00 E1         [ 2]   96 	ldw	_timeTickMs+0, x
                                     97 ;	user/timerTick.c: 19: timeTickUs = 0;
      008C5D 5F               [ 1]   98 	clrw	x
      008C5E CF 00 E5         [ 2]   99 	ldw	_timeTickUs+0, x
      008C61 81               [ 4]  100 	ret
                                    101 ;	user/timerTick.c: 22: void TIMER_Inc(void)
                                    102 ;	-----------------------------------------
                                    103 ;	 function TIMER_Inc
                                    104 ;	-----------------------------------------
      008C62                        105 _TIMER_Inc:
                                    106 ;	user/timerTick.c: 24: timeTickUs++;
      008C62 CE 00 E5         [ 2]  107 	ldw	x, _timeTickUs+0
      008C65 5C               [ 2]  108 	incw	x
                                    109 ;	user/timerTick.c: 25: if(timeTickUs%5 == 0){
      008C66 CF 00 E5         [ 2]  110 	ldw	_timeTickUs+0, x
      008C69 90 AE 00 05      [ 2]  111 	ldw	y, #0x0005
      008C6D 65               [ 2]  112 	divw	x, y
      008C6E 90 5D            [ 2]  113 	tnzw	y
      008C70 27 01            [ 1]  114 	jreq	00109$
      008C72 81               [ 4]  115 	ret
      008C73                        116 00109$:
                                    117 ;	user/timerTick.c: 26: timeTickMs++;
      008C73 CE 00 E3         [ 2]  118 	ldw	x, _timeTickMs+2
      008C76 1C 00 01         [ 2]  119 	addw	x, #0x0001
      008C79 C6 00 E2         [ 1]  120 	ld	a, _timeTickMs+1
      008C7C A9 00            [ 1]  121 	adc	a, #0x00
      008C7E 90 97            [ 1]  122 	ld	yl, a
      008C80 C6 00 E1         [ 1]  123 	ld	a, _timeTickMs+0
      008C83 A9 00            [ 1]  124 	adc	a, #0x00
      008C85 90 95            [ 1]  125 	ld	yh, a
      008C87 CF 00 E3         [ 2]  126 	ldw	_timeTickMs+2, x
      008C8A 90 CF 00 E1      [ 2]  127 	ldw	_timeTickMs+0, y
      008C8E 81               [ 4]  128 	ret
                                    129 ;	user/timerTick.c: 30: void TIMER_InitTime(TIME *pTime)
                                    130 ;	-----------------------------------------
                                    131 ;	 function TIMER_InitTime
                                    132 ;	-----------------------------------------
      008C8F                        133 _TIMER_InitTime:
                                    134 ;	user/timerTick.c: 32: pTime->timeMS = timeTickMs;
      008C8F 1E 03            [ 2]  135 	ldw	x, (0x03, sp)
      008C91 5C               [ 2]  136 	incw	x
      008C92 5C               [ 2]  137 	incw	x
      008C93 90 CE 00 E3      [ 2]  138 	ldw	y, _timeTickMs+2
      008C97 EF 02            [ 2]  139 	ldw	(0x2, x), y
      008C99 90 CE 00 E1      [ 2]  140 	ldw	y, _timeTickMs+0
      008C9D FF               [ 2]  141 	ldw	(x), y
      008C9E 81               [ 4]  142 	ret
                                    143 ;	user/timerTick.c: 35: uint8_t TIMER_CheckTimeUS(TIME *pTime, uint16_t time)
                                    144 ;	-----------------------------------------
                                    145 ;	 function TIMER_CheckTimeUS
                                    146 ;	-----------------------------------------
      008C9F                        147 _TIMER_CheckTimeUS:
      008C9F 52 04            [ 2]  148 	sub	sp, #4
                                    149 ;	user/timerTick.c: 37: timeGet = TIM4_GetCounter();
      008CA1 CD 91 7F         [ 4]  150 	call	_TIM4_GetCounter
      008CA4 5F               [ 1]  151 	clrw	x
      008CA5 97               [ 1]  152 	ld	xl, a
      008CA6 CF 00 DD         [ 2]  153 	ldw	_timeGet+0, x
                                    154 ;	user/timerTick.c: 38: if(((timeGet > pTime->timeUS)&&((timeGet - pTime->timeUS) >= time))||((timeGet < pTime->timeUS)&&(((CYCLE_US -  pTime->timeUS) + timeGet + 1) >= time))){
      008CA9 16 07            [ 2]  155 	ldw	y, (0x07, sp)
      008CAB 17 03            [ 2]  156 	ldw	(0x03, sp), y
      008CAD 1E 03            [ 2]  157 	ldw	x, (0x03, sp)
      008CAF FE               [ 2]  158 	ldw	x, (x)
      008CB0 1F 01            [ 2]  159 	ldw	(0x01, sp), x
      008CB2 1E 01            [ 2]  160 	ldw	x, (0x01, sp)
      008CB4 C3 00 DD         [ 2]  161 	cpw	x, _timeGet+0
      008CB7 24 0A            [ 1]  162 	jrnc	00105$
      008CB9 CE 00 DD         [ 2]  163 	ldw	x, _timeGet+0
      008CBC 72 F0 01         [ 2]  164 	subw	x, (0x01, sp)
      008CBF 13 09            [ 2]  165 	cpw	x, (0x09, sp)
      008CC1 24 14            [ 1]  166 	jrnc	00101$
      008CC3                        167 00105$:
      008CC3 1E 01            [ 2]  168 	ldw	x, (0x01, sp)
      008CC5 C3 00 DD         [ 2]  169 	cpw	x, _timeGet+0
      008CC8 23 17            [ 2]  170 	jrule	00102$
      008CCA CE 00 DD         [ 2]  171 	ldw	x, _timeGet+0
      008CCD 1C 00 C9         [ 2]  172 	addw	x, #0x00c9
      008CD0 72 F0 01         [ 2]  173 	subw	x, (0x01, sp)
      008CD3 13 09            [ 2]  174 	cpw	x, (0x09, sp)
      008CD5 25 0A            [ 1]  175 	jrc	00102$
      008CD7                        176 00101$:
                                    177 ;	user/timerTick.c: 39: pTime->timeUS = timeGet;
      008CD7 1E 03            [ 2]  178 	ldw	x, (0x03, sp)
      008CD9 90 CE 00 DD      [ 2]  179 	ldw	y, _timeGet+0
      008CDD FF               [ 2]  180 	ldw	(x), y
                                    181 ;	user/timerTick.c: 40: return 0;
      008CDE 4F               [ 1]  182 	clr	a
      008CDF 20 02            [ 2]  183 	jra	00106$
      008CE1                        184 00102$:
                                    185 ;	user/timerTick.c: 42: return 1;
      008CE1 A6 01            [ 1]  186 	ld	a, #0x01
      008CE3                        187 00106$:
      008CE3 5B 04            [ 2]  188 	addw	sp, #4
      008CE5 81               [ 4]  189 	ret
                                    190 ;	user/timerTick.c: 45: uint8_t TIMER_CheckTimeMS(TIME *pTime, uint32_t time)
                                    191 ;	-----------------------------------------
                                    192 ;	 function TIMER_CheckTimeMS
                                    193 ;	-----------------------------------------
      008CE6                        194 _TIMER_CheckTimeMS:
      008CE6 52 0B            [ 2]  195 	sub	sp, #11
                                    196 ;	user/timerTick.c: 47: if(((timeTickMs > pTime->timeMS)&&((timeTickMs - pTime->timeMS) >= time))||((timeTickMs < pTime->timeMS)&&(((CYCLE_MS -  pTime->timeMS) + timeTickMs + 1) >= time))){
      008CE8 1E 0E            [ 2]  197 	ldw	x, (0x0e, sp)
      008CEA 5C               [ 2]  198 	incw	x
      008CEB 5C               [ 2]  199 	incw	x
      008CEC 1F 0A            [ 2]  200 	ldw	(0x0a, sp), x
      008CEE 1E 0A            [ 2]  201 	ldw	x, (0x0a, sp)
      008CF0 E6 03            [ 1]  202 	ld	a, (0x3, x)
      008CF2 6B 04            [ 1]  203 	ld	(0x04, sp), a
      008CF4 E6 02            [ 1]  204 	ld	a, (0x2, x)
      008CF6 6B 03            [ 1]  205 	ld	(0x03, sp), a
      008CF8 FE               [ 2]  206 	ldw	x, (x)
      008CF9 1F 01            [ 2]  207 	ldw	(0x01, sp), x
      008CFB CE 00 E3         [ 2]  208 	ldw	x, _timeTickMs+2
      008CFE 72 F0 03         [ 2]  209 	subw	x, (0x03, sp)
      008D01 C6 00 E2         [ 1]  210 	ld	a, _timeTickMs+1
      008D04 12 02            [ 1]  211 	sbc	a, (0x02, sp)
      008D06 88               [ 1]  212 	push	a
      008D07 C6 00 E1         [ 1]  213 	ld	a, _timeTickMs+0
      008D0A 12 02            [ 1]  214 	sbc	a, (0x02, sp)
      008D0C 6B 07            [ 1]  215 	ld	(0x07, sp), a
      008D0E 84               [ 1]  216 	pop	a
      008D0F 88               [ 1]  217 	push	a
      008D10 13 13            [ 2]  218 	cpw	x, (0x13, sp)
      008D12 84               [ 1]  219 	pop	a
      008D13 12 11            [ 1]  220 	sbc	a, (0x11, sp)
      008D15 7B 06            [ 1]  221 	ld	a, (0x06, sp)
      008D17 12 10            [ 1]  222 	sbc	a, (0x10, sp)
      008D19 4F               [ 1]  223 	clr	a
      008D1A 49               [ 1]  224 	rlc	a
      008D1B 6B 05            [ 1]  225 	ld	(0x05, sp), a
      008D1D 1E 03            [ 2]  226 	ldw	x, (0x03, sp)
      008D1F C3 00 E3         [ 2]  227 	cpw	x, _timeTickMs+2
      008D22 7B 02            [ 1]  228 	ld	a, (0x02, sp)
      008D24 C2 00 E2         [ 1]  229 	sbc	a, _timeTickMs+1
      008D27 7B 01            [ 1]  230 	ld	a, (0x01, sp)
      008D29 C2 00 E1         [ 1]  231 	sbc	a, _timeTickMs+0
      008D2C 24 04            [ 1]  232 	jrnc	00105$
      008D2E 0D 05            [ 1]  233 	tnz	(0x05, sp)
      008D30 27 15            [ 1]  234 	jreq	00101$
      008D32                        235 00105$:
      008D32 CE 00 E3         [ 2]  236 	ldw	x, _timeTickMs+2
      008D35 13 03            [ 2]  237 	cpw	x, (0x03, sp)
      008D37 C6 00 E2         [ 1]  238 	ld	a, _timeTickMs+1
      008D3A 12 02            [ 1]  239 	sbc	a, (0x02, sp)
      008D3C C6 00 E1         [ 1]  240 	ld	a, _timeTickMs+0
      008D3F 12 01            [ 1]  241 	sbc	a, (0x01, sp)
      008D41 24 14            [ 1]  242 	jrnc	00102$
      008D43 0D 05            [ 1]  243 	tnz	(0x05, sp)
      008D45 26 10            [ 1]  244 	jrne	00102$
      008D47                        245 00101$:
                                    246 ;	user/timerTick.c: 48: pTime->timeMS = timeTickMs;
      008D47 1E 0A            [ 2]  247 	ldw	x, (0x0a, sp)
      008D49 90 CE 00 E3      [ 2]  248 	ldw	y, _timeTickMs+2
      008D4D EF 02            [ 2]  249 	ldw	(0x2, x), y
      008D4F 90 CE 00 E1      [ 2]  250 	ldw	y, _timeTickMs+0
      008D53 FF               [ 2]  251 	ldw	(x), y
                                    252 ;	user/timerTick.c: 49: return 0;
      008D54 4F               [ 1]  253 	clr	a
      008D55 20 02            [ 2]  254 	jra	00106$
      008D57                        255 00102$:
                                    256 ;	user/timerTick.c: 51: return 1;
      008D57 A6 01            [ 1]  257 	ld	a, #0x01
      008D59                        258 00106$:
      008D59 5B 0B            [ 2]  259 	addw	sp, #11
      008D5B 81               [ 4]  260 	ret
                                    261 	.area CODE
                                    262 	.area INITIALIZER
                                    263 	.area CABS (ABS)
