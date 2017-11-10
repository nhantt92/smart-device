
#include "stm8s_exti.h"

void EXTI_SetExtIntSensitivity(EXTI_Port_TypeDef Port, EXTI_Sensitivity_TypeDef SensitivityValue)
{
  /* Set external interrupt sensitivity */
  switch (Port)
  {
  case EXTI_PORT_GPIOA:
    EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PAIS);
    EXTI->CR1 |= (uint8_t)(SensitivityValue);
    break;
  case EXTI_PORT_GPIOB:
    EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PBIS);
    EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 2);
    break;
  case EXTI_PORT_GPIOC:
    EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PCIS);
    EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 4);
    break;
  case EXTI_PORT_GPIOD:
    EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PDIS);
    EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 6);
    break;
  case EXTI_PORT_GPIOE:
    EXTI->CR2 &= (uint8_t)(~EXTI_CR2_PEIS);
    EXTI->CR2 |= (uint8_t)(SensitivityValue);
    break;
  default:
    break;
  }
}
