
/* Includes ------------------------------------------------------------------*/
#include "stm8s.h"
#include "stm8s_conf.h"
#include "main.h"
#include "clk.h"
#include "debug.h"
#include "remote.h"
#include "rom.h"
#include "key.h"
#include "system.h"
#include "ledss.h"

INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
{
  uint8_t temp;
  /* Read one byte from the receive data register and send it back */
  temp = UART1_ReceiveData8();
}

INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
{
  TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
  TIMER_Inc();
  IWDG_ReloadCounter();
}

INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
{
  TIM1_ClearFlag(TIM1_FLAG_UPDATE); 
} 

INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
{
  //disableInterrupts();
  remote_Process();
  IWDG_ReloadCounter();
  //enableInterrupts();
}

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

void GPIO_Config(void)
{
  GPIO_Init(CTR_GPIO, CTR_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
  GPIO_WriteLow(CTR_GPIO, CTR_PIN);
}

void main(void)
{
  //Configure Quartz Clock
  CLK_Config();
  TIMER_Init();
  debug_Init();
  sys_readCfg();
  remote_Init();
  GPIO_Config();
  tp_init();
  system_init();
  ledstt_init();
  enableInterrupts();
  IWDG_Config();
  while(1)
  {
    remote_Manager();
    tp_manager();
    system_manager();
    ledstt_manager();
    IWDG_ReloadCounter();
  }
}

