
#include "stm8s_tim1.h"

void TIM1_DeInit(void)
{
  TIM1->CR1  = TIM1_CR1_RESET_VALUE;
  TIM1->CR2  = TIM1_CR2_RESET_VALUE;
  TIM1->SMCR = TIM1_SMCR_RESET_VALUE;
  TIM1->ETR  = TIM1_ETR_RESET_VALUE;
  TIM1->IER  = TIM1_IER_RESET_VALUE;
  TIM1->SR2  = TIM1_SR2_RESET_VALUE;
  /* Disable channels */
  TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  /* Configure channels as inputs: it is necessary if lock level is equal to 2 or 3 */
  TIM1->CCMR1 = 0x01;
  TIM1->CCMR2 = 0x01;
  TIM1->CCMR3 = 0x01;
  TIM1->CCMR4 = 0x01;
  /* Then reset channel registers: it also works if lock level is equal to 2 or 3 */
  TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  TIM1->CCMR1 = TIM1_CCMR1_RESET_VALUE;
  TIM1->CCMR2 = TIM1_CCMR2_RESET_VALUE;
  TIM1->CCMR3 = TIM1_CCMR3_RESET_VALUE;
  TIM1->CCMR4 = TIM1_CCMR4_RESET_VALUE;
  TIM1->CNTRH = TIM1_CNTRH_RESET_VALUE;
  TIM1->CNTRL = TIM1_CNTRL_RESET_VALUE;
  TIM1->PSCRH = TIM1_PSCRH_RESET_VALUE;
  TIM1->PSCRL = TIM1_PSCRL_RESET_VALUE;
  TIM1->ARRH  = TIM1_ARRH_RESET_VALUE;
  TIM1->ARRL  = TIM1_ARRL_RESET_VALUE;
  TIM1->CCR1H = TIM1_CCR1H_RESET_VALUE;
  TIM1->CCR1L = TIM1_CCR1L_RESET_VALUE;
  TIM1->CCR2H = TIM1_CCR2H_RESET_VALUE;
  TIM1->CCR2L = TIM1_CCR2L_RESET_VALUE;
  TIM1->CCR3H = TIM1_CCR3H_RESET_VALUE;
  TIM1->CCR3L = TIM1_CCR3L_RESET_VALUE;
  TIM1->CCR4H = TIM1_CCR4H_RESET_VALUE;
  TIM1->CCR4L = TIM1_CCR4L_RESET_VALUE;
  TIM1->OISR  = TIM1_OISR_RESET_VALUE;
  TIM1->EGR   = 0x01; /* TIM1_EGR_UG */
  TIM1->DTR   = TIM1_DTR_RESET_VALUE;
  TIM1->BKR   = TIM1_BKR_RESET_VALUE;
  TIM1->RCR   = TIM1_RCR_RESET_VALUE;
  TIM1->SR1   = TIM1_SR1_RESET_VALUE;
}

void TIM1_TimeBaseInit(uint16_t TIM1_Prescaler,
                       TIM1_CounterMode_TypeDef TIM1_CounterMode,
                       uint16_t TIM1_Period,
                       uint8_t TIM1_RepetitionCounter)
{
  
  /* Set the Autoreload value */
  TIM1->ARRH = (uint8_t)(TIM1_Period >> 8);
  TIM1->ARRL = (uint8_t)(TIM1_Period);
  
  /* Set the Prescaler value */
  TIM1->PSCRH = (uint8_t)(TIM1_Prescaler >> 8);
  TIM1->PSCRL = (uint8_t)(TIM1_Prescaler);
  
  /* Select the Counter Mode */
  TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)(~(TIM1_CR1_CMS | TIM1_CR1_DIR)))
                        | (uint8_t)(TIM1_CounterMode));
  
  /* Set the Repetition Counter value */
  TIM1->RCR = TIM1_RepetitionCounter;
}

void TIM1_Cmd(FunctionalState NewState)
{
  /* set or Reset the CEN Bit */
  if (NewState != DISABLE)
  {
    TIM1->CR1 |= TIM1_CR1_CEN;
  }
  else
  {
    TIM1->CR1 &= (uint8_t)(~TIM1_CR1_CEN);
  }
}

void TIM1_ITConfig(TIM1_IT_TypeDef  TIM1_IT, FunctionalState NewState)
{
  if (NewState != DISABLE)
  {
    /* Enable the Interrupt sources */
    TIM1->IER |= (uint8_t)TIM1_IT;
  }
  else
  {
    /* Disable the Interrupt sources */
    TIM1->IER &= (uint8_t)(~(uint8_t)TIM1_IT);
  }
}

void TIM1_SetCounter(uint16_t Counter)
{
  /* Set the Counter Register value */
  TIM1->CNTRH = (uint8_t)(Counter >> 8);
  TIM1->CNTRL = (uint8_t)(Counter);
}

// void TIM1_SetAutoreload(uint16_t Autoreload)
// {
//    Set the Autoreload Register value 
//   TIM1->ARRH = (uint8_t)(Autoreload >> 8);
//   TIM1->ARRL = (uint8_t)(Autoreload);
//  }

uint16_t TIM1_GetCounter(void)
{
  uint16_t tmpcntr = 0;
  
  tmpcntr = ((uint16_t)TIM1->CNTRH << 8);
  
  /* Get the Counter Register value */
  return (uint16_t)(tmpcntr | (uint16_t)(TIM1->CNTRL));
}

// FlagStatus TIM1_GetFlagStatus(TIM1_FLAG_TypeDef TIM1_FLAG)
// {
//   FlagStatus bitstatus = RESET;
//   uint8_t tim1_flag_l = 0, tim1_flag_h = 0;
  
//   tim1_flag_l = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_FLAG);
//   tim1_flag_h = (uint8_t)((uint16_t)TIM1_FLAG >> 8);
  
//   if ((tim1_flag_l | (uint8_t)(TIM1->SR2 & tim1_flag_h)) != 0)
//   {
//     bitstatus = SET;
//   }
//   else
//   {
//     bitstatus = RESET;
//   }
//   return (FlagStatus)(bitstatus);
// }

void TIM1_ClearFlag(TIM1_FLAG_TypeDef TIM1_FLAG)
{
  /* Clear the flags (rc_w0) clear this bit by writing 0. Writing ë1í has no effect*/
  TIM1->SR1 = (uint8_t)(~(uint8_t)(TIM1_FLAG));
  TIM1->SR2 = (uint8_t)((uint8_t)(~((uint8_t)((uint16_t)TIM1_FLAG >> 8))) & 
                        (uint8_t)0x1E);
}

// ITStatus TIM1_GetITStatus(TIM1_IT_TypeDef TIM1_IT)
// {
//   ITStatus bitstatus = RESET;
//   uint8_t TIM1_itStatus = 0, TIM1_itEnable = 0;
  
//   TIM1_itStatus = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_IT);
  
//   TIM1_itEnable = (uint8_t)(TIM1->IER & (uint8_t)TIM1_IT);
  
//   if ((TIM1_itStatus != (uint8_t)RESET ) && (TIM1_itEnable != (uint8_t)RESET ))
//   {
//     bitstatus = SET;
//   }
//   else
//   {
//     bitstatus = RESET;
//   }
//   return (ITStatus)(bitstatus);
// }

void TIM1_ClearITPendingBit(TIM1_IT_TypeDef TIM1_IT)
{
  /* Clear the IT pending Bit */
  TIM1->SR1 = (uint8_t)(~(uint8_t)TIM1_IT);
}
