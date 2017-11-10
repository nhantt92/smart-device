                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.6.0 #9615 (Mac OS X x86_64)
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
                                     14 	.globl _GPIO_WriteHigh
                                     15 	.globl _GPIO_WriteLow
                                     16 	.globl _GPIO_ReadInputPin
                                     17 	.globl _GPIO_ExternalPullUpConfig
                                     18 ;--------------------------------------------------------
                                     19 ; ram data
                                     20 ;--------------------------------------------------------
                                     21 	.area DATA
                                     22 ;--------------------------------------------------------
                                     23 ; ram data
                                     24 ;--------------------------------------------------------
                                     25 	.area INITIALIZED
                                     26 ;--------------------------------------------------------
                                     27 ; absolute external ram data
                                     28 ;--------------------------------------------------------
                                     29 	.area DABS (ABS)
                                     30 ;--------------------------------------------------------
                                     31 ; global & static initialisations
                                     32 ;--------------------------------------------------------
                                     33 	.area HOME
                                     34 	.area GSINIT
                                     35 	.area GSFINAL
                                     36 	.area GSINIT
                                     37 ;--------------------------------------------------------
                                     38 ; Home
                                     39 ;--------------------------------------------------------
                                     40 	.area HOME
                                     41 	.area HOME
                                     42 ;--------------------------------------------------------
                                     43 ; code
                                     44 ;--------------------------------------------------------
                                     45 	.area CODE
                                     46 ;	lib/gpio.c: 5: void GPIO_DeInit(GPIO_TypeDef* GPIOx)
                                     47 ;	-----------------------------------------
                                     48 ;	 function GPIO_DeInit
                                     49 ;	-----------------------------------------
      008F21                         50 _GPIO_DeInit:
      008F21 89               [ 2]   51 	pushw	x
                                     52 ;	lib/gpio.c: 7: GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
      008F22 16 05            [ 2]   53 	ldw	y, (0x05, sp)
      008F24 17 01            [ 2]   54 	ldw	(0x01, sp), y
      008F26 1E 01            [ 2]   55 	ldw	x, (0x01, sp)
      008F28 7F               [ 1]   56 	clr	(x)
                                     57 ;	lib/gpio.c: 8: GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
      008F29 1E 01            [ 2]   58 	ldw	x, (0x01, sp)
      008F2B 5C               [ 2]   59 	incw	x
      008F2C 5C               [ 2]   60 	incw	x
      008F2D 7F               [ 1]   61 	clr	(x)
                                     62 ;	lib/gpio.c: 9: GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
      008F2E 1E 01            [ 2]   63 	ldw	x, (0x01, sp)
      008F30 1C 00 03         [ 2]   64 	addw	x, #0x0003
      008F33 7F               [ 1]   65 	clr	(x)
                                     66 ;	lib/gpio.c: 10: GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
      008F34 1E 01            [ 2]   67 	ldw	x, (0x01, sp)
      008F36 1C 00 04         [ 2]   68 	addw	x, #0x0004
      008F39 7F               [ 1]   69 	clr	(x)
      008F3A 85               [ 2]   70 	popw	x
      008F3B 81               [ 4]   71 	ret
                                     72 ;	lib/gpio.c: 13: void GPIO_Init(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
                                     73 ;	-----------------------------------------
                                     74 ;	 function GPIO_Init
                                     75 ;	-----------------------------------------
      008F3C                         76 _GPIO_Init:
      008F3C 52 05            [ 2]   77 	sub	sp, #5
                                     78 ;	lib/gpio.c: 16: GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
      008F3E 16 08            [ 2]   79 	ldw	y, (0x08, sp)
      008F40 17 01            [ 2]   80 	ldw	(0x01, sp), y
      008F42 1E 01            [ 2]   81 	ldw	x, (0x01, sp)
      008F44 1C 00 04         [ 2]   82 	addw	x, #0x0004
      008F47 1F 03            [ 2]   83 	ldw	(0x03, sp), x
      008F49 1E 03            [ 2]   84 	ldw	x, (0x03, sp)
      008F4B F6               [ 1]   85 	ld	a, (x)
      008F4C 88               [ 1]   86 	push	a
      008F4D 7B 0B            [ 1]   87 	ld	a, (0x0b, sp)
      008F4F 43               [ 1]   88 	cpl	a
      008F50 6B 06            [ 1]   89 	ld	(0x06, sp), a
      008F52 84               [ 1]   90 	pop	a
      008F53 14 05            [ 1]   91 	and	a, (0x05, sp)
      008F55 1E 03            [ 2]   92 	ldw	x, (0x03, sp)
      008F57 F7               [ 1]   93 	ld	(x), a
                                     94 ;	lib/gpio.c: 33: GPIOx->DDR |= (uint8_t)GPIO_Pin;
      008F58 1E 01            [ 2]   95 	ldw	x, (0x01, sp)
      008F5A 5C               [ 2]   96 	incw	x
      008F5B 5C               [ 2]   97 	incw	x
                                     98 ;	lib/gpio.c: 22: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
      008F5C 0D 0B            [ 1]   99 	tnz	(0x0b, sp)
      008F5E 2A 20            [ 1]  100 	jrpl	00105$
                                    101 ;	lib/gpio.c: 26: GPIOx->ODR |= (uint8_t)GPIO_Pin;
      008F60 16 01            [ 2]  102 	ldw	y, (0x01, sp)
      008F62 90 F6            [ 1]  103 	ld	a, (y)
                                    104 ;	lib/gpio.c: 24: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
      008F64 88               [ 1]  105 	push	a
      008F65 7B 0C            [ 1]  106 	ld	a, (0x0c, sp)
      008F67 A5 10            [ 1]  107 	bcp	a, #0x10
      008F69 84               [ 1]  108 	pop	a
      008F6A 27 08            [ 1]  109 	jreq	00102$
                                    110 ;	lib/gpio.c: 26: GPIOx->ODR |= (uint8_t)GPIO_Pin;
      008F6C 1A 0A            [ 1]  111 	or	a, (0x0a, sp)
      008F6E 16 01            [ 2]  112 	ldw	y, (0x01, sp)
      008F70 90 F7            [ 1]  113 	ld	(y), a
      008F72 20 06            [ 2]  114 	jra	00103$
      008F74                        115 00102$:
                                    116 ;	lib/gpio.c: 30: GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
      008F74 14 05            [ 1]  117 	and	a, (0x05, sp)
      008F76 16 01            [ 2]  118 	ldw	y, (0x01, sp)
      008F78 90 F7            [ 1]  119 	ld	(y), a
      008F7A                        120 00103$:
                                    121 ;	lib/gpio.c: 33: GPIOx->DDR |= (uint8_t)GPIO_Pin;
      008F7A F6               [ 1]  122 	ld	a, (x)
      008F7B 1A 0A            [ 1]  123 	or	a, (0x0a, sp)
      008F7D F7               [ 1]  124 	ld	(x), a
      008F7E 20 04            [ 2]  125 	jra	00106$
      008F80                        126 00105$:
                                    127 ;	lib/gpio.c: 38: GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
      008F80 F6               [ 1]  128 	ld	a, (x)
      008F81 14 05            [ 1]  129 	and	a, (0x05, sp)
      008F83 F7               [ 1]  130 	ld	(x), a
      008F84                        131 00106$:
                                    132 ;	lib/gpio.c: 47: GPIOx->CR1 |= (uint8_t)GPIO_Pin;
      008F84 1E 01            [ 2]  133 	ldw	x, (0x01, sp)
      008F86 1C 00 03         [ 2]  134 	addw	x, #0x0003
                                    135 ;	lib/gpio.c: 45: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
      008F89 7B 0B            [ 1]  136 	ld	a, (0x0b, sp)
      008F8B A5 40            [ 1]  137 	bcp	a, #0x40
      008F8D 27 06            [ 1]  138 	jreq	00108$
                                    139 ;	lib/gpio.c: 47: GPIOx->CR1 |= (uint8_t)GPIO_Pin;
      008F8F F6               [ 1]  140 	ld	a, (x)
      008F90 1A 0A            [ 1]  141 	or	a, (0x0a, sp)
      008F92 F7               [ 1]  142 	ld	(x), a
      008F93 20 04            [ 2]  143 	jra	00109$
      008F95                        144 00108$:
                                    145 ;	lib/gpio.c: 51: GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
      008F95 F6               [ 1]  146 	ld	a, (x)
      008F96 14 05            [ 1]  147 	and	a, (0x05, sp)
      008F98 F7               [ 1]  148 	ld	(x), a
      008F99                        149 00109$:
                                    150 ;	lib/gpio.c: 58: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
      008F99 7B 0B            [ 1]  151 	ld	a, (0x0b, sp)
      008F9B A5 20            [ 1]  152 	bcp	a, #0x20
      008F9D 27 0A            [ 1]  153 	jreq	00111$
                                    154 ;	lib/gpio.c: 60: GPIOx->CR2 |= (uint8_t)GPIO_Pin;
      008F9F 1E 03            [ 2]  155 	ldw	x, (0x03, sp)
      008FA1 F6               [ 1]  156 	ld	a, (x)
      008FA2 1A 0A            [ 1]  157 	or	a, (0x0a, sp)
      008FA4 1E 03            [ 2]  158 	ldw	x, (0x03, sp)
      008FA6 F7               [ 1]  159 	ld	(x), a
      008FA7 20 08            [ 2]  160 	jra	00113$
      008FA9                        161 00111$:
                                    162 ;	lib/gpio.c: 64: GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
      008FA9 1E 03            [ 2]  163 	ldw	x, (0x03, sp)
      008FAB F6               [ 1]  164 	ld	a, (x)
      008FAC 14 05            [ 1]  165 	and	a, (0x05, sp)
      008FAE 1E 03            [ 2]  166 	ldw	x, (0x03, sp)
      008FB0 F7               [ 1]  167 	ld	(x), a
      008FB1                        168 00113$:
      008FB1 5B 05            [ 2]  169 	addw	sp, #5
      008FB3 81               [ 4]  170 	ret
                                    171 ;	lib/gpio.c: 68: void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t PortVal)
                                    172 ;	-----------------------------------------
                                    173 ;	 function GPIO_Write
                                    174 ;	-----------------------------------------
      008FB4                        175 _GPIO_Write:
                                    176 ;	lib/gpio.c: 70: GPIOx->ODR = PortVal;
      008FB4 1E 03            [ 2]  177 	ldw	x, (0x03, sp)
      008FB6 7B 05            [ 1]  178 	ld	a, (0x05, sp)
      008FB8 F7               [ 1]  179 	ld	(x), a
      008FB9 81               [ 4]  180 	ret
                                    181 ;	lib/gpio.c: 73: void GPIO_WriteHigh(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
                                    182 ;	-----------------------------------------
                                    183 ;	 function GPIO_WriteHigh
                                    184 ;	-----------------------------------------
      008FBA                        185 _GPIO_WriteHigh:
                                    186 ;	lib/gpio.c: 75: GPIOx->ODR |= (uint8_t)PortPins;
      008FBA 1E 03            [ 2]  187 	ldw	x, (0x03, sp)
      008FBC F6               [ 1]  188 	ld	a, (x)
      008FBD 1A 05            [ 1]  189 	or	a, (0x05, sp)
      008FBF F7               [ 1]  190 	ld	(x), a
      008FC0 81               [ 4]  191 	ret
                                    192 ;	lib/gpio.c: 78: void GPIO_WriteLow(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
                                    193 ;	-----------------------------------------
                                    194 ;	 function GPIO_WriteLow
                                    195 ;	-----------------------------------------
      008FC1                        196 _GPIO_WriteLow:
      008FC1 88               [ 1]  197 	push	a
                                    198 ;	lib/gpio.c: 80: GPIOx->ODR &= (uint8_t)(~PortPins);
      008FC2 1E 04            [ 2]  199 	ldw	x, (0x04, sp)
      008FC4 F6               [ 1]  200 	ld	a, (x)
      008FC5 6B 01            [ 1]  201 	ld	(0x01, sp), a
      008FC7 7B 06            [ 1]  202 	ld	a, (0x06, sp)
      008FC9 43               [ 1]  203 	cpl	a
      008FCA 14 01            [ 1]  204 	and	a, (0x01, sp)
      008FCC F7               [ 1]  205 	ld	(x), a
      008FCD 84               [ 1]  206 	pop	a
      008FCE 81               [ 4]  207 	ret
                                    208 ;	lib/gpio.c: 93: BitStatus GPIO_ReadInputPin(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
                                    209 ;	-----------------------------------------
                                    210 ;	 function GPIO_ReadInputPin
                                    211 ;	-----------------------------------------
      008FCF                        212 _GPIO_ReadInputPin:
                                    213 ;	lib/gpio.c: 95: return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
      008FCF 1E 03            [ 2]  214 	ldw	x, (0x03, sp)
      008FD1 E6 01            [ 1]  215 	ld	a, (0x1, x)
      008FD3 14 05            [ 1]  216 	and	a, (0x05, sp)
      008FD5 81               [ 4]  217 	ret
                                    218 ;	lib/gpio.c: 98: void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, FunctionalState NewState)
                                    219 ;	-----------------------------------------
                                    220 ;	 function GPIO_ExternalPullUpConfig
                                    221 ;	-----------------------------------------
      008FD6                        222 _GPIO_ExternalPullUpConfig:
      008FD6 88               [ 1]  223 	push	a
                                    224 ;	lib/gpio.c: 102: GPIOx->CR1 |= (uint8_t)GPIO_Pin;
      008FD7 1E 04            [ 2]  225 	ldw	x, (0x04, sp)
      008FD9 1C 00 03         [ 2]  226 	addw	x, #0x0003
                                    227 ;	lib/gpio.c: 100: if (NewState != DISABLE)  //External Pull-Up Set
      008FDC 0D 07            [ 1]  228 	tnz	(0x07, sp)
      008FDE 27 06            [ 1]  229 	jreq	00102$
                                    230 ;	lib/gpio.c: 102: GPIOx->CR1 |= (uint8_t)GPIO_Pin;
      008FE0 F6               [ 1]  231 	ld	a, (x)
      008FE1 1A 06            [ 1]  232 	or	a, (0x06, sp)
      008FE3 F7               [ 1]  233 	ld	(x), a
      008FE4 20 09            [ 2]  234 	jra	00104$
      008FE6                        235 00102$:
                                    236 ;	lib/gpio.c: 106: GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
      008FE6 F6               [ 1]  237 	ld	a, (x)
      008FE7 6B 01            [ 1]  238 	ld	(0x01, sp), a
      008FE9 7B 06            [ 1]  239 	ld	a, (0x06, sp)
      008FEB 43               [ 1]  240 	cpl	a
      008FEC 14 01            [ 1]  241 	and	a, (0x01, sp)
      008FEE F7               [ 1]  242 	ld	(x), a
      008FEF                        243 00104$:
      008FEF 84               [ 1]  244 	pop	a
      008FF0 81               [ 4]  245 	ret
                                    246 	.area CODE
                                    247 	.area INITIALIZER
                                    248 	.area CABS (ABS)
