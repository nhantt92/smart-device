;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW64)
;--------------------------------------------------------
	.module remote
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _remote_Decode
	.globl _GPIO_Configuration
	.globl _TIM1_Config
	.globl _TIM1_DisIn
	.globl _TIM1_EnIn
	.globl _system_checkID
	.globl _debugInfo
	.globl _info
	.globl _TIMER_CheckTimeMS
	.globl _TIM1_ClearFlag
	.globl _TIM1_GetCounter
	.globl _TIM1_SetCounter
	.globl _TIM1_ITConfig
	.globl _TIM1_Cmd
	.globl _TIM1_TimeBaseInit
	.globl _TIM1_DeInit
	.globl _GPIO_WriteReverse
	.globl _GPIO_Init
	.globl _EXTI_SetExtIntSensitivity
	.globl _CLK_PeripheralClockConfig
	.globl _ctrCnt
	.globl _ctrFlag
	.globl _remote
	.globl _remote_Init
	.globl _remote_CheckCompare
	.globl _remote_Clear
	.globl _remote_Process
	.globl _remote_Manager
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
_remote::
	.ds 159
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
_ctrFlag::
	.ds 1
_ctrCnt::
	.ds 1
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
;	user/remote.c: 21: void TIM1_EnIn(void)
;	-----------------------------------------
;	 function TIM1_EnIn
;	-----------------------------------------
_TIM1_EnIn:
;	user/remote.c: 23: TIM1_ClearFlag(TIM1_FLAG_UPDATE); 
	push	#0x01
	push	#0x00
	call	_TIM1_ClearFlag
	popw	x
;	user/remote.c: 24: TIM1_ITConfig(TIM1_IT_UPDATE, ENABLE);
	push	#0x01
	push	#0x01
	call	_TIM1_ITConfig
	popw	x
;	user/remote.c: 25: TIM1_SetCounter(0);
	clrw	x
	pushw	x
	call	_TIM1_SetCounter
	popw	x
	ret
;	user/remote.c: 28: void TIM1_DisIn(void)
;	-----------------------------------------
;	 function TIM1_DisIn
;	-----------------------------------------
_TIM1_DisIn:
;	user/remote.c: 30: TIM1_ClearFlag(TIM1_FLAG_UPDATE); 
	push	#0x01
	push	#0x00
	call	_TIM1_ClearFlag
	popw	x
;	user/remote.c: 31: TIM1_ITConfig(TIM1_IT_UPDATE, DISABLE); 
	push	#0x00
	push	#0x01
	call	_TIM1_ITConfig
	popw	x
	ret
;	user/remote.c: 34: void TIM1_Config(void)
;	-----------------------------------------
;	 function TIM1_Config
;	-----------------------------------------
_TIM1_Config:
;	user/remote.c: 36: CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1 , ENABLE); 
	push	#0x01
	push	#0x07
	call	_CLK_PeripheralClockConfig
	popw	x
;	user/remote.c: 38: TIM1_DeInit();
	call	_TIM1_DeInit
;	user/remote.c: 39: TIM1_TimeBaseInit(15, TIM1_COUNTERMODE_UP, 65535, 0);
	push	#0x00
	push	#0xff
	push	#0xff
	push	#0x00
	push	#0x0f
	push	#0x00
	call	_TIM1_TimeBaseInit
	addw	sp, #6
;	user/remote.c: 40: TIM1_SetCounter(0);
	clrw	x
	pushw	x
	call	_TIM1_SetCounter
	popw	x
;	user/remote.c: 42: TIM1_Cmd(ENABLE);
	push	#0x01
	call	_TIM1_Cmd
	pop	a
	ret
;	user/remote.c: 45: void GPIO_Configuration(void)
;	-----------------------------------------
;	 function GPIO_Configuration
;	-----------------------------------------
_GPIO_Configuration:
;	user/remote.c: 47: GPIO_Init(GPIOD, GPIO_PIN_3, GPIO_MODE_IN_FL_IT);
	push	#0x20
	push	#0x08
	push	#0x0f
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	user/remote.c: 49: EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOD, EXTI_SENSITIVITY_RISE_FALL);
	push	#0x03
	push	#0x03
	call	_EXTI_SetExtIntSensitivity
	popw	x
	ret
