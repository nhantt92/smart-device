#include "ledss.h"

LED_STR led;
void led_change(uint8_t mode, uint8_t time)
{
	led.mode = mode;
	led.timeOn = time;
}

uint8_t led_getstatus(void)
{
	return led.mode;
}

void ledstt_init(void)
{
	led.mode = LED_OFF;
	led.timeOn = 0;
	led.cycle = 0;
	GPIO_Init(PORT_LED, PIN_LED, GPIO_MODE_OUT_PP_HIGH_FAST);
	TIMER_InitTime(&led.tick);
	led_change(LED_FLASH, 10);
}

void ledstt_manager(void)
{
	if(!TIMER_CheckTimeMS(&led.tick, 200))
	{
		if(led.mode == LED_ON)
			GPIO_WriteLow(PORT_LED, PIN_LED);
		else if(led.mode == LED_OFF)
			GPIO_WriteHigh(PORT_LED, PIN_LED);
		else
		{
			if(led.timeOn != 0)
			{
				led.timeOn--;
				if(led.cycle == 0)
				{
					led.cycle = 1;
					GPIO_WriteLow(PORT_LED, PIN_LED);
				}
				else
				{
					led.cycle = 0;
					GPIO_WriteHigh(PORT_LED, PIN_LED);
				}
			}
			else
				led.mode = LED_OFF;
		}
	}
}
