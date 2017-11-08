#ifndef _RING_BUF_H_
#define _RING_BUF_H_

#include "stm8s.h"

#define NULL            0

typedef struct{
  uint8_t* p_o;				/**< Original pointer */
  uint8_t* volatile p_r;		/**< Read pointer */
  uint8_t* volatile p_w;		/**< Write pointer */
  volatile int fill_cnt;	        /**< Number of filled slots */
  int size;				/**< Buffer size */
}RINGBUF;

int RINGBUF_Init(RINGBUF *r, uint8_t* buf, int size);
int RINGBUF_Put(RINGBUF *r, uint8_t c);
int RINGBUF_Get(RINGBUF *r, uint8_t* c);
uint8_t* RINGBUF_GetAddress(RINGBUF *r);
#endif