;	user/remote.c: 52: void remote_Init(void)
;	-----------------------------------------
;	 function remote_Init
;	-----------------------------------------
_remote_Init:
;	user/remote.c: 54: remote_Clear();
	call	_remote_Clear
;	user/remote.c: 55: remote.command = 0;
	ldw	x, #_remote+149
	clrw	y
	ldw	(0x2, x), y
	ldw	(x), y
;	user/remote.c: 56: TIM1_Config();
	call	_TIM1_Config
;	user/remote.c: 57: GPIO_Configuration();
	jp	_GPIO_Configuration
;	user/remote.c: 60: uint32_t remote_CheckCompare(uint32_t dat, uint32_t *buf, uint8_t offset, uint8_t len)
;	-----------------------------------------
;	 function remote_CheckCompare
;	-----------------------------------------
_remote_CheckCompare:
	sub	sp, #4
;	user/remote.c: 64: for(add = 0;add < len;add++)
	clr	a
00107$:
	cp	a, (0x0e, sp)
	jrnc	00105$
;	user/remote.c: 66: if(add == offset)
	cp	a, (0x0d, sp)
	jrne	00102$
;	user/remote.c: 67: add++;
	inc	a
00102$:
;	user/remote.c: 68: if(dat == buf[add])
	clrw	x
	ld	xl, a
	sllw	x
	sllw	x
	addw	x, (0x0b, sp)
	push	a
	ld	a, (0x3, x)
	ld	(0x05, sp), a
	ld	a, (0x2, x)
	ld	(0x04, sp), a
	ldw	x, (x)
	ldw	(0x02, sp), x
	pop	a
	ldw	x, (0x09, sp)
	cpw	x, (0x03, sp)
	jrne	00108$
	ldw	x, (0x07, sp)
	cpw	x, (0x01, sp)
	jrne	00108$
;	user/remote.c: 69: return dat;
	ldw	x, (0x09, sp)
	ldw	y, (0x07, sp)
	jra	00109$
00108$:
;	user/remote.c: 64: for(add = 0;add < len;add++)
	inc	a
	jra	00107$
00105$:
;	user/remote.c: 71: return 0;
	clrw	x
	clrw	y
00109$:
	addw	sp, #4
	ret
;	user/remote.c: 74: void remote_Decode(void)
;	-----------------------------------------
;	 function remote_Decode
;	-----------------------------------------
_remote_Decode:
	sub	sp, #17
;	user/remote.c: 76: uint32_t RC_dataIndex = 0;
	clrw	x
	ldw	(0x03, sp), x
	ldw	(0x01, sp), x
;	user/remote.c: 78: for(add = 1;add < (BIT_READ*2)+1;add+=2)
	ldw	x, #_remote+0
	ldw	(0x08, sp), x
	ldw	x, (0x08, sp)
	addw	x, #0x0003
	ldw	(0x0c, sp), x
	ld	a, #0x01
	ld	(0x05, sp), a
00117$:
;	user/remote.c: 80: if((remote.buff[add] >= MIN_LSB_BIT_TIME_US)&&(remote.buff[add] < MAX_LSB_BIT_TIME_US)&&(remote.buff[add+1] >= MIN_MSB_BIT_TIME_US)&&(remote.buff[add+1] < MAX_MSB_BIT_TIME_US))
	ld	a, (0x05, sp)
	sll	a
	clrw	x
	ld	xl, a
	addw	x, (0x0c, sp)
	ldw	x, (x)
	ldw	(0x0e, sp), x
	ld	a, (0x05, sp)
	inc	a
	sll	a
	ld	xl, a
	clr	a
	ld	xh, a
	addw	x, (0x0c, sp)
	ldw	(0x06, sp), x
	ldw	x, (0x0e, sp)
	cpw	x, #0x012c
	jrc	00108$
	ldw	x, (0x0e, sp)
	cpw	x, #0x01f4
	jrnc	00108$
	ldw	x, (0x06, sp)
	ldw	x, (x)
	cpw	x, #0x02bc
	jrc	00108$
	cpw	x, #0x04b0
	jrc	00109$
