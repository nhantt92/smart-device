                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.6.0 #9615 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module iwdg
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _IWDG_WriteAccessCmd
                                     12 	.globl _IWDG_SetPrescaler
                                     13 	.globl _IWDG_SetReload
                                     14 	.globl _IWDG_ReloadCounter
                                     15 	.globl _IWDG_Enable
                                     16 ;--------------------------------------------------------
                                     17 ; ram data
                                     18 ;--------------------------------------------------------
                                     19 	.area DATA
                                     20 ;--------------------------------------------------------
                                     21 ; ram data
                                     22 ;--------------------------------------------------------
                                     23 	.area INITIALIZED
                                     24 ;--------------------------------------------------------
                                     25 ; absolute external ram data
                                     26 ;--------------------------------------------------------
                                     27 	.area DABS (ABS)
                                     28 ;--------------------------------------------------------
                                     29 ; global & static initialisations
                                     30 ;--------------------------------------------------------
                                     31 	.area HOME
                                     32 	.area GSINIT
                                     33 	.area GSFINAL
                                     34 	.area GSINIT
                                     35 ;--------------------------------------------------------
                                     36 ; Home
                                     37 ;--------------------------------------------------------
                                     38 	.area HOME
                                     39 	.area HOME
                                     40 ;--------------------------------------------------------
                                     41 ; code
                                     42 ;--------------------------------------------------------
                                     43 	.area CODE
                                     44 ;	lib/iwdg.c: 3: void IWDG_WriteAccessCmd(IWDG_WriteAccess_TypeDef IWDG_WriteAccess)
                                     45 ;	-----------------------------------------
                                     46 ;	 function IWDG_WriteAccessCmd
                                     47 ;	-----------------------------------------
      008FE4                         48 _IWDG_WriteAccessCmd:
                                     49 ;	lib/iwdg.c: 5: IWDG->KR = (uint8_t)IWDG_WriteAccess; /* Write Access */
      008FE4 AE 50 E0         [ 2]   50 	ldw	x, #0x50e0
      008FE7 7B 03            [ 1]   51 	ld	a, (0x03, sp)
      008FE9 F7               [ 1]   52 	ld	(x), a
      008FEA 81               [ 4]   53 	ret
                                     54 ;	lib/iwdg.c: 8: void IWDG_SetPrescaler(IWDG_Prescaler_TypeDef IWDG_Prescaler)
                                     55 ;	-----------------------------------------
                                     56 ;	 function IWDG_SetPrescaler
                                     57 ;	-----------------------------------------
      008FEB                         58 _IWDG_SetPrescaler:
                                     59 ;	lib/iwdg.c: 10: IWDG->PR = (uint8_t)IWDG_Prescaler;
      008FEB AE 50 E1         [ 2]   60 	ldw	x, #0x50e1
      008FEE 7B 03            [ 1]   61 	ld	a, (0x03, sp)
      008FF0 F7               [ 1]   62 	ld	(x), a
      008FF1 81               [ 4]   63 	ret
                                     64 ;	lib/iwdg.c: 13: void IWDG_SetReload(uint8_t IWDG_Reload)
                                     65 ;	-----------------------------------------
                                     66 ;	 function IWDG_SetReload
                                     67 ;	-----------------------------------------
      008FF2                         68 _IWDG_SetReload:
                                     69 ;	lib/iwdg.c: 15: IWDG->RLR = IWDG_Reload;
      008FF2 AE 50 E2         [ 2]   70 	ldw	x, #0x50e2
      008FF5 7B 03            [ 1]   71 	ld	a, (0x03, sp)
      008FF7 F7               [ 1]   72 	ld	(x), a
      008FF8 81               [ 4]   73 	ret
                                     74 ;	lib/iwdg.c: 18: void IWDG_ReloadCounter(void)
                                     75 ;	-----------------------------------------
                                     76 ;	 function IWDG_ReloadCounter
                                     77 ;	-----------------------------------------
      008FF9                         78 _IWDG_ReloadCounter:
                                     79 ;	lib/iwdg.c: 20: IWDG->KR = IWDG_KEY_REFRESH;
      008FF9 35 AA 50 E0      [ 1]   80 	mov	0x50e0+0, #0xaa
      008FFD 81               [ 4]   81 	ret
                                     82 ;	lib/iwdg.c: 23: void IWDG_Enable(void)
                                     83 ;	-----------------------------------------
                                     84 ;	 function IWDG_Enable
                                     85 ;	-----------------------------------------
      008FFE                         86 _IWDG_Enable:
                                     87 ;	lib/iwdg.c: 25: IWDG->KR = IWDG_KEY_ENABLE;
      008FFE 35 CC 50 E0      [ 1]   88 	mov	0x50e0+0, #0xcc
      009002 81               [ 4]   89 	ret
                                     90 	.area CODE
                                     91 	.area INITIALIZER
                                     92 	.area CABS (ABS)
