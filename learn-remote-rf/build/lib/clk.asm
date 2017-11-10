;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW64)
;--------------------------------------------------------
	.module clk
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _HSIDivFactor
	.globl _CLK_Config
	.globl _CLK_PeripheralClockConfig
	.globl _CLK_SYSCLKConfig
	.globl _CLK_GetClockFreq
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
;	lib/clk.c: 6: void CLK_Config(void)
;	-----------------------------------------
;	 function CLK_Config
;	-----------------------------------------
_CLK_Config:
;	lib/clk.c: 9: CLK->ICKR = CLK_ICKR_RESET_VALUE;
	mov	0x50c0+0, #0x01
;	lib/clk.c: 10: CLK->ECKR = CLK_ECKR_RESET_VALUE;
	mov	0x50c1+0, #0x00
;	lib/clk.c: 11: CLK->SWR  = CLK_SWR_RESET_VALUE;
	mov	0x50c4+0, #0xe1
;	lib/clk.c: 12: CLK->SWCR = CLK_SWCR_RESET_VALUE;
	mov	0x50c5+0, #0x00
;	lib/clk.c: 13: CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
	mov	0x50c6+0, #0x18
;	lib/clk.c: 14: CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
	mov	0x50c7+0, #0xff
;	lib/clk.c: 15: CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
	mov	0x50ca+0, #0xff
;	lib/clk.c: 16: CLK->CSSR = CLK_CSSR_RESET_VALUE;
	mov	0x50c8+0, #0x00
;	lib/clk.c: 17: CLK->CCOR = CLK_CCOR_RESET_VALUE;
	mov	0x50c9+0, #0x00
;	lib/clk.c: 18: while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
00101$:
	ldw	x, #0x50c9
	ld	a, (x)
	srl	a
	jrc	00101$
;	lib/clk.c: 20: CLK->CCOR = CLK_CCOR_RESET_VALUE;
	mov	0x50c9+0, #0x00
;	lib/clk.c: 21: CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
	mov	0x50cc+0, #0x00
;	lib/clk.c: 22: CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
	mov	0x50cd+0, #0x00
;	lib/clk.c: 24: CLK->ICKR |= CLK_ICKR_HSIEN;
	bset	0x50c0, #0
;	lib/clk.c: 26: CLK->ICKR |= CLK_ICKR_LSIEN;
	ldw	x, #0x50c0
	ld	a, (x)
	or	a, #0x08
	ld	(x), a
;	lib/clk.c: 29: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV); 
	ldw	x, #0x50c6
	ld	a, (x)
	and	a, #0xe7
	ld	(x), a
;	lib/clk.c: 31: CLK->CKDIVR |= (uint8_t)CLK_PRESCALER_HSIDIV1;
	ldw	x, #0x50c6
	ld	a, (x)
	ldw	x, #0x50c6
	ld	(x), a
;	lib/clk.c: 33: CLK_SYSCLKConfig(CLK_PRESCALER_HSIDIV1);
	push	#0x00
	call	_CLK_SYSCLKConfig
	pop	a
	ret
;	lib/clk.c: 36: void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
;	-----------------------------------------
;	 function CLK_PeripheralClockConfig
;	-----------------------------------------
_CLK_PeripheralClockConfig:
	push	a
;	lib/clk.c: 42: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
	ld	a, (0x04, sp)
	and	a, #0x0f
	push	a
	ld	a, #0x01
	ld	(0x02, sp), a
	pop	a
	tnz	a
	jreq	00111$
00110$:
	sll	(0x01, sp)
	dec	a
	jrne	00110$
