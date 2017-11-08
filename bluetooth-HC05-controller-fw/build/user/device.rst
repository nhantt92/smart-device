                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.6.0 #9615 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module device
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _GPIO_WriteLow
                                     12 	.globl _GPIO_Init
                                     13 	.globl _Dev_Init
                                     14 	.globl _Dev_Manager
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
                                     43 ;	user/device.c: 3: void Dev_Init(void)
                                     44 ;	-----------------------------------------
                                     45 ;	 function Dev_Init
                                     46 ;	-----------------------------------------
      0080A0                         47 _Dev_Init:
                                     48 ;	user/device.c: 5: GPIO_Init(DEV_PORT, DEV1_PIN | DEV2_PIN | DEV3_PIN | DEV4_PIN | DEV5_PIN | DEV6_PIN | DEV7_PIN | DEV8_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
      0080A0 4B F0            [ 1]   49 	push	#0xf0
      0080A2 4B FF            [ 1]   50 	push	#0xff
      0080A4 4B 05            [ 1]   51 	push	#0x05
      0080A6 4B 50            [ 1]   52 	push	#0x50
      0080A8 CD 98 0F         [ 4]   53 	call	_GPIO_Init
      0080AB 5B 04            [ 2]   54 	addw	sp, #4
                                     55 ;	user/device.c: 6: GPIO_WriteLow(DEV_PORT, DEV1_PIN|DEV2_PIN|DEV3_PIN|DEV4_PIN|DEV5_PIN|DEV6_PIN|DEV7_PIN|DEV8_PIN);
      0080AD 4B FF            [ 1]   56 	push	#0xff
      0080AF 4B 05            [ 1]   57 	push	#0x05
      0080B1 4B 50            [ 1]   58 	push	#0x50
      0080B3 CD 98 AA         [ 4]   59 	call	_GPIO_WriteLow
      0080B6 5B 03            [ 2]   60 	addw	sp, #3
      0080B8 81               [ 4]   61 	ret
                                     62 ;	user/device.c: 9: void Dev_Manager(void)
                                     63 ;	-----------------------------------------
                                     64 ;	 function Dev_Manager
                                     65 ;	-----------------------------------------
      0080B9                         66 _Dev_Manager:
                                     67 ;	user/device.c: 12: }
      0080B9 81               [ 4]   68 	ret
                                     69 	.area CODE
                                     70 	.area INITIALIZER
                                     71 	.area CABS (ABS)
