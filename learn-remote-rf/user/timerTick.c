#include "timerTick.h"
#include "main.h"

uint16_t timeGet;
uint16_t timeBack;
uint32_t timeTickMs;    
uint16_t timeTickUs;   

void TIMER_Init(void)
{
  CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4 , ENABLE); 
  TIM4_DeInit(); 
  /* Time base configuration */  
  TIM4_TimeBaseInit(TIM4_PRESCALER_16, CYCLE_US);
  TIM4_ClearFlag(TIM4_FLAG_UPDATE); 
  TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
  TIM4_Cmd(ENABLE);    // Enable TIM4 
  timeTickMs = 0;
  timeTickUs = 0;
}

void TIMER_Inc(void)
{
  timeTickUs++;
  if(timeTickUs%5 == 0){
    timeTickMs++;
  }
}

void TIMER_InitTime(TIME *pTime)
{
  pTime->timeMS = timeTickMs;
}

uint8_t TIMER_CheckTimeUS(TIME *pTime, uint16_t time)
{
  timeGet = TIM4_GetCounter();
  if(((timeGet > pTime->timeUS)&&((timeGet - pTime->timeUS) >= time))||((timeGet < pTime->timeUS)&&(((CYCLE_US -  pTime->timeUS) + timeGet + 1) >= time))){
    pTime->timeUS = timeGet;
    return 0;
  }
  return 1;
}

uint8_t TIMER_CheckTimeMS(TIME *pTime, uint32_t time)
{
  if(((timeTickMs > pTime->timeMS)&&((timeTickMs - pTime->timeMS) >= time))||((timeTickMs < pTime->timeMS)&&(((CYCLE_MS -  pTime->timeMS) + timeTickMs + 1) >= time))){
    pTime->timeMS = timeTickMs;
    return 0;
  }
  return 1;
}



