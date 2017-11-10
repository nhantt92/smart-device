#include "debug.h"

void debug_Init(void)
{
  GPIO_Init(GPIOD, GPIO_PIN_5, GPIO_MODE_OUT_OD_HIZ_FAST);
  GPIO_Init(GPIOD, GPIO_PIN_6, GPIO_MODE_IN_PU_NO_IT);
  CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1 , ENABLE); 
  /* Deinitializes the UART1 and UART3 peripheral */
  UART1_DeInit();
  /* Configure the UART1 */
  UART1_Init((uint32_t)9600, UART1_WORDLENGTH_8D, UART1_STOPBITS_1, UART1_PARITY_NO,
              UART1_SYNCMODE_CLOCK_DISABLE, UART1_MODE_TXRX_ENABLE);
  /* Enable UART1 Receive interrupt */
  UART1_ITConfig(UART1_IT_RXNE_OR, ENABLE);    
  /* Enable UART */
  UART1_Cmd(ENABLE);  
}

void usart_send(uint8_t *data)
{
  uint8_t cnt = 0;
  uint16_t timeout;
  while(data[cnt])
  {
    /* Write a character to the UART1 */
    UART1_SendData8(data[cnt++]);
    /* Loop until the end of transmission */
    timeout = 0xFFF;
    while((UART1_GetFlagStatus(UART1_FLAG_TXE) == RESET)&&(timeout--))IWDG_ReloadCounter();
  }
}

void info(const uint8_t* str)
{
  usart_send((uint8_t*)str);
}

// void debugInfoDec(const uint8_t* str, uint16_t *data, uint8_t len)
// {
//   uint8_t dec[6];
//   uint8_t add;
//   uint8_t dnib, tnib, hnib, mnib, lnib;
//   uint16_t dat;
//   usart_send((uint8_t*)str);
//   for(add = 0; add < len; add++)
//   {
//     dat = data[add];
//     dnib = dat/10000;
//     tnib = (dat%10000)/1000;
//     hnib = ((dat%10000)%1000)/100;
//     mnib = (((dat%10000)%1000)%100)/10;
//     lnib = (((dat%10000)%1000)%100)%10;
//     dec[0] = dnib + '0';
//     dec[1] = tnib + '0';
//     dec[2] = hnib + '0';
//     dec[3] = mnib + '0';
//     dec[4] = lnib + '0';
//     dec[5] = 0;
//     usart_send(dec);
//     usart_send(" ");
//   }
//   usart_send("\r\n");
// }

void debugInfo(const uint8_t* str, uint8_t *data, uint8_t len)
{
  uint8_t ascii[6];
  uint8_t add;
  uint8_t hnib, lnib;
  uint8_t dat;
  usart_send((uint8_t*)str);
  for(add = 0; add < len; add++)
  {
    dat = data[add];
    hnib = dat/16;
    lnib = dat%16;
    ascii[0] = '0';
    ascii[1] = 'x';
    ascii[4] = ' ';
    ascii[5] = 0;
    if(hnib < 10)
      ascii[2] = hnib + '0';
    if(hnib >= 10)
      ascii[2] = (hnib - 10) + 'A';
    if(lnib < 10)
      ascii[3] = lnib + '0';
    if(lnib >= 10)
      ascii[3] = (lnib - 10) + 'A';
    usart_send(ascii);
  }
  usart_send("\r\n");
}
