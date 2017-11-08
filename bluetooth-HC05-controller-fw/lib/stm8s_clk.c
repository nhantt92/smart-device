/**
*******************************************
* @file    	stm8s_clk.c
* @author 	nhantt
* @version 	V1.0.0
* @date    	21-March-2017
* @brief   	This file brief for save memory used build with SDCC
*********************************************
*/

#include "stm8s_clk.h"

CONST uint8_t HSIDivFactor[4] = {1, 2, 4, 8}; /*!< Holds the different HSI Divider factors */

void CLK_Config(void)
{
	/*CLK_DeInit()*/
	CLK->ICKR = CLK_ICKR_RESET_VALUE;
    CLK->ECKR = CLK_ECKR_RESET_VALUE;
    CLK->SWR  = CLK_SWR_RESET_VALUE;
    CLK->SWCR = CLK_SWCR_RESET_VALUE;
    CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
    CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
    CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
    CLK->CSSR = CLK_CSSR_RESET_VALUE;
    CLK->CCOR = CLK_CCOR_RESET_VALUE;
    while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
    {}
    CLK->CCOR = CLK_CCOR_RESET_VALUE;
    CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
    CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;

    /*Select clk source*/
    /*CLK_HSI*/
    CLK->ICKR |= CLK_ICKR_HSIEN; /* Set HSIEN bit */
    /*CLK_LSI*/
    //CLK->ICKR |= CLK_ICKR_LSIEN; /* Set LSIEN bit */
    /*CLK_HSE*/
    //CLK->ECKR |= CLK_ECKR_HSEEN; /* Set HSEEN bit */

    /*CLK_HSIPrescalerConfig*/
    CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV); /* Clear High speed internal clock prescaler */
    CLK->CKDIVR |= (uint8_t)CLK_PRESCALER_HSIDIV1; /* Set High speed internal clock prescaler */
    //CLK_SYSCLKConfig
    CLK_SYSCLKConfig(CLK_PRESCALER_HSIDIV1);
}

void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
{
    if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
    {
        if (NewState != DISABLE)
        {
            /* Enable the peripheral Clock */
            CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
        }
        else
        {
            /* Disable the peripheral Clock */
            CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
        }
    }
    else
    {
        if (NewState != DISABLE)
        {
            /* Enable the peripheral Clock */
            CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
        }
        else
        {
            /* Disable the peripheral Clock */
            CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
        }
    }
}

void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
{
    if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
    {
        CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
        CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
    }
    else /* Bit7 = 1 means CPU divider */
    {
        CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
        CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
    }
}

uint32_t CLK_GetClockFreq(void)
{

    uint32_t clockfrequency = 0;
    CLK_Source_TypeDef clocksource = CLK_SOURCE_HSI;
    uint8_t tmp = 0, presc = 0;
    /* Get CLK source. */
    clocksource = (CLK_Source_TypeDef)CLK->CMSR;
    if (clocksource == CLK_SOURCE_HSI)
    {
        tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
        tmp = (uint8_t)(tmp >> 3);
        presc = HSIDivFactor[tmp];
        clockfrequency = HSI_VALUE / presc;
    }
    else if ( clocksource == CLK_SOURCE_LSI)
    {
        clockfrequency = LSI_VALUE;
    }
    else
    {
        clockfrequency = HSE_VALUE;
    }
    return((uint32_t)clockfrequency);
}