;	user/remote.c: 81: RC_dataIndex |= 0;
00108$:
;	user/remote.c: 82: else if((remote.buff[add] >= MIN_MSB_BIT_TIME_US)&&(remote.buff[add] < MAX_MSB_BIT_TIME_US)&&(remote.buff[add+1] >= MIN_LSB_BIT_TIME_US)&&(remote.buff[add+1] < MAX_LSB_BIT_TIME_US))
	ldw	x, (0x0e, sp)
	cpw	x, #0x02bc
	jrc	00119$
	ldw	x, (0x0e, sp)
	cpw	x, #0x04b0
	jrnc	00119$
	ldw	x, (0x06, sp)
	ldw	x, (x)
	cpw	x, #0x012c
	jrc	00119$
	cpw	x, #0x01f4
	jrnc	00119$
;	user/remote.c: 83: RC_dataIndex |= 1;
	ldw	x, (0x03, sp)
	srlw	x
	scf
	rlcw	x
	ld	a, (0x02, sp)
	ld	yl, a
	ld	a, (0x01, sp)
	ld	yh, a
	ldw	(0x03, sp), x
	ldw	(0x01, sp), y
;	user/remote.c: 85: return;
	jra	00109$
00109$:
;	user/remote.c: 86: RC_dataIndex <<= 1;
	ldw	x, (0x03, sp)
	ldw	y, (0x01, sp)
	sllw	x
	rlcw	y
	ldw	(0x03, sp), x
	ldw	(0x01, sp), y
;	user/remote.c: 78: for(add = 1;add < (BIT_READ*2)+1;add+=2)
	inc	(0x05, sp)
	inc	(0x05, sp)
	ld	a, (0x05, sp)
	cp	a, #0x31
	jrc	00117$
;	user/remote.c: 88: remote.cmdBuff[remote.cntCmd] = RC_dataIndex;
	ldw	x, (0x08, sp)
	addw	x, #0x007c
	ldw	(0x10, sp), x
	ldw	x, (0x08, sp)
	addw	x, #0x007b
	ldw	(0x0a, sp), x
	ldw	x, (0x0a, sp)
	ld	a, (x)
	sll	a
	sll	a
	clrw	x
	ld	xl, a
	addw	x, (0x10, sp)
	ldw	y, (0x03, sp)
	ldw	(0x2, x), y
	ldw	y, (0x01, sp)
	ldw	(x), y
;	user/remote.c: 89: if(remote.cntCmd < (MAX_BUFF_CMD-1))
	ldw	x, (0x0a, sp)
	ld	a, (x)
	cp	a, #0x04
	jrnc	00115$
;	user/remote.c: 90: remote.cntCmd++;
	inc	a
	ldw	x, (0x0a, sp)
	ld	(x), a
	jra	00119$
00115$:
;	user/remote.c: 92: remote.flag = 1;
	ldw	x, (0x08, sp)
	incw	x
	incw	x
	ld	a, #0x01
	ld	(x), a
00119$:
	addw	sp, #17
	ret
;	user/remote.c: 95: void remote_Clear(void)
;	-----------------------------------------
;	 function remote_Clear
;	-----------------------------------------
_remote_Clear:
	pushw	x
;	user/remote.c: 97: remote.startBit = 0;
	ldw	x, #_remote+0
	clr	(x)
;	user/remote.c: 98: remote.cnt = 0;
	ldw	x, #_remote+0
	ldw	(0x01, sp), x
	ldw	x, (0x01, sp)
	incw	x
	clr	(x)
;	user/remote.c: 99: remote.cntCmd = 0;
	ldw	x, (0x01, sp)
	addw	x, #0x007b
	clr	(x)
;	user/remote.c: 100: remote.flag = 0;
	ldw	x, (0x01, sp)
	incw	x
	incw	x
	clr	(x)
;	user/remote.c: 101: remote.lastCmd = 0;
	ldw	x, (0x01, sp)
	addw	x, #0x0090
	clrw	y
	ldw	(0x2, x), y
	ldw	(x), y
