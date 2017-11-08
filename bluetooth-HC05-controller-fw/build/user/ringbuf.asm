;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW64)
;--------------------------------------------------------
	.module ringbuf
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _RINGBUF_Init
	.globl _RINGBUF_Put
	.globl _RINGBUF_Get
	.globl _RINGBUF_GetAddress
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
;	user/ringbuf.c: 4: int RINGBUF_Init(RINGBUF *r, uint8_t* buf, int size)
;	-----------------------------------------
;	 function RINGBUF_Init
;	-----------------------------------------
_RINGBUF_Init:
	sub	sp, #4
;	user/ringbuf.c: 6: if(r == NULL || buf == NULL || size < 2) return -1; 
	ldw	x, (0x07, sp)
	jreq	00101$
	ldw	x, (0x09, sp)
	jreq	00101$
	ldw	x, (0x0b, sp)
	cpw	x, #0x0002
	jrsge	00102$
00101$:
	ldw	x, #0xffff
	jra	00105$
00102$:
;	user/ringbuf.c: 7: r->p_o = r->p_r = r->p_w = buf;
	ldw	y, (0x07, sp)
	ldw	(0x03, sp), y
	ldw	x, (0x03, sp)
	incw	x
	incw	x
	ldw	(0x01, sp), x
	ldw	x, (0x03, sp)
	ldw	y, (0x09, sp)
	ldw	(0x0004, x), y
	ldw	x, (0x01, sp)
	ldw	y, (0x09, sp)
	ldw	(x), y
	ldw	x, (0x03, sp)
	ldw	y, (0x09, sp)
	ldw	(x), y
;	user/ringbuf.c: 8: r->fill_cnt = 0;
	ldw	x, (0x03, sp)
	addw	x, #0x0006
	clr	(0x1, x)
	clr	(x)
;	user/ringbuf.c: 9: r->size = size; 
	ldw	x, (0x03, sp)
	ldw	y, (0x0b, sp)
	ldw	(0x0008, x), y
;	user/ringbuf.c: 10: return 0;
	clrw	x
00105$:
	addw	sp, #4
	ret
;	user/ringbuf.c: 13: int RINGBUF_Put(RINGBUF *r, uint8_t c)
;	-----------------------------------------
;	 function RINGBUF_Put
;	-----------------------------------------
_RINGBUF_Put:
	sub	sp, #16
;	user/ringbuf.c: 15: if(r->fill_cnt>=r->size)return -1;		// ring buffer is full, this should be atomic operation
	ldw	y, (0x13, sp)
	ldw	(0x0d, sp), y
	ldw	x, (0x0d, sp)
	addw	x, #0x0006
	ldw	(0x07, sp), x
	ldw	x, (0x07, sp)
	ldw	x, (x)
	ldw	y, (0x0d, sp)
	addw	y, #0x0008
	ldw	(0x09, sp), y
	ldw	y, (0x09, sp)
	ldw	y, (y)
	ldw	(0x01, sp), y
	cpw	x, (0x01, sp)
	jrslt	00102$
	ldw	x, #0xffff
	jra	00105$
00102$:
;	user/ringbuf.c: 17: disableInterrupts();				// enter critical session
	sim
;	user/ringbuf.c: 18: r->fill_cnt++;				// increase filled slots count, this should be atomic operation
	ldw	x, (0x07, sp)
	ldw	x, (x)
	incw	x
	ldw	y, (0x07, sp)
	ldw	(y), x
;	user/ringbuf.c: 19: enableInterrupts();				// leave critical session
	rim
;	user/ringbuf.c: 21: *r->p_w++ = c;				// put character into buffer
	ldw	x, (0x0d, sp)
	addw	x, #0x0004
	ldw	(0x0b, sp), x
	ldw	x, (0x0b, sp)
	ldw	x, (x)
	ldw	(0x0f, sp), x
	ldw	x, (0x0f, sp)
	incw	x
	ldw	y, (0x0b, sp)
	ldw	(y), x
	ldw	x, (0x0f, sp)
	ld	a, (0x15, sp)
	ld	(x), a
