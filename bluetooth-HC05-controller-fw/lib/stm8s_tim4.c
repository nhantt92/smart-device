/**
*******************************************
* @file     stm8s_tim4.c
* @author   nhantt
* @version  V1.0.0
* @date     21-March-2017
* @brief    This file brief for save memory used build with SDCC
*********************************************
*/

#include "stm8s_tim4.h"

void TIM4_DeInit(void)
{
  TIM4->CR1 = TIM4_CR1_RESET_VALUE;
  TIM4->IER = TIM4_IER_RESET_VALUE;
  TIM4->CNTR = TIM4_CNTR_RESET_VALUE;
  TIM4->PSCR = TIM4_PSCR_RESET_VALUE;
  TIM4->ARR = TIM4_ARR_RESET_VALUE;
  TIM4->SR1 = TIM4_SR1_RESET_VALUE;
}

void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler, uint8_t TIM4_Period)
{
  /* Set the Prescaler value */
  TIM4->PSCR = (uint8_t)(TIM4_Prescaler);
  /* Set the Autoreload value */
  TIM4->ARR = (uint8_t)(TIM4_Period);
}

void TIM4_Cmd(FunctionalState NewState)
{
  uint8_t state = NewState;
  TIM4->CR1 |= TIM4_CR1_CEN;
}

void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, FunctionalState NewState)
{
  uint8_t state = NewState;
  /* Enable the Interrupt sources */
  TIM4->IER |= (uint8_t)TIM4_IT;
}

uint8_t TIM4_GetCounter(void)
{
  /* Get the Counter Register value */
  return (uint8_t)(TIM4->CNTR);
}

FlagStatus TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG)
{
  FlagStatus bitstatus = RESET;
  if ((TIM4->SR1 & (uint8_t)TIM4_FLAG)  != 0)
  {
    bitstatus = SET;
  }
  else
  {
    bitstatus = RESET;
  }
  return ((FlagStatus)bitstatus);
}

void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
{
  /* Clear the flags (rc_w0) clear this bit by writing 0. Writing ë1í has no effect*/
  TIM4->SR1 = (uint8_t)(~TIM4_FLAG);
}

void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
{
  /* Clear the IT pending Bit */
  TIM4->SR1 = (uint8_t)(~TIM4_IT);
}