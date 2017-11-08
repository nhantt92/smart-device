;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW64)
;--------------------------------------------------------
	.module stm8s_clk
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
;	lib/stm8s_clk.c: 15: void CLK_Config(void)
;	-----------------------------------------
;	 function CLK_Config
;	-----------------------------------------
_CLK_Config:
;	lib/stm8s_clk.c: 18: CLK->ICKR = CLK_ICKR_RESET_VALUE;
	mov	0x50c0+0, #0x01
;	lib/stm8s_clk.c: 19: CLK->ECKR = CLK_ECKR_RESET_VALUE;
	mov	0x50c1+0, #0x00
;	lib/stm8s_clk.c: 20: CLK->SWR  = CLK_SWR_RESET_VALUE;
	mov	0x50c4+0, #0xe1
;	lib/stm8s_clk.c: 21: CLK->SWCR = CLK_SWCR_RESET_VALUE;
	mov	0x50c5+0, #0x00
;	lib/stm8s_clk.c: 22: CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
	mov	0x50c6+0, #0x18
;	lib/stm8s_clk.c: 23: CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
	mov	0x50c7+0, #0xff
;	lib/stm8s_clk.c: 24: CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
	mov	0x50ca+0, #0xff
;	lib/stm8s_clk.c: 25: CLK->CSSR = CLK_CSSR_RESET_VALUE;
	mov	0x50c8+0, #0x00
;	lib/stm8s_clk.c: 26: CLK->CCOR = CLK_CCOR_RESET_VALUE;
	mov	0x50c9+0, #0x00
;	lib/stm8s_clk.c: 27: while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
00101$:
	ldw	x, #0x50c9
	ld	a, (x)
	srl	a
	jrc	00101$
;	lib/stm8s_clk.c: 29: CLK->CCOR = CLK_CCOR_RESET_VALUE;
	mov	0x50c9+0, #0x00
;	lib/stm8s_clk.c: 30: CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
	mov	0x50cc+0, #0x00
;	lib/stm8s_clk.c: 31: CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
	mov	0x50cd+0, #0x00
;	lib/stm8s_clk.c: 35: CLK->ICKR |= CLK_ICKR_HSIEN; /* Set HSIEN bit */
	bset	0x50c0, #0
;	lib/stm8s_clk.c: 42: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV); /* Clear High speed internal clock prescaler */
	ldw	x, #0x50c6
	ld	a, (x)
	and	a, #0xe7
	ld	(x), a
;	lib/stm8s_clk.c: 43: CLK->CKDIVR |= (uint8_t)CLK_PRESCALER_HSIDIV1; /* Set High speed internal clock prescaler */
	ldw	x, #0x50c6
	ld	a, (x)
	ldw	x, #0x50c6
	ld	(x), a
;	lib/stm8s_clk.c: 45: CLK_SYSCLKConfig(CLK_PRESCALER_HSIDIV1);
	push	#0x00
	call	_CLK_SYSCLKConfig
	pop	a
	ret
;	lib/stm8s_clk.c: 48: void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
;	-----------------------------------------
;	 function CLK_PeripheralClockConfig
;	-----------------------------------------
_CLK_PeripheralClockConfig:
	pushw	x
;	lib/stm8s_clk.c: 55: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
	ld	a, (0x05, sp)
	and	a, #0x0f
	push	a
	ld	a, #0x01
	ld	(0x03, sp), a
	pop	a
	tnz	a
	jreq	00125$
00124$:
	sll	(0x02, sp)
	dec	a
	jrne	00124$
00125$:
;	lib/stm8s_clk.c: 60: CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
	ld	a, (0x02, sp)
	cpl	a
	ld	(0x01, sp), a
;	lib/stm8s_clk.c: 50: if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
	ld	a, (0x05, sp)
	bcp	a, #0x10
	jrne	00108$
;	lib/stm8s_clk.c: 52: if (NewState != DISABLE)
	tnz	(0x06, sp)
	jreq	00102$
