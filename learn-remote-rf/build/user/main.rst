                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.6.0 #9615 (Mac OS X x86_64)
                                      4 ;--------------------------------------------------------
                                      5 	.module main
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _main
                                     12 	.globl _GPIO_Config
                                     13 	.globl _IWDG_Config
                                     14 	.globl _EXTI_PORTD_IRQHandler
                                     15 	.globl _TIM1_UPD_OVF_TRG_BRK_IRQHandler
                                     16 	.globl _TIM4_UPD_OVF_IRQHandler
                                     17 	.globl _UART1_RX_IRQHandler
                                     18 	.globl _ledstt_manager
                                     19 	.globl _ledstt_init
                                     20 	.globl _system_manager
                                     21 	.globl _system_init
                                     22 	.globl _tp_manager
                                     23 	.globl _tp_init
                                     24 	.globl _sys_readCfg
                                     25 	.globl _remote_Manager
                                     26 	.globl _remote_Process
                                     27 	.globl _remote_Init
                                     28 	.globl _debug_Init
                                     29 	.globl _CLK_Config
                                     30 	.globl _TIMER_Inc
                                     31 	.globl _TIMER_Init
                                     32 	.globl _UART1_ReceiveData8
                                     33 	.globl _TIM4_ClearITPendingBit
                                     34 	.globl _TIM1_ClearFlag
                                     35 	.globl _IWDG_Enable
                                     36 	.globl _IWDG_ReloadCounter
                                     37 	.globl _IWDG_SetReload
                                     38 	.globl _IWDG_SetPrescaler
                                     39 	.globl _IWDG_WriteAccessCmd
                                     40 	.globl _GPIO_WriteLow
                                     41 	.globl _GPIO_Init
                                     42 ;--------------------------------------------------------
                                     43 ; ram data
                                     44 ;--------------------------------------------------------
                                     45 	.area DATA
                                     46 ;--------------------------------------------------------
                                     47 ; ram data
                                     48 ;--------------------------------------------------------
                                     49 	.area INITIALIZED
                                     50 ;--------------------------------------------------------
                                     51 ; Stack segment in internal ram 
                                     52 ;--------------------------------------------------------
                                     53 	.area	SSEG
      0095EB                         54 __start__stack:
      0095EB                         55 	.ds	1
                                     56 
                                     57 ;--------------------------------------------------------
                                     58 ; absolute external ram data
                                     59 ;--------------------------------------------------------
                                     60 	.area DABS (ABS)
                                     61 ;--------------------------------------------------------
                                     62 ; interrupt vector 
                                     63 ;--------------------------------------------------------
                                     64 	.area HOME
      008000                         65 __interrupt_vect:
      008000 82 00 80 83             66 	int s_GSINIT ;reset
      008004 82 00 00 00             67 	int 0x0000 ;trap
      008008 82 00 00 00             68 	int 0x0000 ;int0
      00800C 82 00 00 00             69 	int 0x0000 ;int1
      008010 82 00 00 00             70 	int 0x0000 ;int2
      008014 82 00 00 00             71 	int 0x0000 ;int3
      008018 82 00 00 00             72 	int 0x0000 ;int4
      00801C 82 00 00 00             73 	int 0x0000 ;int5
      008020 82 00 84 04             74 	int _EXTI_PORTD_IRQHandler ;int6
      008024 82 00 00 00             75 	int 0x0000 ;int7
      008028 82 00 00 00             76 	int 0x0000 ;int8
      00802C 82 00 00 00             77 	int 0x0000 ;int9
      008030 82 00 00 00             78 	int 0x0000 ;int10
      008034 82 00 83 FA             79 	int _TIM1_UPD_OVF_TRG_BRK_IRQHandler ;int11
      008038 82 00 00 00             80 	int 0x0000 ;int12
      00803C 82 00 00 00             81 	int 0x0000 ;int13
      008040 82 00 00 00             82 	int 0x0000 ;int14
      008044 82 00 00 00             83 	int 0x0000 ;int15
      008048 82 00 00 00             84 	int 0x0000 ;int16
      00804C 82 00 00 00             85 	int 0x0000 ;int17
      008050 82 00 83 E7             86 	int _UART1_RX_IRQHandler ;int18
      008054 82 00 00 00             87 	int 0x0000 ;int19
      008058 82 00 00 00             88 	int 0x0000 ;int20
      00805C 82 00 00 00             89 	int 0x0000 ;int21
      008060 82 00 00 00             90 	int 0x0000 ;int22
      008064 82 00 83 EC             91 	int _TIM4_UPD_OVF_IRQHandler ;int23
      008068 82 00 00 00             92 	int 0x0000 ;int24
      00806C 82 00 00 00             93 	int 0x0000 ;int25
      008070 82 00 00 00             94 	int 0x0000 ;int26
      008074 82 00 00 00             95 	int 0x0000 ;int27
      008078 82 00 00 00             96 	int 0x0000 ;int28
      00807C 82 00 00 00             97 	int 0x0000 ;int29
                                     98 ;--------------------------------------------------------
                                     99 ; global & static initialisations
                                    100 ;--------------------------------------------------------
                                    101 	.area HOME
                                    102 	.area GSINIT
                                    103 	.area GSFINAL
                                    104 	.area GSINIT
      008083                        105 __sdcc_gs_init_startup:
      008083                        106 __sdcc_init_data:
                                    107 ; stm8_genXINIT() start
      008083 AE 00 E6         [ 2]  108 	ldw x, #l_DATA
      008086 27 07            [ 1]  109 	jreq	00002$
      008088                        110 00001$:
      008088 72 4F 00 00      [ 1]  111 	clr (s_DATA - 1, x)
      00808C 5A               [ 2]  112 	decw x
      00808D 26 F9            [ 1]  113 	jrne	00001$
      00808F                        114 00002$:
      00808F AE 00 02         [ 2]  115 	ldw	x, #l_INITIALIZER
      008092 27 09            [ 1]  116 	jreq	00004$
      008094                        117 00003$:
      008094 D6 95 E8         [ 1]  118 	ld	a, (s_INITIALIZER - 1, x)
      008097 D7 00 E6         [ 1]  119 	ld	(s_INITIALIZED - 1, x), a
      00809A 5A               [ 2]  120 	decw	x
      00809B 26 F7            [ 1]  121 	jrne	00003$
      00809D                        122 00004$:
                                    123 ; stm8_genXINIT() end
                                    124 	.area GSFINAL
      00809D CC 80 80         [ 2]  125 	jp	__sdcc_program_startup
                                    126 ;--------------------------------------------------------
                                    127 ; Home
                                    128 ;--------------------------------------------------------
                                    129 	.area HOME
                                    130 	.area HOME
      008080                        131 __sdcc_program_startup:
      008080 CC 84 3D         [ 2]  132 	jp	_main
                                    133 ;	return from main will return to caller
                                    134 ;--------------------------------------------------------
                                    135 ; code
                                    136 ;--------------------------------------------------------
                                    137 	.area CODE
                                    138 ;	user/main.c: 14: INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
                                    139 ;	-----------------------------------------
                                    140 ;	 function UART1_RX_IRQHandler
                                    141 ;	-----------------------------------------
      0083E7                        142 _UART1_RX_IRQHandler:
      0083E7 62               [ 2]  143 	div	x, a
                                    144 ;	user/main.c: 18: temp = UART1_ReceiveData8();
      0083E8 CD 94 0F         [ 4]  145 	call	_UART1_ReceiveData8
      0083EB 80               [11]  146 	iret
                                    147 ;	user/main.c: 21: INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
                                    148 ;	-----------------------------------------
                                    149 ;	 function TIM4_UPD_OVF_IRQHandler
                                    150 ;	-----------------------------------------
      0083EC                        151 _TIM4_UPD_OVF_IRQHandler:
      0083EC 62               [ 2]  152 	div	x, a
                                    153 ;	user/main.c: 23: TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
      0083ED 4B 01            [ 1]  154 	push	#0x01
      0083EF CD 91 A7         [ 4]  155 	call	_TIM4_ClearITPendingBit
      0083F2 84               [ 1]  156 	pop	a
                                    157 ;	user/main.c: 24: TIMER_Inc();
      0083F3 CD 8C 76         [ 4]  158 	call	_TIMER_Inc
                                    159 ;	user/main.c: 25: IWDG_ReloadCounter();
      0083F6 CD 90 06         [ 4]  160 	call	_IWDG_ReloadCounter
      0083F9 80               [11]  161 	iret
                                    162 ;	user/main.c: 28: INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
                                    163 ;	-----------------------------------------
                                    164 ;	 function TIM1_UPD_OVF_TRG_BRK_IRQHandler
                                    165 ;	-----------------------------------------
      0083FA                        166 _TIM1_UPD_OVF_TRG_BRK_IRQHandler:
      0083FA 62               [ 2]  167 	div	x, a
                                    168 ;	user/main.c: 30: TIM1_ClearFlag(TIM1_FLAG_UPDATE); 
      0083FB 4B 01            [ 1]  169 	push	#0x01
      0083FD 4B 00            [ 1]  170 	push	#0x00
      0083FF CD 91 39         [ 4]  171 	call	_TIM1_ClearFlag
      008402 85               [ 2]  172 	popw	x
      008403 80               [11]  173 	iret
                                    174 ;	user/main.c: 33: INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
                                    175 ;	-----------------------------------------
                                    176 ;	 function EXTI_PORTD_IRQHandler
                                    177 ;	-----------------------------------------
      008404                        178 _EXTI_PORTD_IRQHandler:
      008404 62               [ 2]  179 	div	x, a
                                    180 ;	user/main.c: 36: remote_Process();
      008405 CD 86 0E         [ 4]  181 	call	_remote_Process
                                    182 ;	user/main.c: 37: IWDG_ReloadCounter();
      008408 CD 90 06         [ 4]  183 	call	_IWDG_ReloadCounter
      00840B 80               [11]  184 	iret
                                    185 ;	user/main.c: 41: void IWDG_Config(void)
                                    186 ;	-----------------------------------------
                                    187 ;	 function IWDG_Config
                                    188 ;	-----------------------------------------
      00840C                        189 _IWDG_Config:
                                    190 ;	user/main.c: 45: IWDG_WriteAccessCmd(IWDG_WriteAccess_Enable);
      00840C 4B 55            [ 1]  191 	push	#0x55
      00840E CD 8F F1         [ 4]  192 	call	_IWDG_WriteAccessCmd
      008411 84               [ 1]  193 	pop	a
                                    194 ;	user/main.c: 47: IWDG_SetPrescaler(IWDG_Prescaler_256);
      008412 4B 06            [ 1]  195 	push	#0x06
      008414 CD 8F F8         [ 4]  196 	call	_IWDG_SetPrescaler
      008417 84               [ 1]  197 	pop	a
                                    198 ;	user/main.c: 51: IWDG_SetReload(250);
      008418 4B FA            [ 1]  199 	push	#0xfa
      00841A CD 8F FF         [ 4]  200 	call	_IWDG_SetReload
      00841D 84               [ 1]  201 	pop	a
                                    202 ;	user/main.c: 53: IWDG_ReloadCounter();
      00841E CD 90 06         [ 4]  203 	call	_IWDG_ReloadCounter
                                    204 ;	user/main.c: 55: IWDG_Enable();
      008421 CC 90 0B         [ 2]  205 	jp	_IWDG_Enable
                                    206 ;	user/main.c: 58: void GPIO_Config(void)
                                    207 ;	-----------------------------------------
                                    208 ;	 function GPIO_Config
                                    209 ;	-----------------------------------------
      008424                        210 _GPIO_Config:
                                    211 ;	user/main.c: 60: GPIO_Init(CTR_GPIO, CTR_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
      008424 4B F0            [ 1]  212 	push	#0xf0
      008426 4B 04            [ 1]  213 	push	#0x04
      008428 4B 0F            [ 1]  214 	push	#0x0f
      00842A 4B 50            [ 1]  215 	push	#0x50
      00842C CD 8F 3C         [ 4]  216 	call	_GPIO_Init
      00842F 5B 04            [ 2]  217 	addw	sp, #4
                                    218 ;	user/main.c: 61: GPIO_WriteLow(CTR_GPIO, CTR_PIN);
      008431 4B 04            [ 1]  219 	push	#0x04
      008433 4B 0F            [ 1]  220 	push	#0x0f
      008435 4B 50            [ 1]  221 	push	#0x50
      008437 CD 8F C1         [ 4]  222 	call	_GPIO_WriteLow
      00843A 5B 03            [ 2]  223 	addw	sp, #3
      00843C 81               [ 4]  224 	ret
                                    225 ;	user/main.c: 64: void main(void)
                                    226 ;	-----------------------------------------
                                    227 ;	 function main
                                    228 ;	-----------------------------------------
      00843D                        229 _main:
                                    230 ;	user/main.c: 67: CLK_Config();
      00843D CD 8D 70         [ 4]  231 	call	_CLK_Config
                                    232 ;	user/main.c: 68: TIMER_Init();
      008440 CD 8C 43         [ 4]  233 	call	_TIMER_Init
                                    234 ;	user/main.c: 69: debug_Init();
      008443 CD 80 A0         [ 4]  235 	call	_debug_Init
                                    236 ;	user/main.c: 70: sys_readCfg();
      008446 CD 88 86         [ 4]  237 	call	_sys_readCfg
                                    238 ;	user/main.c: 71: remote_Init();
      008449 CD 84 D5         [ 4]  239 	call	_remote_Init
                                    240 ;	user/main.c: 72: GPIO_Config();
      00844C CD 84 24         [ 4]  241 	call	_GPIO_Config
                                    242 ;	user/main.c: 73: tp_init();
      00844F CD 81 D4         [ 4]  243 	call	_tp_init
                                    244 ;	user/main.c: 74: system_init();
      008452 CD 89 D2         [ 4]  245 	call	_system_init
                                    246 ;	user/main.c: 75: ledstt_init();
      008455 CD 83 38         [ 4]  247 	call	_ledstt_init
                                    248 ;	user/main.c: 76: enableInterrupts();
      008458 9A               [ 1]  249 	rim
                                    250 ;	user/main.c: 77: IWDG_Config();
      008459 CD 84 0C         [ 4]  251 	call	_IWDG_Config
                                    252 ;	user/main.c: 78: while(1)
      00845C                        253 00102$:
                                    254 ;	user/main.c: 80: remote_Manager();
      00845C CD 86 6F         [ 4]  255 	call	_remote_Manager
                                    256 ;	user/main.c: 81: tp_manager();
      00845F CD 82 BE         [ 4]  257 	call	_tp_manager
                                    258 ;	user/main.c: 82: system_manager();
      008462 CD 8A 18         [ 4]  259 	call	_system_manager
                                    260 ;	user/main.c: 83: ledstt_manager();
      008465 CD 83 6E         [ 4]  261 	call	_ledstt_manager
                                    262 ;	user/main.c: 84: IWDG_ReloadCounter();
      008468 CD 90 06         [ 4]  263 	call	_IWDG_ReloadCounter
      00846B 20 EF            [ 2]  264 	jra	00102$
      00846D 81               [ 4]  265 	ret
                                    266 	.area CODE
                                    267 	.area INITIALIZER
                                    268 	.area CABS (ABS)
