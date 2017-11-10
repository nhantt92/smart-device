#ifndef _TOUCHPAD_H_
#define _TOUCHPAD_H_

#include "stm8s.h"
#include "timerTick.h"

// Define pin connect touch key
#define PORT_SET_KEY 			GPIOC

#define PIN_SET_KEY 			GPIO_PIN_3

#define SET_In()			    GPIO_ReadInputPin(PORT_SET_KEY, PIN_SET_KEY)

#define NUM_OF_SAMPLE_KEY		10
#define NUM_KEY					1

#define KEY_ACTIVE_HIGH			1

typedef enum {
	TP_SET = 0
}TP_NAME;

typedef enum {
	TP_RELEASE = 0,
	TP_PRESS,
}TP_EVENT;

typedef struct {
	uint8_t pressed;
    uint8_t press;
    uint8_t waitRelease;
    uint8_t cnt;       
}TP_EXT;

typedef struct {
	TP_NAME 	name;
	TP_EXT  	ext[NUM_KEY];
	TIME 		tick;
}TP_STRUCT;

void tp_init(void);
void tp_manager(void);
uint8_t tp_get(uint8_t id);

#endif