;	user/remote.c: 102: remote.compareCnt = 0;
	ldw	x, (0x01, sp)
	addw	x, #0x0094
	clr	(x)
	popw	x
	ret
;	user/remote.c: 105: void remote_Process(void)
;	-----------------------------------------
;	 function remote_Process
;	-----------------------------------------
_remote_Process:
	sub	sp, #8
;	user/remote.c: 108: TIM1_DisIn();
	call	_TIM1_DisIn
;	user/remote.c: 109: dat = TIM1_GetCounter();
	call	_TIM1_GetCounter
	ldw	(0x01, sp), x
	ldw	y, (0x01, sp)
;	user/remote.c: 110: if((dat >= MIN_SYN_BIT_TIME_US)&&(dat < MAX_SYN_BIT_TIME_US))
	cpw	y, #0x157c
	jrc	00104$
	cpw	y, #0x2ee0
	jrnc	00104$
;	user/remote.c: 112: if(remote.startBit == 0)
	ldw	x, #_remote+0
	ld	a, (x)
	tnz	a
	jrne	00104$
;	user/remote.c: 114: remote.startBit = 1;
	ld	a, #0x01
	ld	(x), a
;	user/remote.c: 115: remote.cnt = 0;
	ldw	x, #_remote+1
	clr	(x)
00104$:
;	user/remote.c: 118: if(remote.startBit == 1)
	ldw	x, #_remote+0
	ld	a, (x)
	cp	a, #0x01
	jrne	00109$
;	user/remote.c: 120: remote.buff[remote.cnt] = dat;
	ldw	x, #_remote+0
	ldw	(0x07, sp), x
	ldw	x, (0x07, sp)
	addw	x, #0x0003
	ldw	(0x05, sp), x
	ldw	x, (0x07, sp)
	incw	x
	ldw	(0x03, sp), x
	ldw	x, (0x03, sp)
	ld	a, (x)
	sll	a
	clrw	x
	ld	xl, a
	addw	x, (0x05, sp)
	ldw	(x), y
;	user/remote.c: 121: if(++remote.cnt > (MAX_BIT_READ*2))
	ldw	x, (0x03, sp)
	ld	a, (x)
	inc	a
	ld	(x), a
	cp	a, #0x32
	jrule	00109$
;	user/remote.c: 123: remote.startBit = 0;
	ldw	x, (0x07, sp)
	clr	(x)
;	user/remote.c: 124: remote.cnt = 0;
	ldw	x, (0x03, sp)
	clr	(x)
;	user/remote.c: 125: remote_Decode();
	call	_remote_Decode
00109$:
;	user/remote.c: 128: TIM1_EnIn();
	call	_TIM1_EnIn
	addw	sp, #8
	ret
;	user/remote.c: 133: void remote_Manager(void)
;	-----------------------------------------
;	 function remote_Manager
;	-----------------------------------------
_remote_Manager:
	sub	sp, #51
;	user/remote.c: 138: if(TIMER_CheckTimeMS(&remote.time, 100) == 0)
	ldw	x, #_remote+0
	ldw	(0x32, sp), x
	ldw	x, (0x32, sp)
	addw	x, #0x0099
	push	#0x64
	push	#0x00
	push	#0x00
	push	#0x00
	pushw	x
	call	_TIMER_CheckTimeMS
	addw	sp, #6
	tnz	a
	jreq	00162$
	jp	00119$
00162$:
;	user/remote.c: 141: if(ctrCnt != 0)ctrCnt--;
	tnz	_ctrCnt+0
	jreq	00102$
	dec	_ctrCnt+0
00102$:
;	user/remote.c: 146: if(remote.flag == 1)
	ldw	x, (0x32, sp)
	ld	a, (0x2, x)
	cp	a, #0x01
	jreq	00166$
	jp	00119$
00166$:
;	user/remote.c: 148: disableInterrupts();
	sim
;	user/remote.c: 149: remote.compareCnt = 0;
	ldw	x, (0x32, sp)
	addw	x, #0x0094
	ldw	(0x30, sp), x
	ldw	x, (0x30, sp)
	clr	(x)
