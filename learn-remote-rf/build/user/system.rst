                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.6.0 #9615 (MINGW64)
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
      0089C4                         56 _system_init:
                                     57 ;	user/system.c: 13: sys.mode = SYS_NOMAL;
      0089C4 AE 00 CC         [ 2]   58 	ldw	x, #_sys+0
      0089C7 7F               [ 1]   59 	clr	(x)
                                     60 ;	user/system.c: 14: TIMER_InitTime(&sys.tick);
      0089C8 AE 00 D1         [ 2]   61 	ldw	x, #_sys+5
      0089CB 89               [ 2]   62 	pushw	x
      0089CC CD 8C 8F         [ 4]   63 	call	_TIMER_InitTime
      0089CF 85               [ 2]   64 	popw	x
      0089D0 81               [ 4]   65 	ret
                                     66 ;	user/system.c: 17: uint8_t system_checkID(uint32_t idGet)
                                     67 ;	-----------------------------------------
                                     68 ;	 function system_checkID
                                     69 ;	-----------------------------------------
      0089D1                         70 _system_checkID:
      0089D1 52 07            [ 2]   71 	sub	sp, #7
                                     72 ;	user/system.c: 20: for(id = 0; id < MAX_KEY_ID_LEN; id++)
      0089D3 AE 00 B8         [ 2]   73 	ldw	x, #_sysCfg+4
      0089D6 1F 06            [ 2]   74 	ldw	(0x06, sp), x
      0089D8 0F 01            [ 1]   75 	clr	(0x01, sp)
      0089DA                         76 00104$:
                                     77 ;	user/system.c: 22: if(idGet == sysCfg.id[id])
      0089DA 7B 01            [ 1]   78 	ld	a, (0x01, sp)
      0089DC 48               [ 1]   79 	sll	a
      0089DD 48               [ 1]   80 	sll	a
      0089DE 5F               [ 1]   81 	clrw	x
      0089DF 97               [ 1]   82 	ld	xl, a
      0089E0 72 FB 06         [ 2]   83 	addw	x, (0x06, sp)
      0089E3 E6 03            [ 1]   84 	ld	a, (0x3, x)
      0089E5 6B 05            [ 1]   85 	ld	(0x05, sp), a
      0089E7 E6 02            [ 1]   86 	ld	a, (0x2, x)
      0089E9 6B 04            [ 1]   87 	ld	(0x04, sp), a
      0089EB FE               [ 2]   88 	ldw	x, (x)
      0089EC 1F 02            [ 2]   89 	ldw	(0x02, sp), x
      0089EE 1E 0C            [ 2]   90 	ldw	x, (0x0c, sp)
      0089F0 13 04            [ 2]   91 	cpw	x, (0x04, sp)
      0089F2 26 0A            [ 1]   92 	jrne	00105$
      0089F4 1E 0A            [ 2]   93 	ldw	x, (0x0a, sp)
      0089F6 13 02            [ 2]   94 	cpw	x, (0x02, sp)
      0089F8 26 04            [ 1]   95 	jrne	00105$
                                     96 ;	user/system.c: 23: return 1;
      0089FA A6 01            [ 1]   97 	ld	a, #0x01
      0089FC 20 09            [ 2]   98 	jra	00106$
      0089FE                         99 00105$:
                                    100 ;	user/system.c: 20: for(id = 0; id < MAX_KEY_ID_LEN; id++)
      0089FE 0C 01            [ 1]  101 	inc	(0x01, sp)
      008A00 7B 01            [ 1]  102 	ld	a, (0x01, sp)
      008A02 A1 05            [ 1]  103 	cp	a, #0x05
      008A04 25 D4            [ 1]  104 	jrc	00104$
                                    105 ;	user/system.c: 25: return 0;
      008A06 4F               [ 1]  106 	clr	a
      008A07                        107 00106$:
      008A07 5B 07            [ 2]  108 	addw	sp, #7
      008A09 81               [ 4]  109 	ret
                                    110 ;	user/system.c: 28: void system_manager(void)
                                    111 ;	-----------------------------------------
                                    112 ;	 function system_manager
                                    113 ;	-----------------------------------------
      008A0A                        114 _system_manager:
      008A0A 52 1E            [ 2]  115 	sub	sp, #30
                                    116 ;	user/system.c: 31: if(!TIMER_CheckTimeMS(&sys.tick, 100)){
      008A0C AE 00 CC         [ 2]  117 	ldw	x, #_sys+0
      008A0F 1F 07            [ 2]  118 	ldw	(0x07, sp), x
      008A11 1E 07            [ 2]  119 	ldw	x, (0x07, sp)
      008A13 1C 00 05         [ 2]  120 	addw	x, #0x0005
      008A16 4B 64            [ 1]  121 	push	#0x64
      008A18 4B 00            [ 1]  122 	push	#0x00
      008A1A 4B 00            [ 1]  123 	push	#0x00
      008A1C 4B 00            [ 1]  124 	push	#0x00
      008A1E 89               [ 2]  125 	pushw	x
      008A1F CD 8C E6         [ 4]  126 	call	_TIMER_CheckTimeMS
      008A22 5B 06            [ 2]  127 	addw	sp, #6
      008A24 6B 01            [ 1]  128 	ld	(0x01, sp), a
      008A26 0D 01            [ 1]  129 	tnz	(0x01, sp)
      008A28 27 03            [ 1]  130 	jreq	00209$
      008A2A CC 8B F5         [ 2]  131 	jp	00135$
      008A2D                        132 00209$:
                                    133 ;	user/system.c: 32: switch(sys.mode)
      008A2D 1E 07            [ 2]  134 	ldw	x, (0x07, sp)
      008A2F F6               [ 1]  135 	ld	a, (x)
                                    136 ;	user/system.c: 38: if(++sys.keyPressTime > 30)
      008A30 1E 07            [ 2]  137 	ldw	x, (0x07, sp)
      008A32 1C 00 0F         [ 2]  138 	addw	x, #0x000f
      008A35 1F 0D            [ 2]  139 	ldw	(0x0d, sp), x
                                    140 ;	user/system.c: 41: sys.setTimeOut = 600;
      008A37 1E 07            [ 2]  141 	ldw	x, (0x07, sp)
      008A39 1C 00 0B         [ 2]  142 	addw	x, #0x000b
      008A3C 1F 03            [ 2]  143 	ldw	(0x03, sp), x
                                    144 ;	user/system.c: 43: sys.keyReleaseTime = 100;
      008A3E 1E 07            [ 2]  145 	ldw	x, (0x07, sp)
      008A40 1C 00 10         [ 2]  146 	addw	x, #0x0010
      008A43 1F 1B            [ 2]  147 	ldw	(0x1b, sp), x
                                    148 ;	user/system.c: 44: sys.idKeyGet = 0;
      008A45 1E 07            [ 2]  149 	ldw	x, (0x07, sp)
      008A47 5C               [ 2]  150 	incw	x
      008A48 1F 1D            [ 2]  151 	ldw	(0x1d, sp), x
                                    152 ;	user/system.c: 32: switch(sys.mode)
      008A4A A1 00            [ 1]  153 	cp	a, #0x00
      008A4C 27 07            [ 1]  154 	jreq	00101$
      008A4E A1 01            [ 1]  155 	cp	a, #0x01
      008A50 27 6A            [ 1]  156 	jreq	00108$
      008A52 CC 8B F5         [ 2]  157 	jp	00135$
                                    158 ;	user/system.c: 34: case SYS_NOMAL:
      008A55                        159 00101$:
                                    160 ;	user/system.c: 35: keyGet = tp_get(TP_SET);
      008A55 4B 00            [ 1]  161 	push	#0x00
      008A57 CD 82 AB         [ 4]  162 	call	_tp_get
      008A5A 5B 01            [ 2]  163 	addw	sp, #1
                                    164 ;	user/system.c: 36: if(keyGet == TP_PRESS)
      008A5C A1 01            [ 1]  165 	cp	a, #0x01
      008A5E 26 38            [ 1]  166 	jrne	00105$
                                    167 ;	user/system.c: 38: if(++sys.keyPressTime > 30)
      008A60 1E 0D            [ 2]  168 	ldw	x, (0x0d, sp)
      008A62 F6               [ 1]  169 	ld	a, (x)
      008A63 4C               [ 1]  170 	inc	a
      008A64 F7               [ 1]  171 	ld	(x), a
      008A65 A1 1E            [ 1]  172 	cp	a, #0x1e
      008A67 23 2F            [ 2]  173 	jrule	00105$
                                    174 ;	user/system.c: 40: sys.mode = SYS_SET_ID;
      008A69 1E 07            [ 2]  175 	ldw	x, (0x07, sp)
      008A6B A6 01            [ 1]  176 	ld	a, #0x01
      008A6D F7               [ 1]  177 	ld	(x), a
                                    178 ;	user/system.c: 41: sys.setTimeOut = 600;
      008A6E 1E 03            [ 2]  179 	ldw	x, (0x03, sp)
      008A70 90 AE 02 58      [ 2]  180 	ldw	y, #0x0258
      008A74 EF 02            [ 2]  181 	ldw	(0x2, x), y
      008A76 6F 01            [ 1]  182 	clr	(0x1, x)
      008A78 7F               [ 1]  183 	clr	(x)
                                    184 ;	user/system.c: 42: sys.keyPressTime = 0;
      008A79 1E 0D            [ 2]  185 	ldw	x, (0x0d, sp)
      008A7B 7F               [ 1]  186 	clr	(x)
                                    187 ;	user/system.c: 43: sys.keyReleaseTime = 100;
      008A7C 1E 1B            [ 2]  188 	ldw	x, (0x1b, sp)
      008A7E A6 64            [ 1]  189 	ld	a, #0x64
      008A80 F7               [ 1]  190 	ld	(x), a
                                    191 ;	user/system.c: 44: sys.idKeyGet = 0;
      008A81 1E 1D            [ 2]  192 	ldw	x, (0x1d, sp)
      008A83 90 5F            [ 1]  193 	clrw	y
      008A85 EF 02            [ 2]  194 	ldw	(0x2, x), y
      008A87 FF               [ 2]  195 	ldw	(x), y
                                    196 ;	user/system.c: 45: led_change(LED_ON, 0);
      008A88 4B 00            [ 1]  197 	push	#0x00
      008A8A 4B 01            [ 1]  198 	push	#0x01
      008A8C CD 83 1E         [ 4]  199 	call	_led_change
      008A8F 85               [ 2]  200 	popw	x
                                    201 ;	user/system.c: 46: info("\r\nSet key id.....");
      008A90 AE 8B F8         [ 2]  202 	ldw	x, #___str_0+0
      008A93 89               [ 2]  203 	pushw	x
      008A94 CD 81 2B         [ 4]  204 	call	_info
      008A97 85               [ 2]  205 	popw	x
      008A98                        206 00105$:
                                    207 ;	user/system.c: 49: if(sys.idKeyGet != 0)
      008A98 1E 1D            [ 2]  208 	ldw	x, (0x1d, sp)
      008A9A 89               [ 2]  209 	pushw	x
      008A9B EE 02            [ 2]  210 	ldw	x, (0x2, x)
      008A9D 51               [ 1]  211 	exgw	x, y
      008A9E 85               [ 2]  212 	popw	x
      008A9F FE               [ 2]  213 	ldw	x, (x)
      008AA0 90 5D            [ 2]  214 	tnzw	y
      008AA2 26 06            [ 1]  215 	jrne	00220$
      008AA4 5D               [ 2]  216 	tnzw	x
      008AA5 26 03            [ 1]  217 	jrne	00220$
      008AA7 CC 8B F5         [ 2]  218 	jp	00135$
      008AAA                        219 00220$:
                                    220 ;	user/system.c: 51: sys.idKeyGet = 0;
      008AAA 1E 1D            [ 2]  221 	ldw	x, (0x1d, sp)
      008AAC 90 5F            [ 1]  222 	clrw	y
      008AAE EF 02            [ 2]  223 	ldw	(0x2, x), y
      008AB0 FF               [ 2]  224 	ldw	(x), y
                                    225 ;	user/system.c: 52: led_change(LED_FLASH, 10);
      008AB1 4B 0A            [ 1]  226 	push	#0x0a
      008AB3 4B 02            [ 1]  227 	push	#0x02
      008AB5 CD 83 1E         [ 4]  228 	call	_led_change
      008AB8 85               [ 2]  229 	popw	x
                                    230 ;	user/system.c: 54: break;
      008AB9 CC 8B F5         [ 2]  231 	jp	00135$
                                    232 ;	user/system.c: 55: case SYS_SET_ID:
      008ABC                        233 00108$:
                                    234 ;	user/system.c: 56: if((sysCfg.idLen != 0)&&(led_getstatus() != LED_FLASH))
      008ABC AE 00 B4         [ 2]  235 	ldw	x, #_sysCfg+0
      008ABF 1F 15            [ 2]  236 	ldw	(0x15, sp), x
      008AC1 1E 15            [ 2]  237 	ldw	x, (0x15, sp)
      008AC3 5C               [ 2]  238 	incw	x
      008AC4 5C               [ 2]  239 	incw	x
      008AC5 1F 05            [ 2]  240 	ldw	(0x05, sp), x
      008AC7 1E 05            [ 2]  241 	ldw	x, (0x05, sp)
      008AC9 FE               [ 2]  242 	ldw	x, (x)
      008ACA 5D               [ 2]  243 	tnzw	x
      008ACB 27 0F            [ 1]  244 	jreq	00110$
      008ACD CD 83 32         [ 4]  245 	call	_led_getstatus
      008AD0 A1 02            [ 1]  246 	cp	a, #0x02
      008AD2 27 08            [ 1]  247 	jreq	00110$
                                    248 ;	user/system.c: 57: led_change(LED_ON, 0);
      008AD4 4B 00            [ 1]  249 	push	#0x00
      008AD6 4B 01            [ 1]  250 	push	#0x01
      008AD8 CD 83 1E         [ 4]  251 	call	_led_change
      008ADB 85               [ 2]  252 	popw	x
      008ADC                        253 00110$:
                                    254 ;	user/system.c: 58: if(sys.keyReleaseTime != 0)
      008ADC 1E 1B            [ 2]  255 	ldw	x, (0x1b, sp)
      008ADE F6               [ 1]  256 	ld	a, (x)
      008ADF 4D               [ 1]  257 	tnz	a
      008AE0 27 07            [ 1]  258 	jreq	00113$
                                    259 ;	user/system.c: 60: sys.keyReleaseTime--;
      008AE2 4A               [ 1]  260 	dec	a
      008AE3 1E 1B            [ 2]  261 	ldw	x, (0x1b, sp)
      008AE5 F7               [ 1]  262 	ld	(x), a
                                    263 ;	user/system.c: 61: sys.keyPressTime = 0;
      008AE6 1E 0D            [ 2]  264 	ldw	x, (0x0d, sp)
      008AE8 7F               [ 1]  265 	clr	(x)
      008AE9                        266 00113$:
                                    267 ;	user/system.c: 63: keyGet = tp_get(TP_SET);
      008AE9 4B 00            [ 1]  268 	push	#0x00
      008AEB CD 82 AB         [ 4]  269 	call	_tp_get
      008AEE 5B 01            [ 2]  270 	addw	sp, #1
                                    271 ;	user/system.c: 68: for(sysCfg.idLen = 0; sysCfg.idLen < MAX_KEY_ID_LEN; sysCfg.idLen++)
      008AF0 1E 15            [ 2]  272 	ldw	x, (0x15, sp)
      008AF2 1C 00 04         [ 2]  273 	addw	x, #0x0004
      008AF5 1F 19            [ 2]  274 	ldw	(0x19, sp), x
                                    275 ;	user/system.c: 64: if((keyGet == TP_PRESS)&&(sys.keyReleaseTime == 0))
      008AF7 A1 01            [ 1]  276 	cp	a, #0x01
      008AF9 26 4C            [ 1]  277 	jrne	00118$
      008AFB 1E 1B            [ 2]  278 	ldw	x, (0x1b, sp)
      008AFD F6               [ 1]  279 	ld	a, (x)
      008AFE 4D               [ 1]  280 	tnz	a
      008AFF 26 46            [ 1]  281 	jrne	00118$
                                    282 ;	user/system.c: 66: if(++sys.keyPressTime > 10)
      008B01 1E 0D            [ 2]  283 	ldw	x, (0x0d, sp)
      008B03 F6               [ 1]  284 	ld	a, (x)
      008B04 4C               [ 1]  285 	inc	a
      008B05 F7               [ 1]  286 	ld	(x), a
      008B06 A1 0A            [ 1]  287 	cp	a, #0x0a
      008B08 23 3D            [ 2]  288 	jrule	00118$
                                    289 ;	user/system.c: 68: for(sysCfg.idLen = 0; sysCfg.idLen < MAX_KEY_ID_LEN; sysCfg.idLen++)
      008B0A 1E 05            [ 2]  290 	ldw	x, (0x05, sp)
      008B0C 6F 01            [ 1]  291 	clr	(0x1, x)
      008B0E 7F               [ 1]  292 	clr	(x)
      008B0F 16 19            [ 2]  293 	ldw	y, (0x19, sp)
      008B11 17 17            [ 2]  294 	ldw	(0x17, sp), y
      008B13                        295 00133$:
      008B13 1E 05            [ 2]  296 	ldw	x, (0x05, sp)
      008B15 FE               [ 2]  297 	ldw	x, (x)
      008B16 A3 00 05         [ 2]  298 	cpw	x, #0x0005
      008B19 24 14            [ 1]  299 	jrnc	00114$
                                    300 ;	user/system.c: 69: sysCfg.id[sysCfg.idLen] = 0;
      008B1B 58               [ 2]  301 	sllw	x
      008B1C 58               [ 2]  302 	sllw	x
      008B1D 72 FB 17         [ 2]  303 	addw	x, (0x17, sp)
      008B20 90 5F            [ 1]  304 	clrw	y
      008B22 EF 02            [ 2]  305 	ldw	(0x2, x), y
      008B24 FF               [ 2]  306 	ldw	(x), y
                                    307 ;	user/system.c: 68: for(sysCfg.idLen = 0; sysCfg.idLen < MAX_KEY_ID_LEN; sysCfg.idLen++)
      008B25 1E 05            [ 2]  308 	ldw	x, (0x05, sp)
      008B27 FE               [ 2]  309 	ldw	x, (x)
      008B28 5C               [ 2]  310 	incw	x
      008B29 16 05            [ 2]  311 	ldw	y, (0x05, sp)
      008B2B 90 FF            [ 2]  312 	ldw	(y), x
      008B2D 20 E4            [ 2]  313 	jra	00133$
      008B2F                        314 00114$:
                                    315 ;	user/system.c: 70: sysCfg.idLen = 0;
      008B2F 1E 05            [ 2]  316 	ldw	x, (0x05, sp)
      008B31 6F 01            [ 1]  317 	clr	(0x1, x)
      008B33 7F               [ 1]  318 	clr	(x)
                                    319 ;	user/system.c: 71: sys_WriteCfg();
      008B34 CD 88 37         [ 4]  320 	call	_sys_WriteCfg
                                    321 ;	user/system.c: 72: led_change(LED_OFF, 0);
      008B37 4B 00            [ 1]  322 	push	#0x00
      008B39 4B 00            [ 1]  323 	push	#0x00
      008B3B CD 83 1E         [ 4]  324 	call	_led_change
      008B3E 85               [ 2]  325 	popw	x
                                    326 ;	user/system.c: 73: info("\r\nClear all key.....");
      008B3F AE 8C 0A         [ 2]  327 	ldw	x, #___str_1+0
      008B42 89               [ 2]  328 	pushw	x
      008B43 CD 81 2B         [ 4]  329 	call	_info
      008B46 85               [ 2]  330 	popw	x
      008B47                        331 00118$:
                                    332 ;	user/system.c: 76: if(sys.setTimeOut != 0)
      008B47 1E 03            [ 2]  333 	ldw	x, (0x03, sp)
      008B49 89               [ 2]  334 	pushw	x
      008B4A EE 02            [ 2]  335 	ldw	x, (0x2, x)
      008B4C 51               [ 1]  336 	exgw	x, y
      008B4D 85               [ 2]  337 	popw	x
      008B4E FE               [ 2]  338 	ldw	x, (x)
      008B4F 90 5D            [ 2]  339 	tnzw	y
      008B51 26 06            [ 1]  340 	jrne	00232$
      008B53 5D               [ 2]  341 	tnzw	x
      008B54 26 03            [ 1]  342 	jrne	00232$
      008B56 CC 8B E7         [ 2]  343 	jp	00127$
      008B59                        344 00232$:
                                    345 ;	user/system.c: 78: sys.setTimeOut--;
      008B59 72 A2 00 01      [ 2]  346 	subw	y, #0x0001
      008B5D 9F               [ 1]  347 	ld	a, xl
      008B5E A2 00            [ 1]  348 	sbc	a, #0x00
      008B60 6B 0A            [ 1]  349 	ld	(0x0a, sp), a
      008B62 9E               [ 1]  350 	ld	a, xh
      008B63 A2 00            [ 1]  351 	sbc	a, #0x00
      008B65 6B 09            [ 1]  352 	ld	(0x09, sp), a
      008B67 1E 03            [ 2]  353 	ldw	x, (0x03, sp)
      008B69 EF 02            [ 2]  354 	ldw	(0x2, x), y
      008B6B 16 09            [ 2]  355 	ldw	y, (0x09, sp)
      008B6D FF               [ 2]  356 	ldw	(x), y
                                    357 ;	user/system.c: 79: if(sys.idKeyGet != 0)
      008B6E 1E 1D            [ 2]  358 	ldw	x, (0x1d, sp)
      008B70 89               [ 2]  359 	pushw	x
      008B71 EE 02            [ 2]  360 	ldw	x, (0x2, x)
      008B73 51               [ 1]  361 	exgw	x, y
      008B74 85               [ 2]  362 	popw	x
      008B75 FE               [ 2]  363 	ldw	x, (x)
      008B76 90 5D            [ 2]  364 	tnzw	y
      008B78 26 03            [ 1]  365 	jrne	00233$
      008B7A 5D               [ 2]  366 	tnzw	x
      008B7B 27 78            [ 1]  367 	jreq	00135$
      008B7D                        368 00233$:
                                    369 ;	user/system.c: 81: sys.setTimeOut = 600;
      008B7D 1E 03            [ 2]  370 	ldw	x, (0x03, sp)
      008B7F 90 AE 02 58      [ 2]  371 	ldw	y, #0x0258
      008B83 EF 02            [ 2]  372 	ldw	(0x2, x), y
      008B85 6F 01            [ 1]  373 	clr	(0x1, x)
      008B87 7F               [ 1]  374 	clr	(x)
                                    375 ;	user/system.c: 82: if(system_checkID(sys.idKeyGet) == 0)
      008B88 1E 1D            [ 2]  376 	ldw	x, (0x1d, sp)
      008B8A 89               [ 2]  377 	pushw	x
      008B8B EE 02            [ 2]  378 	ldw	x, (0x2, x)
      008B8D 51               [ 1]  379 	exgw	x, y
      008B8E 85               [ 2]  380 	popw	x
      008B8F FE               [ 2]  381 	ldw	x, (x)
      008B90 90 89            [ 2]  382 	pushw	y
      008B92 89               [ 2]  383 	pushw	x
      008B93 CD 89 D1         [ 4]  384 	call	_system_checkID
      008B96 5B 04            [ 2]  385 	addw	sp, #4
      008B98 6B 02            [ 1]  386 	ld	(0x02, sp), a
      008B9A 0D 02            [ 1]  387 	tnz	(0x02, sp)
      008B9C 26 40            [ 1]  388 	jrne	00123$
                                    389 ;	user/system.c: 84: info("\r\nSave key.....");
      008B9E AE 8C 1F         [ 2]  390 	ldw	x, #___str_2+0
      008BA1 89               [ 2]  391 	pushw	x
      008BA2 CD 81 2B         [ 4]  392 	call	_info
      008BA5 85               [ 2]  393 	popw	x
                                    394 ;	user/system.c: 85: sysCfg.id[sysCfg.idLen] = sys.idKeyGet;
      008BA6 1E 05            [ 2]  395 	ldw	x, (0x05, sp)
      008BA8 FE               [ 2]  396 	ldw	x, (x)
      008BA9 58               [ 2]  397 	sllw	x
      008BAA 58               [ 2]  398 	sllw	x
      008BAB 72 FB 19         [ 2]  399 	addw	x, (0x19, sp)
      008BAE 1F 13            [ 2]  400 	ldw	(0x13, sp), x
      008BB0 1E 1D            [ 2]  401 	ldw	x, (0x1d, sp)
      008BB2 89               [ 2]  402 	pushw	x
      008BB3 EE 02            [ 2]  403 	ldw	x, (0x2, x)
      008BB5 51               [ 1]  404 	exgw	x, y
      008BB6 85               [ 2]  405 	popw	x
      008BB7 FE               [ 2]  406 	ldw	x, (x)
      008BB8 1F 0F            [ 2]  407 	ldw	(0x0f, sp), x
      008BBA 1E 13            [ 2]  408 	ldw	x, (0x13, sp)
      008BBC EF 02            [ 2]  409 	ldw	(0x2, x), y
      008BBE 16 0F            [ 2]  410 	ldw	y, (0x0f, sp)
      008BC0 FF               [ 2]  411 	ldw	(x), y
                                    412 ;	user/system.c: 86: if(++sysCfg.idLen >= MAX_KEY_ID_LEN)sysCfg.idLen = 0;
      008BC1 1E 05            [ 2]  413 	ldw	x, (0x05, sp)
      008BC3 FE               [ 2]  414 	ldw	x, (x)
      008BC4 5C               [ 2]  415 	incw	x
      008BC5 16 05            [ 2]  416 	ldw	y, (0x05, sp)
      008BC7 90 FF            [ 2]  417 	ldw	(y), x
      008BC9 A3 00 05         [ 2]  418 	cpw	x, #0x0005
      008BCC 25 05            [ 1]  419 	jrc	00121$
      008BCE 1E 05            [ 2]  420 	ldw	x, (0x05, sp)
      008BD0 6F 01            [ 1]  421 	clr	(0x1, x)
      008BD2 7F               [ 1]  422 	clr	(x)
      008BD3                        423 00121$:
                                    424 ;	user/system.c: 87: sys_WriteCfg();
      008BD3 CD 88 37         [ 4]  425 	call	_sys_WriteCfg
                                    426 ;	user/system.c: 88: led_change(LED_FLASH, 10);
      008BD6 4B 0A            [ 1]  427 	push	#0x0a
      008BD8 4B 02            [ 1]  428 	push	#0x02
      008BDA CD 83 1E         [ 4]  429 	call	_led_change
      008BDD 85               [ 2]  430 	popw	x
      008BDE                        431 00123$:
                                    432 ;	user/system.c: 90: sys.idKeyGet = 0;
      008BDE 1E 1D            [ 2]  433 	ldw	x, (0x1d, sp)
      008BE0 90 5F            [ 1]  434 	clrw	y
      008BE2 EF 02            [ 2]  435 	ldw	(0x2, x), y
      008BE4 FF               [ 2]  436 	ldw	(x), y
      008BE5 20 0E            [ 2]  437 	jra	00135$
      008BE7                        438 00127$:
                                    439 ;	user/system.c: 95: sys.keyPressTime = 0;
      008BE7 1E 0D            [ 2]  440 	ldw	x, (0x0d, sp)
      008BE9 7F               [ 1]  441 	clr	(x)
                                    442 ;	user/system.c: 96: sys.mode = SYS_NOMAL;
      008BEA 1E 07            [ 2]  443 	ldw	x, (0x07, sp)
      008BEC 7F               [ 1]  444 	clr	(x)
                                    445 ;	user/system.c: 97: led_change(LED_OFF, 0);
      008BED 4B 00            [ 1]  446 	push	#0x00
      008BEF 4B 00            [ 1]  447 	push	#0x00
      008BF1 CD 83 1E         [ 4]  448 	call	_led_change
      008BF4 85               [ 2]  449 	popw	x
                                    450 ;	user/system.c: 100: }
      008BF5                        451 00135$:
      008BF5 5B 1E            [ 2]  452 	addw	sp, #30
      008BF7 81               [ 4]  453 	ret
                                    454 	.area CODE
      008BF8                        455 ___str_0:
      008BF8 0D                     456 	.db 0x0d
      008BF9 0A                     457 	.db 0x0a
      008BFA 53 65 74 20 6B 65 79   458 	.ascii "Set key id....."
             20 69 64 2E 2E 2E 2E
             2E
      008C09 00                     459 	.db 0x00
      008C0A                        460 ___str_1:
      008C0A 0D                     461 	.db 0x0d
      008C0B 0A                     462 	.db 0x0a
      008C0C 43 6C 65 61 72 20 61   463 	.ascii "Clear all key....."
             6C 6C 20 6B 65 79 2E
             2E 2E 2E 2E
      008C1E 00                     464 	.db 0x00
      008C1F                        465 ___str_2:
      008C1F 0D                     466 	.db 0x0d
      008C20 0A                     467 	.db 0x0a
      008C21 53 61 76 65 20 6B 65   468 	.ascii "Save key....."
             79 2E 2E 2E 2E 2E
      008C2E 00                     469 	.db 0x00
                                    470 	.area INITIALIZER
                                    471 	.area CABS (ABS)
