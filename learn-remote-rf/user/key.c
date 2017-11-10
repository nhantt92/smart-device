#include <stdio.h>
#include "timerTick.h"
#include "key.h"
#include "debug.h"

TP_STRUCT	key;
void tp_init(void)
{
	GPIO_Init(PORT_SET_KEY, PIN_SET_KEY, GPIO_MODE_IN_PU_NO_IT);
	TIMER_InitTime(&key.tick);
	for(key.name = TP_SET; key.name < NUM_KEY; key.name++){
		key.ext[key.name].pressed = key.ext[key.name].press = TP_RELEASE;
		key.ext[key.name].waitRelease = 0;
		key.ext[key.name].cnt = 0;
	}
}

void touch_get(uint8_t port_id)     
{  
	uint16_t keyGet;
	switch(port_id)
	{
		case TP_SET:
			keyGet = SET_In();
			#ifdef	KEY_ACTIVE_HIGH
				if(keyGet != PIN_SET_KEY)
			#else
				if(keyGet == PIN_SET_KEY)
			#endif
		    	key.ext[port_id].press = TP_PRESS;
		  	else
		    	key.ext[port_id].press = TP_RELEASE;
		  	break;
	}
	if(key.ext[port_id].press != key.ext[port_id].pressed)
	{
		++(key.ext[port_id].cnt);
		if(key.ext[port_id].cnt == NUM_OF_SAMPLE_KEY)
		{ 
	  		key.ext[port_id].pressed = key.ext[port_id].press;
	  		key.ext[port_id].cnt = 0;
		}
	}
	else
	{       
		key.ext[port_id].cnt = 0;
	}        
} 
 
uint8_t tp_get(uint8_t id)
{
	return key.ext[id].pressed;
}

void tp_manager(void)
{
	if(!TIMER_CheckTimeMS(&key.tick, 10))
  	{
    	for(key.name = TP_SET;key.name < NUM_KEY;key.name++)
    	{
      		touch_get(key.name);
      		if(key.ext[key.name].pressed == TP_PRESS)
      		{
        		key.ext[key.name].waitRelease = 1;
        		//info("Key press: \r\n");
      		}
      		if(key.ext[key.name].pressed == TP_RELEASE){
        		key.ext[key.name].waitRelease = 0;
      		}
        }
    }
}
