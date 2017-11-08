#ifndef __TIMERTICK_H
#define __TIMERTICK_H

#include "stm8s.h"
#include "stm8s_conf.h"

#define CYCLE_US   200
#define CYCLE_MS   0xFFFFFFFF

typedef struct
{
	uint16_t timeUS;
  	uint32_t timeMS;
}TIME;

void TIMER_Init(void);
void TIMER_Inc(void);
void TIMER_InitTime(TIME *pTime);
uint8_t TIMER_CheckTimeUS(TIME *pTime, uint16_t time);
uint8_t TIMER_CheckTimeMS(TIME *pTime, uint32_t time);
uint32_t TIMER_GetTime(void);
void TIM_Delay(uint8_t us);
#endif
