/**
*******************************************
* @file    	stm8s_gpio.c
* @author 	nhantt
* @version 	V1.0.0
* @date    	21-March-2017
* @brief   	This file brief for save memory used build with SDCC
*********************************************
*/

#include "stm8s_iwdg.h"

void IWDG_WriteAccessCmd(IWDG_WriteAccess_TypeDef IWDG_WriteAccess)
{
	IWDG->KR = (uint8_t)IWDG_WriteAccess; /* Write Access */
}

void IWDG_SetPrescaler(IWDG_Prescaler_TypeDef IWDG_Prescaler)
{
    IWDG->PR = (uint8_t)IWDG_Prescaler;
}

void IWDG_SetReload(uint8_t IWDG_Reload)
{
    IWDG->RLR = IWDG_Reload;
}

void IWDG_ReloadCounter(void)
{
    IWDG->KR = IWDG_KEY_REFRESH;
}

void IWDG_Enable(void)
{
    IWDG->KR = IWDG_KEY_ENABLE;
}