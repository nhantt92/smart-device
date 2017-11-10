
/* Includes ------------------------------------------------------------------*/
#include "stm8s_uart1.h"

void UART1_DeInit(void)
{
  /* Clear the Idle Line Detected bit in the status register by a read
  to the UART1_SR register followed by a Read to the UART1_DR register */
  (void)UART1->SR;
  (void)UART1->DR;
  
  UART1->BRR2 = UART1_BRR2_RESET_VALUE;  /* Set UART1_BRR2 to reset value 0x00 */
  UART1->BRR1 = UART1_BRR1_RESET_VALUE;  /* Set UART1_BRR1 to reset value 0x00 */
  
  UART1->CR1 = UART1_CR1_RESET_VALUE;  /* Set UART1_CR1 to reset value 0x00 */
  UART1->CR2 = UART1_CR2_RESET_VALUE;  /* Set UART1_CR2 to reset value 0x00 */
  UART1->CR3 = UART1_CR3_RESET_VALUE;  /* Set UART1_CR3 to reset value 0x00 */
  UART1->CR4 = UART1_CR4_RESET_VALUE;  /* Set UART1_CR4 to reset value 0x00 */
  UART1->CR5 = UART1_CR5_RESET_VALUE;  /* Set UART1_CR5 to reset value 0x00 */
  
  UART1->GTR = UART1_GTR_RESET_VALUE;
  UART1->PSCR = UART1_PSCR_RESET_VALUE;
}

void UART1_Init(uint32_t BaudRate, UART1_WordLength_TypeDef WordLength, 
                UART1_StopBits_TypeDef StopBits, UART1_Parity_TypeDef Parity, 
                UART1_SyncMode_TypeDef SyncMode, UART1_Mode_TypeDef Mode)
{
  uint32_t BaudRate_Mantissa = 0, BaudRate_Mantissa100 = 0;
  
  /* Clear the word length bit */
  UART1->CR1 &= (uint8_t)(~UART1_CR1_M);  
  
  /* Set the word length bit according to UART1_WordLength value */
  UART1->CR1 |= (uint8_t)WordLength;
  
  /* Clear the STOP bits */
  UART1->CR3 &= (uint8_t)(~UART1_CR3_STOP);  
  /* Set the STOP bits number according to UART1_StopBits value  */
  UART1->CR3 |= (uint8_t)StopBits;  
  
  /* Clear the Parity Control bit */
  UART1->CR1 &= (uint8_t)(~(UART1_CR1_PCEN | UART1_CR1_PS  ));  
  /* Set the Parity Control bit to UART1_Parity value */
  UART1->CR1 |= (uint8_t)Parity;  
  
  /* Clear the LSB mantissa of UART1DIV  */
  UART1->BRR1 &= (uint8_t)(~UART1_BRR1_DIVM);  
  /* Clear the MSB mantissa of UART1DIV  */
  UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVM);  
  /* Clear the Fraction bits of UART1DIV */
  UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVF);  
  
  /* Set the UART1 BaudRates in BRR1 and BRR2 registers according to UART1_BaudRate value */
  BaudRate_Mantissa    = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
  BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
  /* Set the fraction of UART1DIV  */
  UART1->BRR2 |= (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100)) << 4) / 100) & (uint8_t)0x0F); 
  /* Set the MSB mantissa of UART1DIV  */
  UART1->BRR2 |= (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0); 
  /* Set the LSB mantissa of UART1DIV  */
  UART1->BRR1 |= (uint8_t)BaudRate_Mantissa;           
  
  /* Disable the Transmitter and Receiver before setting the LBCL, CPOL and CPHA bits */
  UART1->CR2 &= (uint8_t)~(UART1_CR2_TEN | UART1_CR2_REN); 
  /* Clear the Clock Polarity, lock Phase, Last Bit Clock pulse */
  UART1->CR3 &= (uint8_t)~(UART1_CR3_CPOL | UART1_CR3_CPHA | UART1_CR3_LBCL); 
  /* Set the Clock Polarity, lock Phase, Last Bit Clock pulse */
  UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & (uint8_t)(UART1_CR3_CPOL | 
                                                        UART1_CR3_CPHA | UART1_CR3_LBCL));  
  
  if ((uint8_t)(Mode & UART1_MODE_TX_ENABLE))
  {
    /* Set the Transmitter Enable bit */
    UART1->CR2 |= (uint8_t)UART1_CR2_TEN;  
  }
  else
  {
    /* Clear the Transmitter Disable bit */
    UART1->CR2 &= (uint8_t)(~UART1_CR2_TEN);  
  }
  if ((uint8_t)(Mode & UART1_MODE_RX_ENABLE))
  {
    /* Set the Receiver Enable bit */
    UART1->CR2 |= (uint8_t)UART1_CR2_REN;  
  }
  else
  {
    /* Clear the Receiver Disable bit */
    UART1->CR2 &= (uint8_t)(~UART1_CR2_REN);  
  }
  /* Set the Clock Enable bit, lock Polarity, lock Phase and Last Bit Clock 
  pulse bits according to UART1_Mode value */
  if ((uint8_t)(SyncMode & UART1_SYNCMODE_CLOCK_DISABLE))
  {
    /* Clear the Clock Enable bit */
    UART1->CR3 &= (uint8_t)(~UART1_CR3_CKEN); 
  }
  else
  {
    UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & UART1_CR3_CKEN);
  }
}