;	user/ringbuf.c: 23: if(r->p_w >= r->p_o + r->size)	        // rollback if write pointer go pass
	ldw	x, (0x0b, sp)
	ldw	x, (x)
	ldw	y, (0x0d, sp)
	ldw	y, (y)
	ldw	(0x05, sp), y
	ldw	y, (0x09, sp)
	ldw	y, (y)
	addw	y, (0x05, sp)
	ldw	(0x03, sp), y
	cpw	x, (0x03, sp)
	jrc	00104$
;	user/ringbuf.c: 24: r->p_w = r->p_o;			// the physical boundary 
	ldw	x, (0x0b, sp)
	ldw	y, (0x05, sp)
	ldw	(x), y
00104$:
;	user/ringbuf.c: 25: return 0;
	clrw	x
00105$:
	addw	sp, #16
	ret
;	user/ringbuf.c: 28: int RINGBUF_Get(RINGBUF *r, uint8_t* c)
;	-----------------------------------------
;	 function RINGBUF_Get
;	-----------------------------------------
_RINGBUF_Get:
	sub	sp, #14
;	user/ringbuf.c: 30: if(r->fill_cnt<=0)return -1;			// ring buffer is empty, this should be atomic operation
	ldw	y, (0x11, sp)
	ldw	(0x0d, sp), y
	ldw	x, (0x0d, sp)
	addw	x, #0x0006
	ldw	(0x0b, sp), x
	ldw	x, (0x0b, sp)
	ldw	x, (x)
	cpw	x, #0x0000
	jrsgt	00102$
	ldw	x, #0xffff
	jra	00105$
00102$:
;	user/ringbuf.c: 32: disableInterrupts();				// enter critical session
	sim
;	user/ringbuf.c: 33: r->fill_cnt--;				// decrease filled slots count
	ldw	x, (0x0b, sp)
	ldw	x, (x)
	decw	x
	ldw	y, (0x0b, sp)
	ldw	(y), x
;	user/ringbuf.c: 34: enableInterrupts();			        // leave critical session
	rim
;	user/ringbuf.c: 36: *c = *r->p_r++;				// get the character out
	ldw	y, (0x13, sp)
	ldw	(0x07, sp), y
	ldw	x, (0x0d, sp)
	incw	x
	incw	x
	ldw	(0x09, sp), x
	ldw	x, (0x09, sp)
	ldw	x, (x)
	ldw	(0x05, sp), x
	ldw	x, (0x05, sp)
	incw	x
	ldw	y, (0x09, sp)
	ldw	(y), x
	ldw	x, (0x05, sp)
	ld	a, (x)
	ldw	x, (0x07, sp)
	ld	(x), a
;	user/ringbuf.c: 38: if(r->p_r >= r->p_o + r->size)		// rollback if write pointer go pass
	ldw	x, (0x09, sp)
	ldw	x, (x)
	ldw	y, (0x0d, sp)
	ldw	y, (y)
	ldw	(0x03, sp), y
	ldw	y, (0x0d, sp)
	ldw	y, (0x8, y)
	addw	y, (0x03, sp)
	ldw	(0x01, sp), y
	cpw	x, (0x01, sp)
	jrc	00104$
;	user/ringbuf.c: 39: r->p_r = r->p_o;			// the physical boundary
	ldw	x, (0x09, sp)
	ldw	y, (0x03, sp)
	ldw	(x), y
00104$:
;	user/ringbuf.c: 41: return 0;
	clrw	x
00105$:
	addw	sp, #14
	ret
;	user/ringbuf.c: 43: uint8_t* RINGBUF_GetAddress(RINGBUF *r) 
;	-----------------------------------------
;	 function RINGBUF_GetAddress
;	-----------------------------------------
_RINGBUF_GetAddress:
	pushw	x
;	user/ringbuf.c: 45: return (uint8_t*)(r->fill_cnt + r);
	ldw	y, (0x05, sp)
	ldw	(0x01, sp), y
	ldw	x, (0x01, sp)
	ldw	x, (0x6, x)
	pushw	x
	push	#0x0a
	push	#0x00
	call	__mulint
	addw	sp, #4
	addw	x, (0x01, sp)
	addw	sp, #2
	ret
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)
