;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW64)
;--------------------------------------------------------
	.module device
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _GPIO_WriteLow
	.globl _GPIO_Init
	.globl _Dev_Init
	.globl _Dev_Manager
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
;	user/device.c: 3: void Dev_Init(void)
;	-----------------------------------------
;	 function Dev_Init
;	-----------------------------------------
_Dev_Init:
;	user/device.c: 5: GPIO_Init(DEV_PORT, DEV1_PIN | DEV2_PIN | DEV3_PIN | DEV4_PIN | DEV5_PIN | DEV6_PIN | DEV7_PIN | DEV8_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
	push	#0xf0
	push	#0xff
	push	#0x05
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	user/device.c: 6: GPIO_WriteLow(DEV_PORT, DEV1_PIN|DEV2_PIN|DEV3_PIN|DEV4_PIN|DEV5_PIN|DEV6_PIN|DEV7_PIN|DEV8_PIN);
	push	#0xff
	push	#0x05
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
	ret
;	user/device.c: 9: void Dev_Manager(void)
;	-----------------------------------------
;	 function Dev_Manager
;	-----------------------------------------
_Dev_Manager:
;	user/device.c: 12: }
	ret
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)
