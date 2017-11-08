                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.6.0 #9615 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8s_gpio
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _GPIO_Init
                                     12 	.globl _GPIO_Write
                                     13 	.globl _GPIO_WriteHigh
                                     14 	.globl _GPIO_WriteLow
                                     15 	.globl _GPIO_WriteReverse
                                     16 	.globl _GPIO_ReadOutputData
                                     17 	.globl _GPIO_ReadInputData
                                     18 	.globl _GPIO_ReadInputPin
                                     19 	.globl _GPIO_ExternalPullUpConfig
                                     20 ;--------------------------------------------------------
                                     21 ; ram data
                                     22 ;--------------------------------------------------------
                                     23 	.area DATA
                                     24 ;--------------------------------------------------------
                                     25 ; ram data
                                     26 ;--------------------------------------------------------
                                     27 	.area INITIALIZED
                                     28 ;--------------------------------------------------------
                                     29 ; absolute external ram data
                                     30 ;--------------------------------------------------------
                                     31 	.area DABS (ABS)
                                     32 ;--------------------------------------------------------
                                     33 ; global & static initialisations
                                     34 ;--------------------------------------------------------
                                     35 	.area HOME
                                     36 	.area GSINIT
                                     37 	.area GSFINAL
                                     38 	.area GSINIT
                                     39 ;--------------------------------------------------------
                                     40 ; Home
                                     41 ;--------------------------------------------------------
                                     42 	.area HOME
                                     43 	.area HOME
                                     44 ;--------------------------------------------------------
                                     45 ; code
                                     46 ;--------------------------------------------------------
                                     47 	.area CODE
                                     48 ;	lib/stm8s_gpio.c: 13: void GPIO_Init(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
                                     49 ;	-----------------------------------------
                                     50 ;	 function GPIO_Init
                                     51 ;	-----------------------------------------
      00980F                         52 _GPIO_Init:
      00980F 52 07            [ 2]   53 	sub	sp, #7
                                     54 ;	lib/stm8s_gpio.c: 16: GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
      009811 16 0A            [ 2]   55 	ldw	y, (0x0a, sp)
      009813 17 04            [ 2]   56 	ldw	(0x04, sp), y
      009815 1E 04            [ 2]   57 	ldw	x, (0x04, sp)
      009817 7F               [ 1]   58 	clr	(x)
                                     59 ;	lib/stm8s_gpio.c: 17: GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
      009818 1E 04            [ 2]   60 	ldw	x, (0x04, sp)
      00981A 5C               [ 2]   61 	incw	x
      00981B 5C               [ 2]   62 	incw	x
      00981C 1F 06            [ 2]   63 	ldw	(0x06, sp), x
      00981E 1E 06            [ 2]   64 	ldw	x, (0x06, sp)
      009820 7F               [ 1]   65 	clr	(x)
                                     66 ;	lib/stm8s_gpio.c: 18: GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
      009821 1E 04            [ 2]   67 	ldw	x, (0x04, sp)
      009823 1C 00 03         [ 2]   68 	addw	x, #0x0003
      009826 1F 02            [ 2]   69 	ldw	(0x02, sp), x
      009828 1E 02            [ 2]   70 	ldw	x, (0x02, sp)
      00982A 7F               [ 1]   71 	clr	(x)
                                     72 ;	lib/stm8s_gpio.c: 19: GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
      00982B 16 04            [ 2]   73 	ldw	y, (0x04, sp)
      00982D 72 A9 00 04      [ 2]   74 	addw	y, #0x0004
      009831 90 7F            [ 1]   75 	clr	(y)
                                     76 ;	lib/stm8s_gpio.c: 22: GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin)); /* Reset corresponding bit to GPIO_Pin in CR2 register */
      009833 90 F6            [ 1]   77 	ld	a, (y)
      009835 88               [ 1]   78 	push	a
      009836 7B 0D            [ 1]   79 	ld	a, (0x0d, sp)
      009838 43               [ 1]   80 	cpl	a
      009839 6B 02            [ 1]   81 	ld	(0x02, sp), a
      00983B 84               [ 1]   82 	pop	a
      00983C 14 01            [ 1]   83 	and	a, (0x01, sp)
      00983E 90 F7            [ 1]   84 	ld	(y), a
                                     85 ;	lib/stm8s_gpio.c: 27: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
      009840 0D 0D            [ 1]   86 	tnz	(0x0d, sp)
      009842 2A 22            [ 1]   87 	jrpl	00105$
                                     88 ;	lib/stm8s_gpio.c: 29: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
      009844 7B 0D            [ 1]   89 	ld	a, (0x0d, sp)
      009846 A5 10            [ 1]   90 	bcp	a, #0x10
      009848 27 0A            [ 1]   91 	jreq	00102$
                                     92 ;	lib/stm8s_gpio.c: 31: GPIOx->ODR |= (uint8_t)GPIO_Pin;
      00984A 1E 04            [ 2]   93 	ldw	x, (0x04, sp)
      00984C F6               [ 1]   94 	ld	a, (x)
      00984D 1A 0C            [ 1]   95 	or	a, (0x0c, sp)
      00984F 1E 04            [ 2]   96 	ldw	x, (0x04, sp)
      009851 F7               [ 1]   97 	ld	(x), a
      009852 20 08            [ 2]   98 	jra	00103$
      009854                         99 00102$:
                                    100 ;	lib/stm8s_gpio.c: 35: GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
      009854 1E 04            [ 2]  101 	ldw	x, (0x04, sp)
      009856 F6               [ 1]  102 	ld	a, (x)
      009857 14 01            [ 1]  103 	and	a, (0x01, sp)
      009859 1E 04            [ 2]  104 	ldw	x, (0x04, sp)
      00985B F7               [ 1]  105 	ld	(x), a
      00985C                        106 00103$:
                                    107 ;	lib/stm8s_gpio.c: 38: GPIOx->DDR |= (uint8_t)GPIO_Pin;
      00985C 1E 06            [ 2]  108 	ldw	x, (0x06, sp)
      00985E F6               [ 1]  109 	ld	a, (x)
      00985F 1A 0C            [ 1]  110 	or	a, (0x0c, sp)
      009861 1E 06            [ 2]  111 	ldw	x, (0x06, sp)
      009863 F7               [ 1]  112 	ld	(x), a
      009864 20 08            [ 2]  113 	jra	00106$
      009866                        114 00105$:
                                    115 ;	lib/stm8s_gpio.c: 43: GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
      009866 1E 06            [ 2]  116 	ldw	x, (0x06, sp)
      009868 F6               [ 1]  117 	ld	a, (x)
      009869 14 01            [ 1]  118 	and	a, (0x01, sp)
      00986B 1E 06            [ 2]  119 	ldw	x, (0x06, sp)
      00986D F7               [ 1]  120 	ld	(x), a
      00986E                        121 00106$:
                                    122 ;	lib/stm8s_gpio.c: 48: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
      00986E 7B 0D            [ 1]  123 	ld	a, (0x0d, sp)
      009870 A5 40            [ 1]  124 	bcp	a, #0x40
      009872 27 0A            [ 1]  125 	jreq	00108$
                                    126 ;	lib/stm8s_gpio.c: 50: GPIOx->CR1 |= (uint8_t)GPIO_Pin;
      009874 1E 02            [ 2]  127 	ldw	x, (0x02, sp)
      009876 F6               [ 1]  128 	ld	a, (x)
      009877 1A 0C            [ 1]  129 	or	a, (0x0c, sp)
      009879 1E 02            [ 2]  130 	ldw	x, (0x02, sp)
      00987B F7               [ 1]  131 	ld	(x), a
      00987C 20 08            [ 2]  132 	jra	00109$
      00987E                        133 00108$:
                                    134 ;	lib/stm8s_gpio.c: 54: GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
      00987E 1E 02            [ 2]  135 	ldw	x, (0x02, sp)
      009880 F6               [ 1]  136 	ld	a, (x)
      009881 14 01            [ 1]  137 	and	a, (0x01, sp)
      009883 1E 02            [ 2]  138 	ldw	x, (0x02, sp)
      009885 F7               [ 1]  139 	ld	(x), a
      009886                        140 00109$:
                                    141 ;	lib/stm8s_gpio.c: 59: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
      009886 7B 0D            [ 1]  142 	ld	a, (0x0d, sp)
      009888 A5 20            [ 1]  143 	bcp	a, #0x20
      00988A 27 08            [ 1]  144 	jreq	00111$
                                    145 ;	lib/stm8s_gpio.c: 61: GPIOx->CR2 |= (uint8_t)GPIO_Pin;
      00988C 90 F6            [ 1]  146 	ld	a, (y)
      00988E 1A 0C            [ 1]  147 	or	a, (0x0c, sp)
      009890 90 F7            [ 1]  148 	ld	(y), a
      009892 20 06            [ 2]  149 	jra	00113$
      009894                        150 00111$:
                                    151 ;	lib/stm8s_gpio.c: 65: GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
      009894 90 F6            [ 1]  152 	ld	a, (y)
      009896 14 01            [ 1]  153 	and	a, (0x01, sp)
      009898 90 F7            [ 1]  154 	ld	(y), a
      00989A                        155 00113$:
      00989A 5B 07            [ 2]  156 	addw	sp, #7
      00989C 81               [ 4]  157 	ret
                                    158 ;	lib/stm8s_gpio.c: 69: void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t PortVal)
                                    159 ;	-----------------------------------------
                                    160 ;	 function GPIO_Write
                                    161 ;	-----------------------------------------
      00989D                        162 _GPIO_Write:
                                    163 ;	lib/stm8s_gpio.c: 71: GPIOx->ODR = PortVal;
      00989D 1E 03            [ 2]  164 	ldw	x, (0x03, sp)
      00989F 7B 05            [ 1]  165 	ld	a, (0x05, sp)
      0098A1 F7               [ 1]  166 	ld	(x), a
      0098A2 81               [ 4]  167 	ret
                                    168 ;	lib/stm8s_gpio.c: 74: void GPIO_WriteHigh(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
                                    169 ;	-----------------------------------------
                                    170 ;	 function GPIO_WriteHigh
                                    171 ;	-----------------------------------------
      0098A3                        172 _GPIO_WriteHigh:
                                    173 ;	lib/stm8s_gpio.c: 76: GPIOx->ODR |= (uint8_t)PortPins;
      0098A3 1E 03            [ 2]  174 	ldw	x, (0x03, sp)
      0098A5 F6               [ 1]  175 	ld	a, (x)
      0098A6 1A 05            [ 1]  176 	or	a, (0x05, sp)
      0098A8 F7               [ 1]  177 	ld	(x), a
      0098A9 81               [ 4]  178 	ret
                                    179 ;	lib/stm8s_gpio.c: 79: void GPIO_WriteLow(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
                                    180 ;	-----------------------------------------
                                    181 ;	 function GPIO_WriteLow
                                    182 ;	-----------------------------------------
      0098AA                        183 _GPIO_WriteLow:
      0098AA 88               [ 1]  184 	push	a
                                    185 ;	lib/stm8s_gpio.c: 81: GPIOx->ODR &= (uint8_t)(~PortPins);
      0098AB 1E 04            [ 2]  186 	ldw	x, (0x04, sp)
      0098AD F6               [ 1]  187 	ld	a, (x)
      0098AE 6B 01            [ 1]  188 	ld	(0x01, sp), a
      0098B0 7B 06            [ 1]  189 	ld	a, (0x06, sp)
      0098B2 43               [ 1]  190 	cpl	a
      0098B3 14 01            [ 1]  191 	and	a, (0x01, sp)
      0098B5 F7               [ 1]  192 	ld	(x), a
      0098B6 84               [ 1]  193 	pop	a
      0098B7 81               [ 4]  194 	ret
                                    195 ;	lib/stm8s_gpio.c: 84: void GPIO_WriteReverse(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
                                    196 ;	-----------------------------------------
                                    197 ;	 function GPIO_WriteReverse
                                    198 ;	-----------------------------------------
      0098B8                        199 _GPIO_WriteReverse:
                                    200 ;	lib/stm8s_gpio.c: 86: GPIOx->ODR ^= (uint8_t)PortPins;
      0098B8 1E 03            [ 2]  201 	ldw	x, (0x03, sp)
      0098BA F6               [ 1]  202 	ld	a, (x)
      0098BB 18 05            [ 1]  203 	xor	a, (0x05, sp)
      0098BD F7               [ 1]  204 	ld	(x), a
      0098BE 81               [ 4]  205 	ret
                                    206 ;	lib/stm8s_gpio.c: 89: uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
                                    207 ;	-----------------------------------------
                                    208 ;	 function GPIO_ReadOutputData
                                    209 ;	-----------------------------------------
      0098BF                        210 _GPIO_ReadOutputData:
                                    211 ;	lib/stm8s_gpio.c: 91: return ((uint8_t)GPIOx->ODR);
      0098BF 1E 03            [ 2]  212 	ldw	x, (0x03, sp)
      0098C1 F6               [ 1]  213 	ld	a, (x)
      0098C2 81               [ 4]  214 	ret
                                    215 ;	lib/stm8s_gpio.c: 94: uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
                                    216 ;	-----------------------------------------
                                    217 ;	 function GPIO_ReadInputData
                                    218 ;	-----------------------------------------
      0098C3                        219 _GPIO_ReadInputData:
                                    220 ;	lib/stm8s_gpio.c: 96: return ((uint8_t)GPIOx->IDR);
      0098C3 1E 03            [ 2]  221 	ldw	x, (0x03, sp)
      0098C5 E6 01            [ 1]  222 	ld	a, (0x1, x)
      0098C7 81               [ 4]  223 	ret
                                    224 ;	lib/stm8s_gpio.c: 99: BitStatus GPIO_ReadInputPin(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
                                    225 ;	-----------------------------------------
                                    226 ;	 function GPIO_ReadInputPin
                                    227 ;	-----------------------------------------
      0098C8                        228 _GPIO_ReadInputPin:
                                    229 ;	lib/stm8s_gpio.c: 101: return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
      0098C8 1E 03            [ 2]  230 	ldw	x, (0x03, sp)
      0098CA E6 01            [ 1]  231 	ld	a, (0x1, x)
      0098CC 14 05            [ 1]  232 	and	a, (0x05, sp)
      0098CE 81               [ 4]  233 	ret
                                    234 ;	lib/stm8s_gpio.c: 104: void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, FunctionalState NewState)
                                    235 ;	-----------------------------------------
                                    236 ;	 function GPIO_ExternalPullUpConfig
                                    237 ;	-----------------------------------------
      0098CF                        238 _GPIO_ExternalPullUpConfig:
      0098CF 88               [ 1]  239 	push	a
                                    240 ;	lib/stm8s_gpio.c: 108: GPIOx->CR1 |= (uint8_t)GPIO_Pin;
      0098D0 1E 04            [ 2]  241 	ldw	x, (0x04, sp)
      0098D2 1C 00 03         [ 2]  242 	addw	x, #0x0003
                                    243 ;	lib/stm8s_gpio.c: 106: if (NewState != DISABLE) /* External Pull-Up Set*/
      0098D5 0D 07            [ 1]  244 	tnz	(0x07, sp)
      0098D7 27 06            [ 1]  245 	jreq	00102$
                                    246 ;	lib/stm8s_gpio.c: 108: GPIOx->CR1 |= (uint8_t)GPIO_Pin;
      0098D9 F6               [ 1]  247 	ld	a, (x)
      0098DA 1A 06            [ 1]  248 	or	a, (0x06, sp)
      0098DC F7               [ 1]  249 	ld	(x), a
      0098DD 20 09            [ 2]  250 	jra	00104$
      0098DF                        251 00102$:
                                    252 ;	lib/stm8s_gpio.c: 111: GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
      0098DF F6               [ 1]  253 	ld	a, (x)
      0098E0 6B 01            [ 1]  254 	ld	(0x01, sp), a
      0098E2 7B 06            [ 1]  255 	ld	a, (0x06, sp)
      0098E4 43               [ 1]  256 	cpl	a
      0098E5 14 01            [ 1]  257 	and	a, (0x01, sp)
      0098E7 F7               [ 1]  258 	ld	(x), a
      0098E8                        259 00104$:
      0098E8 84               [ 1]  260 	pop	a
      0098E9 81               [ 4]  261 	ret
                                    262 	.area CODE
                                    263 	.area INITIALIZER
                                    264 	.area CABS (ABS)
