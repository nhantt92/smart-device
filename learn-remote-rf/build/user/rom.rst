                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.6.0 #9615 (Mac OS X x86_64)
                                      4 ;--------------------------------------------------------
                                      5 	.module rom
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _debugInfo
                                     12 	.globl _sysCfg
                                     13 	.globl _sys_WriteCfg
                                     14 	.globl _sys_readCfg
                                     15 ;--------------------------------------------------------
                                     16 ; ram data
                                     17 ;--------------------------------------------------------
                                     18 	.area DATA
      0000B4                         19 _sysCfg::
      0000B4                         20 	.ds 24
                                     21 ;--------------------------------------------------------
                                     22 ; ram data
                                     23 ;--------------------------------------------------------
                                     24 	.area INITIALIZED
                                     25 ;--------------------------------------------------------
                                     26 ; absolute external ram data
                                     27 ;--------------------------------------------------------
                                     28 	.area DABS (ABS)
                                     29 ;--------------------------------------------------------
                                     30 ; global & static initialisations
                                     31 ;--------------------------------------------------------
                                     32 	.area HOME
                                     33 	.area GSINIT
                                     34 	.area GSFINAL
                                     35 	.area GSINIT
                                     36 ;--------------------------------------------------------
                                     37 ; Home
                                     38 ;--------------------------------------------------------
                                     39 	.area HOME
                                     40 	.area HOME
                                     41 ;--------------------------------------------------------
                                     42 ; code
                                     43 ;--------------------------------------------------------
                                     44 	.area CODE
                                     45 ;	user/rom.c: 5: void sys_WriteCfg(void)
                                     46 ;	-----------------------------------------
                                     47 ;	 function sys_WriteCfg
                                     48 ;	-----------------------------------------
      008845                         49 _sys_WriteCfg:
      008845 52 09            [ 2]   50 	sub	sp, #9
                                     51 ;	user/rom.c: 9: pSys = (uint8_t*)&sysCfg;
      008847 90 AE 00 B4      [ 2]   52 	ldw	y, #_sysCfg+0
                                     53 ;	user/rom.c: 11: FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
      00884B 35 AE 50 64      [ 1]   54 	mov	0x5064+0, #0xae
                                     55 ;	user/rom.c: 12: FLASH->DUKR = FLASH_RASS_KEY1;
      00884F 35 56 50 64      [ 1]   56 	mov	0x5064+0, #0x56
                                     57 ;	user/rom.c: 13: while((FLASH->IAPSR & (uint8_t)FLASH_FLAG_DUL) == RESET);
      008853                         58 00101$:
      008853 AE 50 5F         [ 2]   59 	ldw	x, #0x505f
      008856 F6               [ 1]   60 	ld	a, (x)
      008857 A5 08            [ 1]   61 	bcp	a, #0x08
      008859 27 F8            [ 1]   62 	jreq	00101$
                                     63 ;	user/rom.c: 14: for(add = 0; add < CFG_LEN; add++)
      00885B 0F 01            [ 1]   64 	clr	(0x01, sp)
      00885D                         65 00105$:
                                     66 ;	user/rom.c: 16: *(PointerAttr uint8_t*) (MemoryAddressCast)(CFG_ADDRESS_START+add) = *pSys;
      00885D 5F               [ 1]   67 	clrw	x
      00885E 7B 01            [ 1]   68 	ld	a, (0x01, sp)
      008860 97               [ 1]   69 	ld	xl, a
      008861 4F               [ 1]   70 	clr	a
      008862 0F 06            [ 1]   71 	clr	(0x06, sp)
      008864 1C 40 00         [ 2]   72 	addw	x, #0x4000
      008867 A9 00            [ 1]   73 	adc	a, #0x00
      008869 6B 03            [ 1]   74 	ld	(0x03, sp), a
      00886B 7B 06            [ 1]   75 	ld	a, (0x06, sp)
      00886D A9 00            [ 1]   76 	adc	a, #0x00
      00886F 90 F6            [ 1]   77 	ld	a, (y)
      008871 F7               [ 1]   78 	ld	(x), a
                                     79 ;	user/rom.c: 17: pSys++;
      008872 90 5C            [ 2]   80 	incw	y
                                     81 ;	user/rom.c: 14: for(add = 0; add < CFG_LEN; add++)
      008874 0C 01            [ 1]   82 	inc	(0x01, sp)
      008876 7B 01            [ 1]   83 	ld	a, (0x01, sp)
      008878 A1 18            [ 1]   84 	cp	a, #0x18
      00887A 25 E1            [ 1]   85 	jrc	00105$
                                     86 ;	user/rom.c: 20: FLASH->IAPSR &= (uint8_t)FLASH_MEMTYPE_DATA;
      00887C AE 50 5F         [ 2]   87 	ldw	x, #0x505f
      00887F F6               [ 1]   88 	ld	a, (x)
      008880 A4 F7            [ 1]   89 	and	a, #0xf7
      008882 F7               [ 1]   90 	ld	(x), a
      008883 5B 09            [ 2]   91 	addw	sp, #9
      008885 81               [ 4]   92 	ret
                                     93 ;	user/rom.c: 23: void sys_readCfg(void)
                                     94 ;	-----------------------------------------
                                     95 ;	 function sys_readCfg
                                     96 ;	-----------------------------------------
      008886                         97 _sys_readCfg:
      008886 52 2B            [ 2]   98 	sub	sp, #43
                                     99 ;	user/rom.c: 28: pSys = (uint8_t*)&sysCfg;
      008888 AE 00 B4         [ 2]  100 	ldw	x, #_sysCfg+0
      00888B 1F 2A            [ 2]  101 	ldw	(0x2a, sp), x
      00888D 16 2A            [ 2]  102 	ldw	y, (0x2a, sp)
                                    103 ;	user/rom.c: 35: (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
      00888F AE 50 5F         [ 2]  104 	ldw	x, #0x505f
      008892 F6               [ 1]  105 	ld	a, (x)
                                    106 ;	user/rom.c: 37: FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
      008893 35 AE 50 64      [ 1]  107 	mov	0x5064+0, #0xae
                                    108 ;	user/rom.c: 38: FLASH->DUKR = FLASH_RASS_KEY1;
      008897 35 56 50 64      [ 1]  109 	mov	0x5064+0, #0x56
                                    110 ;	user/rom.c: 39: while((FLASH->IAPSR & (uint8_t)FLASH_FLAG_DUL) == RESET);
      00889B                        111 00101$:
      00889B AE 50 5F         [ 2]  112 	ldw	x, #0x505f
      00889E F6               [ 1]  113 	ld	a, (x)
      00889F A5 08            [ 1]  114 	bcp	a, #0x08
      0088A1 27 F8            [ 1]  115 	jreq	00101$
                                    116 ;	user/rom.c: 40: for(add = 0; add < CFG_LEN; add++)
      0088A3 0F 05            [ 1]  117 	clr	(0x05, sp)
      0088A5                        118 00107$:
                                    119 ;	user/rom.c: 42: *pSys = (*(PointerAttr uint8_t *) (MemoryAddressCast)(CFG_ADDRESS_START+add));
      0088A5 5F               [ 1]  120 	clrw	x
      0088A6 7B 05            [ 1]  121 	ld	a, (0x05, sp)
      0088A8 97               [ 1]  122 	ld	xl, a
      0088A9 4F               [ 1]  123 	clr	a
      0088AA 0F 26            [ 1]  124 	clr	(0x26, sp)
      0088AC 1C 40 00         [ 2]  125 	addw	x, #0x4000
      0088AF A9 00            [ 1]  126 	adc	a, #0x00
      0088B1 6B 23            [ 1]  127 	ld	(0x23, sp), a
      0088B3 7B 26            [ 1]  128 	ld	a, (0x26, sp)
      0088B5 A9 00            [ 1]  129 	adc	a, #0x00
      0088B7 F6               [ 1]  130 	ld	a, (x)
      0088B8 90 F7            [ 1]  131 	ld	(y), a
                                    132 ;	user/rom.c: 43: pSys++;
      0088BA 90 5C            [ 2]  133 	incw	y
                                    134 ;	user/rom.c: 40: for(add = 0; add < CFG_LEN; add++)
      0088BC 0C 05            [ 1]  135 	inc	(0x05, sp)
      0088BE 7B 05            [ 1]  136 	ld	a, (0x05, sp)
      0088C0 A1 18            [ 1]  137 	cp	a, #0x18
      0088C2 25 E1            [ 1]  138 	jrc	00107$
                                    139 ;	user/rom.c: 45: if(sysCfg.holder != CFG_HOLDER)
      0088C4 1E 2A            [ 2]  140 	ldw	x, (0x2a, sp)
      0088C6 FE               [ 2]  141 	ldw	x, (x)
                                    142 ;	user/rom.c: 48: sysCfg.id[0] = DEFAULT_ID_1;
      0088C7 16 2A            [ 2]  143 	ldw	y, (0x2a, sp)
      0088C9 72 A9 00 04      [ 2]  144 	addw	y, #0x0004
      0088CD 17 20            [ 2]  145 	ldw	(0x20, sp), y
                                    146 ;	user/rom.c: 49: sysCfg.id[1] = DEFAULT_ID_2;
      0088CF 16 2A            [ 2]  147 	ldw	y, (0x2a, sp)
      0088D1 72 A9 00 08      [ 2]  148 	addw	y, #0x0008
      0088D5 17 1E            [ 2]  149 	ldw	(0x1e, sp), y
                                    150 ;	user/rom.c: 45: if(sysCfg.holder != CFG_HOLDER)
      0088D7 A3 00 44         [ 2]  151 	cpw	x, #0x0044
      0088DA 27 24            [ 1]  152 	jreq	00106$
                                    153 ;	user/rom.c: 47: sysCfg.holder = CFG_HOLDER;
      0088DC 1E 2A            [ 2]  154 	ldw	x, (0x2a, sp)
      0088DE 90 AE 00 44      [ 2]  155 	ldw	y, #0x0044
      0088E2 FF               [ 2]  156 	ldw	(x), y
                                    157 ;	user/rom.c: 48: sysCfg.id[0] = DEFAULT_ID_1;
      0088E3 1E 20            [ 2]  158 	ldw	x, (0x20, sp)
      0088E5 90 AE 92 C6      [ 2]  159 	ldw	y, #0x92c6
      0088E9 EF 02            [ 2]  160 	ldw	(0x2, x), y
      0088EB 90 AE 01 43      [ 2]  161 	ldw	y, #0x0143
      0088EF FF               [ 2]  162 	ldw	(x), y
                                    163 ;	user/rom.c: 49: sysCfg.id[1] = DEFAULT_ID_2;
      0088F0 1E 1E            [ 2]  164 	ldw	x, (0x1e, sp)
      0088F2 90 AE B7 C6      [ 2]  165 	ldw	y, #0xb7c6
      0088F6 EF 02            [ 2]  166 	ldw	(0x2, x), y
      0088F8 90 AE 01 60      [ 2]  167 	ldw	y, #0x0160
      0088FC FF               [ 2]  168 	ldw	(x), y
                                    169 ;	user/rom.c: 50: sys_WriteCfg();
      0088FD CD 88 45         [ 4]  170 	call	_sys_WriteCfg
      008900                        171 00106$:
                                    172 ;	user/rom.c: 53: FLASH->IAPSR &= (uint8_t)FLASH_MEMTYPE_DATA;
      008900 AE 50 5F         [ 2]  173 	ldw	x, #0x505f
      008903 F6               [ 1]  174 	ld	a, (x)
      008904 A4 F7            [ 1]  175 	and	a, #0xf7
      008906 F7               [ 1]  176 	ld	(x), a
                                    177 ;	user/rom.c: 55: cm[0] = (sysCfg.id[0]&0xFF000000)>>24;
      008907 96               [ 1]  178 	ldw	x, sp
      008908 5C               [ 2]  179 	incw	x
      008909 1F 1C            [ 2]  180 	ldw	(0x1c, sp), x
      00890B 1E 20            [ 2]  181 	ldw	x, (0x20, sp)
      00890D 89               [ 2]  182 	pushw	x
      00890E EE 02            [ 2]  183 	ldw	x, (0x2, x)
      008910 51               [ 1]  184 	exgw	x, y
      008911 85               [ 2]  185 	popw	x
      008912 FE               [ 2]  186 	ldw	x, (x)
      008913 4F               [ 1]  187 	clr	a
      008914 90 5F            [ 1]  188 	clrw	y
      008916 9E               [ 1]  189 	ld	a, xh
      008917 5F               [ 1]  190 	clrw	x
      008918 0F 18            [ 1]  191 	clr	(0x18, sp)
      00891A 1E 1C            [ 2]  192 	ldw	x, (0x1c, sp)
      00891C F7               [ 1]  193 	ld	(x), a
                                    194 ;	user/rom.c: 56: cm[1] = (sysCfg.id[0]&0x00FF0000)>>16;
      00891D 1E 1C            [ 2]  195 	ldw	x, (0x1c, sp)
      00891F 5C               [ 2]  196 	incw	x
      008920 1F 16            [ 2]  197 	ldw	(0x16, sp), x
      008922 1E 20            [ 2]  198 	ldw	x, (0x20, sp)
      008924 89               [ 2]  199 	pushw	x
      008925 EE 02            [ 2]  200 	ldw	x, (0x2, x)
      008927 51               [ 1]  201 	exgw	x, y
      008928 85               [ 2]  202 	popw	x
      008929 FE               [ 2]  203 	ldw	x, (x)
      00892A 90 5F            [ 1]  204 	clrw	y
      00892C 4F               [ 1]  205 	clr	a
      00892D 90 5F            [ 1]  206 	clrw	y
      00892F 9F               [ 1]  207 	ld	a, xl
      008930 1E 16            [ 2]  208 	ldw	x, (0x16, sp)
      008932 F7               [ 1]  209 	ld	(x), a
                                    210 ;	user/rom.c: 57: cm[2] = (sysCfg.id[0]&0x0000FF00)>>8;
      008933 1E 1C            [ 2]  211 	ldw	x, (0x1c, sp)
      008935 5C               [ 2]  212 	incw	x
      008936 5C               [ 2]  213 	incw	x
      008937 1F 14            [ 2]  214 	ldw	(0x14, sp), x
      008939 1E 20            [ 2]  215 	ldw	x, (0x20, sp)
      00893B 89               [ 2]  216 	pushw	x
      00893C EE 02            [ 2]  217 	ldw	x, (0x2, x)
      00893E 51               [ 1]  218 	exgw	x, y
      00893F 85               [ 2]  219 	popw	x
      008940 FE               [ 2]  220 	ldw	x, (x)
      008941 0F 13            [ 1]  221 	clr	(0x13, sp)
      008943 5F               [ 1]  222 	clrw	x
      008944 4F               [ 1]  223 	clr	a
      008945 90 9E            [ 1]  224 	ld	a, yh
      008947 1E 14            [ 2]  225 	ldw	x, (0x14, sp)
      008949 F7               [ 1]  226 	ld	(x), a
                                    227 ;	user/rom.c: 58: cm[3] = (sysCfg.id[0]&0x000000FF)>>0;
      00894A 1E 1C            [ 2]  228 	ldw	x, (0x1c, sp)
      00894C 1C 00 03         [ 2]  229 	addw	x, #0x0003
      00894F 1F 0E            [ 2]  230 	ldw	(0x0e, sp), x
      008951 1E 20            [ 2]  231 	ldw	x, (0x20, sp)
      008953 89               [ 2]  232 	pushw	x
      008954 EE 02            [ 2]  233 	ldw	x, (0x2, x)
      008956 51               [ 1]  234 	exgw	x, y
      008957 85               [ 2]  235 	popw	x
      008958 FE               [ 2]  236 	ldw	x, (x)
      008959 4F               [ 1]  237 	clr	a
      00895A 5F               [ 1]  238 	clrw	x
      00895B 90 9F            [ 1]  239 	ld	a, yl
      00895D 1E 0E            [ 2]  240 	ldw	x, (0x0e, sp)
      00895F F7               [ 1]  241 	ld	(x), a
                                    242 ;	user/rom.c: 59: debugInfo("Key 1: ", cm, 4);
      008960 16 1C            [ 2]  243 	ldw	y, (0x1c, sp)
      008962 AE 89 C2         [ 2]  244 	ldw	x, #___str_0+0
      008965 4B 04            [ 1]  245 	push	#0x04
      008967 90 89            [ 2]  246 	pushw	y
      008969 89               [ 2]  247 	pushw	x
      00896A CD 81 33         [ 4]  248 	call	_debugInfo
      00896D 5B 05            [ 2]  249 	addw	sp, #5
                                    250 ;	user/rom.c: 60: cm[0] = (sysCfg.id[1]&0xFF000000)>>24;
      00896F 1E 1E            [ 2]  251 	ldw	x, (0x1e, sp)
      008971 89               [ 2]  252 	pushw	x
      008972 EE 02            [ 2]  253 	ldw	x, (0x2, x)
      008974 51               [ 1]  254 	exgw	x, y
      008975 85               [ 2]  255 	popw	x
      008976 FE               [ 2]  256 	ldw	x, (x)
      008977 4F               [ 1]  257 	clr	a
      008978 90 5F            [ 1]  258 	clrw	y
      00897A 9E               [ 1]  259 	ld	a, xh
      00897B 5F               [ 1]  260 	clrw	x
      00897C 0F 0A            [ 1]  261 	clr	(0x0a, sp)
      00897E 1E 1C            [ 2]  262 	ldw	x, (0x1c, sp)
      008980 F7               [ 1]  263 	ld	(x), a
                                    264 ;	user/rom.c: 61: cm[1] = (sysCfg.id[1]&0x00FF0000)>>16;
      008981 1E 1E            [ 2]  265 	ldw	x, (0x1e, sp)
      008983 89               [ 2]  266 	pushw	x
      008984 EE 02            [ 2]  267 	ldw	x, (0x2, x)
      008986 51               [ 1]  268 	exgw	x, y
      008987 85               [ 2]  269 	popw	x
      008988 FE               [ 2]  270 	ldw	x, (x)
      008989 90 5F            [ 1]  271 	clrw	y
      00898B 4F               [ 1]  272 	clr	a
      00898C 90 5F            [ 1]  273 	clrw	y
      00898E 9F               [ 1]  274 	ld	a, xl
      00898F 1E 16            [ 2]  275 	ldw	x, (0x16, sp)
      008991 F7               [ 1]  276 	ld	(x), a
                                    277 ;	user/rom.c: 62: cm[2] = (sysCfg.id[1]&0x0000FF00)>>8;
      008992 1E 1E            [ 2]  278 	ldw	x, (0x1e, sp)
      008994 89               [ 2]  279 	pushw	x
      008995 EE 02            [ 2]  280 	ldw	x, (0x2, x)
      008997 51               [ 1]  281 	exgw	x, y
      008998 85               [ 2]  282 	popw	x
      008999 FE               [ 2]  283 	ldw	x, (x)
      00899A 0F 09            [ 1]  284 	clr	(0x09, sp)
      00899C 5F               [ 1]  285 	clrw	x
      00899D 4F               [ 1]  286 	clr	a
      00899E 90 9E            [ 1]  287 	ld	a, yh
      0089A0 1E 14            [ 2]  288 	ldw	x, (0x14, sp)
      0089A2 F7               [ 1]  289 	ld	(x), a
                                    290 ;	user/rom.c: 63: cm[3] = (sysCfg.id[1]&0x000000FF)>>0;
      0089A3 1E 1E            [ 2]  291 	ldw	x, (0x1e, sp)
      0089A5 89               [ 2]  292 	pushw	x
      0089A6 EE 02            [ 2]  293 	ldw	x, (0x2, x)
      0089A8 51               [ 1]  294 	exgw	x, y
      0089A9 85               [ 2]  295 	popw	x
      0089AA FE               [ 2]  296 	ldw	x, (x)
      0089AB 4F               [ 1]  297 	clr	a
      0089AC 5F               [ 1]  298 	clrw	x
      0089AD 90 9F            [ 1]  299 	ld	a, yl
      0089AF 1E 0E            [ 2]  300 	ldw	x, (0x0e, sp)
      0089B1 F7               [ 1]  301 	ld	(x), a
                                    302 ;	user/rom.c: 64: debugInfo("Key 2: ", cm, 4);
      0089B2 16 1C            [ 2]  303 	ldw	y, (0x1c, sp)
      0089B4 AE 89 CA         [ 2]  304 	ldw	x, #___str_1+0
      0089B7 4B 04            [ 1]  305 	push	#0x04
      0089B9 90 89            [ 2]  306 	pushw	y
      0089BB 89               [ 2]  307 	pushw	x
      0089BC CD 81 33         [ 4]  308 	call	_debugInfo
      0089BF 5B 30            [ 2]  309 	addw	sp, #48
      0089C1 81               [ 4]  310 	ret
                                    311 	.area CODE
      0089C2                        312 ___str_0:
      0089C2 4B 65 79 20 31 3A 20   313 	.ascii "Key 1: "
      0089C9 00                     314 	.db 0x00
      0089CA                        315 ___str_1:
      0089CA 4B 65 79 20 32 3A 20   316 	.ascii "Key 2: "
      0089D1 00                     317 	.db 0x00
                                    318 	.area INITIALIZER
                                    319 	.area CABS (ABS)
