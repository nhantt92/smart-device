/**
*******************************************
* @file     stm8s_adc1.c
* @author   nhantt
* @version  V1.0.0
* @date     21-March-2017
* @brief    This file brief for save memory used build with SDCC
*********************************************
*/
/* Includes ------------------------------------------------------------------*/
#include "stm8s_spi.h"

void SPI_DeInit(void)
{
    SPI->CR1    = SPI_CR1_RESET_VALUE;
    SPI->CR2    = SPI_CR2_RESET_VALUE;
    SPI->ICR    = SPI_ICR_RESET_VALUE;
    SPI->SR     = SPI_SR_RESET_VALUE;
    SPI->CRCPR  = SPI_CRCPR_RESET_VALUE;
}

void SPI_Init(SPI_FirstBit_TypeDef FirstBit, SPI_BaudRatePrescaler_TypeDef BaudRatePrescaler, SPI_Mode_TypeDef Mode, SPI_ClockPolarity_TypeDef ClockPolarity, SPI_ClockPhase_TypeDef ClockPhase, SPI_DataDirection_TypeDef Data_Direction, SPI_NSS_TypeDef Slave_Management, uint8_t CRCPolynomial)
{
    /* Frame Format, BaudRate, Clock Polarity and Phase configuration */
    SPI->CR1 = (uint8_t)((uint8_t)((uint8_t)FirstBit | BaudRatePrescaler) |
                    (uint8_t)((uint8_t)ClockPolarity | ClockPhase));

    /* Data direction configuration: BDM, BDOE and RXONLY bits */
    SPI->CR2 = (uint8_t)((uint8_t)(Data_Direction) | (uint8_t)(Slave_Management));

    if (Mode == SPI_MODE_MASTER)
    {
        SPI->CR2 |= (uint8_t)SPI_CR2_SSI;
    }
    else
    {
        SPI->CR2 &= (uint8_t)~(SPI_CR2_SSI);
    }

    /* Master/Slave mode configuration */
    SPI->CR1 |= (uint8_t)(Mode);

    /* CRC configuration */
    SPI->CRCPR = (uint8_t)CRCPolynomial;
}

void SPI_Cmd(FunctionalState NewState)
{

    if (NewState != DISABLE)
    {
        SPI->CR1 |= SPI_CR1_SPE; /* Enable the SPI peripheral*/
    }
    else
    {
        SPI->CR1 &= (uint8_t)(~SPI_CR1_SPE); /* Disable the SPI peripheral*/
    }
}

void SPI_ITConfig(SPI_IT_TypeDef SPI_IT, FunctionalState NewState)
{
    uint8_t itpos = 0;

    /* Get the SPI IT index */
    itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)SPI_IT & (uint8_t)0x0F));

    if (NewState != DISABLE)
    {
        SPI->ICR |= itpos; /* Enable interrupt*/
    }
    else
    {
        SPI->ICR &= (uint8_t)(~itpos); /* Disable interrupt*/
    }
}

void SPI_SendData(uint8_t Data)
{
    SPI->DR = Data; 
}

uint8_t SPI_ReceiveData(void)
{
    return ((uint8_t)SPI->DR); 
}

void SPI_NSSInternalSoftwareCmd(FunctionalState NewState)
{
    if (NewState != DISABLE)
    {
        SPI->CR2 |= SPI_CR2_SSI; /* Set NSS pin internally by software*/
    }
    else
    {
        SPI->CR2 &= (uint8_t)(~SPI_CR2_SSI); /* Reset NSS pin internally by software*/
    }
}

void SPI_TransmitCRC(void)
{
    SPI->CR2 |= SPI_CR2_CRCNEXT; /* Enable the CRC transmission*/
}

void SPI_CalculateCRCCmd(FunctionalState NewState)
{

    if (NewState != DISABLE)
    {
        SPI->CR2 |= SPI_CR2_CRCEN; /* Enable the CRC calculation*/
    }
    else
    {
        SPI->CR2 &= (uint8_t)(~SPI_CR2_CRCEN); /* Disable the CRC calculation*/
    }
}