;	lib/stm8s_clk.c: 55: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
	ldw	x, #0x50c7
	ld	a, (x)
	or	a, (0x02, sp)
	ldw	x, #0x50c7
	ld	(x), a
	jra	00110$
00102$:
;	lib/stm8s_clk.c: 60: CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
	ldw	x, #0x50c7
	ld	a, (x)
	and	a, (0x01, sp)
	ldw	x, #0x50c7
	ld	(x), a
	jra	00110$
00108$:
;	lib/stm8s_clk.c: 65: if (NewState != DISABLE)
	tnz	(0x06, sp)
	jreq	00105$
;	lib/stm8s_clk.c: 68: CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
	ldw	x, #0x50ca
	ld	a, (x)
	or	a, (0x02, sp)
	ldw	x, #0x50ca
	ld	(x), a
	jra	00110$
00105$:
;	lib/stm8s_clk.c: 73: CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
	ldw	x, #0x50ca
	ld	a, (x)
	and	a, (0x01, sp)
	ldw	x, #0x50ca
	ld	(x), a
00110$:
	popw	x
	ret
;	lib/stm8s_clk.c: 78: void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
;	-----------------------------------------
;	 function CLK_SYSCLKConfig
;	-----------------------------------------
_CLK_SYSCLKConfig:
	pushw	x
;	lib/stm8s_clk.c: 80: if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
	tnz	(0x05, sp)
	jrmi	00102$
;	lib/stm8s_clk.c: 82: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
	ldw	x, #0x50c6
	ld	a, (x)
	and	a, #0xe7
	ld	(x), a
;	lib/stm8s_clk.c: 83: CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
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
;	lib/stm8s_clk.c: 87: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
	ldw	x, #0x50c6
	ld	a, (x)
	and	a, #0xf8
	ld	(x), a
;	lib/stm8s_clk.c: 88: CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
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
;	lib/stm8s_clk.c: 92: uint32_t CLK_GetClockFreq(void)
;	-----------------------------------------
;	 function CLK_GetClockFreq
;	-----------------------------------------
_CLK_GetClockFreq:
	sub	sp, #7
;	lib/stm8s_clk.c: 99: clocksource = (CLK_Source_TypeDef)CLK->CMSR;
	ldw	x, #0x50c3
	ld	a, (x)
	ld	(0x05, sp), a
;	lib/stm8s_clk.c: 100: if (clocksource == CLK_SOURCE_HSI)
	ld	a, (0x05, sp)
	cp	a, #0xe1
	jrne	00105$
;	lib/stm8s_clk.c: 102: tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
	ldw	x, #0x50c6
	ld	a, (x)
	and	a, #0x18
;	lib/stm8s_clk.c: 103: tmp = (uint8_t)(tmp >> 3);
	srl	a
	srl	a
	srl	a
;	lib/stm8s_clk.c: 104: presc = HSIDivFactor[tmp];
	ldw	x, #_HSIDivFactor+0
	ldw	(0x06, sp), x
	clrw	x
	ld	xl, a
	addw	x, (0x06, sp)
	ld	a, (x)
;	lib/stm8s_clk.c: 105: clockfrequency = HSI_VALUE / presc;
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
	ldw	(0x03, sp), x
	jra	00106$
00105$:
;	lib/stm8s_clk.c: 107: else if ( clocksource == CLK_SOURCE_LSI)
	ld	a, (0x05, sp)
	cp	a, #0xd2
	jrne	00102$
;	lib/stm8s_clk.c: 109: clockfrequency = LSI_VALUE;
	ldw	x, #0xf400
	ldw	(0x03, sp), x
	ldw	y, #0x0001
	jra	00106$
00102$:
;	lib/stm8s_clk.c: 113: clockfrequency = HSE_VALUE;
	ldw	x, #0x2400
	ldw	(0x03, sp), x
	ldw	y, #0x00f4
00106$:
;	lib/stm8s_clk.c: 115: return((uint32_t)clockfrequency);
	ldw	x, (0x03, sp)
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
