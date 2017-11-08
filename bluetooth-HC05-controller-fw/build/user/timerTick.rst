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
      0000AF                         31 _timeGet::
      0000AF                         32 	.ds 2
      0000B1                         33 _timeBack::
      0000B1                         34 	.ds 2
      0000B3                         35 _timeTickMs::
      0000B3                         36 	.ds 4
      0000B7                         37 _timeTickUs::
      0000B7                         38 	.ds 1
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
                                     63 ;	user/timerTick.c: 17: void TIMER_Init(void)
                                     64 ;	-----------------------------------------
                                     65 ;	 function TIMER_Init
                                     66 ;	-----------------------------------------
      0095A8                         67 _TIMER_Init:
                                     68 ;	user/timerTick.c: 19: CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4 , ENABLE); 
      0095A8 4B 01            [ 1]   69 	push	#0x01
      0095AA 4B 04            [ 1]   70 	push	#0x04
      0095AC CD 97 25         [ 4]   71 	call	_CLK_PeripheralClockConfig
      0095AF 85               [ 2]   72 	popw	x
                                     73 ;	user/timerTick.c: 20: TIM4_DeInit(); 
      0095B0 CD 9A 85         [ 4]   74 	call	_TIM4_DeInit
                                     75 ;	user/timerTick.c: 22: TIM4_TimeBaseInit(TIM4_PRESCALER_16, CYCLE_US);
      0095B3 4B C8            [ 1]   76 	push	#0xc8
      0095B5 4B 04            [ 1]   77 	push	#0x04
      0095B7 CD 9A 9E         [ 4]   78 	call	_TIM4_TimeBaseInit
      0095BA 85               [ 2]   79 	popw	x
                                     80 ;	user/timerTick.c: 23: TIM4_ClearFlag(TIM4_FLAG_UPDATE); 
      0095BB 4B 01            [ 1]   81 	push	#0x01
      0095BD CD 9A CE         [ 4]   82 	call	_TIM4_ClearFlag
      0095C0 84               [ 1]   83 	pop	a
                                     84 ;	user/timerTick.c: 24: TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
      0095C1 4B 01            [ 1]   85 	push	#0x01
      0095C3 4B 01            [ 1]   86 	push	#0x01
      0095C5 CD 9A B0         [ 4]   87 	call	_TIM4_ITConfig
      0095C8 85               [ 2]   88 	popw	x
                                     89 ;	user/timerTick.c: 25: TIM4_Cmd(ENABLE);    // Enable TIM4 
      0095C9 4B 01            [ 1]   90 	push	#0x01
      0095CB CD 9A AB         [ 4]   91 	call	_TIM4_Cmd
      0095CE 84               [ 1]   92 	pop	a
                                     93 ;	user/timerTick.c: 26: timeTickMs = 0;
      0095CF 5F               [ 1]   94 	clrw	x
      0095D0 CF 00 B5         [ 2]   95 	ldw	_timeTickMs+2, x
      0095D3 CF 00 B3         [ 2]   96 	ldw	_timeTickMs+0, x
                                     97 ;	user/timerTick.c: 27: timeTickUs = 0;
      0095D6 72 5F 00 B7      [ 1]   98 	clr	_timeTickUs+0
      0095DA 81               [ 4]   99 	ret
                                    100 ;	user/timerTick.c: 30: void TIMER_Inc(void)
                                    101 ;	-----------------------------------------
                                    102 ;	 function TIMER_Inc
                                    103 ;	-----------------------------------------
      0095DB                        104 _TIMER_Inc:
                                    105 ;	user/timerTick.c: 32: timeTickUs++;
      0095DB 72 5C 00 B7      [ 1]  106 	inc	_timeTickUs+0
                                    107 ;	user/timerTick.c: 33: if(timeTickUs%5 == 0){
      0095DF 5F               [ 1]  108 	clrw	x
      0095E0 C6 00 B7         [ 1]  109 	ld	a, _timeTickUs+0
      0095E3 97               [ 1]  110 	ld	xl, a
      0095E4 A6 05            [ 1]  111 	ld	a, #0x05
      0095E6 62               [ 2]  112 	div	x, a
      0095E7 4D               [ 1]  113 	tnz	a
      0095E8 27 01            [ 1]  114 	jreq	00109$
      0095EA 81               [ 4]  115 	ret
      0095EB                        116 00109$:
                                    117 ;	user/timerTick.c: 34: timeTickMs++;
      0095EB CE 00 B5         [ 2]  118 	ldw	x, _timeTickMs+2
      0095EE 1C 00 01         [ 2]  119 	addw	x, #0x0001
      0095F1 C6 00 B4         [ 1]  120 	ld	a, _timeTickMs+1
      0095F4 A9 00            [ 1]  121 	adc	a, #0x00
      0095F6 90 97            [ 1]  122 	ld	yl, a
      0095F8 C6 00 B3         [ 1]  123 	ld	a, _timeTickMs+0
      0095FB A9 00            [ 1]  124 	adc	a, #0x00
      0095FD 90 95            [ 1]  125 	ld	yh, a
      0095FF CF 00 B5         [ 2]  126 	ldw	_timeTickMs+2, x
      009602 90 CF 00 B3      [ 2]  127 	ldw	_timeTickMs+0, y
      009606 81               [ 4]  128 	ret
                                    129 ;	user/timerTick.c: 38: void TIMER_InitTime(TIME *pTime)
                                    130 ;	-----------------------------------------
                                    131 ;	 function TIMER_InitTime
                                    132 ;	-----------------------------------------
      009607                        133 _TIMER_InitTime:
                                    134 ;	user/timerTick.c: 40: pTime->timeMS = timeTickMs;
      009607 1E 03            [ 2]  135 	ldw	x, (0x03, sp)
      009609 5C               [ 2]  136 	incw	x
      00960A 5C               [ 2]  137 	incw	x
      00960B 90 CE 00 B5      [ 2]  138 	ldw	y, _timeTickMs+2
      00960F EF 02            [ 2]  139 	ldw	(0x2, x), y
      009611 90 CE 00 B3      [ 2]  140 	ldw	y, _timeTickMs+0
      009615 FF               [ 2]  141 	ldw	(x), y
      009616 81               [ 4]  142 	ret
                                    143 ;	user/timerTick.c: 43: uint8_t TIMER_CheckTimeUS(TIME *pTime, uint16_t time)
                                    144 ;	-----------------------------------------
                                    145 ;	 function TIMER_CheckTimeUS
                                    146 ;	-----------------------------------------
      009617                        147 _TIMER_CheckTimeUS:
      009617 52 04            [ 2]  148 	sub	sp, #4
                                    149 ;	user/timerTick.c: 45: timeGet = TIM4_GetCounter();
      009619 CD 9A BB         [ 4]  150 	call	_TIM4_GetCounter
      00961C 5F               [ 1]  151 	clrw	x
      00961D 97               [ 1]  152 	ld	xl, a
      00961E CF 00 AF         [ 2]  153 	ldw	_timeGet+0, x
                                    154 ;	user/timerTick.c: 46: if(((timeGet > pTime->timeUS)&&((timeGet - pTime->timeUS) >= time))||((timeGet < pTime->timeUS)&&(((CYCLE_US -  pTime->timeUS) + timeGet + 1) >= time))){
      009621 16 07            [ 2]  155 	ldw	y, (0x07, sp)
      009623 17 01            [ 2]  156 	ldw	(0x01, sp), y
      009625 1E 01            [ 2]  157 	ldw	x, (0x01, sp)
      009627 FE               [ 2]  158 	ldw	x, (x)
      009628 1F 03            [ 2]  159 	ldw	(0x03, sp), x
      00962A 1E 03            [ 2]  160 	ldw	x, (0x03, sp)
      00962C C3 00 AF         [ 2]  161 	cpw	x, _timeGet+0
      00962F 24 0A            [ 1]  162 	jrnc	00105$
      009631 CE 00 AF         [ 2]  163 	ldw	x, _timeGet+0
      009634 72 F0 03         [ 2]  164 	subw	x, (0x03, sp)
      009637 13 09            [ 2]  165 	cpw	x, (0x09, sp)
      009639 24 14            [ 1]  166 	jrnc	00101$
      00963B                        167 00105$:
      00963B 1E 03            [ 2]  168 	ldw	x, (0x03, sp)
      00963D C3 00 AF         [ 2]  169 	cpw	x, _timeGet+0
      009640 23 17            [ 2]  170 	jrule	00102$
      009642 CE 00 AF         [ 2]  171 	ldw	x, _timeGet+0
      009645 1C 00 C9         [ 2]  172 	addw	x, #0x00c9
      009648 72 F0 03         [ 2]  173 	subw	x, (0x03, sp)
      00964B 13 09            [ 2]  174 	cpw	x, (0x09, sp)
      00964D 25 0A            [ 1]  175 	jrc	00102$
      00964F                        176 00101$:
                                    177 ;	user/timerTick.c: 47: pTime->timeUS = timeGet;
      00964F 1E 01            [ 2]  178 	ldw	x, (0x01, sp)
      009651 90 CE 00 AF      [ 2]  179 	ldw	y, _timeGet+0
      009655 FF               [ 2]  180 	ldw	(x), y
                                    181 ;	user/timerTick.c: 48: return 0;
      009656 4F               [ 1]  182 	clr	a
      009657 20 02            [ 2]  183 	jra	00106$
      009659                        184 00102$:
                                    185 ;	user/timerTick.c: 50: return 1;
      009659 A6 01            [ 1]  186 	ld	a, #0x01
      00965B                        187 00106$:
      00965B 5B 04            [ 2]  188 	addw	sp, #4
      00965D 81               [ 4]  189 	ret
                                    190 ;	user/timerTick.c: 53: uint8_t TIMER_CheckTimeMS(TIME *pTime, uint32_t time)
                                    191 ;	-----------------------------------------
                                    192 ;	 function TIMER_CheckTimeMS
                                    193 ;	-----------------------------------------
      00965E                        194 _TIMER_CheckTimeMS:
      00965E 52 0B            [ 2]  195 	sub	sp, #11
                                    196 ;	user/timerTick.c: 55: if(((timeTickMs > pTime->timeMS)&&((timeTickMs - pTime->timeMS) >= time))||((timeTickMs < pTime->timeMS)&&(((CYCLE_MS -  pTime->timeMS) + timeTickMs + 1) >= time))){
      009660 1E 0E            [ 2]  197 	ldw	x, (0x0e, sp)
      009662 5C               [ 2]  198 	incw	x
      009663 5C               [ 2]  199 	incw	x
      009664 1F 06            [ 2]  200 	ldw	(0x06, sp), x
      009666 1E 06            [ 2]  201 	ldw	x, (0x06, sp)
      009668 E6 03            [ 1]  202 	ld	a, (0x3, x)
      00966A 6B 04            [ 1]  203 	ld	(0x04, sp), a
      00966C E6 02            [ 1]  204 	ld	a, (0x2, x)
      00966E 6B 03            [ 1]  205 	ld	(0x03, sp), a
      009670 FE               [ 2]  206 	ldw	x, (x)
      009671 1F 01            [ 2]  207 	ldw	(0x01, sp), x
      009673 CE 00 B5         [ 2]  208 	ldw	x, _timeTickMs+2
      009676 72 F0 03         [ 2]  209 	subw	x, (0x03, sp)
      009679 C6 00 B4         [ 1]  210 	ld	a, _timeTickMs+1
      00967C 12 02            [ 1]  211 	sbc	a, (0x02, sp)
      00967E 88               [ 1]  212 	push	a
      00967F C6 00 B3         [ 1]  213 	ld	a, _timeTickMs+0
      009682 12 02            [ 1]  214 	sbc	a, (0x02, sp)
      009684 6B 09            [ 1]  215 	ld	(0x09, sp), a
      009686 84               [ 1]  216 	pop	a
      009687 88               [ 1]  217 	push	a
      009688 13 13            [ 2]  218 	cpw	x, (0x13, sp)
      00968A 84               [ 1]  219 	pop	a
      00968B 12 11            [ 1]  220 	sbc	a, (0x11, sp)
      00968D 7B 08            [ 1]  221 	ld	a, (0x08, sp)
      00968F 12 10            [ 1]  222 	sbc	a, (0x10, sp)
      009691 4F               [ 1]  223 	clr	a
      009692 49               [ 1]  224 	rlc	a
      009693 6B 05            [ 1]  225 	ld	(0x05, sp), a
      009695 1E 03            [ 2]  226 	ldw	x, (0x03, sp)
      009697 C3 00 B5         [ 2]  227 	cpw	x, _timeTickMs+2
      00969A 7B 02            [ 1]  228 	ld	a, (0x02, sp)
      00969C C2 00 B4         [ 1]  229 	sbc	a, _timeTickMs+1
      00969F 7B 01            [ 1]  230 	ld	a, (0x01, sp)
      0096A1 C2 00 B3         [ 1]  231 	sbc	a, _timeTickMs+0
      0096A4 24 04            [ 1]  232 	jrnc	00105$
      0096A6 0D 05            [ 1]  233 	tnz	(0x05, sp)
      0096A8 27 15            [ 1]  234 	jreq	00101$
      0096AA                        235 00105$:
      0096AA CE 00 B5         [ 2]  236 	ldw	x, _timeTickMs+2
      0096AD 13 03            [ 2]  237 	cpw	x, (0x03, sp)
      0096AF C6 00 B4         [ 1]  238 	ld	a, _timeTickMs+1
      0096B2 12 02            [ 1]  239 	sbc	a, (0x02, sp)
      0096B4 C6 00 B3         [ 1]  240 	ld	a, _timeTickMs+0
      0096B7 12 01            [ 1]  241 	sbc	a, (0x01, sp)
      0096B9 24 14            [ 1]  242 	jrnc	00102$
      0096BB 0D 05            [ 1]  243 	tnz	(0x05, sp)
      0096BD 26 10            [ 1]  244 	jrne	00102$
      0096BF                        245 00101$:
                                    246 ;	user/timerTick.c: 56: pTime->timeMS = timeTickMs;
      0096BF 1E 06            [ 2]  247 	ldw	x, (0x06, sp)
      0096C1 90 CE 00 B5      [ 2]  248 	ldw	y, _timeTickMs+2
      0096C5 EF 02            [ 2]  249 	ldw	(0x2, x), y
      0096C7 90 CE 00 B3      [ 2]  250 	ldw	y, _timeTickMs+0
      0096CB FF               [ 2]  251 	ldw	(x), y
                                    252 ;	user/timerTick.c: 57: return 0;
      0096CC 4F               [ 1]  253 	clr	a
      0096CD 20 02            [ 2]  254 	jra	00106$
      0096CF                        255 00102$:
                                    256 ;	user/timerTick.c: 59: return 1;
      0096CF A6 01            [ 1]  257 	ld	a, #0x01
      0096D1                        258 00106$:
      0096D1 5B 0B            [ 2]  259 	addw	sp, #11
      0096D3 81               [ 4]  260 	ret
                                    261 	.area CODE
                                    262 	.area INITIALIZER
                                    263 	.area CABS (ABS)
