                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.6.0 #9615 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module main
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _main
                                     12 	.globl _UART1_RX_IRQHandler
                                     13 	.globl _HC05_PutStr
                                     14 	.globl _HC05_Read
                                     15 	.globl _HC05_Init
                                     16 	.globl _IWDG_Enable
                                     17 	.globl _IWDG_ReloadCounter
                                     18 	.globl _IWDG_SetReload
                                     19 	.globl _IWDG_SetPrescaler
                                     20 	.globl _IWDG_WriteAccessCmd
                                     21 	.globl _CLK_Config
                                     22 	.globl _IWDG_Config
                                     23 ;--------------------------------------------------------
                                     24 ; ram data
                                     25 ;--------------------------------------------------------
                                     26 	.area DATA
                                     27 ;--------------------------------------------------------
                                     28 ; ram data
                                     29 ;--------------------------------------------------------
                                     30 	.area INITIALIZED
                                     31 ;--------------------------------------------------------
                                     32 ; Stack segment in internal ram 
                                     33 ;--------------------------------------------------------
                                     34 	.area	SSEG
      00A887                         35 __start__stack:
      00A887                         36 	.ds	1
                                     37 
                                     38 ;--------------------------------------------------------
                                     39 ; absolute external ram data
                                     40 ;--------------------------------------------------------
                                     41 	.area DABS (ABS)
                                     42 ;--------------------------------------------------------
                                     43 ; interrupt vector 
                                     44 ;--------------------------------------------------------
                                     45 	.area HOME
      008000                         46 __interrupt_vect:
      008000 82 00 80 83             47 	int s_GSINIT ;reset
      008004 82 00 00 00             48 	int 0x0000 ;trap
      008008 82 00 00 00             49 	int 0x0000 ;int0
      00800C 82 00 00 00             50 	int 0x0000 ;int1
      008010 82 00 00 00             51 	int 0x0000 ;int2
      008014 82 00 00 00             52 	int 0x0000 ;int3
      008018 82 00 00 00             53 	int 0x0000 ;int4
      00801C 82 00 00 00             54 	int 0x0000 ;int5
      008020 82 00 00 00             55 	int 0x0000 ;int6
      008024 82 00 00 00             56 	int 0x0000 ;int7
      008028 82 00 00 00             57 	int 0x0000 ;int8
      00802C 82 00 00 00             58 	int 0x0000 ;int9
      008030 82 00 00 00             59 	int 0x0000 ;int10
      008034 82 00 00 00             60 	int 0x0000 ;int11
      008038 82 00 00 00             61 	int 0x0000 ;int12
      00803C 82 00 00 00             62 	int 0x0000 ;int13
      008040 82 00 00 00             63 	int 0x0000 ;int14
      008044 82 00 00 00             64 	int 0x0000 ;int15
      008048 82 00 00 00             65 	int 0x0000 ;int16
      00804C 82 00 00 00             66 	int 0x0000 ;int17
      008050 82 00 87 8E             67 	int _UART1_RX_IRQHandler ;int18
      008054 82 00 00 00             68 	int 0x0000 ;int19
      008058 82 00 00 00             69 	int 0x0000 ;int20
      00805C 82 00 00 00             70 	int 0x0000 ;int21
      008060 82 00 00 00             71 	int 0x0000 ;int22
      008064 82 00 00 00             72 	int 0x0000 ;int23
      008068 82 00 00 00             73 	int 0x0000 ;int24
      00806C 82 00 00 00             74 	int 0x0000 ;int25
      008070 82 00 00 00             75 	int 0x0000 ;int26
      008074 82 00 00 00             76 	int 0x0000 ;int27
      008078 82 00 00 00             77 	int 0x0000 ;int28
      00807C 82 00 00 00             78 	int 0x0000 ;int29
                                     79 ;--------------------------------------------------------
                                     80 ; global & static initialisations
                                     81 ;--------------------------------------------------------
                                     82 	.area HOME
                                     83 	.area GSINIT
                                     84 	.area GSFINAL
                                     85 	.area GSINIT
      008083                         86 __sdcc_gs_init_startup:
      008083                         87 __sdcc_init_data:
                                     88 ; stm8_genXINIT() start
      008083 AE 00 B7         [ 2]   89 	ldw x, #l_DATA
      008086 27 07            [ 1]   90 	jreq	00002$
      008088                         91 00001$:
      008088 72 4F 00 00      [ 1]   92 	clr (s_DATA - 1, x)
      00808C 5A               [ 2]   93 	decw x
      00808D 26 F9            [ 1]   94 	jrne	00001$
      00808F                         95 00002$:
      00808F AE 00 04         [ 2]   96 	ldw	x, #l_INITIALIZER
      008092 27 09            [ 1]   97 	jreq	00004$
      008094                         98 00003$:
      008094 D6 A8 82         [ 1]   99 	ld	a, (s_INITIALIZER - 1, x)
      008097 D7 00 B7         [ 1]  100 	ld	(s_INITIALIZED - 1, x), a
      00809A 5A               [ 2]  101 	decw	x
      00809B 26 F7            [ 1]  102 	jrne	00003$
      00809D                        103 00004$:
                                    104 ; stm8_genXINIT() end
                                    105 	.area GSFINAL
      00809D CC 80 80         [ 2]  106 	jp	__sdcc_program_startup
                                    107 ;--------------------------------------------------------
                                    108 ; Home
                                    109 ;--------------------------------------------------------
                                    110 	.area HOME
                                    111 	.area HOME
      008080                        112 __sdcc_program_startup:
      008080 CC 87 AB         [ 2]  113 	jp	_main
                                    114 ;	return from main will return to caller
                                    115 ;--------------------------------------------------------
                                    116 ; code
                                    117 ;--------------------------------------------------------
                                    118 	.area CODE
                                    119 ;	user/main.c: 22: INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
                                    120 ;	-----------------------------------------
                                    121 ;	 function UART1_RX_IRQHandler
                                    122 ;	-----------------------------------------
      00878E                        123 _UART1_RX_IRQHandler:
      00878E 62               [ 2]  124 	div	x, a
                                    125 ;	user/main.c: 24: HC05_Read();
      00878F CD 81 3C         [ 4]  126 	call	_HC05_Read
      008792 80               [11]  127 	iret
                                    128 ;	user/main.c: 34: void IWDG_Config(void)
                                    129 ;	-----------------------------------------
                                    130 ;	 function IWDG_Config
                                    131 ;	-----------------------------------------
      008793                        132 _IWDG_Config:
                                    133 ;	user/main.c: 38: IWDG_WriteAccessCmd(IWDG_WriteAccess_Enable);
      008793 4B 55            [ 1]  134 	push	#0x55
      008795 CD 98 EA         [ 4]  135 	call	_IWDG_WriteAccessCmd
      008798 84               [ 1]  136 	pop	a
                                    137 ;	user/main.c: 40: IWDG_SetPrescaler(IWDG_Prescaler_256);
      008799 4B 06            [ 1]  138 	push	#0x06
      00879B CD 98 F1         [ 4]  139 	call	_IWDG_SetPrescaler
      00879E 84               [ 1]  140 	pop	a
                                    141 ;	user/main.c: 44: IWDG_SetReload(250);
      00879F 4B FA            [ 1]  142 	push	#0xfa
      0087A1 CD 98 F8         [ 4]  143 	call	_IWDG_SetReload
      0087A4 84               [ 1]  144 	pop	a
                                    145 ;	user/main.c: 46: IWDG_ReloadCounter();
      0087A5 CD 98 FF         [ 4]  146 	call	_IWDG_ReloadCounter
                                    147 ;	user/main.c: 48: IWDG_Enable();
      0087A8 CC 99 04         [ 2]  148 	jp	_IWDG_Enable
                                    149 ;	user/main.c: 51: void main(void)
                                    150 ;	-----------------------------------------
                                    151 ;	 function main
                                    152 ;	-----------------------------------------
      0087AB                        153 _main:
                                    154 ;	user/main.c: 53: CLK_Config();
      0087AB CD 96 D4         [ 4]  155 	call	_CLK_Config
                                    156 ;	user/main.c: 55: HC05_Init(9600);
      0087AE 4B 80            [ 1]  157 	push	#0x80
      0087B0 4B 25            [ 1]  158 	push	#0x25
      0087B2 5F               [ 1]  159 	clrw	x
      0087B3 89               [ 2]  160 	pushw	x
      0087B4 CD 80 BA         [ 4]  161 	call	_HC05_Init
      0087B7 5B 04            [ 2]  162 	addw	sp, #4
                                    163 ;	user/main.c: 56: HC05_PutStr("Hello World!");
      0087B9 AE 87 CA         [ 2]  164 	ldw	x, #___str_0+0
      0087BC 89               [ 2]  165 	pushw	x
      0087BD CD 81 BE         [ 4]  166 	call	_HC05_PutStr
      0087C0 85               [ 2]  167 	popw	x
                                    168 ;	user/main.c: 57: IWDG_Config();
      0087C1 CD 87 93         [ 4]  169 	call	_IWDG_Config
                                    170 ;	user/main.c: 58: while(1)
      0087C4                        171 00102$:
                                    172 ;	user/main.c: 60: IWDG_ReloadCounter();
      0087C4 CD 98 FF         [ 4]  173 	call	_IWDG_ReloadCounter
      0087C7 20 FB            [ 2]  174 	jra	00102$
      0087C9 81               [ 4]  175 	ret
                                    176 	.area CODE
      0087CA                        177 ___str_0:
      0087CA 48 65 6C 6C 6F 20 57   178 	.ascii "Hello World!"
             6F 72 6C 64 21
      0087D6 00                     179 	.db 0x00
                                    180 	.area INITIALIZER
                                    181 	.area CABS (ABS)
