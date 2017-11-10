                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.6.0 #9615 (MINGW64)
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
      008837                         49 _sys_WriteCfg:
      008837 52 09            [ 2]   50 	sub	sp, #9
                                     51 ;	user/rom.c: 9: pSys = (uint8_t*)&sysCfg;
      008839 90 AE 00 B4      [ 2]   52 	ldw	y, #_sysCfg+0
                                     53 ;	user/rom.c: 11: FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
      00883D 35 AE 50 64      [ 1]   54 	mov	0x5064+0, #0xae
                                     55 ;	user/rom.c: 12: FLASH->DUKR = FLASH_RASS_KEY1;
      008841 35 56 50 64      [ 1]   56 	mov	0x5064+0, #0x56
                                     57 ;	user/rom.c: 13: while((FLASH->IAPSR & (uint8_t)FLASH_FLAG_DUL) == RESET);
      008845                         58 00101$:
      008845 AE 50 5F         [ 2]   59 	ldw	x, #0x505f
      008848 F6               [ 1]   60 	ld	a, (x)
      008849 A5 08            [ 1]   61 	bcp	a, #0x08
      00884B 27 F8            [ 1]   62 	jreq	00101$
                                     63 ;	user/rom.c: 14: for(add = 0; add < CFG_LEN; add++)
      00884D 0F 01            [ 1]   64 	clr	(0x01, sp)
      00884F                         65 00105$:
                                     66 ;	user/rom.c: 16: *(PointerAttr uint8_t*) (MemoryAddressCast)(CFG_ADDRESS_START+add) = *pSys;
      00884F 5F               [ 1]   67 	clrw	x
      008850 7B 01            [ 1]   68 	ld	a, (0x01, sp)
      008852 97               [ 1]   69 	ld	xl, a
      008853 4F               [ 1]   70 	clr	a
      008854 0F 06            [ 1]   71 	clr	(0x06, sp)
      008856 1C 40 00         [ 2]   72 	addw	x, #0x4000
      008859 A9 00            [ 1]   73 	adc	a, #0x00
      00885B 6B 03            [ 1]   74 	ld	(0x03, sp), a
      00885D 7B 06            [ 1]   75 	ld	a, (0x06, sp)
      00885F A9 00            [ 1]   76 	adc	a, #0x00
      008861 90 F6            [ 1]   77 	ld	a, (y)
      008863 F7               [ 1]   78 	ld	(x), a
                                     79 ;	user/rom.c: 17: pSys++;
      008864 90 5C            [ 2]   80 	incw	y
                                     81 ;	user/rom.c: 14: for(add = 0; add < CFG_LEN; add++)
      008866 0C 01            [ 1]   82 	inc	(0x01, sp)
      008868 7B 01            [ 1]   83 	ld	a, (0x01, sp)
      00886A A1 18            [ 1]   84 	cp	a, #0x18
      00886C 25 E1            [ 1]   85 	jrc	00105$
                                     86 ;	user/rom.c: 20: FLASH->IAPSR &= (uint8_t)FLASH_MEMTYPE_DATA;
      00886E AE 50 5F         [ 2]   87 	ldw	x, #0x505f
      008871 F6               [ 1]   88 	ld	a, (x)
      008872 A4 F7            [ 1]   89 	and	a, #0xf7
      008874 F7               [ 1]   90 	ld	(x), a
      008875 5B 09            [ 2]   91 	addw	sp, #9
      008877 81               [ 4]   92 	ret
                                     93 ;	user/rom.c: 23: void sys_readCfg(void)
                                     94 ;	-----------------------------------------
                                     95 ;	 function sys_readCfg
                                     96 ;	-----------------------------------------
      008878                         97 _sys_readCfg:
      008878 52 2B            [ 2]   98 	sub	sp, #43
                                     99 ;	user/rom.c: 28: pSys = (uint8_t*)&sysCfg;
      00887A AE 00 B4         [ 2]  100 	ldw	x, #_sysCfg+0
      00887D 1F 22            [ 2]  101 	ldw	(0x22, sp), x
      00887F 16 22            [ 2]  102 	ldw	y, (0x22, sp)
                                    103 ;	user/rom.c: 35: (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
      008881 AE 50 5F         [ 2]  104 	ldw	x, #0x505f
      008884 F6               [ 1]  105 	ld	a, (x)
                                    106 ;	user/rom.c: 37: FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
      008885 35 AE 50 64      [ 1]  107 	mov	0x5064+0, #0xae
                                    108 ;	user/rom.c: 38: FLASH->DUKR = FLASH_RASS_KEY1;
      008889 35 56 50 64      [ 1]  109 	mov	0x5064+0, #0x56
                                    110 ;	user/rom.c: 39: while((FLASH->IAPSR & (uint8_t)FLASH_FLAG_DUL) == RESET);
      00888D                        111 00101$:
      00888D AE 50 5F         [ 2]  112 	ldw	x, #0x505f
      008890 F6               [ 1]  113 	ld	a, (x)
      008891 A5 08            [ 1]  114 	bcp	a, #0x08
      008893 27 F8            [ 1]  115 	jreq	00101$
                                    116 ;	user/rom.c: 40: for(add = 0; add < CFG_LEN; add++)
      008895 0F 05            [ 1]  117 	clr	(0x05, sp)
      008897                        118 00107$:
                                    119 ;	user/rom.c: 42: *pSys = (*(PointerAttr uint8_t *) (MemoryAddressCast)(CFG_ADDRESS_START+add));
      008897 5F               [ 1]  120 	clrw	x
      008898 7B 05            [ 1]  121 	ld	a, (0x05, sp)
      00889A 97               [ 1]  122 	ld	xl, a
      00889B 4F               [ 1]  123 	clr	a
      00889C 0F 1E            [ 1]  124 	clr	(0x1e, sp)
      00889E 1C 40 00         [ 2]  125 	addw	x, #0x4000
      0088A1 A9 00            [ 1]  126 	adc	a, #0x00
      0088A3 6B 1B            [ 1]  127 	ld	(0x1b, sp), a
      0088A5 7B 1E            [ 1]  128 	ld	a, (0x1e, sp)
      0088A7 A9 00            [ 1]  129 	adc	a, #0x00
      0088A9 F6               [ 1]  130 	ld	a, (x)
      0088AA 90 F7            [ 1]  131 	ld	(y), a
                                    132 ;	user/rom.c: 43: pSys++;
      0088AC 90 5C            [ 2]  133 	incw	y
                                    134 ;	user/rom.c: 40: for(add = 0; add < CFG_LEN; add++)
      0088AE 0C 05            [ 1]  135 	inc	(0x05, sp)
      0088B0 7B 05            [ 1]  136 	ld	a, (0x05, sp)
      0088B2 A1 18            [ 1]  137 	cp	a, #0x18
      0088B4 25 E1            [ 1]  138 	jrc	00107$
                                    139 ;	user/rom.c: 45: if(sysCfg.holder != CFG_HOLDER)
      0088B6 1E 22            [ 2]  140 	ldw	x, (0x22, sp)
      0088B8 FE               [ 2]  141 	ldw	x, (x)
                                    142 ;	user/rom.c: 48: sysCfg.id[0] = DEFAULT_ID_1;
      0088B9 16 22            [ 2]  143 	ldw	y, (0x22, sp)
      0088BB 72 A9 00 04      [ 2]  144 	addw	y, #0x0004
      0088BF 17 18            [ 2]  145 	ldw	(0x18, sp), y
                                    146 ;	user/rom.c: 49: sysCfg.id[1] = DEFAULT_ID_2;
      0088C1 16 22            [ 2]  147 	ldw	y, (0x22, sp)
      0088C3 72 A9 00 08      [ 2]  148 	addw	y, #0x0008
      0088C7 17 2A            [ 2]  149 	ldw	(0x2a, sp), y
                                    150 ;	user/rom.c: 45: if(sysCfg.holder != CFG_HOLDER)
      0088C9 A3 00 44         [ 2]  151 	cpw	x, #0x0044
      0088CC 27 24            [ 1]  152 	jreq	00106$
                                    153 ;	user/rom.c: 47: sysCfg.holder = CFG_HOLDER;
      0088CE 1E 22            [ 2]  154 	ldw	x, (0x22, sp)
      0088D0 90 AE 00 44      [ 2]  155 	ldw	y, #0x0044
      0088D4 FF               [ 2]  156 	ldw	(x), y
                                    157 ;	user/rom.c: 48: sysCfg.id[0] = DEFAULT_ID_1;
      0088D5 1E 18            [ 2]  158 	ldw	x, (0x18, sp)
      0088D7 90 AE 92 C6      [ 2]  159 	ldw	y, #0x92c6
      0088DB EF 02            [ 2]  160 	ldw	(0x2, x), y
      0088DD 90 AE 01 43      [ 2]  161 	ldw	y, #0x0143
      0088E1 FF               [ 2]  162 	ldw	(x), y
                                    163 ;	user/rom.c: 49: sysCfg.id[1] = DEFAULT_ID_2;
      0088E2 1E 2A            [ 2]  164 	ldw	x, (0x2a, sp)
      0088E4 90 AE B7 C6      [ 2]  165 	ldw	y, #0xb7c6
      0088E8 EF 02            [ 2]  166 	ldw	(0x2, x), y
      0088EA 90 AE 01 60      [ 2]  167 	ldw	y, #0x0160
      0088EE FF               [ 2]  168 	ldw	(x), y
                                    169 ;	user/rom.c: 50: sys_WriteCfg();
      0088EF CD 88 37         [ 4]  170 	call	_sys_WriteCfg
      0088F2                        171 00106$:
                                    172 ;	user/rom.c: 53: FLASH->IAPSR &= (uint8_t)FLASH_MEMTYPE_DATA;
      0088F2 AE 50 5F         [ 2]  173 	ldw	x, #0x505f
      0088F5 F6               [ 1]  174 	ld	a, (x)
      0088F6 A4 F7            [ 1]  175 	and	a, #0xf7
      0088F8 F7               [ 1]  176 	ld	(x), a
                                    177 ;	user/rom.c: 55: cm[0] = (sysCfg.id[0]&0xFF000000)>>24;
      0088F9 96               [ 1]  178 	ldw	x, sp
      0088FA 5C               [ 2]  179 	incw	x
      0088FB 1F 16            [ 2]  180 	ldw	(0x16, sp), x
      0088FD 1E 18            [ 2]  181 	ldw	x, (0x18, sp)
      0088FF 89               [ 2]  182 	pushw	x
      008900 EE 02            [ 2]  183 	ldw	x, (0x2, x)
      008902 51               [ 1]  184 	exgw	x, y
      008903 85               [ 2]  185 	popw	x
      008904 FE               [ 2]  186 	ldw	x, (x)
      008905 4F               [ 1]  187 	clr	a
      008906 90 5F            [ 1]  188 	clrw	y
      008908 9E               [ 1]  189 	ld	a, xh
      008909 5F               [ 1]  190 	clrw	x
      00890A 0F 26            [ 1]  191 	clr	(0x26, sp)
      00890C 1E 16            [ 2]  192 	ldw	x, (0x16, sp)
      00890E F7               [ 1]  193 	ld	(x), a
                                    194 ;	user/rom.c: 56: cm[1] = (sysCfg.id[0]&0x00FF0000)>>16;
      00890F 1E 16            [ 2]  195 	ldw	x, (0x16, sp)
      008911 5C               [ 2]  196 	incw	x
      008912 1F 14            [ 2]  197 	ldw	(0x14, sp), x
      008914 1E 18            [ 2]  198 	ldw	x, (0x18, sp)
      008916 89               [ 2]  199 	pushw	x
      008917 EE 02            [ 2]  200 	ldw	x, (0x2, x)
      008919 51               [ 1]  201 	exgw	x, y
      00891A 85               [ 2]  202 	popw	x
      00891B FE               [ 2]  203 	ldw	x, (x)
      00891C 90 5F            [ 1]  204 	clrw	y
      00891E 4F               [ 1]  205 	clr	a
      00891F 90 5F            [ 1]  206 	clrw	y
      008921 9F               [ 1]  207 	ld	a, xl
      008922 1E 14            [ 2]  208 	ldw	x, (0x14, sp)
      008924 F7               [ 1]  209 	ld	(x), a
                                    210 ;	user/rom.c: 57: cm[2] = (sysCfg.id[0]&0x0000FF00)>>8;
      008925 1E 16            [ 2]  211 	ldw	x, (0x16, sp)
      008927 5C               [ 2]  212 	incw	x
      008928 5C               [ 2]  213 	incw	x
      008929 1F 12            [ 2]  214 	ldw	(0x12, sp), x
      00892B 1E 18            [ 2]  215 	ldw	x, (0x18, sp)
      00892D 89               [ 2]  216 	pushw	x
      00892E EE 02            [ 2]  217 	ldw	x, (0x2, x)
      008930 51               [ 1]  218 	exgw	x, y
      008931 85               [ 2]  219 	popw	x
      008932 FE               [ 2]  220 	ldw	x, (x)
      008933 0F 11            [ 1]  221 	clr	(0x11, sp)
      008935 5F               [ 1]  222 	clrw	x
      008936 4F               [ 1]  223 	clr	a
      008937 90 9E            [ 1]  224 	ld	a, yh
      008939 1E 12            [ 2]  225 	ldw	x, (0x12, sp)
      00893B F7               [ 1]  226 	ld	(x), a
                                    227 ;	user/rom.c: 58: cm[3] = (sysCfg.id[0]&0x000000FF)>>0;
      00893C 1E 16            [ 2]  228 	ldw	x, (0x16, sp)
      00893E 1C 00 03         [ 2]  229 	addw	x, #0x0003
      008941 1F 24            [ 2]  230 	ldw	(0x24, sp), x
      008943 1E 18            [ 2]  231 	ldw	x, (0x18, sp)
      008945 89               [ 2]  232 	pushw	x
      008946 EE 02            [ 2]  233 	ldw	x, (0x2, x)
      008948 51               [ 1]  234 	exgw	x, y
      008949 85               [ 2]  235 	popw	x
      00894A FE               [ 2]  236 	ldw	x, (x)
      00894B 4F               [ 1]  237 	clr	a
      00894C 5F               [ 1]  238 	clrw	x
      00894D 90 9F            [ 1]  239 	ld	a, yl
      00894F 1E 24            [ 2]  240 	ldw	x, (0x24, sp)
      008951 F7               [ 1]  241 	ld	(x), a
                                    242 ;	user/rom.c: 59: debugInfo("Key 1: ", cm, 4);
      008952 16 16            [ 2]  243 	ldw	y, (0x16, sp)
      008954 AE 89 B4         [ 2]  244 	ldw	x, #___str_0+0
      008957 4B 04            [ 1]  245 	push	#0x04
      008959 90 89            [ 2]  246 	pushw	y
      00895B 89               [ 2]  247 	pushw	x
      00895C CD 81 33         [ 4]  248 	call	_debugInfo
      00895F 5B 05            [ 2]  249 	addw	sp, #5
                                    250 ;	user/rom.c: 60: cm[0] = (sysCfg.id[1]&0xFF000000)>>24;
      008961 1E 2A            [ 2]  251 	ldw	x, (0x2a, sp)
      008963 89               [ 2]  252 	pushw	x
      008964 EE 02            [ 2]  253 	ldw	x, (0x2, x)
      008966 51               [ 1]  254 	exgw	x, y
      008967 85               [ 2]  255 	popw	x
      008968 FE               [ 2]  256 	ldw	x, (x)
      008969 4F               [ 1]  257 	clr	a
      00896A 90 5F            [ 1]  258 	clrw	y
      00896C 9E               [ 1]  259 	ld	a, xh
      00896D 5F               [ 1]  260 	clrw	x
      00896E 0F 0A            [ 1]  261 	clr	(0x0a, sp)
      008970 1E 16            [ 2]  262 	ldw	x, (0x16, sp)
      008972 F7               [ 1]  263 	ld	(x), a
                                    264 ;	user/rom.c: 61: cm[1] = (sysCfg.id[1]&0x00FF0000)>>16;
      008973 1E 2A            [ 2]  265 	ldw	x, (0x2a, sp)
      008975 89               [ 2]  266 	pushw	x
      008976 EE 02            [ 2]  267 	ldw	x, (0x2, x)
      008978 51               [ 1]  268 	exgw	x, y
      008979 85               [ 2]  269 	popw	x
      00897A FE               [ 2]  270 	ldw	x, (x)
      00897B 90 5F            [ 1]  271 	clrw	y
      00897D 4F               [ 1]  272 	clr	a
      00897E 90 5F            [ 1]  273 	clrw	y
      008980 9F               [ 1]  274 	ld	a, xl
      008981 1E 14            [ 2]  275 	ldw	x, (0x14, sp)
      008983 F7               [ 1]  276 	ld	(x), a
                                    277 ;	user/rom.c: 62: cm[2] = (sysCfg.id[1]&0x0000FF00)>>8;
      008984 1E 2A            [ 2]  278 	ldw	x, (0x2a, sp)
      008986 89               [ 2]  279 	pushw	x
      008987 EE 02            [ 2]  280 	ldw	x, (0x2, x)
      008989 51               [ 1]  281 	exgw	x, y
      00898A 85               [ 2]  282 	popw	x
      00898B FE               [ 2]  283 	ldw	x, (x)
      00898C 0F 09            [ 1]  284 	clr	(0x09, sp)
      00898E 5F               [ 1]  285 	clrw	x
      00898F 4F               [ 1]  286 	clr	a
      008990 90 9E            [ 1]  287 	ld	a, yh
      008992 1E 12            [ 2]  288 	ldw	x, (0x12, sp)
      008994 F7               [ 1]  289 	ld	(x), a
                                    290 ;	user/rom.c: 63: cm[3] = (sysCfg.id[1]&0x000000FF)>>0;
      008995 1E 2A            [ 2]  291 	ldw	x, (0x2a, sp)
      008997 89               [ 2]  292 	pushw	x
      008998 EE 02            [ 2]  293 	ldw	x, (0x2, x)
      00899A 51               [ 1]  294 	exgw	x, y
      00899B 85               [ 2]  295 	popw	x
      00899C FE               [ 2]  296 	ldw	x, (x)
      00899D 4F               [ 1]  297 	clr	a
      00899E 5F               [ 1]  298 	clrw	x
      00899F 90 9F            [ 1]  299 	ld	a, yl
      0089A1 1E 24            [ 2]  300 	ldw	x, (0x24, sp)
      0089A3 F7               [ 1]  301 	ld	(x), a
                                    302 ;	user/rom.c: 64: debugInfo("Key 2: ", cm, 4);
      0089A4 16 16            [ 2]  303 	ldw	y, (0x16, sp)
      0089A6 AE 89 BC         [ 2]  304 	ldw	x, #___str_1+0
      0089A9 4B 04            [ 1]  305 	push	#0x04
      0089AB 90 89            [ 2]  306 	pushw	y
      0089AD 89               [ 2]  307 	pushw	x
      0089AE CD 81 33         [ 4]  308 	call	_debugInfo
      0089B1 5B 30            [ 2]  309 	addw	sp, #48
      0089B3 81               [ 4]  310 	ret
                                    311 	.area CODE
      0089B4                        312 ___str_0:
      0089B4 4B 65 79 20 31 3A 20   313 	.ascii "Key 1: "
      0089BB 00                     314 	.db 0x00
      0089BC                        315 ___str_1:
      0089BC 4B 65 79 20 32 3A 20   316 	.ascii "Key 2: "
      0089C3 00                     317 	.db 0x00
                                    318 	.area INITIALIZER
                                    319 	.area CABS (ABS)
