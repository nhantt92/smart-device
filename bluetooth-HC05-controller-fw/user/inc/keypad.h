
#ifndef __KEYPAD_H
#define __KEYPAD_H

/* Includes ------------------------------------------------------------------*/
#include "stm8s.h"
#include "stm8s_gpio.h"
#include "timerTick.h"

#define KEY_PORT1 GPIOD
#define KEY_PORT2 GPIOC
#define KEY1 GPIO_PIN_0
#define KEY2 GPIO_PIN_2
#define KEY3 GPIO_PIN_3
#define KEY4 GPIO_PIN_4
#define KEY5 GPIO_PIN_7
#define KEY6 GPIO_PIN_2
#define KEY7 GPIO_PIN_3
#define KEY8 GPIO_PIN_4

#define KEY1_In() GPIO_ReadInputPin(KEY_PORT1, KEY1)
#define KEY2_In() GPIO_ReadInputPin(KEY_PORT1, KEY2)
#define KEY3_In() GPIO_ReadInputPin(KEY_PORT1, KEY3)
#define KEY4_In() GPIO_ReadInputPin(KEY_PORT1, KEY4)
#define KEY5_In() GPIO_ReadInputPin(KEY_PORT1, KEY5)
#define KEY6_In() GPIO_ReadInputPin(KEY_PORT2, KEY6)
#define KEY7_In() GPIO_ReadInputPin(KEY_PORT2, KEY7)
#define KEY8_In() GPIO_ReadInputPin(KEY_PORT2, KEY8)

#define NUM_OF_SAMPLE_KEY   10
#define NUM_KEY 8

typedef enum{
  TP_LEFT1 = 0,
  TP_RIGHT1 = 1,
  TP_LEFT2 = 2,
  TP_RIGHT2 = 3,
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
  uint8_t name;
  TP_EXT ext[NUM_KEY];
  TIME tick;
}TP_STRUCT;

void touch_pad_init(void);
void touch_get(uint8_t port_id);
uint8_t tp_get(uint8_t id);
void tp_process(void);
void touch_pad_manager(void);


#endif /* __KEYPAD_H */