;	user/remote.c: 150: for(add = 0;add < MAX_BUFF_CMD;add++)
	ldw	x, #___str_2+0
	ldw	(0x2e, sp), x
	ldw	x, #___str_1+0
	ldw	(0x2c, sp), x
	ldw	x, (0x32, sp)
	addw	x, #0x007c
	ldw	(0x24, sp), x
	ldw	x, #___str_0+0
	ldw	(0x2a, sp), x
	clr	(0x05, sp)
00117$:
;	user/remote.c: 152: cm[0] = (remote.cmdBuff[add]&0xFF000000)>>24;
	ldw	x, sp
	incw	x
	ldw	(0x1c, sp), x
	ld	a, (0x05, sp)
	ld	xl, a
	sllw	x
	sllw	x
	clr	a
	ld	xh, a
	addw	x, (0x24, sp)
	ldw	(0x1e, sp), x
	ldw	x, (0x1e, sp)
	pushw	x
	ldw	x, (0x2, x)
	exgw	x, y
	popw	x
	ldw	x, (x)
	clr	a
	clrw	y
	ld	a, xh
	clrw	x
	clr	(0x0a, sp)
	ldw	x, (0x1c, sp)
	ld	(x), a
;	user/remote.c: 153: cm[1] = (remote.cmdBuff[add]&0x00FF0000)>>16;
	ldw	x, (0x1c, sp)
	incw	x
	ldw	(0x1a, sp), x
	ldw	x, (0x1e, sp)
	pushw	x
	ldw	x, (0x2, x)
	exgw	x, y
	popw	x
	ldw	x, (x)
	clrw	y
	clr	a
	clrw	y
	ld	a, xl
	ldw	x, (0x1a, sp)
	ld	(x), a
;	user/remote.c: 154: cm[2] = (remote.cmdBuff[add]&0x0000FF00)>>8;
	ldw	x, (0x1c, sp)
	incw	x
	incw	x
	ldw	(0x28, sp), x
	ldw	x, (0x1e, sp)
	pushw	x
	ldw	x, (0x2, x)
	exgw	x, y
	popw	x
	ldw	x, (x)
	clr	(0x19, sp)
	clrw	x
	clr	a
	ld	a, yh
	ldw	x, (0x28, sp)
	ld	(x), a
;	user/remote.c: 155: cm[3] = (remote.cmdBuff[add]&0x000000FF)>>0;
	ldw	x, (0x1c, sp)
	addw	x, #0x0003
	ldw	(0x20, sp), x
	ldw	x, (0x1e, sp)
	pushw	x
	ldw	x, (0x2, x)
	exgw	x, y
	popw	x
	ldw	x, (x)
	clr	a
	clrw	x
	ld	a, yl
	ldw	x, (0x20, sp)
	ld	(x), a
;	user/remote.c: 156: debugInfo("Data decoder: ", cm, 4);
	ldw	y, (0x1c, sp)
	ldw	x, (0x2a, sp)
	push	#0x04
	pushw	y
	pushw	x
	call	_debugInfo
	addw	sp, #5
;	user/remote.c: 157: if(remote.cmdBuff[add] != 0)
	ldw	x, (0x1e, sp)
	ld	a, (0x3, x)
	ld	(0x09, sp), a
	ld	a, (0x2, x)
	ld	(0x08, sp), a
	ldw	x, (x)
	ldw	(0x06, sp), x
	ldw	x, (0x08, sp)
	jrne	00167$
	ldw	x, (0x06, sp)
	jrne	00167$
	jp	00118$
00167$:
;	user/remote.c: 159: if(remote_CheckCompare(remote.cmdBuff[add], remote.cmdBuff, add, MAX_BUFF_CMD))
	ldw	x, (0x24, sp)
	push	#0x05
	ld	a, (0x06, sp)
	push	a
	pushw	x
	ldw	x, (0x0c, sp)
	pushw	x
	ldw	x, (0x0c, sp)
	pushw	x
	call	_remote_CheckCompare
	addw	sp, #8
	tnzw	x
	jrne	00168$
	tnzw	y
	jrne	00168$
	jp	00118$
