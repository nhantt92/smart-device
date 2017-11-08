/**
*******************************************
* @file     main.c
* @author   nhantt
* @version  V1.0.0
* @date     25-March-2017
* @brief    This file brief for save memory used build with SDCC
*********************************************
*/

/* Includes ------------------------------------------------------------------*/
#include "stm8s.h"
#include "main.h"
#include "stm8s_gpio.h"
#include "stm8s_clk.h"
#include "stm8s_conf.h"
#include "stm8s_iwdg.h"
#include "keypad.h"
#include "hc05.h"


INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
{
  HC05_Read();
}

// void GPIO_Config(void)
// {
//  // GPIO_Init(GPIOA, GPIO_PIN_2 | GPIO_PIN_3, GPIO_MODE_OUT_PP_HIGH_FAST);
//  // GPIO_Init(GPIOC, GPIO_PIN_4 | GPIO_PIN_5 | GPIO_PIN_6 | GPIO_PIN_7, GPIO_MODE_OUT_PP_HIGH_FAST);
//   GPIO_Init(GPIOD, GPIO_PIN_3 | GPIO_PIN_4, GPIO_MODE_IN_PU_NO_IT);
// }

void IWDG_Config(void)
{
  /* IWDG timeout equal to 500 ms (the timeout may varies due to LSI frequency dispersion) */
  /* Enable write access to IWDG_PR and IWDG_RLR registers */
  IWDG_WriteAccessCmd(IWDG_WriteAccess_Enable);
  /* IWDG counter clock: LSI 128KHz/256 */
  IWDG_SetPrescaler(IWDG_Prescaler_256);
  //Set counter reload value to obtain 0.5s IWDG TimeOut.
  //Counter Reload Value = 0.5s/IWDG counter clock period
  //                       = 0.5s*LsiFreq/(256) 
  IWDG_SetReload(250);
  /* Reload IWDG counter */
  IWDG_ReloadCounter();
  /* Enable IWDG (the LSI oscillator will be enabled by hardware) */
  IWDG_Enable();
}

void main(void)
{
  CLK_Config();
  //GPIO_Config();
  HC05_Init(9600);
  HC05_PutStr("Hello World!");
  IWDG_Config();
  while(1)
  {
    IWDG_ReloadCounter();
  }
}
