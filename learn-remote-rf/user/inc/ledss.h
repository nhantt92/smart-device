#ifndef _LEDSTT_H_
#define _LEDSTT_H_

#include "stm8s.h"
#include "timerTick.h"

#define PORT_LED 			GPIOC
#define PIN_LED 			GPIO_PIN_4

typedef enum{
	LED_OFF = 0,
	LED_ON,
	LED_FLASH
}LED_EVENT;

typedef struct{
	TIME tick;
	uint8_t mode;
	uint8_t timeOn;
	uint8_t cycle;
}LED_STR;

void ledstt_init(void);
uint8_t led_getstatus(void);
void ledstt_manager(void);
void led_change(uint8_t mode, uint8_t time);

#endif