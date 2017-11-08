                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.6.0 #9615 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module ringbuf
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _RINGBUF_Init
                                     12 	.globl _RINGBUF_Put
                                     13 	.globl _RINGBUF_Get
                                     14 	.globl _RINGBUF_GetAddress
                                     15 ;--------------------------------------------------------
                                     16 ; ram data
                                     17 ;--------------------------------------------------------
                                     18 	.area DATA
                                     19 ;--------------------------------------------------------
                                     20 ; ram data
                                     21 ;--------------------------------------------------------
                                     22 	.area INITIALIZED
                                     23 ;--------------------------------------------------------
                                     24 ; absolute external ram data
                                     25 ;--------------------------------------------------------
                                     26 	.area DABS (ABS)
                                     27 ;--------------------------------------------------------
                                     28 ; global & static initialisations
                                     29 ;--------------------------------------------------------
                                     30 	.area HOME
                                     31 	.area GSINIT
                                     32 	.area GSFINAL
                                     33 	.area GSINIT
                                     34 ;--------------------------------------------------------
                                     35 ; Home
                                     36 ;--------------------------------------------------------
                                     37 	.area HOME
                                     38 	.area HOME
                                     39 ;--------------------------------------------------------
                                     40 ; code
                                     41 ;--------------------------------------------------------
                                     42 	.area CODE
                                     43 ;	user/ringbuf.c: 4: int RINGBUF_Init(RINGBUF *r, uint8_t* buf, int size)
                                     44 ;	-----------------------------------------
                                     45 ;	 function RINGBUF_Init
                                     46 ;	-----------------------------------------
      0091FB                         47 _RINGBUF_Init:
      0091FB 52 04            [ 2]   48 	sub	sp, #4
                                     49 ;	user/ringbuf.c: 6: if(r == NULL || buf == NULL || size < 2) return -1; 
      0091FD 1E 07            [ 2]   50 	ldw	x, (0x07, sp)
      0091FF 27 0B            [ 1]   51 	jreq	00101$
      009201 1E 09            [ 2]   52 	ldw	x, (0x09, sp)
      009203 27 07            [ 1]   53 	jreq	00101$
      009205 1E 0B            [ 2]   54 	ldw	x, (0x0b, sp)
      009207 A3 00 02         [ 2]   55 	cpw	x, #0x0002
      00920A 2E 05            [ 1]   56 	jrsge	00102$
      00920C                         57 00101$:
      00920C AE FF FF         [ 2]   58 	ldw	x, #0xffff
      00920F 20 29            [ 2]   59 	jra	00105$
      009211                         60 00102$:
                                     61 ;	user/ringbuf.c: 7: r->p_o = r->p_r = r->p_w = buf;
      009211 16 07            [ 2]   62 	ldw	y, (0x07, sp)
      009213 17 03            [ 2]   63 	ldw	(0x03, sp), y
      009215 1E 03            [ 2]   64 	ldw	x, (0x03, sp)
      009217 5C               [ 2]   65 	incw	x
      009218 5C               [ 2]   66 	incw	x
      009219 1F 01            [ 2]   67 	ldw	(0x01, sp), x
      00921B 1E 03            [ 2]   68 	ldw	x, (0x03, sp)
      00921D 16 09            [ 2]   69 	ldw	y, (0x09, sp)
      00921F EF 04            [ 2]   70 	ldw	(0x0004, x), y
      009221 1E 01            [ 2]   71 	ldw	x, (0x01, sp)
      009223 16 09            [ 2]   72 	ldw	y, (0x09, sp)
      009225 FF               [ 2]   73 	ldw	(x), y
      009226 1E 03            [ 2]   74 	ldw	x, (0x03, sp)
      009228 16 09            [ 2]   75 	ldw	y, (0x09, sp)
      00922A FF               [ 2]   76 	ldw	(x), y
                                     77 ;	user/ringbuf.c: 8: r->fill_cnt = 0;
      00922B 1E 03            [ 2]   78 	ldw	x, (0x03, sp)
      00922D 1C 00 06         [ 2]   79 	addw	x, #0x0006
      009230 6F 01            [ 1]   80 	clr	(0x1, x)
      009232 7F               [ 1]   81 	clr	(x)
                                     82 ;	user/ringbuf.c: 9: r->size = size; 
      009233 1E 03            [ 2]   83 	ldw	x, (0x03, sp)
      009235 16 0B            [ 2]   84 	ldw	y, (0x0b, sp)
      009237 EF 08            [ 2]   85 	ldw	(0x0008, x), y
                                     86 ;	user/ringbuf.c: 10: return 0;
      009239 5F               [ 1]   87 	clrw	x
      00923A                         88 00105$:
      00923A 5B 04            [ 2]   89 	addw	sp, #4
      00923C 81               [ 4]   90 	ret
                                     91 ;	user/ringbuf.c: 13: int RINGBUF_Put(RINGBUF *r, uint8_t c)
                                     92 ;	-----------------------------------------
                                     93 ;	 function RINGBUF_Put
                                     94 ;	-----------------------------------------
      00923D                         95 _RINGBUF_Put:
      00923D 52 10            [ 2]   96 	sub	sp, #16
                                     97 ;	user/ringbuf.c: 15: if(r->fill_cnt>=r->size)return -1;		// ring buffer is full, this should be atomic operation
      00923F 16 13            [ 2]   98 	ldw	y, (0x13, sp)
      009241 17 0D            [ 2]   99 	ldw	(0x0d, sp), y
      009243 1E 0D            [ 2]  100 	ldw	x, (0x0d, sp)
      009245 1C 00 06         [ 2]  101 	addw	x, #0x0006
      009248 1F 07            [ 2]  102 	ldw	(0x07, sp), x
      00924A 1E 07            [ 2]  103 	ldw	x, (0x07, sp)
      00924C FE               [ 2]  104 	ldw	x, (x)
      00924D 16 0D            [ 2]  105 	ldw	y, (0x0d, sp)
      00924F 72 A9 00 08      [ 2]  106 	addw	y, #0x0008
      009253 17 09            [ 2]  107 	ldw	(0x09, sp), y
      009255 16 09            [ 2]  108 	ldw	y, (0x09, sp)
      009257 90 FE            [ 2]  109 	ldw	y, (y)
      009259 17 01            [ 2]  110 	ldw	(0x01, sp), y
      00925B 13 01            [ 2]  111 	cpw	x, (0x01, sp)
      00925D 2F 05            [ 1]  112 	jrslt	00102$
      00925F AE FF FF         [ 2]  113 	ldw	x, #0xffff
      009262 20 3E            [ 2]  114 	jra	00105$
      009264                        115 00102$:
                                    116 ;	user/ringbuf.c: 17: disableInterrupts();				// enter critical session
      009264 9B               [ 1]  117 	sim
                                    118 ;	user/ringbuf.c: 18: r->fill_cnt++;				// increase filled slots count, this should be atomic operation
      009265 1E 07            [ 2]  119 	ldw	x, (0x07, sp)
      009267 FE               [ 2]  120 	ldw	x, (x)
      009268 5C               [ 2]  121 	incw	x
      009269 16 07            [ 2]  122 	ldw	y, (0x07, sp)
      00926B 90 FF            [ 2]  123 	ldw	(y), x
                                    124 ;	user/ringbuf.c: 19: enableInterrupts();				// leave critical session
      00926D 9A               [ 1]  125 	rim
                                    126 ;	user/ringbuf.c: 21: *r->p_w++ = c;				// put character into buffer
      00926E 1E 0D            [ 2]  127 	ldw	x, (0x0d, sp)
      009270 1C 00 04         [ 2]  128 	addw	x, #0x0004
      009273 1F 0B            [ 2]  129 	ldw	(0x0b, sp), x
      009275 1E 0B            [ 2]  130 	ldw	x, (0x0b, sp)
      009277 FE               [ 2]  131 	ldw	x, (x)
      009278 1F 0F            [ 2]  132 	ldw	(0x0f, sp), x
      00927A 1E 0F            [ 2]  133 	ldw	x, (0x0f, sp)
      00927C 5C               [ 2]  134 	incw	x
      00927D 16 0B            [ 2]  135 	ldw	y, (0x0b, sp)
      00927F 90 FF            [ 2]  136 	ldw	(y), x
      009281 1E 0F            [ 2]  137 	ldw	x, (0x0f, sp)
      009283 7B 15            [ 1]  138 	ld	a, (0x15, sp)
      009285 F7               [ 1]  139 	ld	(x), a
                                    140 ;	user/ringbuf.c: 23: if(r->p_w >= r->p_o + r->size)	        // rollback if write pointer go pass
      009286 1E 0B            [ 2]  141 	ldw	x, (0x0b, sp)
      009288 FE               [ 2]  142 	ldw	x, (x)
      009289 16 0D            [ 2]  143 	ldw	y, (0x0d, sp)
      00928B 90 FE            [ 2]  144 	ldw	y, (y)
      00928D 17 05            [ 2]  145 	ldw	(0x05, sp), y
      00928F 16 09            [ 2]  146 	ldw	y, (0x09, sp)
      009291 90 FE            [ 2]  147 	ldw	y, (y)
      009293 72 F9 05         [ 2]  148 	addw	y, (0x05, sp)
      009296 17 03            [ 2]  149 	ldw	(0x03, sp), y
      009298 13 03            [ 2]  150 	cpw	x, (0x03, sp)
      00929A 25 05            [ 1]  151 	jrc	00104$
                                    152 ;	user/ringbuf.c: 24: r->p_w = r->p_o;			// the physical boundary 
      00929C 1E 0B            [ 2]  153 	ldw	x, (0x0b, sp)
      00929E 16 05            [ 2]  154 	ldw	y, (0x05, sp)
      0092A0 FF               [ 2]  155 	ldw	(x), y
      0092A1                        156 00104$:
                                    157 ;	user/ringbuf.c: 25: return 0;
      0092A1 5F               [ 1]  158 	clrw	x
      0092A2                        159 00105$:
      0092A2 5B 10            [ 2]  160 	addw	sp, #16
      0092A4 81               [ 4]  161 	ret
                                    162 ;	user/ringbuf.c: 28: int RINGBUF_Get(RINGBUF *r, uint8_t* c)
                                    163 ;	-----------------------------------------
                                    164 ;	 function RINGBUF_Get
                                    165 ;	-----------------------------------------
      0092A5                        166 _RINGBUF_Get:
      0092A5 52 0E            [ 2]  167 	sub	sp, #14
                                    168 ;	user/ringbuf.c: 30: if(r->fill_cnt<=0)return -1;			// ring buffer is empty, this should be atomic operation
      0092A7 16 11            [ 2]  169 	ldw	y, (0x11, sp)
      0092A9 17 0D            [ 2]  170 	ldw	(0x0d, sp), y
      0092AB 1E 0D            [ 2]  171 	ldw	x, (0x0d, sp)
      0092AD 1C 00 06         [ 2]  172 	addw	x, #0x0006
      0092B0 1F 0B            [ 2]  173 	ldw	(0x0b, sp), x
      0092B2 1E 0B            [ 2]  174 	ldw	x, (0x0b, sp)
      0092B4 FE               [ 2]  175 	ldw	x, (x)
      0092B5 A3 00 00         [ 2]  176 	cpw	x, #0x0000
      0092B8 2C 05            [ 1]  177 	jrsgt	00102$
      0092BA AE FF FF         [ 2]  178 	ldw	x, #0xffff
      0092BD 20 43            [ 2]  179 	jra	00105$
      0092BF                        180 00102$:
                                    181 ;	user/ringbuf.c: 32: disableInterrupts();				// enter critical session
      0092BF 9B               [ 1]  182 	sim
                                    183 ;	user/ringbuf.c: 33: r->fill_cnt--;				// decrease filled slots count
      0092C0 1E 0B            [ 2]  184 	ldw	x, (0x0b, sp)
      0092C2 FE               [ 2]  185 	ldw	x, (x)
      0092C3 5A               [ 2]  186 	decw	x
      0092C4 16 0B            [ 2]  187 	ldw	y, (0x0b, sp)
      0092C6 90 FF            [ 2]  188 	ldw	(y), x
                                    189 ;	user/ringbuf.c: 34: enableInterrupts();			        // leave critical session
      0092C8 9A               [ 1]  190 	rim
                                    191 ;	user/ringbuf.c: 36: *c = *r->p_r++;				// get the character out
      0092C9 16 13            [ 2]  192 	ldw	y, (0x13, sp)
      0092CB 17 07            [ 2]  193 	ldw	(0x07, sp), y
      0092CD 1E 0D            [ 2]  194 	ldw	x, (0x0d, sp)
      0092CF 5C               [ 2]  195 	incw	x
      0092D0 5C               [ 2]  196 	incw	x
      0092D1 1F 09            [ 2]  197 	ldw	(0x09, sp), x
      0092D3 1E 09            [ 2]  198 	ldw	x, (0x09, sp)
      0092D5 FE               [ 2]  199 	ldw	x, (x)
      0092D6 1F 05            [ 2]  200 	ldw	(0x05, sp), x
      0092D8 1E 05            [ 2]  201 	ldw	x, (0x05, sp)
      0092DA 5C               [ 2]  202 	incw	x
      0092DB 16 09            [ 2]  203 	ldw	y, (0x09, sp)
      0092DD 90 FF            [ 2]  204 	ldw	(y), x
      0092DF 1E 05            [ 2]  205 	ldw	x, (0x05, sp)
      0092E1 F6               [ 1]  206 	ld	a, (x)
      0092E2 1E 07            [ 2]  207 	ldw	x, (0x07, sp)
      0092E4 F7               [ 1]  208 	ld	(x), a
                                    209 ;	user/ringbuf.c: 38: if(r->p_r >= r->p_o + r->size)		// rollback if write pointer go pass
      0092E5 1E 09            [ 2]  210 	ldw	x, (0x09, sp)
      0092E7 FE               [ 2]  211 	ldw	x, (x)
      0092E8 16 0D            [ 2]  212 	ldw	y, (0x0d, sp)
      0092EA 90 FE            [ 2]  213 	ldw	y, (y)
      0092EC 17 03            [ 2]  214 	ldw	(0x03, sp), y
      0092EE 16 0D            [ 2]  215 	ldw	y, (0x0d, sp)
      0092F0 90 EE 08         [ 2]  216 	ldw	y, (0x8, y)
      0092F3 72 F9 03         [ 2]  217 	addw	y, (0x03, sp)
      0092F6 17 01            [ 2]  218 	ldw	(0x01, sp), y
      0092F8 13 01            [ 2]  219 	cpw	x, (0x01, sp)
      0092FA 25 05            [ 1]  220 	jrc	00104$
                                    221 ;	user/ringbuf.c: 39: r->p_r = r->p_o;			// the physical boundary
      0092FC 1E 09            [ 2]  222 	ldw	x, (0x09, sp)
      0092FE 16 03            [ 2]  223 	ldw	y, (0x03, sp)
      009300 FF               [ 2]  224 	ldw	(x), y
      009301                        225 00104$:
                                    226 ;	user/ringbuf.c: 41: return 0;
      009301 5F               [ 1]  227 	clrw	x
      009302                        228 00105$:
      009302 5B 0E            [ 2]  229 	addw	sp, #14
      009304 81               [ 4]  230 	ret
                                    231 ;	user/ringbuf.c: 43: uint8_t* RINGBUF_GetAddress(RINGBUF *r) 
                                    232 ;	-----------------------------------------
                                    233 ;	 function RINGBUF_GetAddress
                                    234 ;	-----------------------------------------
      009305                        235 _RINGBUF_GetAddress:
      009305 89               [ 2]  236 	pushw	x
                                    237 ;	user/ringbuf.c: 45: return (uint8_t*)(r->fill_cnt + r);
      009306 16 05            [ 2]  238 	ldw	y, (0x05, sp)
      009308 17 01            [ 2]  239 	ldw	(0x01, sp), y
      00930A 1E 01            [ 2]  240 	ldw	x, (0x01, sp)
      00930C EE 06            [ 2]  241 	ldw	x, (0x6, x)
      00930E 89               [ 2]  242 	pushw	x
      00930F 4B 0A            [ 1]  243 	push	#0x0a
      009311 4B 00            [ 1]  244 	push	#0x00
      009313 CD 9F 6D         [ 4]  245 	call	__mulint
      009316 5B 04            [ 2]  246 	addw	sp, #4
      009318 72 FB 01         [ 2]  247 	addw	x, (0x01, sp)
      00931B 5B 02            [ 2]  248 	addw	sp, #2
      00931D 81               [ 4]  249 	ret
                                    250 	.area CODE
                                    251 	.area INITIALIZER
                                    252 	.area CABS (ABS)
