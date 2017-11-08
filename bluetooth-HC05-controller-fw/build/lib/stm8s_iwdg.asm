;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW64)
;--------------------------------------------------------
	.module stm8s_iwdg
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _IWDG_WriteAccessCmd
	.globl _IWDG_SetPrescaler
	.globl _IWDG_SetReload
	.globl _IWDG_ReloadCounter
	.globl _IWDG_Enable
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
;	lib/stm8s_iwdg.c: 13: void IWDG_WriteAccessCmd(IWDG_WriteAccess_TypeDef IWDG_WriteAccess)
;	-----------------------------------------
;	 function IWDG_WriteAccessCmd
;	-----------------------------------------
_IWDG_WriteAccessCmd:
;	lib/stm8s_iwdg.c: 15: IWDG->KR = (uint8_t)IWDG_WriteAccess; /* Write Access */
	ldw	x, #0x50e0
	ld	a, (0x03, sp)
	ld	(x), a
	ret
;	lib/stm8s_iwdg.c: 18: void IWDG_SetPrescaler(IWDG_Prescaler_TypeDef IWDG_Prescaler)
;	-----------------------------------------
;	 function IWDG_SetPrescaler
;	-----------------------------------------
_IWDG_SetPrescaler:
;	lib/stm8s_iwdg.c: 20: IWDG->PR = (uint8_t)IWDG_Prescaler;
	ldw	x, #0x50e1
	ld	a, (0x03, sp)
	ld	(x), a
	ret
;	lib/stm8s_iwdg.c: 23: void IWDG_SetReload(uint8_t IWDG_Reload)
;	-----------------------------------------
;	 function IWDG_SetReload
;	-----------------------------------------
_IWDG_SetReload:
;	lib/stm8s_iwdg.c: 25: IWDG->RLR = IWDG_Reload;
	ldw	x, #0x50e2
	ld	a, (0x03, sp)
	ld	(x), a
	ret
;	lib/stm8s_iwdg.c: 28: void IWDG_ReloadCounter(void)
;	-----------------------------------------
;	 function IWDG_ReloadCounter
;	-----------------------------------------
_IWDG_ReloadCounter:
;	lib/stm8s_iwdg.c: 30: IWDG->KR = IWDG_KEY_REFRESH;
	mov	0x50e0+0, #0xaa
	ret
;	lib/stm8s_iwdg.c: 33: void IWDG_Enable(void)
;	-----------------------------------------
;	 function IWDG_Enable
;	-----------------------------------------
_IWDG_Enable:
;	lib/stm8s_iwdg.c: 35: IWDG->KR = IWDG_KEY_ENABLE;
	mov	0x50e0+0, #0xcc
	ret
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)