00111$:
;	lib/clk.c: 40: if(((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
	ld	a, (0x04, sp)
	bcp	a, #0x10
	jrne	00102$
;	lib/clk.c: 42: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
	ldw	x, #0x50c7
	ld	a, (x)
	or	a, (0x01, sp)
	ldw	x, #0x50c7
	ld	(x), a
	jra	00104$
00102$:
;	lib/clk.c: 45: CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
	ldw	x, #0x50ca
	ld	a, (x)
	or	a, (0x01, sp)
	ldw	x, #0x50ca
	ld	(x), a
00104$:
	pop	a
	ret
;	lib/clk.c: 48: void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
;	-----------------------------------------
;	 function CLK_SYSCLKConfig
;	-----------------------------------------
_CLK_SYSCLKConfig:
	pushw	x
;	lib/clk.c: 51: if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
	tnz	(0x05, sp)
	jrmi	00102$
;	lib/clk.c: 53: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
	ldw	x, #0x50c6
	ld	a, (x)
	and	a, #0xe7
	ld	(x), a
;	lib/clk.c: 54: CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
	ldw	x, #0x50c6
	ld	a, (x)
	ld	(0x01, sp), a
	ld	a, (0x05, sp)
	and	a, #0x18
	or	a, (0x01, sp)
	ldw	x, #0x50c6
	ld	(x), a
	jra	00104$
00102$:
;	lib/clk.c: 58: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
	ldw	x, #0x50c6
	ld	a, (x)
	and	a, #0xf8
	ld	(x), a
;	lib/clk.c: 59: CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
	ldw	x, #0x50c6
	ld	a, (x)
	ld	(0x02, sp), a
	ld	a, (0x05, sp)
	and	a, #0x07
	or	a, (0x02, sp)
	ldw	x, #0x50c6
	ld	(x), a
00104$:
	popw	x
	ret
;	lib/clk.c: 63: uint32_t CLK_GetClockFreq(void)
;	-----------------------------------------
;	 function CLK_GetClockFreq
;	-----------------------------------------
_CLK_GetClockFreq:
	sub	sp, #7
;	lib/clk.c: 69: clocksource = (CLK_Source_TypeDef)CLK->CMSR; 
	ldw	x, #0x50c3
	ld	a, (x)
	ld	(0x01, sp), a
;	lib/clk.c: 70: if (clocksource == CLK_SOURCE_HSI)
	ld	a, (0x01, sp)
	cp	a, #0xe1
	jrne	00105$
;	lib/clk.c: 72: tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
	ldw	x, #0x50c6
	ld	a, (x)
	and	a, #0x18
;	lib/clk.c: 73: tmp = (uint8_t)(tmp >> 3);
	srl	a
	srl	a
	srl	a
;	lib/clk.c: 74: presc = HSIDivFactor[tmp];
	ldw	x, #_HSIDivFactor+0
	ldw	(0x06, sp), x
	clrw	x
	ld	xl, a
	addw	x, (0x06, sp)
	ld	a, (x)
;	lib/clk.c: 75: clockfrequency = HSI_VALUE / presc;
	clrw	x
	ld	xl, a
	clrw	y
	pushw	x
	pushw	y
	push	#0x00
	push	#0x24
	push	#0xf4
	push	#0x00
	call	__divulong
	addw	sp, #8
	ldw	(0x04, sp), x
	jra	00106$
00105$:
;	lib/clk.c: 77: else if ( clocksource == CLK_SOURCE_LSI)
	ld	a, (0x01, sp)
	cp	a, #0xd2
	jrne	00102$
;	lib/clk.c: 79: clockfrequency = LSI_VALUE;
	ldw	x, #0xf400
	ldw	(0x04, sp), x
	ldw	y, #0x0001
	jra	00106$
00102$:
;	lib/clk.c: 83: clockfrequency = HSE_VALUE;
	ldw	x, #0x2400
	ldw	(0x04, sp), x
	ldw	y, #0x00f4
00106$:
;	lib/clk.c: 85: return((uint32_t)clockfrequency);
	ldw	x, (0x04, sp)
	addw	sp, #7
	ret
	.area CODE
_HSIDivFactor:
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x08	; 8
	.area INITIALIZER
	.area CABS (ABS)
