
#include "ringbuf.h"

int RINGBUF_Init(RINGBUF *r, uint8_t* buf, int size)
{
  if(r == NULL || buf == NULL || size < 2) return -1; 
  r->p_o = r->p_r = r->p_w = buf;
  r->fill_cnt = 0;
  r->size = size; 
  return 0;
}

int RINGBUF_Put(RINGBUF *r, uint8_t c)
{
  if(r->fill_cnt>=r->size)return -1;		// ring buffer is full, this should be atomic operation
  
  disableInterrupts();				// enter critical session
  r->fill_cnt++;				// increase filled slots count, this should be atomic operation
  enableInterrupts();				// leave critical session
  
  *r->p_w++ = c;				// put character into buffer
  
  if(r->p_w >= r->p_o + r->size)	        // rollback if write pointer go pass
          r->p_w = r->p_o;			// the physical boundary 
  return 0;
}

int RINGBUF_Get(RINGBUF *r, uint8_t* c)
{
  if(r->fill_cnt<=0)return -1;			// ring buffer is empty, this should be atomic operation
  
  disableInterrupts();				// enter critical session
  r->fill_cnt--;				// decrease filled slots count
  enableInterrupts();			        // leave critical session
  
  *c = *r->p_r++;				// get the character out
  
  if(r->p_r >= r->p_o + r->size)		// rollback if write pointer go pass
          r->p_r = r->p_o;			// the physical boundary
  
  return 0;
}
uint8_t* RINGBUF_GetAddress(RINGBUF *r) 
{
  return (uint8_t*)(r->fill_cnt + r);
}
