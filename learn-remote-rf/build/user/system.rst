                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.6.0 #9615 (Mac OS X x86_64)
                                      4 ;--------------------------------------------------------
                                      5 	.module system
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _led_change
                                     12 	.globl _led_getstatus
                                     13 	.globl _sys_WriteCfg
                                     14 	.globl _info
                                     15 	.globl _tp_get
                                     16 	.globl _TIMER_CheckTimeMS
                                     17 	.globl _TIMER_InitTime
                                     18 	.globl _sys
                                     19 	.globl _system_init
                                     20 	.globl _system_checkID
                                     21 	.globl _system_manager
                                     22 ;--------------------------------------------------------
                                     23 ; ram data
                                     24 ;--------------------------------------------------------
                                     25 	.area DATA
      0000CC                         26 _sys::
      0000CC                         27 	.ds 17
                                     28 ;--------------------------------------------------------
                                     29 ; ram data
                                     30 ;--------------------------------------------------------
                                     31 	.area INITIALIZED
                                     32 ;--------------------------------------------------------
                                     33 ; absolute external ram data
                                     34 ;--------------------------------------------------------
                                     35 	.area DABS (ABS)
                                     36 ;--------------------------------------------------------
                                     37 ; global & static initialisations
                                     38 ;--------------------------------------------------------
                                     39 	.area HOME
                                     40 	.area GSINIT
                                     41 	.area GSFINAL
                                     42 	.area GSINIT
                                     43 ;--------------------------------------------------------
                                     44 ; Home
                                     45 ;--------------------------------------------------------
                                     46 	.area HOME
                                     47 	.area HOME
                                     48 ;--------------------------------------------------------
                                     49 ; code
                                     50 ;--------------------------------------------------------
                                     51 	.area CODE
                                     52 ;	user/system.c: 11: void system_init(void)
                                     53 ;	-----------------------------------------
                                     54 ;	 function system_init
                                     55 ;	-----------------------------------------
      0089D2                         56 _system_init:
                                     57 ;	user/system.c: 13: sys.mode = SYS_NOMAL;
      0089D2 AE 00 CC         [ 2]   58 	ldw	x, #_sys+0
      0089D5 7F               [ 1]   59 	clr	(x)
                                     60 ;	user/system.c: 14: TIMER_InitTime(&sys.tick);
      0089D6 AE 00 D1         [ 2]   61 	ldw	x, #_sys+5
      0089D9 89               [ 2]   62 	pushw	x
      0089DA CD 8C A3         [ 4]   63 	call	_TIMER_InitTime
      0089DD 85               [ 2]   64 	popw	x
      0089DE 81               [ 4]   65 	ret
                                     66 ;	user/system.c: 17: uint8_t system_checkID(uint32_t idGet)
                                     67 ;	-----------------------------------------
                                     68 ;	 function system_checkID
                                     69 ;	-----------------------------------------
      0089DF                         70 _system_checkID:
      0089DF 52 07            [ 2]   71 	sub	sp, #7
                                     72 ;	user/system.c: 20: for(id = 0; id < MAX_KEY_ID_LEN; id++)
      0089E1 AE 00 B8         [ 2]   73 	ldw	x, #_sysCfg+4
      0089E4 1F 06            [ 2]   74 	ldw	(0x06, sp), x
      0089E6 0F 01            [ 1]   75 	clr	(0x01, sp)
      0089E8                         76 00104$:
                                     77 ;	user/system.c: 22: if(idGet == sysCfg.id[id])
      0089E8 7B 01            [ 1]   78 	ld	a, (0x01, sp)
      0089EA 48               [ 1]   79 	sll	a
      0089EB 48               [ 1]   80 	sll	a
      0089EC 5F               [ 1]   81 	clrw	x
      0089ED 97               [ 1]   82 	ld	xl, a
      0089EE 72 FB 06         [ 2]   83 	addw	x, (0x06, sp)
      0089F1 E6 03            [ 1]   84 	ld	a, (0x3, x)
      0089F3 6B 05            [ 1]   85 	ld	(0x05, sp), a
      0089F5 E6 02            [ 1]   86 	ld	a, (0x2, x)
      0089F7 6B 04            [ 1]   87 	ld	(0x04, sp), a
      0089F9 FE               [ 2]   88 	ldw	x, (x)
      0089FA 1F 02            [ 2]   89 	ldw	(0x02, sp), x
      0089FC 1E 0C            [ 2]   90 	ldw	x, (0x0c, sp)
      0089FE 13 04            [ 2]   91 	cpw	x, (0x04, sp)
      008A00 26 0A            [ 1]   92 	jrne	00105$
      008A02 1E 0A            [ 2]   93 	ldw	x, (0x0a, sp)
      008A04 13 02            [ 2]   94 	cpw	x, (0x02, sp)
      008A06 26 04            [ 1]   95 	jrne	00105$
                                     96 ;	user/system.c: 23: return 1;
      008A08 A6 01            [ 1]   97 	ld	a, #0x01
      008A0A 20 09            [ 2]   98 	jra	00106$
      008A0C                         99 00105$:
                                    100 ;	user/system.c: 20: for(id = 0; id < MAX_KEY_ID_LEN; id++)
      008A0C 0C 01            [ 1]  101 	inc	(0x01, sp)
      008A0E 7B 01            [ 1]  102 	ld	a, (0x01, sp)
      008A10 A1 05            [ 1]  103 	cp	a, #0x05
      008A12 25 D4            [ 1]  104 	jrc	00104$
                                    105 ;	user/system.c: 25: return 0;
      008A14 4F               [ 1]  106 	clr	a
      008A15                        107 00106$:
      008A15 5B 07            [ 2]  108 	addw	sp, #7
      008A17 81               [ 4]  109 	ret
                                    110 ;	user/system.c: 28: void system_manager(void)
                                    111 ;	-----------------------------------------
                                    112 ;	 function system_manager
                                    113 ;	-----------------------------------------
      008A18                        114 _system_manager:
      008A18 52 1F            [ 2]  115 	sub	sp, #31
                                    116 ;	user/system.c: 31: if(!TIMER_CheckTimeMS(&sys.tick, 100)){
      008A1A AE 00 CC         [ 2]  117 	ldw	x, #_sys+0
      008A1D 1F 1E            [ 2]  118 	ldw	(0x1e, sp), x
      008A1F 1E 1E            [ 2]  119 	ldw	x, (0x1e, sp)
      008A21 1C 00 05         [ 2]  120 	addw	x, #0x0005
      008A24 4B 64            [ 1]  121 	push	#0x64
      008A26 4B 00            [ 1]  122 	push	#0x00
      008A28 4B 00            [ 1]  123 	push	#0x00
      008A2A 4B 00            [ 1]  124 	push	#0x00
      008A2C 89               [ 2]  125 	pushw	x
      008A2D CD 8C FA         [ 4]  126 	call	_TIMER_CheckTimeMS
      008A30 5B 06            [ 2]  127 	addw	sp, #6
      008A32 6B 1D            [ 1]  128 	ld	(0x1d, sp), a
      008A34 0D 1D            [ 1]  129 	tnz	(0x1d, sp)
      008A36 27 03            [ 1]  130 	jreq	00209$
      008A38 CC 8C 09         [ 2]  131 	jp	00135$
      008A3B                        132 00209$:
                                    133 ;	user/system.c: 32: switch(sys.mode)
      008A3B 1E 1E            [ 2]  134 	ldw	x, (0x1e, sp)
      008A3D F6               [ 1]  135 	ld	a, (x)
                                    136 ;	user/system.c: 38: if(++sys.keyPressTime > 30)
      008A3E 1E 1E            [ 2]  137 	ldw	x, (0x1e, sp)
      008A40 1C 00 0F         [ 2]  138 	addw	x, #0x000f
      008A43 1F 1B            [ 2]  139 	ldw	(0x1b, sp), x
                                    140 ;	user/system.c: 41: sys.setTimeOut = 600;
      008A45 1E 1E            [ 2]  141 	ldw	x, (0x1e, sp)
      008A47 1C 00 0B         [ 2]  142 	addw	x, #0x000b
      008A4A 1F 19            [ 2]  143 	ldw	(0x19, sp), x
                                    144 ;	user/system.c: 43: sys.keyReleaseTime = 100;
      008A4C 1E 1E            [ 2]  145 	ldw	x, (0x1e, sp)
      008A4E 1C 00 10         [ 2]  146 	addw	x, #0x0010
      008A51 1F 17            [ 2]  147 	ldw	(0x17, sp), x
                                    148 ;	user/system.c: 44: sys.idKeyGet = 0;
      008A53 1E 1E            [ 2]  149 	ldw	x, (0x1e, sp)
      008A55 5C               [ 2]  150 	incw	x
      008A56 1F 15            [ 2]  151 	ldw	(0x15, sp), x
                                    152 ;	user/system.c: 32: switch(sys.mode)
      008A58 A1 00            [ 1]  153 	cp	a, #0x00
      008A5A 27 07            [ 1]  154 	jreq	00101$
      008A5C A1 01            [ 1]  155 	cp	a, #0x01
      008A5E 27 70            [ 1]  156 	jreq	00108$
      008A60 CC 8C 09         [ 2]  157 	jp	00135$
                                    158 ;	user/system.c: 34: case SYS_NOMAL:
      008A63                        159 00101$:
                                    160 ;	user/system.c: 35: keyGet = tp_get(TP_SET);
      008A63 4B 00            [ 1]  161 	push	#0x00
      008A65 CD 82 AC         [ 4]  162 	call	_tp_get
      008A68 5B 01            [ 2]  163 	addw	sp, #1
                                    164 ;	user/system.c: 36: if(keyGet == TP_PRESS)
      008A6A A1 01            [ 1]  165 	cp	a, #0x01
      008A6C 26 3E            [ 1]  166 	jrne	00105$
                                    167 ;	user/system.c: 38: if(++sys.keyPressTime > 30)
      008A6E 1E 1B            [ 2]  168 	ldw	x, (0x1b, sp)
      008A70 F6               [ 1]  169 	ld	a, (x)
      008A71 6B 14            [ 1]  170 	ld	(0x14, sp), a
      008A73 7B 14            [ 1]  171 	ld	a, (0x14, sp)
      008A75 4C               [ 1]  172 	inc	a
      008A76 1E 1B            [ 2]  173 	ldw	x, (0x1b, sp)
      008A78 F7               [ 1]  174 	ld	(x), a
      008A79 A1 1E            [ 1]  175 	cp	a, #0x1e
      008A7B 23 2F            [ 2]  176 	jrule	00105$
                                    177 ;	user/system.c: 40: sys.mode = SYS_SET_ID;
      008A7D 1E 1E            [ 2]  178 	ldw	x, (0x1e, sp)
      008A7F A6 01            [ 1]  179 	ld	a, #0x01
      008A81 F7               [ 1]  180 	ld	(x), a
                                    181 ;	user/system.c: 41: sys.setTimeOut = 600;
      008A82 1E 19            [ 2]  182 	ldw	x, (0x19, sp)
      008A84 90 AE 02 58      [ 2]  183 	ldw	y, #0x0258
      008A88 EF 02            [ 2]  184 	ldw	(0x2, x), y
      008A8A 6F 01            [ 1]  185 	clr	(0x1, x)
      008A8C 7F               [ 1]  186 	clr	(x)
                                    187 ;	user/system.c: 42: sys.keyPressTime = 0;
      008A8D 1E 1B            [ 2]  188 	ldw	x, (0x1b, sp)
      008A8F 7F               [ 1]  189 	clr	(x)
                                    190 ;	user/system.c: 43: sys.keyReleaseTime = 100;
      008A90 1E 17            [ 2]  191 	ldw	x, (0x17, sp)
      008A92 A6 64            [ 1]  192 	ld	a, #0x64
      008A94 F7               [ 1]  193 	ld	(x), a
                                    194 ;	user/system.c: 44: sys.idKeyGet = 0;
      008A95 1E 15            [ 2]  195 	ldw	x, (0x15, sp)
      008A97 90 5F            [ 1]  196 	clrw	y
      008A99 EF 02            [ 2]  197 	ldw	(0x2, x), y
      008A9B FF               [ 2]  198 	ldw	(x), y
                                    199 ;	user/system.c: 45: led_change(LED_ON, 0);
      008A9C 4B 00            [ 1]  200 	push	#0x00
      008A9E 4B 01            [ 1]  201 	push	#0x01
      008AA0 CD 83 1F         [ 4]  202 	call	_led_change
      008AA3 85               [ 2]  203 	popw	x
                                    204 ;	user/system.c: 46: info("\r\nSet key id.....");
      008AA4 AE 8C 0C         [ 2]  205 	ldw	x, #___str_0+0
      008AA7 89               [ 2]  206 	pushw	x
      008AA8 CD 81 2B         [ 4]  207 	call	_info
      008AAB 85               [ 2]  208 	popw	x
      008AAC                        209 00105$:
                                    210 ;	user/system.c: 49: if(sys.idKeyGet != 0)
      008AAC 1E 15            [ 2]  211 	ldw	x, (0x15, sp)
      008AAE 89               [ 2]  212 	pushw	x
      008AAF EE 02            [ 2]  213 	ldw	x, (0x2, x)
      008AB1 51               [ 1]  214 	exgw	x, y
      008AB2 85               [ 2]  215 	popw	x
      008AB3 FE               [ 2]  216 	ldw	x, (x)
      008AB4 90 5D            [ 2]  217 	tnzw	y
      008AB6 26 06            [ 1]  218 	jrne	00220$
      008AB8 5D               [ 2]  219 	tnzw	x
      008AB9 26 03            [ 1]  220 	jrne	00220$
      008ABB CC 8C 09         [ 2]  221 	jp	00135$
      008ABE                        222 00220$:
                                    223 ;	user/system.c: 51: sys.idKeyGet = 0;
      008ABE 1E 15            [ 2]  224 	ldw	x, (0x15, sp)
      008AC0 90 5F            [ 1]  225 	clrw	y
      008AC2 EF 02            [ 2]  226 	ldw	(0x2, x), y
      008AC4 FF               [ 2]  227 	ldw	(x), y
                                    228 ;	user/system.c: 52: led_change(LED_FLASH, 10);
      008AC5 4B 0A            [ 1]  229 	push	#0x0a
      008AC7 4B 02            [ 1]  230 	push	#0x02
      008AC9 CD 83 1F         [ 4]  231 	call	_led_change
      008ACC 85               [ 2]  232 	popw	x
                                    233 ;	user/system.c: 54: break;
      008ACD CC 8C 09         [ 2]  234 	jp	00135$
                                    235 ;	user/system.c: 55: case SYS_SET_ID:
      008AD0                        236 00108$:
                                    237 ;	user/system.c: 56: if((sysCfg.idLen != 0)&&(led_getstatus() != LED_FLASH))
      008AD0 AE 00 B4         [ 2]  238 	ldw	x, #_sysCfg+0
      008AD3 1F 12            [ 2]  239 	ldw	(0x12, sp), x
      008AD5 1E 12            [ 2]  240 	ldw	x, (0x12, sp)
      008AD7 5C               [ 2]  241 	incw	x
      008AD8 5C               [ 2]  242 	incw	x
      008AD9 1F 10            [ 2]  243 	ldw	(0x10, sp), x
      008ADB 1E 10            [ 2]  244 	ldw	x, (0x10, sp)
      008ADD FE               [ 2]  245 	ldw	x, (x)
      008ADE 5D               [ 2]  246 	tnzw	x
      008ADF 27 0F            [ 1]  247 	jreq	00110$
      008AE1 CD 83 33         [ 4]  248 	call	_led_getstatus
      008AE4 A1 02            [ 1]  249 	cp	a, #0x02
      008AE6 27 08            [ 1]  250 	jreq	00110$
                                    251 ;	user/system.c: 57: led_change(LED_ON, 0);
      008AE8 4B 00            [ 1]  252 	push	#0x00
      008AEA 4B 01            [ 1]  253 	push	#0x01
      008AEC CD 83 1F         [ 4]  254 	call	_led_change
      008AEF 85               [ 2]  255 	popw	x
      008AF0                        256 00110$:
                                    257 ;	user/system.c: 58: if(sys.keyReleaseTime != 0)
      008AF0 1E 17            [ 2]  258 	ldw	x, (0x17, sp)
      008AF2 F6               [ 1]  259 	ld	a, (x)
      008AF3 4D               [ 1]  260 	tnz	a
      008AF4 27 07            [ 1]  261 	jreq	00113$
                                    262 ;	user/system.c: 60: sys.keyReleaseTime--;
      008AF6 4A               [ 1]  263 	dec	a
      008AF7 1E 17            [ 2]  264 	ldw	x, (0x17, sp)
      008AF9 F7               [ 1]  265 	ld	(x), a
                                    266 ;	user/system.c: 61: sys.keyPressTime = 0;
      008AFA 1E 1B            [ 2]  267 	ldw	x, (0x1b, sp)
      008AFC 7F               [ 1]  268 	clr	(x)
      008AFD                        269 00113$:
                                    270 ;	user/system.c: 63: keyGet = tp_get(TP_SET);
      008AFD 4B 00            [ 1]  271 	push	#0x00
      008AFF CD 82 AC         [ 4]  272 	call	_tp_get
      008B02 5B 01            [ 2]  273 	addw	sp, #1
                                    274 ;	user/system.c: 68: for(sysCfg.idLen = 0; sysCfg.idLen < MAX_KEY_ID_LEN; sysCfg.idLen++)
      008B04 1E 12            [ 2]  275 	ldw	x, (0x12, sp)
      008B06 1C 00 04         [ 2]  276 	addw	x, #0x0004
      008B09 1F 0E            [ 2]  277 	ldw	(0x0e, sp), x
                                    278 ;	user/system.c: 64: if((keyGet == TP_PRESS)&&(sys.keyReleaseTime == 0))
      008B0B A1 01            [ 1]  279 	cp	a, #0x01
      008B0D 26 4C            [ 1]  280 	jrne	00118$
      008B0F 1E 17            [ 2]  281 	ldw	x, (0x17, sp)
      008B11 F6               [ 1]  282 	ld	a, (x)
      008B12 4D               [ 1]  283 	tnz	a
      008B13 26 46            [ 1]  284 	jrne	00118$
                                    285 ;	user/system.c: 66: if(++sys.keyPressTime > 10)
      008B15 1E 1B            [ 2]  286 	ldw	x, (0x1b, sp)
      008B17 F6               [ 1]  287 	ld	a, (x)
      008B18 4C               [ 1]  288 	inc	a
      008B19 F7               [ 1]  289 	ld	(x), a
      008B1A A1 0A            [ 1]  290 	cp	a, #0x0a
      008B1C 23 3D            [ 2]  291 	jrule	00118$
                                    292 ;	user/system.c: 68: for(sysCfg.idLen = 0; sysCfg.idLen < MAX_KEY_ID_LEN; sysCfg.idLen++)
      008B1E 1E 10            [ 2]  293 	ldw	x, (0x10, sp)
      008B20 6F 01            [ 1]  294 	clr	(0x1, x)
      008B22 7F               [ 1]  295 	clr	(x)
      008B23 16 0E            [ 2]  296 	ldw	y, (0x0e, sp)
      008B25 17 0C            [ 2]  297 	ldw	(0x0c, sp), y
      008B27                        298 00133$:
      008B27 1E 10            [ 2]  299 	ldw	x, (0x10, sp)
      008B29 FE               [ 2]  300 	ldw	x, (x)
      008B2A A3 00 05         [ 2]  301 	cpw	x, #0x0005
      008B2D 24 14            [ 1]  302 	jrnc	00114$
                                    303 ;	user/system.c: 69: sysCfg.id[sysCfg.idLen] = 0;
      008B2F 58               [ 2]  304 	sllw	x
      008B30 58               [ 2]  305 	sllw	x
      008B31 72 FB 0C         [ 2]  306 	addw	x, (0x0c, sp)
      008B34 90 5F            [ 1]  307 	clrw	y
      008B36 EF 02            [ 2]  308 	ldw	(0x2, x), y
      008B38 FF               [ 2]  309 	ldw	(x), y
                                    310 ;	user/system.c: 68: for(sysCfg.idLen = 0; sysCfg.idLen < MAX_KEY_ID_LEN; sysCfg.idLen++)
      008B39 1E 10            [ 2]  311 	ldw	x, (0x10, sp)
      008B3B FE               [ 2]  312 	ldw	x, (x)
      008B3C 5C               [ 2]  313 	incw	x
      008B3D 16 10            [ 2]  314 	ldw	y, (0x10, sp)
      008B3F 90 FF            [ 2]  315 	ldw	(y), x
      008B41 20 E4            [ 2]  316 	jra	00133$
      008B43                        317 00114$:
                                    318 ;	user/system.c: 70: sysCfg.idLen = 0;
      008B43 1E 10            [ 2]  319 	ldw	x, (0x10, sp)
      008B45 6F 01            [ 1]  320 	clr	(0x1, x)
      008B47 7F               [ 1]  321 	clr	(x)
                                    322 ;	user/system.c: 71: sys_WriteCfg();
      008B48 CD 88 45         [ 4]  323 	call	_sys_WriteCfg
                                    324 ;	user/system.c: 72: led_change(LED_OFF, 0);
      008B4B 4B 00            [ 1]  325 	push	#0x00
      008B4D 4B 00            [ 1]  326 	push	#0x00
      008B4F CD 83 1F         [ 4]  327 	call	_led_change
      008B52 85               [ 2]  328 	popw	x
                                    329 ;	user/system.c: 73: info("\r\nClear all key.....");
      008B53 AE 8C 1E         [ 2]  330 	ldw	x, #___str_1+0
      008B56 89               [ 2]  331 	pushw	x
      008B57 CD 81 2B         [ 4]  332 	call	_info
      008B5A 85               [ 2]  333 	popw	x
      008B5B                        334 00118$:
                                    335 ;	user/system.c: 76: if(sys.setTimeOut != 0)
      008B5B 1E 19            [ 2]  336 	ldw	x, (0x19, sp)
      008B5D 89               [ 2]  337 	pushw	x
      008B5E EE 02            [ 2]  338 	ldw	x, (0x2, x)
      008B60 51               [ 1]  339 	exgw	x, y
      008B61 85               [ 2]  340 	popw	x
      008B62 FE               [ 2]  341 	ldw	x, (x)
      008B63 90 5D            [ 2]  342 	tnzw	y
      008B65 26 06            [ 1]  343 	jrne	00232$
      008B67 5D               [ 2]  344 	tnzw	x
      008B68 26 03            [ 1]  345 	jrne	00232$
      008B6A CC 8B FB         [ 2]  346 	jp	00127$
      008B6D                        347 00232$:
                                    348 ;	user/system.c: 78: sys.setTimeOut--;
      008B6D 72 A2 00 01      [ 2]  349 	subw	y, #0x0001
      008B71 9F               [ 1]  350 	ld	a, xl
      008B72 A2 00            [ 1]  351 	sbc	a, #0x00
      008B74 6B 09            [ 1]  352 	ld	(0x09, sp), a
      008B76 9E               [ 1]  353 	ld	a, xh
      008B77 A2 00            [ 1]  354 	sbc	a, #0x00
      008B79 6B 08            [ 1]  355 	ld	(0x08, sp), a
      008B7B 1E 19            [ 2]  356 	ldw	x, (0x19, sp)
      008B7D EF 02            [ 2]  357 	ldw	(0x2, x), y
      008B7F 16 08            [ 2]  358 	ldw	y, (0x08, sp)
      008B81 FF               [ 2]  359 	ldw	(x), y
                                    360 ;	user/system.c: 79: if(sys.idKeyGet != 0)
      008B82 1E 15            [ 2]  361 	ldw	x, (0x15, sp)
      008B84 89               [ 2]  362 	pushw	x
      008B85 EE 02            [ 2]  363 	ldw	x, (0x2, x)
      008B87 51               [ 1]  364 	exgw	x, y
      008B88 85               [ 2]  365 	popw	x
      008B89 FE               [ 2]  366 	ldw	x, (x)
      008B8A 90 5D            [ 2]  367 	tnzw	y
      008B8C 26 03            [ 1]  368 	jrne	00233$
      008B8E 5D               [ 2]  369 	tnzw	x
      008B8F 27 78            [ 1]  370 	jreq	00135$
      008B91                        371 00233$:
                                    372 ;	user/system.c: 81: sys.setTimeOut = 600;
      008B91 1E 19            [ 2]  373 	ldw	x, (0x19, sp)
      008B93 90 AE 02 58      [ 2]  374 	ldw	y, #0x0258
      008B97 EF 02            [ 2]  375 	ldw	(0x2, x), y
      008B99 6F 01            [ 1]  376 	clr	(0x1, x)
      008B9B 7F               [ 1]  377 	clr	(x)
                                    378 ;	user/system.c: 82: if(system_checkID(sys.idKeyGet) == 0)
      008B9C 1E 15            [ 2]  379 	ldw	x, (0x15, sp)
      008B9E 89               [ 2]  380 	pushw	x
      008B9F EE 02            [ 2]  381 	ldw	x, (0x2, x)
      008BA1 51               [ 1]  382 	exgw	x, y
      008BA2 85               [ 2]  383 	popw	x
      008BA3 FE               [ 2]  384 	ldw	x, (x)
      008BA4 90 89            [ 2]  385 	pushw	y
      008BA6 89               [ 2]  386 	pushw	x
      008BA7 CD 89 DF         [ 4]  387 	call	_system_checkID
      008BAA 5B 04            [ 2]  388 	addw	sp, #4
      008BAC 6B 07            [ 1]  389 	ld	(0x07, sp), a
      008BAE 0D 07            [ 1]  390 	tnz	(0x07, sp)
      008BB0 26 40            [ 1]  391 	jrne	00123$
                                    392 ;	user/system.c: 84: info("\r\nSave key.....");
      008BB2 AE 8C 33         [ 2]  393 	ldw	x, #___str_2+0
      008BB5 89               [ 2]  394 	pushw	x
      008BB6 CD 81 2B         [ 4]  395 	call	_info
      008BB9 85               [ 2]  396 	popw	x
                                    397 ;	user/system.c: 85: sysCfg.id[sysCfg.idLen] = sys.idKeyGet;
      008BBA 1E 10            [ 2]  398 	ldw	x, (0x10, sp)
      008BBC FE               [ 2]  399 	ldw	x, (x)
      008BBD 58               [ 2]  400 	sllw	x
      008BBE 58               [ 2]  401 	sllw	x
      008BBF 72 FB 0E         [ 2]  402 	addw	x, (0x0e, sp)
      008BC2 1F 05            [ 2]  403 	ldw	(0x05, sp), x
      008BC4 1E 15            [ 2]  404 	ldw	x, (0x15, sp)
      008BC6 89               [ 2]  405 	pushw	x
      008BC7 EE 02            [ 2]  406 	ldw	x, (0x2, x)
      008BC9 51               [ 1]  407 	exgw	x, y
      008BCA 85               [ 2]  408 	popw	x
      008BCB FE               [ 2]  409 	ldw	x, (x)
      008BCC 1F 01            [ 2]  410 	ldw	(0x01, sp), x
      008BCE 1E 05            [ 2]  411 	ldw	x, (0x05, sp)
      008BD0 EF 02            [ 2]  412 	ldw	(0x2, x), y
      008BD2 16 01            [ 2]  413 	ldw	y, (0x01, sp)
      008BD4 FF               [ 2]  414 	ldw	(x), y
                                    415 ;	user/system.c: 86: if(++sysCfg.idLen >= MAX_KEY_ID_LEN)sysCfg.idLen = 0;
      008BD5 1E 10            [ 2]  416 	ldw	x, (0x10, sp)
      008BD7 FE               [ 2]  417 	ldw	x, (x)
      008BD8 5C               [ 2]  418 	incw	x
      008BD9 16 10            [ 2]  419 	ldw	y, (0x10, sp)
      008BDB 90 FF            [ 2]  420 	ldw	(y), x
      008BDD A3 00 05         [ 2]  421 	cpw	x, #0x0005
      008BE0 25 05            [ 1]  422 	jrc	00121$
      008BE2 1E 10            [ 2]  423 	ldw	x, (0x10, sp)
      008BE4 6F 01            [ 1]  424 	clr	(0x1, x)
      008BE6 7F               [ 1]  425 	clr	(x)
      008BE7                        426 00121$:
                                    427 ;	user/system.c: 87: sys_WriteCfg();
      008BE7 CD 88 45         [ 4]  428 	call	_sys_WriteCfg
                                    429 ;	user/system.c: 88: led_change(LED_FLASH, 10);
      008BEA 4B 0A            [ 1]  430 	push	#0x0a
      008BEC 4B 02            [ 1]  431 	push	#0x02
      008BEE CD 83 1F         [ 4]  432 	call	_led_change
      008BF1 85               [ 2]  433 	popw	x
      008BF2                        434 00123$:
                                    435 ;	user/system.c: 90: sys.idKeyGet = 0;
      008BF2 1E 15            [ 2]  436 	ldw	x, (0x15, sp)
      008BF4 90 5F            [ 1]  437 	clrw	y
      008BF6 EF 02            [ 2]  438 	ldw	(0x2, x), y
      008BF8 FF               [ 2]  439 	ldw	(x), y
      008BF9 20 0E            [ 2]  440 	jra	00135$
      008BFB                        441 00127$:
                                    442 ;	user/system.c: 95: sys.keyPressTime = 0;
      008BFB 1E 1B            [ 2]  443 	ldw	x, (0x1b, sp)
      008BFD 7F               [ 1]  444 	clr	(x)
                                    445 ;	user/system.c: 96: sys.mode = SYS_NOMAL;
      008BFE 1E 1E            [ 2]  446 	ldw	x, (0x1e, sp)
      008C00 7F               [ 1]  447 	clr	(x)
                                    448 ;	user/system.c: 97: led_change(LED_OFF, 0);
      008C01 4B 00            [ 1]  449 	push	#0x00
      008C03 4B 00            [ 1]  450 	push	#0x00
      008C05 CD 83 1F         [ 4]  451 	call	_led_change
      008C08 85               [ 2]  452 	popw	x
                                    453 ;	user/system.c: 100: }
      008C09                        454 00135$:
      008C09 5B 1F            [ 2]  455 	addw	sp, #31
      008C0B 81               [ 4]  456 	ret
                                    457 	.area CODE
      008C0C                        458 ___str_0:
      008C0C 0D                     459 	.db 0x0d
      008C0D 0A                     460 	.db 0x0a
      008C0E 53 65 74 20 6B 65 79   461 	.ascii "Set key id....."
             20 69 64 2E 2E 2E 2E
             2E
      008C1D 00                     462 	.db 0x00
      008C1E                        463 ___str_1:
      008C1E 0D                     464 	.db 0x0d
      008C1F 0A                     465 	.db 0x0a
      008C20 43 6C 65 61 72 20 61   466 	.ascii "Clear all key....."
             6C 6C 20 6B 65 79 2E
             2E 2E 2E 2E
      008C32 00                     467 	.db 0x00
      008C33                        468 ___str_2:
      008C33 0D                     469 	.db 0x0d
      008C34 0A                     470 	.db 0x0a
      008C35 53 61 76 65 20 6B 65   471 	.ascii "Save key....."
             79 2E 2E 2E 2E 2E
      008C42 00                     472 	.db 0x00
                                    473 	.area INITIALIZER
                                    474 	.area CABS (ABS)
