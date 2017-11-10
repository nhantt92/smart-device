;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW64)
;--------------------------------------------------------
	.module main
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _GPIO_Config
	.globl _IWDG_Config
	.globl _EXTI_PORTD_IRQHandler
	.globl _TIM1_UPD_OVF_TRG_BRK_IRQHandler
	.globl _TIM4_UPD_OVF_IRQHandler
	.globl _UART1_RX_IRQHandler
	.globl _ledstt_manager
	.globl _ledstt_init
	.globl _system_manager
	.globl _system_init
	.globl _tp_manager
	.globl _tp_init
	.globl _sys_readCfg
	.globl _remote_Manager
	.globl _remote_Process
	.globl _remote_Init
	.globl _debug_Init
	.globl _CLK_Config
	.globl _TIMER_Inc
	.globl _TIMER_Init
	.globl _UART1_ReceiveData8
	.globl _TIM4_ClearITPendingBit
	.globl _TIM1_ClearFlag
	.globl _IWDG_Enable
	.globl _IWDG_ReloadCounter
	.globl _IWDG_SetReload
	.globl _IWDG_SetPrescaler
	.globl _IWDG_WriteAccessCmd
	.globl _GPIO_WriteLow
	.globl _GPIO_Init
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
;--------------------------------------------------------
; Stack segment in internal ram 
;--------------------------------------------------------
	.area	SSEG
__start__stack:
	.ds	1

;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area DABS (ABS)
;--------------------------------------------------------
; interrupt vector 
;--------------------------------------------------------
	.area HOME
__interrupt_vect:
	int s_GSINIT ;reset
	int 0x0000 ;trap
	int 0x0000 ;int0
	int 0x0000 ;int1
	int 0x0000 ;int2
	int 0x0000 ;int3
	int 0x0000 ;int4
	int 0x0000 ;int5
	int _EXTI_PORTD_IRQHandler ;int6
	int 0x0000 ;int7
	int 0x0000 ;int8
	int 0x0000 ;int9
	int 0x0000 ;int10
	int _TIM1_UPD_OVF_TRG_BRK_IRQHandler ;int11
	int 0x0000 ;int12
	int 0x0000 ;int13
	int 0x0000 ;int14
	int 0x0000 ;int15
	int 0x0000 ;int16
	int 0x0000 ;int17
	int _UART1_RX_IRQHandler ;int18
	int 0x0000 ;int19
	int 0x0000 ;int20
	int 0x0000 ;int21
	int 0x0000 ;int22
	int _TIM4_UPD_OVF_IRQHandler ;int23
	int 0x0000 ;int24
	int 0x0000 ;int25
	int 0x0000 ;int26
	int 0x0000 ;int27
	int 0x0000 ;int28
	int 0x0000 ;int29
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area GSINIT
__sdcc_gs_init_startup:
__sdcc_init_data:
; stm8_genXINIT() start
	ldw x, #l_DATA
	jreq	00002$
00001$:
	clr (s_DATA - 1, x)
	decw x
	jrne	00001$
00002$:
	ldw	x, #l_INITIALIZER
	jreq	00004$
00003$:
	ld	a, (s_INITIALIZER - 1, x)
	ld	(s_INITIALIZED - 1, x), a
	decw	x
	jrne	00003$
00004$:
; stm8_genXINIT() end
	.area GSFINAL
	jp	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
__sdcc_program_startup:
	jp	_main
;	return from main will return to caller
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
;	user/main.c: 14: INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
;	-----------------------------------------
;	 function UART1_RX_IRQHandler
;	-----------------------------------------
_UART1_RX_IRQHandler:
	div	x, a
;	user/main.c: 18: temp = UART1_ReceiveData8();
	call	_UART1_ReceiveData8
	iret
;	user/main.c: 21: INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
;	-----------------------------------------
;	 function TIM4_UPD_OVF_IRQHandler
;	-----------------------------------------
_TIM4_UPD_OVF_IRQHandler:
	div	x, a
