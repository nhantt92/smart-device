                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.6.0 #9615 (Mac OS X x86_64)
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
      008C43                         67 _TIMER_Init:
                                     68 ;	user/timerTick.c: 11: CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4 , ENABLE); 
      008C43 4B 01            [ 1]   69 	push	#0x01
      008C45 4B 04            [ 1]   70 	push	#0x04
      008C47 CD 8D C8         [ 4]   71 	call	_CLK_PeripheralClockConfig
      008C4A 85               [ 2]   72 	popw	x
                                     73 ;	user/timerTick.c: 12: TIM4_DeInit(); 
      008C4B CD 91 56         [ 4]   74 	call	_TIM4_DeInit
                                     75 ;	user/timerTick.c: 14: TIM4_TimeBaseInit(TIM4_PRESCALER_16, CYCLE_US);
      008C4E 4B C8            [ 1]   76 	push	#0xc8
      008C50 4B 04            [ 1]   77 	push	#0x04
      008C52 CD 91 6F         [ 4]   78 	call	_TIM4_TimeBaseInit
      008C55 85               [ 2]   79 	popw	x
                                     80 ;	user/timerTick.c: 15: TIM4_ClearFlag(TIM4_FLAG_UPDATE); 
      008C56 4B 01            [ 1]   81 	push	#0x01
      008C58 CD 91 9F         [ 4]   82 	call	_TIM4_ClearFlag
      008C5B 84               [ 1]   83 	pop	a
                                     84 ;	user/timerTick.c: 16: TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
      008C5C 4B 01            [ 1]   85 	push	#0x01
      008C5E 4B 01            [ 1]   86 	push	#0x01
      008C60 CD 91 81         [ 4]   87 	call	_TIM4_ITConfig
      008C63 85               [ 2]   88 	popw	x
                                     89 ;	user/timerTick.c: 17: TIM4_Cmd(ENABLE);    // Enable TIM4 
      008C64 4B 01            [ 1]   90 	push	#0x01
      008C66 CD 91 7C         [ 4]   91 	call	_TIM4_Cmd
      008C69 84               [ 1]   92 	pop	a
                                     93 ;	user/timerTick.c: 18: timeTickMs = 0;
      008C6A 5F               [ 1]   94 	clrw	x
      008C6B CF 00 E3         [ 2]   95 	ldw	_timeTickMs+2, x
      008C6E CF 00 E1         [ 2]   96 	ldw	_timeTickMs+0, x
                                     97 ;	user/timerTick.c: 19: timeTickUs = 0;
      008C71 5F               [ 1]   98 	clrw	x
      008C72 CF 00 E5         [ 2]   99 	ldw	_timeTickUs+0, x
      008C75 81               [ 4]  100 	ret
                                    101 ;	user/timerTick.c: 22: void TIMER_Inc(void)
                                    102 ;	-----------------------------------------
                                    103 ;	 function TIMER_Inc
                                    104 ;	-----------------------------------------
      008C76                        105 _TIMER_Inc:
                                    106 ;	user/timerTick.c: 24: timeTickUs++;
      008C76 CE 00 E5         [ 2]  107 	ldw	x, _timeTickUs+0
      008C79 5C               [ 2]  108 	incw	x
                                    109 ;	user/timerTick.c: 25: if(timeTickUs%5 == 0){
      008C7A CF 00 E5         [ 2]  110 	ldw	_timeTickUs+0, x
      008C7D 90 AE 00 05      [ 2]  111 	ldw	y, #0x0005
      008C81 65               [ 2]  112 	divw	x, y
      008C82 90 5D            [ 2]  113 	tnzw	y
      008C84 27 01            [ 1]  114 	jreq	00109$
      008C86 81               [ 4]  115 	ret
      008C87                        116 00109$:
                                    117 ;	user/timerTick.c: 26: timeTickMs++;
      008C87 CE 00 E3         [ 2]  118 	ldw	x, _timeTickMs+2
      008C8A 1C 00 01         [ 2]  119 	addw	x, #0x0001
      008C8D C6 00 E2         [ 1]  120 	ld	a, _timeTickMs+1
      008C90 A9 00            [ 1]  121 	adc	a, #0x00
      008C92 90 97            [ 1]  122 	ld	yl, a
      008C94 C6 00 E1         [ 1]  123 	ld	a, _timeTickMs+0
      008C97 A9 00            [ 1]  124 	adc	a, #0x00
      008C99 90 95            [ 1]  125 	ld	yh, a
      008C9B CF 00 E3         [ 2]  126 	ldw	_timeTickMs+2, x
      008C9E 90 CF 00 E1      [ 2]  127 	ldw	_timeTickMs+0, y
      008CA2 81               [ 4]  128 	ret
                                    129 ;	user/timerTick.c: 30: void TIMER_InitTime(TIME *pTime)
                                    130 ;	-----------------------------------------
                                    131 ;	 function TIMER_InitTime
                                    132 ;	-----------------------------------------
      008CA3                        133 _TIMER_InitTime:
                                    134 ;	user/timerTick.c: 32: pTime->timeMS = timeTickMs;
      008CA3 1E 03            [ 2]  135 	ldw	x, (0x03, sp)
      008CA5 5C               [ 2]  136 	incw	x
      008CA6 5C               [ 2]  137 	incw	x
      008CA7 90 CE 00 E3      [ 2]  138 	ldw	y, _timeTickMs+2
      008CAB EF 02            [ 2]  139 	ldw	(0x2, x), y
      008CAD 90 CE 00 E1      [ 2]  140 	ldw	y, _timeTickMs+0
      008CB1 FF               [ 2]  141 	ldw	(x), y
      008CB2 81               [ 4]  142 	ret
                                    143 ;	user/timerTick.c: 35: uint8_t TIMER_CheckTimeUS(TIME *pTime, uint16_t time)
                                    144 ;	-----------------------------------------
                                    145 ;	 function TIMER_CheckTimeUS
                                    146 ;	-----------------------------------------
      008CB3                        147 _TIMER_CheckTimeUS:
      008CB3 52 04            [ 2]  148 	sub	sp, #4
                                    149 ;	user/timerTick.c: 37: timeGet = TIM4_GetCounter();
      008CB5 CD 91 8C         [ 4]  150 	call	_TIM4_GetCounter
      008CB8 5F               [ 1]  151 	clrw	x
      008CB9 97               [ 1]  152 	ld	xl, a
      008CBA CF 00 DD         [ 2]  153 	ldw	_timeGet+0, x
                                    154 ;	user/timerTick.c: 38: if(((timeGet > pTime->timeUS)&&((timeGet - pTime->timeUS) >= time))||((timeGet < pTime->timeUS)&&(((CYCLE_US -  pTime->timeUS) + timeGet + 1) >= time))){
      008CBD 16 07            [ 2]  155 	ldw	y, (0x07, sp)
      008CBF 17 03            [ 2]  156 	ldw	(0x03, sp), y
      008CC1 1E 03            [ 2]  157 	ldw	x, (0x03, sp)
      008CC3 FE               [ 2]  158 	ldw	x, (x)
      008CC4 1F 01            [ 2]  159 	ldw	(0x01, sp), x
      008CC6 1E 01            [ 2]  160 	ldw	x, (0x01, sp)
      008CC8 C3 00 DD         [ 2]  161 	cpw	x, _timeGet+0
      008CCB 24 0A            [ 1]  162 	jrnc	00105$
      008CCD CE 00 DD         [ 2]  163 	ldw	x, _timeGet+0
      008CD0 72 F0 01         [ 2]  164 	subw	x, (0x01, sp)
      008CD3 13 09            [ 2]  165 	cpw	x, (0x09, sp)
      008CD5 24 14            [ 1]  166 	jrnc	00101$
      008CD7                        167 00105$:
      008CD7 1E 01            [ 2]  168 	ldw	x, (0x01, sp)
      008CD9 C3 00 DD         [ 2]  169 	cpw	x, _timeGet+0
      008CDC 23 17            [ 2]  170 	jrule	00102$
      008CDE CE 00 DD         [ 2]  171 	ldw	x, _timeGet+0
      008CE1 1C 00 C9         [ 2]  172 	addw	x, #0x00c9
      008CE4 72 F0 01         [ 2]  173 	subw	x, (0x01, sp)
      008CE7 13 09            [ 2]  174 	cpw	x, (0x09, sp)
      008CE9 25 0A            [ 1]  175 	jrc	00102$
      008CEB                        176 00101$:
                                    177 ;	user/timerTick.c: 39: pTime->timeUS = timeGet;
      008CEB 1E 03            [ 2]  178 	ldw	x, (0x03, sp)
      008CED 90 CE 00 DD      [ 2]  179 	ldw	y, _timeGet+0
      008CF1 FF               [ 2]  180 	ldw	(x), y
                                    181 ;	user/timerTick.c: 40: return 0;
      008CF2 4F               [ 1]  182 	clr	a
      008CF3 20 02            [ 2]  183 	jra	00106$
      008CF5                        184 00102$:
                                    185 ;	user/timerTick.c: 42: return 1;
      008CF5 A6 01            [ 1]  186 	ld	a, #0x01
      008CF7                        187 00106$:
      008CF7 5B 04            [ 2]  188 	addw	sp, #4
      008CF9 81               [ 4]  189 	ret
                                    190 ;	user/timerTick.c: 45: uint8_t TIMER_CheckTimeMS(TIME *pTime, uint32_t time)
                                    191 ;	-----------------------------------------
                                    192 ;	 function TIMER_CheckTimeMS
                                    193 ;	-----------------------------------------
      008CFA                        194 _TIMER_CheckTimeMS:
      008CFA 52 0B            [ 2]  195 	sub	sp, #11
                                    196 ;	user/timerTick.c: 47: if(((timeTickMs > pTime->timeMS)&&((timeTickMs - pTime->timeMS) >= time))||((timeTickMs < pTime->timeMS)&&(((CYCLE_MS -  pTime->timeMS) + timeTickMs + 1) >= time))){
      008CFC 1E 0E            [ 2]  197 	ldw	x, (0x0e, sp)
      008CFE 5C               [ 2]  198 	incw	x
      008CFF 5C               [ 2]  199 	incw	x
      008D00 1F 0A            [ 2]  200 	ldw	(0x0a, sp), x
      008D02 1E 0A            [ 2]  201 	ldw	x, (0x0a, sp)
      008D04 E6 03            [ 1]  202 	ld	a, (0x3, x)
      008D06 6B 09            [ 1]  203 	ld	(0x09, sp), a
      008D08 E6 02            [ 1]  204 	ld	a, (0x2, x)
      008D0A 6B 08            [ 1]  205 	ld	(0x08, sp), a
      008D0C FE               [ 2]  206 	ldw	x, (x)
      008D0D 1F 06            [ 2]  207 	ldw	(0x06, sp), x
      008D0F CE 00 E3         [ 2]  208 	ldw	x, _timeTickMs+2
      008D12 72 F0 08         [ 2]  209 	subw	x, (0x08, sp)
      008D15 C6 00 E2         [ 1]  210 	ld	a, _timeTickMs+1
      008D18 12 07            [ 1]  211 	sbc	a, (0x07, sp)
      008D1A 88               [ 1]  212 	push	a
      008D1B C6 00 E1         [ 1]  213 	ld	a, _timeTickMs+0
      008D1E 12 07            [ 1]  214 	sbc	a, (0x07, sp)
      008D20 6B 03            [ 1]  215 	ld	(0x03, sp), a
      008D22 84               [ 1]  216 	pop	a
      008D23 88               [ 1]  217 	push	a
      008D24 13 13            [ 2]  218 	cpw	x, (0x13, sp)
      008D26 84               [ 1]  219 	pop	a
      008D27 12 11            [ 1]  220 	sbc	a, (0x11, sp)
      008D29 7B 02            [ 1]  221 	ld	a, (0x02, sp)
      008D2B 12 10            [ 1]  222 	sbc	a, (0x10, sp)
      008D2D 4F               [ 1]  223 	clr	a
      008D2E 49               [ 1]  224 	rlc	a
      008D2F 6B 01            [ 1]  225 	ld	(0x01, sp), a
      008D31 1E 08            [ 2]  226 	ldw	x, (0x08, sp)
      008D33 C3 00 E3         [ 2]  227 	cpw	x, _timeTickMs+2
      008D36 7B 07            [ 1]  228 	ld	a, (0x07, sp)
      008D38 C2 00 E2         [ 1]  229 	sbc	a, _timeTickMs+1
      008D3B 7B 06            [ 1]  230 	ld	a, (0x06, sp)
      008D3D C2 00 E1         [ 1]  231 	sbc	a, _timeTickMs+0
      008D40 24 04            [ 1]  232 	jrnc	00105$
      008D42 0D 01            [ 1]  233 	tnz	(0x01, sp)
      008D44 27 15            [ 1]  234 	jreq	00101$
      008D46                        235 00105$:
      008D46 CE 00 E3         [ 2]  236 	ldw	x, _timeTickMs+2
      008D49 13 08            [ 2]  237 	cpw	x, (0x08, sp)
      008D4B C6 00 E2         [ 1]  238 	ld	a, _timeTickMs+1
      008D4E 12 07            [ 1]  239 	sbc	a, (0x07, sp)
      008D50 C6 00 E1         [ 1]  240 	ld	a, _timeTickMs+0
      008D53 12 06            [ 1]  241 	sbc	a, (0x06, sp)
      008D55 24 14            [ 1]  242 	jrnc	00102$
      008D57 0D 01            [ 1]  243 	tnz	(0x01, sp)
      008D59 26 10            [ 1]  244 	jrne	00102$
      008D5B                        245 00101$:
                                    246 ;	user/timerTick.c: 48: pTime->timeMS = timeTickMs;
      008D5B 1E 0A            [ 2]  247 	ldw	x, (0x0a, sp)
      008D5D 90 CE 00 E3      [ 2]  248 	ldw	y, _timeTickMs+2
      008D61 EF 02            [ 2]  249 	ldw	(0x2, x), y
      008D63 90 CE 00 E1      [ 2]  250 	ldw	y, _timeTickMs+0
      008D67 FF               [ 2]  251 	ldw	(x), y
                                    252 ;	user/timerTick.c: 49: return 0;
      008D68 4F               [ 1]  253 	clr	a
      008D69 20 02            [ 2]  254 	jra	00106$
      008D6B                        255 00102$:
                                    256 ;	user/timerTick.c: 51: return 1;
      008D6B A6 01            [ 1]  257 	ld	a, #0x01
      008D6D                        258 00106$:
      008D6D 5B 0B            [ 2]  259 	addw	sp, #11
      008D6F 81               [ 4]  260 	ret
                                    261 	.area CODE
                                    262 	.area INITIALIZER
                                    263 	.area CABS (ABS)