00168$:
;	user/remote.c: 161: remote.lastCmd = remote.cmdBuff[add];
	ldw	x, (0x32, sp)
	addw	x, #0x0090
	ldw	(0x26, sp), x
	ldw	x, (0x1e, sp)
	pushw	x
	ldw	x, (0x2, x)
	exgw	x, y
	popw	x
	ldw	x, (x)
	ldw	(0x12, sp), x
	ldw	x, (0x26, sp)
	ldw	(0x2, x), y
	ldw	y, (0x12, sp)
	ldw	(x), y
;	user/remote.c: 162: remote.compareCnt++;
	ldw	x, (0x30, sp)
	ld	a, (x)
	inc	a
	ld	(x), a
;	user/remote.c: 163: if(remote.compareCnt >= (MAX_BUFF_CMD - 2))
	cp	a, #0x03
	jrc	00118$
;	user/remote.c: 165: remote.compareCnt = 0;
	ldw	x, (0x30, sp)
	clr	(x)
;	user/remote.c: 166: remote.command = remote.lastCmd;
	ldw	x, (0x32, sp)
	addw	x, #0x0095
	ldw	(0x22, sp), x
	ldw	x, (0x26, sp)
	pushw	x
	ldw	x, (0x2, x)
	exgw	x, y
	popw	x
	ldw	x, (x)
	ldw	(0x0e, sp), x
	ldw	x, (0x22, sp)
	ldw	(0x2, x), y
	ld	a, (0x0f, sp)
	ld	(0x1, x), a
	ld	a, (0x0e, sp)
	ld	(x), a
;	user/remote.c: 167: remote.lastCmd = 0;
	ldw	x, (0x26, sp)
	clr	(0x3, x)
	clr	(0x2, x)
	clr	(0x1, x)
	clr	(x)
;	user/remote.c: 168: sys.idKeyGet = remote.command;
	ldw	x, #_sys+1
	ldw	(0x2, x), y
	ldw	y, (0x0e, sp)
	ldw	(x), y
;	user/remote.c: 169: info("Key press \r\n");
	ldw	x, (0x2c, sp)
	pushw	x
	call	_info
	popw	x
;	user/remote.c: 175: checkCmd = system_checkID(remote.command);
	ldw	x, (0x22, sp)
	pushw	x
	ldw	x, (0x2, x)
	exgw	x, y
	popw	x
	ldw	x, (x)
	pushw	y
	pushw	x
	call	_system_checkID
	addw	sp, #4
;	user/remote.c: 176: if((checkCmd == 1)&&(ctrCnt == 0))
	cp	a, #0x01
	jrne	00118$
	tnz	_ctrCnt+0
	jrne	00118$
;	user/remote.c: 178: GPIO_WriteReverse(CTR_GPIO, CTR_PIN);
	push	#0x04
	push	#0x0f
	push	#0x50
	call	_GPIO_WriteReverse
	addw	sp, #3
;	user/remote.c: 179: info("TurnOn A \r\n");
	ldw	x, (0x2e, sp)
	pushw	x
	call	_info
	popw	x
;	user/remote.c: 180: ctrCnt = 20;
	mov	_ctrCnt+0, #0x14
;	user/remote.c: 181: remote.command = 0;
	ldw	x, (0x22, sp)
	clrw	y
	ldw	(0x2, x), y
	ldw	(x), y
00118$:
;	user/remote.c: 150: for(add = 0;add < MAX_BUFF_CMD;add++)
	inc	(0x05, sp)
	ld	a, (0x05, sp)
	cp	a, #0x05
	jrnc	00174$
	jp	00117$
00174$:
;	user/remote.c: 187: remote_Clear();
	call	_remote_Clear
;	user/remote.c: 188: enableInterrupts();
	rim
00119$:
	addw	sp, #51
	ret
	.area CODE
___str_0:
	.ascii "Data decoder: "
	.db 0x00
___str_1:
	.ascii "Key press "
	.db 0x0d
	.db 0x0a
	.db 0x00
___str_2:
	.ascii "TurnOn A "
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area INITIALIZER
__xinit__ctrFlag:
	.db #0x00	; 0
__xinit__ctrCnt:
	.db #0x00	; 0
	.area CABS (ABS)