;	user/main.c: 23: TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
	push	#0x01
	call	_TIM4_ClearITPendingBit
	pop	a
;	user/main.c: 24: TIMER_Inc();
	call	_TIMER_Inc
;	user/main.c: 25: IWDG_ReloadCounter();
	call	_IWDG_ReloadCounter
	iret
;	user/main.c: 28: INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
;	-----------------------------------------
;	 function TIM1_UPD_OVF_TRG_BRK_IRQHandler
;	-----------------------------------------
_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
	div	x, a
;	user/main.c: 30: TIM1_ClearFlag(TIM1_FLAG_UPDATE); 
	push	#0x01
	push	#0x00
	call	_TIM1_ClearFlag
	popw	x
	iret
;	user/main.c: 33: INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
;	-----------------------------------------
;	 function EXTI_PORTD_IRQHandler
;	-----------------------------------------
_EXTI_PORTD_IRQHandler:
	div	x, a
;	user/main.c: 36: remote_Process();
	call	_remote_Process
;	user/main.c: 37: IWDG_ReloadCounter();
	call	_IWDG_ReloadCounter
	iret
;	user/main.c: 41: void IWDG_Config(void)
;	-----------------------------------------
;	 function IWDG_Config
;	-----------------------------------------
_IWDG_Config:
;	user/main.c: 45: IWDG_WriteAccessCmd(IWDG_WriteAccess_Enable);
	push	#0x55
	call	_IWDG_WriteAccessCmd
	pop	a
;	user/main.c: 47: IWDG_SetPrescaler(IWDG_Prescaler_256);
	push	#0x06
	call	_IWDG_SetPrescaler
	pop	a
;	user/main.c: 51: IWDG_SetReload(250);
	push	#0xfa
	call	_IWDG_SetReload
	pop	a
;	user/main.c: 53: IWDG_ReloadCounter();
	call	_IWDG_ReloadCounter
;	user/main.c: 55: IWDG_Enable();
	jp	_IWDG_Enable
;	user/main.c: 58: void GPIO_Config(void)
;	-----------------------------------------
;	 function GPIO_Config
;	-----------------------------------------
_GPIO_Config:
;	user/main.c: 60: GPIO_Init(CTR_GPIO, CTR_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
	push	#0xf0
	push	#0x04
	push	#0x0f
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	user/main.c: 61: GPIO_WriteLow(CTR_GPIO, CTR_PIN);
	push	#0x04
	push	#0x0f
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
	ret
;	user/main.c: 64: void main(void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	user/main.c: 67: CLK_Config();
	call	_CLK_Config
;	user/main.c: 68: TIMER_Init();
	call	_TIMER_Init
;	user/main.c: 69: debug_Init();
	call	_debug_Init
;	user/main.c: 70: sys_readCfg();
	call	_sys_readCfg
;	user/main.c: 71: remote_Init();
	call	_remote_Init
;	user/main.c: 72: GPIO_Config();
	call	_GPIO_Config
;	user/main.c: 73: tp_init();
	call	_tp_init
;	user/main.c: 74: system_init();
	call	_system_init
;	user/main.c: 75: ledstt_init();
	call	_ledstt_init
;	user/main.c: 76: enableInterrupts();
	rim
;	user/main.c: 77: IWDG_Config();
	call	_IWDG_Config
;	user/main.c: 78: while(1)
00102$:
;	user/main.c: 80: remote_Manager();
	call	_remote_Manager
;	user/main.c: 81: tp_manager();
	call	_tp_manager
;	user/main.c: 82: system_manager();
	call	_system_manager
;	user/main.c: 83: ledstt_manager();
	call	_ledstt_manager
;	user/main.c: 84: IWDG_ReloadCounter();
	call	_IWDG_ReloadCounter
	jra	00102$
	ret
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)
