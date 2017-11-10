                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.6.0 #9615 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module gpio
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _GPIO_DeInit
                                     12 	.globl _GPIO_Init
                                     13 	.globl _GPIO_Write
                                     14 	.globl _GPIO_WriteReverse
                                     15 	.globl _GPIO_WriteHigh
                                     16 	.globl _GPIO_WriteLow
                                     17 	.globl _GPIO_ReadInputPin
                                     18 	.globl _GPIO_ExternalPullUpConfig
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
                                     47 ;	lib/gpio.c: 5: void GPIO_DeInit(GPIO_TypeDef* GPIOx)
                                     48 ;	-----------------------------------------
                                     49 ;	 function GPIO_DeInit
                                     50 ;	-----------------------------------------
      008F0D                         51 _GPIO_DeInit:
      008F0D 89               [ 2]   52 	pushw	x
                                     53 ;	lib/gpio.c: 7: GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
      008F0E 16 05            [ 2]   54 	ldw	y, (0x05, sp)
      008F10 17 01            [ 2]   55 	ldw	(0x01, sp), y
      008F12 1E 01            [ 2]   56 	ldw	x, (0x01, sp)
      008F14 7F               [ 1]   57 	clr	(x)
                                     58 ;	lib/gpio.c: 8: GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
      008F15 1E 01            [ 2]   59 	ldw	x, (0x01, sp)
      008F17 5C               [ 2]   60 	incw	x
      008F18 5C               [ 2]   61 	incw	x
      008F19 7F               [ 1]   62 	clr	(x)
                                     63 ;	lib/gpio.c: 9: GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
      008F1A 1E 01            [ 2]   64 	ldw	x, (0x01, sp)
      008F1C 1C 00 03         [ 2]   65 	addw	x, #0x0003
      008F1F 7F               [ 1]   66 	clr	(x)
                                     67 ;	lib/gpio.c: 10: GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
      008F20 1E 01            [ 2]   68 	ldw	x, (0x01, sp)
      008F22 1C 00 04         [ 2]   69 	addw	x, #0x0004
      008F25 7F               [ 1]   70 	clr	(x)
      008F26 85               [ 2]   71 	popw	x
      008F27 81               [ 4]   72 	ret
                                     73 ;	lib/gpio.c: 13: void GPIO_Init(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
                                     74 ;	-----------------------------------------
                                     75 ;	 function GPIO_Init
                                     76 ;	-----------------------------------------
      008F28                         77 _GPIO_Init:
      008F28 52 05            [ 2]   78 	sub	sp, #5
                                     79 ;	lib/gpio.c: 16: GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
      008F2A 16 08            [ 2]   80 	ldw	y, (0x08, sp)
      008F2C 17 02            [ 2]   81 	ldw	(0x02, sp), y
      008F2E 1E 02            [ 2]   82 	ldw	x, (0x02, sp)
      008F30 1C 00 04         [ 2]   83 	addw	x, #0x0004
      008F33 1F 04            [ 2]   84 	ldw	(0x04, sp), x
      008F35 1E 04            [ 2]   85 	ldw	x, (0x04, sp)
      008F37 F6               [ 1]   86 	ld	a, (x)
      008F38 88               [ 1]   87 	push	a
      008F39 7B 0B            [ 1]   88 	ld	a, (0x0b, sp)
      008F3B 43               [ 1]   89 	cpl	a
      008F3C 6B 02            [ 1]   90 	ld	(0x02, sp), a
      008F3E 84               [ 1]   91 	pop	a
      008F3F 14 01            [ 1]   92 	and	a, (0x01, sp)
      008F41 1E 04            [ 2]   93 	ldw	x, (0x04, sp)
      008F43 F7               [ 1]   94 	ld	(x), a
                                     95 ;	lib/gpio.c: 33: GPIOx->DDR |= (uint8_t)GPIO_Pin;
      008F44 1E 02            [ 2]   96 	ldw	x, (0x02, sp)
      008F46 5C               [ 2]   97 	incw	x
      008F47 5C               [ 2]   98 	incw	x
                                     99 ;	lib/gpio.c: 22: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
      008F48 0D 0B            [ 1]  100 	tnz	(0x0b, sp)
      008F4A 2A 20            [ 1]  101 	jrpl	00105$
                                    102 ;	lib/gpio.c: 26: GPIOx->ODR |= (uint8_t)GPIO_Pin;
      008F4C 16 02            [ 2]  103 	ldw	y, (0x02, sp)
      008F4E 90 F6            [ 1]  104 	ld	a, (y)
                                    105 ;	lib/gpio.c: 24: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
      008F50 88               [ 1]  106 	push	a
      008F51 7B 0C            [ 1]  107 	ld	a, (0x0c, sp)
      008F53 A5 10            [ 1]  108 	bcp	a, #0x10
      008F55 84               [ 1]  109 	pop	a
      008F56 27 08            [ 1]  110 	jreq	00102$
                                    111 ;	lib/gpio.c: 26: GPIOx->ODR |= (uint8_t)GPIO_Pin;
      008F58 1A 0A            [ 1]  112 	or	a, (0x0a, sp)
      008F5A 16 02            [ 2]  113 	ldw	y, (0x02, sp)
      008F5C 90 F7            [ 1]  114 	ld	(y), a
      008F5E 20 06            [ 2]  115 	jra	00103$
      008F60                        116 00102$:
                                    117 ;	lib/gpio.c: 30: GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
      008F60 14 01            [ 1]  118 	and	a, (0x01, sp)
      008F62 16 02            [ 2]  119 	ldw	y, (0x02, sp)
      008F64 90 F7            [ 1]  120 	ld	(y), a
      008F66                        121 00103$:
                                    122 ;	lib/gpio.c: 33: GPIOx->DDR |= (uint8_t)GPIO_Pin;
      008F66 F6               [ 1]  123 	ld	a, (x)
      008F67 1A 0A            [ 1]  124 	or	a, (0x0a, sp)
      008F69 F7               [ 1]  125 	ld	(x), a
      008F6A 20 04            [ 2]  126 	jra	00106$
      008F6C                        127 00105$:
                                    128 ;	lib/gpio.c: 38: GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
      008F6C F6               [ 1]  129 	ld	a, (x)
      008F6D 14 01            [ 1]  130 	and	a, (0x01, sp)
      008F6F F7               [ 1]  131 	ld	(x), a
      008F70                        132 00106$:
                                    133 ;	lib/gpio.c: 47: GPIOx->CR1 |= (uint8_t)GPIO_Pin;
      008F70 1E 02            [ 2]  134 	ldw	x, (0x02, sp)
      008F72 1C 00 03         [ 2]  135 	addw	x, #0x0003
                                    136 ;	lib/gpio.c: 45: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
      008F75 7B 0B            [ 1]  137 	ld	a, (0x0b, sp)
      008F77 A5 40            [ 1]  138 	bcp	a, #0x40
      008F79 27 06            [ 1]  139 	jreq	00108$
                                    140 ;	lib/gpio.c: 47: GPIOx->CR1 |= (uint8_t)GPIO_Pin;
      008F7B F6               [ 1]  141 	ld	a, (x)
      008F7C 1A 0A            [ 1]  142 	or	a, (0x0a, sp)
      008F7E F7               [ 1]  143 	ld	(x), a
      008F7F 20 04            [ 2]  144 	jra	00109$
      008F81                        145 00108$:
                                    146 ;	lib/gpio.c: 51: GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
      008F81 F6               [ 1]  147 	ld	a, (x)
      008F82 14 01            [ 1]  148 	and	a, (0x01, sp)
      008F84 F7               [ 1]  149 	ld	(x), a
      008F85                        150 00109$:
                                    151 ;	lib/gpio.c: 58: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
      008F85 7B 0B            [ 1]  152 	ld	a, (0x0b, sp)
      008F87 A5 20            [ 1]  153 	bcp	a, #0x20
      008F89 27 0A            [ 1]  154 	jreq	00111$
                                    155 ;	lib/gpio.c: 60: GPIOx->CR2 |= (uint8_t)GPIO_Pin;
      008F8B 1E 04            [ 2]  156 	ldw	x, (0x04, sp)
      008F8D F6               [ 1]  157 	ld	a, (x)
      008F8E 1A 0A            [ 1]  158 	or	a, (0x0a, sp)
      008F90 1E 04            [ 2]  159 	ldw	x, (0x04, sp)
      008F92 F7               [ 1]  160 	ld	(x), a
      008F93 20 08            [ 2]  161 	jra	00113$
      008F95                        162 00111$:
                                    163 ;	lib/gpio.c: 64: GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
      008F95 1E 04            [ 2]  164 	ldw	x, (0x04, sp)
      008F97 F6               [ 1]  165 	ld	a, (x)
      008F98 14 01            [ 1]  166 	and	a, (0x01, sp)
      008F9A 1E 04            [ 2]  167 	ldw	x, (0x04, sp)
      008F9C F7               [ 1]  168 	ld	(x), a
      008F9D                        169 00113$:
      008F9D 5B 05            [ 2]  170 	addw	sp, #5
      008F9F 81               [ 4]  171 	ret
                                    172 ;	lib/gpio.c: 68: void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t PortVal)
                                    173 ;	-----------------------------------------
                                    174 ;	 function GPIO_Write
                                    175 ;	-----------------------------------------
      008FA0                        176 _GPIO_Write:
                                    177 ;	lib/gpio.c: 70: GPIOx->ODR = PortVal;
      008FA0 1E 03            [ 2]  178 	ldw	x, (0x03, sp)
      008FA2 7B 05            [ 1]  179 	ld	a, (0x05, sp)
      008FA4 F7               [ 1]  180 	ld	(x), a
      008FA5 81               [ 4]  181 	ret
                                    182 ;	lib/gpio.c: 73: void GPIO_WriteReverse(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
                                    183 ;	-----------------------------------------
                                    184 ;	 function GPIO_WriteReverse
                                    185 ;	-----------------------------------------
      008FA6                        186 _GPIO_WriteReverse:
                                    187 ;	lib/gpio.c: 75: GPIOx->ODR ^= (uint8_t)PortPins;
      008FA6 1E 03            [ 2]  188 	ldw	x, (0x03, sp)
      008FA8 F6               [ 1]  189 	ld	a, (x)
      008FA9 18 05            [ 1]  190 	xor	a, (0x05, sp)
      008FAB F7               [ 1]  191 	ld	(x), a
      008FAC 81               [ 4]  192 	ret
                                    193 ;	lib/gpio.c: 78: void GPIO_WriteHigh(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
                                    194 ;	-----------------------------------------
                                    195 ;	 function GPIO_WriteHigh
                                    196 ;	-----------------------------------------
      008FAD                        197 _GPIO_WriteHigh:
                                    198 ;	lib/gpio.c: 80: GPIOx->ODR |= (uint8_t)PortPins;
      008FAD 1E 03            [ 2]  199 	ldw	x, (0x03, sp)
      008FAF F6               [ 1]  200 	ld	a, (x)
      008FB0 1A 05            [ 1]  201 	or	a, (0x05, sp)
      008FB2 F7               [ 1]  202 	ld	(x), a
      008FB3 81               [ 4]  203 	ret
                                    204 ;	lib/gpio.c: 83: void GPIO_WriteLow(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
                                    205 ;	-----------------------------------------
                                    206 ;	 function GPIO_WriteLow
                                    207 ;	-----------------------------------------
      008FB4                        208 _GPIO_WriteLow:
      008FB4 88               [ 1]  209 	push	a
                                    210 ;	lib/gpio.c: 85: GPIOx->ODR &= (uint8_t)(~PortPins);
      008FB5 1E 04            [ 2]  211 	ldw	x, (0x04, sp)
      008FB7 F6               [ 1]  212 	ld	a, (x)
      008FB8 6B 01            [ 1]  213 	ld	(0x01, sp), a
      008FBA 7B 06            [ 1]  214 	ld	a, (0x06, sp)
      008FBC 43               [ 1]  215 	cpl	a
      008FBD 14 01            [ 1]  216 	and	a, (0x01, sp)
      008FBF F7               [ 1]  217 	ld	(x), a
      008FC0 84               [ 1]  218 	pop	a
      008FC1 81               [ 4]  219 	ret
                                    220 ;	lib/gpio.c: 98: BitStatus GPIO_ReadInputPin(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
                                    221 ;	-----------------------------------------
                                    222 ;	 function GPIO_ReadInputPin
                                    223 ;	-----------------------------------------
      008FC2                        224 _GPIO_ReadInputPin:
                                    225 ;	lib/gpio.c: 100: return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
      008FC2 1E 03            [ 2]  226 	ldw	x, (0x03, sp)
      008FC4 E6 01            [ 1]  227 	ld	a, (0x1, x)
      008FC6 14 05            [ 1]  228 	and	a, (0x05, sp)
      008FC8 81               [ 4]  229 	ret
                                    230 ;	lib/gpio.c: 103: void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, FunctionalState NewState)
                                    231 ;	-----------------------------------------
                                    232 ;	 function GPIO_ExternalPullUpConfig
                                    233 ;	-----------------------------------------
      008FC9                        234 _GPIO_ExternalPullUpConfig:
      008FC9 88               [ 1]  235 	push	a
                                    236 ;	lib/gpio.c: 107: GPIOx->CR1 |= (uint8_t)GPIO_Pin;
      008FCA 1E 04            [ 2]  237 	ldw	x, (0x04, sp)
      008FCC 1C 00 03         [ 2]  238 	addw	x, #0x0003
                                    239 ;	lib/gpio.c: 105: if (NewState != DISABLE)  //External Pull-Up Set
      008FCF 0D 07            [ 1]  240 	tnz	(0x07, sp)
      008FD1 27 06            [ 1]  241 	jreq	00102$
                                    242 ;	lib/gpio.c: 107: GPIOx->CR1 |= (uint8_t)GPIO_Pin;
      008FD3 F6               [ 1]  243 	ld	a, (x)
      008FD4 1A 06            [ 1]  244 	or	a, (0x06, sp)
      008FD6 F7               [ 1]  245 	ld	(x), a
      008FD7 20 09            [ 2]  246 	jra	00104$
      008FD9                        247 00102$:
                                    248 ;	lib/gpio.c: 111: GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
      008FD9 F6               [ 1]  249 	ld	a, (x)
      008FDA 6B 01            [ 1]  250 	ld	(0x01, sp), a
      008FDC 7B 06            [ 1]  251 	ld	a, (0x06, sp)
      008FDE 43               [ 1]  252 	cpl	a
      008FDF 14 01            [ 1]  253 	and	a, (0x01, sp)
      008FE1 F7               [ 1]  254 	ld	(x), a
      008FE2                        255 00104$:
      008FE2 84               [ 1]  256 	pop	a
      008FE3 81               [ 4]  257 	ret
                                    258 	.area CODE
                                    259 	.area INITIALIZER
                                    260 	.area CABS (ABS)
