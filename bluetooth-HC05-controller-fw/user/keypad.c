#include "keypad.h"
#include "timerTick.h"
#include "stm8s_iwdg.h"

TP_STRUCT key;

void touch_pad_init(void)
{
	GPIO_Init(KEY_PORT1, KEY1|KEY2|KEY3|KEY4|KEY5, GPIO_MODE_IN_PU_NO_IT);
	GPIO_Init(KEY_PORT2, KEY6|KEY7|KEY8, GPIO_MODE_IN_PU_NO_IT);
	for(key.name = 0; key.name < NUM_KEY; key.name++)
	{
		key.ext[key.name].press = key.ext[key.name].press = TP_RELEASE;
		key.ext[key.name].waitRelease = 0;
		key.ext[key.name].cnt = 0;
	}
}

void touch_get(uint8_t port_id){
	uint16_t keyGet;
	switch(port_id){
		case 0:
			keyGet = KEY5_In();
			if(keyGet == 0)
				key.ext[port_id].press = TP_PRESS;
			else
				key.ext[port_id].press = TP_RELEASE;
			break;
		case 1:
			keyGet = KEY6_In();
			if(keyGet == 0)
				key.ext[port_id].press = TP_PRESS;
			else
				key.ext[port_id].press = TP_RELEASE;
			break;
		case 2:
			keyGet = KEY8_In();
			if(keyGet == 0)
				key.ext[port_id].press = TP_PRESS;
			else
				key.ext[port_id].press = TP_RELEASE;
			break;
		case 3:
			keyGet = KEY7_In();
			if(keyGet == 0)
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
			key.ext[port_id].pressed = key.ext[port_id].pressed;
			key.ext[port_id].cnt = 0;
		}
	}
	else
	{
		key.ext[port_id].cnt = 0;
	}
}

uint8_t tp_get(uint8_t id){
	return key.ext[id].pressed;
}

// void tp_process(void){
// 	for(key.name = 0; key.name < NUM_KEY; key.name++){
// 		touch_get(key.name);
// 		if(key.ext[key.name].press == TP_PRESS){
// 			if(key.ext[key.name].waitRelease == 0){
// 				switch(key.name){
// 					case TP_LEFT1:
// 						RS485_Puts("LEFT1_ON\r\n");
// 						break;
// 					case TP_RIGHT1:
// 						RS485_Puts("RIGHT1_ON\r\n");
// 						break;
// 					case TP_LEFT2:
// 						RS485_Puts("LEFT2_ON\r\n");
// 						break;
// 					case TP_RIGHT2:
// 						RS485_Puts("RIGHT2_ON\r\n");
// 						break;
// 				}
// 			}
// 			key.ext[key.name].waitRelease = 1;
// 		}
// 		if(key.ext[key.name].press == TP_RELEASE){
// 			if(key.ext[key.name].waitRelease ==1)
// 			{
// 				switch(key.name){
// 					case TP_LEFT1:
// 						RS485_Puts("LEFT1_OFF\r\n");
// 						break;
// 					case TP_RIGHT1:
// 						RS485_Puts("RIGHT1_OFF\r\n");
// 						break;
// 					case TP_LEFT2:
// 						RS485_Puts("LEFT2_OFF\r\n");
// 						break;
// 					case TP_RIGHT2:
// 						RS485_Puts("RIGHT2_OFF\r\n");
// 						break;
// 				}
// 			}
// 			key.ext[key.name].waitRelease = 0;
// 		}
// 	}
// }
// void touch_pad_manager(void)
// {	
// 	if(TIMER_CheckTimeMS(&key.tick, 10))
// 	{
// 		tp_process();
// 	}
// }

