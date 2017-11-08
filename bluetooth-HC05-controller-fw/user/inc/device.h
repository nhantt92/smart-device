#ifndef __DEVICE_H
#define __DEVICE_H

#include "stm8s.h"
#include "stm8s_gpio.h"
#include "timerTick.h"

#define DEV_PORT GPIOB
#define DEV1_PIN GPIO_PIN_1
#define DEV2_PIN GPIO_PIN_0
#define DEV3_PIN GPIO_PIN_2
#define DEV4_PIN GPIO_PIN_3
#define DEV5_PIN GPIO_PIN_4
#define DEV6_PIN GPIO_PIN_5
#define DEV7_PIN GPIO_PIN_6
#define DEV8_PIN GPIO_PIN_7

void Dev_Init(void);
void Dev_Manager(void);

#endif