uint8_t SPI_GetCRC(SPI_CRC_TypeDef SPI_CRC)
{
    uint8_t crcreg = 0;


    if (SPI_CRC != SPI_CRC_RX)
    {
        crcreg = SPI->TXCRCR;  /* Get the Tx CRC register*/
    }
    else
    {
        crcreg = SPI->RXCRCR; /* Get the Rx CRC register*/
    }

    /* Return the selected CRC register status*/
    return crcreg;
}

void SPI_ResetCRC(void)
{
    /* Rx CRCR & Tx CRCR registers are reset when CRCEN (hardware calculation)
       bit in SPI_CR2 is written to 1 (enable) */
    SPI_CalculateCRCCmd(ENABLE);

    /* Previous function disable the SPI */
    SPI_Cmd(ENABLE);
}

/**
  * @brief  Returns the CRC Polynomial register value.
  * @param  None
  * @retval The CRC Polynomial register value.
  */
uint8_t SPI_GetCRCPolynomial(void)
{
    return SPI->CRCPR; /* Return the CRC polynomial register */
}

/**
  * @brief  Selects the data transfer direction in bi-directional mode.
  * @param  SPI_Direction Specifies the data transfer direction in bi-directional mode.
  * @retval None
  */
void SPI_BiDirectionalLineConfig(SPI_Direction_TypeDef SPI_Direction)
{

    if (SPI_Direction != SPI_DIRECTION_RX)
    {
        SPI->CR2 |= SPI_CR2_BDOE; /* Set the Tx only mode*/
    }
    else
    {
        SPI->CR2 &= (uint8_t)(~SPI_CR2_BDOE); /* Set the Rx only mode*/
    }
}


FlagStatus SPI_GetFlagStatus(SPI_Flag_TypeDef SPI_FLAG)
{
    FlagStatus status = RESET;
    /* Check the status of the specified SPI flag */
    if ((SPI->SR & (uint8_t)SPI_FLAG) != (uint8_t)RESET)
    {
        status = SET; /* SPI_FLAG is set */
    }
    else
    {
        status = RESET; /* SPI_FLAG is reset*/
    }

    /* Return the SPI_FLAG status */
    return status;
}

void SPI_ClearFlag(SPI_Flag_TypeDef SPI_FLAG)
{
    SPI->SR = (uint8_t)(~SPI_FLAG);
}

ITStatus SPI_GetITStatus(SPI_IT_TypeDef SPI_IT)
{
    ITStatus pendingbitstatus = RESET;
    uint8_t itpos = 0;
    uint8_t itmask1 = 0;
    uint8_t itmask2 = 0;
    uint8_t enablestatus = 0;
    /* Get the SPI IT index */
    itpos = (uint8_t)((uint8_t)1 << ((uint8_t)SPI_IT & (uint8_t)0x0F));

    /* Get the SPI IT mask */
    itmask1 = (uint8_t)((uint8_t)SPI_IT >> (uint8_t)4);
    /* Set the IT mask */
    itmask2 = (uint8_t)((uint8_t)1 << itmask1);
    /* Get the SPI_ITPENDINGBIT enable bit status */
    enablestatus = (uint8_t)((uint8_t)SPI->SR & itmask2);
    /* Check the status of the specified SPI interrupt */
    if (((SPI->ICR & itpos) != RESET) && enablestatus)
    {
        /* SPI_ITPENDINGBIT is set */
        pendingbitstatus = SET;
    }
    else
    {
        /* SPI_ITPENDINGBIT is reset */
        pendingbitstatus = RESET;
    }
    /* Return the SPI_ITPENDINGBIT status */
    return  pendingbitstatus;
}

void SPI_ClearITPendingBit(SPI_IT_TypeDef SPI_IT)
{
    uint8_t itpos = 0;

    /* Clear  SPI_IT_CRCERR or SPI_IT_WKUP interrupt pending bits */

    /* Get the SPI pending bit index */
    itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)(SPI_IT & (uint8_t)0xF0) >> 4));
    /* Clear the pending bit */
    SPI->SR = (uint8_t)(~itpos);

}