void UART1_Cmd(FunctionalState NewState)
{
  if (NewState != DISABLE)
  {
    /* UART1 Enable */
    UART1->CR1 &= (uint8_t)(~UART1_CR1_UARTD); 
  }
  else
  {
    /* UART Disable */
    UART1->CR1 |= UART1_CR1_UARTD;  
  }
}

void UART1_ITConfig(UART1_IT_TypeDef UART1_IT, FunctionalState NewState)
{
  uint8_t uartreg = 0, itpos = 0x00;
  
  /* Get the UART1 register index */
  uartreg = (uint8_t)((uint16_t)UART1_IT >> 0x08);
  /* Get the UART1 IT index */
  itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
  
  if (NewState != DISABLE)
  {
    /**< Enable the Interrupt bits according to UART1_IT mask */
    if (uartreg == 0x01)
    {
      UART1->CR1 |= itpos;
    }
    else if (uartreg == 0x02)
    {
      UART1->CR2 |= itpos;
    }
    else
    {
      UART1->CR4 |= itpos;
    }
  }
  else
  {
    /**< Disable the interrupt bits according to UART1_IT mask */
    if (uartreg == 0x01)
    {
      UART1->CR1 &= (uint8_t)(~itpos);
    }
    else if (uartreg == 0x02)
    {
      UART1->CR2 &= (uint8_t)(~itpos);
    }
    else
    {
      UART1->CR4 &= (uint8_t)(~itpos);
    }
  }
  
}

uint8_t UART1_ReceiveData8(void)
{
  return ((uint8_t)UART1->DR);
}

void UART1_SendData8(uint8_t Data)
{
  /* Transmit Data */
  UART1->DR = Data;
}

FlagStatus UART1_GetFlagStatus(UART1_Flag_TypeDef UART1_FLAG)
{
  FlagStatus status = RESET;
  /* Check the status of the specified UART1 flag*/
  if (UART1_FLAG == UART1_FLAG_LBDF)
  {
    if ((UART1->CR4 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
    {
      /* UART1_FLAG is set*/
      status = SET;
    }
    else
    {
      /* UART1_FLAG is reset*/
      status = RESET;
    }
  }
  else if (UART1_FLAG == UART1_FLAG_SBK)
  {
    if ((UART1->CR2 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
    {
      /* UART1_FLAG is set*/
      status = SET;
    }
    else
    {
      /* UART1_FLAG is reset*/
      status = RESET;
    }
  }
  else
  {
    if ((UART1->SR & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
    {
      /* UART1_FLAG is set*/
      status = SET;
    }
    else
    {
      /* UART1_FLAG is reset*/
      status = RESET;
    }
  }
  /* Return the UART1_FLAG status*/
  return status;
}

void UART1_ClearFlag(UART1_Flag_TypeDef UART1_FLAG)
{
  /* Clear the Receive Register Not Empty flag */
  if (UART1_FLAG == UART1_FLAG_RXNE)
  {
    UART1->SR = (uint8_t)~(UART1_SR_RXNE);
  }
  /* Clear the LIN Break Detection flag */
  else
  {
    UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
  }
}

ITStatus UART1_GetITStatus(UART1_IT_TypeDef UART1_IT)
{
  ITStatus pendingbitstatus = RESET;
  uint8_t itpos = 0;
  uint8_t itmask1 = 0;
  uint8_t itmask2 = 0;
  uint8_t enablestatus = 0;
  
  /* Get the UART1 IT index */
  itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
  /* Get the UART1 IT index */
  itmask1 = (uint8_t)((uint8_t)UART1_IT >> (uint8_t)4);
  /* Set the IT mask*/
  itmask2 = (uint8_t)((uint8_t)1 << itmask1);
  
  /* Check the status of the specified UART1 pending bit*/
  if (UART1_IT == UART1_IT_PE)
  {
    /* Get the UART1_IT enable bit status*/
    enablestatus = (uint8_t)((uint8_t)UART1->CR1 & itmask2);
    /* Check the status of the specified UART1 interrupt*/
    
    if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
    {
      /* Interrupt occurred*/
      pendingbitstatus = SET;
    }
    else
    {
      /* Interrupt not occurred*/
      pendingbitstatus = RESET;
    }
  }
  
  else if (UART1_IT == UART1_IT_LBDF)
  {
    /* Get the UART1_IT enable bit status*/
    enablestatus = (uint8_t)((uint8_t)UART1->CR4 & itmask2);
    /* Check the status of the specified UART1 interrupt*/
    if (((UART1->CR4 & itpos) != (uint8_t)0x00) && enablestatus)
    {
      /* Interrupt occurred*/
      pendingbitstatus = SET;
    }
    else
    {
      /* Interrupt not occurred*/
      pendingbitstatus = RESET;
    }
  }
  else
  {
    /* Get the UART1_IT enable bit status*/
    enablestatus = (uint8_t)((uint8_t)UART1->CR2 & itmask2);
    /* Check the status of the specified UART1 interrupt*/
    if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
    {
      /* Interrupt occurred*/
      pendingbitstatus = SET;
    }
    else
    {
      /* Interrupt not occurred*/
      pendingbitstatus = RESET;
    }
  }
  
  /* Return the UART1_IT status*/
  return  pendingbitstatus;
}

void UART1_ClearITPendingBit(UART1_IT_TypeDef UART1_IT)
{
  /* Clear the Receive Register Not Empty pending bit */
  if (UART1_IT == UART1_IT_RXNE)
  {
    UART1->SR = (uint8_t)~(UART1_SR_RXNE);
  }
  /* Clear the LIN Break Detection pending bit */
  else
  {
    UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
  }
}

