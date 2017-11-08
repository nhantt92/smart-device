#include "hc05.h"
#include "timerTick.h"
#include "ringbuf.h"
#include <string.h> 
#include <stdio.h> 


static void HC05_Delay(uint32_t delay);
// HC05 hc05;
// RINGBUF serialRingBuf;
// TIME serialTime;

char HC05_rx_buffer[HC05_RX_BUFFER_LENGTH];
uint8_t HC05_rx_counter = 0; 
char HC05_msg[HC05_RX_BUFFER_LENGTH];
uint8_t new_HC05_msg = 0; 
 
void HC05_Init(uint32_t baudrate)
{
  /* Set PD5 as Output open-drain high-impedance level (UART1_Tx)*/
  GPIO_Init(GPIOD, GPIO_PIN_5, GPIO_MODE_OUT_OD_HIZ_FAST);
  GPIO_Init(GPIOD, GPIO_PIN_6, GPIO_MODE_IN_PU_NO_IT);
  /* Deinitializes the UART1 peripheral */
  UART1_DeInit();
  /* UART1 configuration -------------------------------------------------*/
  /* UART1 configured as follow:
                          - BaudRate = baudrate
                          - Word Length = 8 Bits
                          - One Stop Bit
                          - No parity
                          - Receive and transmit enabled
                          - UART1 Clock disabled
  */
  /* Configure the UART1 */
  UART1_Init((uint32_t)baudrate, UART1_WORDLENGTH_8D, UART1_STOPBITS_1, UART1_PARITY_NO, UART1_SYNCMODE_CLOCK_DISABLE, UART1_MODE_TXRX_ENABLE);
  
  /* Enable UART1 Receive interrupt */
  UART1_ITConfig(UART1_IT_RXNE_OR, ENABLE);
  
  /* Enable UART */
  UART1_Cmd(ENABLE);
  //ITC_SetSoftwarePriority(ITC_IRQ_UART1_RX, ITC_PRIORITYLEVEL_3);    //High level
  
  //RINGBUF_Init(&serialRingBuf, &serial.rxBuff[0], RX_BUFF_SIZE);
  // memset(hc.txBuff, 0, TX_BUFF_SIZE);
  // hc05.txLen = 0;
  // hc.rxLen = 0;
  // hc.Flag = 0;
  // hc.serialStatus = READ_FROM_SERIAL;
  // TIMER_InitTime(&serialTime);
  HC05_PutStr("\r\n");
  HC05_ClearRxBuffer();
  HC05_Delay(1000);
}

static void HC05_Delay(uint32_t delay)
{
  while(delay--);
}
  
void HC05_Read(void)
{  
  while (UART1_GetFlagStatus(UART1_FLAG_RXNE) == RESET);
  HC05_rx_buffer[HC05_rx_counter] == UART1_ReceiveData8();
  if((HC05_rx_counter+1 == HC05_RX_BUFFER_LENGTH) || (HC05_rx_buffer[HC05_rx_counter] == 0x0a))
  {
    memcpy(HC05_msg, HC05_rx_buffer, HC05_rx_counter);
    memset(HC05_rx_buffer, 0, HC05_RX_BUFFER_LENGTH);
    HC05_rx_counter = 0;
    new_HC05_msg = 1;
  }
  else
  {
    HC05_rx_counter++;
  }
}               
 
void HC05_PutChar(uint8_t c)
{
  while(UART1_GetFlagStatus(UART1_FLAG_TXE) == RESET);
  IWDG_ReloadCounter();
  UART1_SendData8(c);
}


void HC05_PutStr(uint8_t *str)
{ 
  uint16_t ad_send=0;
  uint32_t tick = 0xFFFF;
  while(str[ad_send] != 0)
  { 
    while((UART1_GetFlagStatus(UART1_FLAG_TXE) == RESET)&&(tick-- != 0));
    IWDG_ReloadCounter();
    UART1_SendData8(str[ad_send]);
    ad_send++;
  }	 
} 

void HC05_ClearRxBuffer(void)
{
  memset(HC05_rx_buffer, 0, HC05_RX_BUFFER_LENGTH);
  HC05_rx_counter = 0;
  new_HC05_msg = 0;
}

uint8_t HC05_Test(void)
{
  uint32_t timeout = HC05_TIMEOUT_MAX;
  HC05_ClearRxBuffer();
  HC05_PutStr("AT");
  while(HC05_rx_counter < 2)
  {
    timeout--;
    HC05_Delay(1000);
    if(timeout == 0) return 0x01;
  }
  if(strcmp(HC05_rx_buffer, "OK") == 0) return 0x00;
  else return 0x02;
}

uint8_t HC05_SetBaud(uint32_t speed)
{
  uint32_t timeout = HC05_TIMEOUT_MAX;
  char buf[20];
  
  HC05_ClearRxBuffer(); //clear rx buffer
  //AT command for SET BAUD speed
  if(speed == 1200)
  {
    strcpy(buf, "OK1200");
    HC05_PutStr("AT+BAUD1");                          
  }
  else if(speed == 2400)
  {
    strcpy(buf, "OK2400");
    HC05_PutStr("AT+BAUD2");                          
  }
  else if(speed == 4800)
  {
    strcpy(buf, "OK4800");
    HC05_PutStr("AT+BAUD3");                          
  }
  else if(speed == 9600)
  {
    strcpy(buf, "OK9600");
    HC05_PutStr("AT+BAUD4");                          
  }
  else if(speed == 19200)
  {
    strcpy(buf, "OK19200");
    HC05_PutStr("AT+BAUD5");                          
  }
  else if(speed == 38400)
  {
    strcpy(buf, "OK38400");
    HC05_PutStr("AT+BAUD6");                          
  }
  else if(speed == 57600)
  {
    strcpy(buf, "OK57600");
    HC05_PutStr("AT+BAUD7");                          
  }
  else if(speed == 115200)
  {
    strcpy(buf, "OK115200");
    HC05_PutStr("AT+BAUD8");                          
  }
  else if(speed == 230400)
  {
    strcpy(buf, "OK230400");
    HC05_PutStr("AT+BAUD9");                          
  }
  else
  {
    return 0x01; //error - incorrect speed
  }

  while(HC05_rx_counter < strlen(buf)) //wait for "OK" message
  {
    timeout--;
    HC05_Delay(1000); //wait +/- 100us just to give interrupt time to service incoming message
    if (timeout == 0) 
      return 0x02; //if the timeout delay is exeeded, exit with error code
  }
  if(strcmp(HC05_rx_buffer, buf) == 0)
    return 0x00; //success
  else
    return 0x03; //unknown return AT msg from HC06
}

uint8_t HC05_SetName(char *name)
{
  uint32_t timeout = HC05_TIMEOUT_MAX;
  char cmd[20];
  
  HC05_ClearRxBuffer(); //clear rx buffer
  
  if(strlen(name) > 13) //error - name more than 20 characters
    return 0x01;
  
  //sprintf(cmd, "AT+NAME%s", name);
  HC05_PutStr(cmd); //AT command for SET NAME
  
  while(HC05_rx_counter < 9) //wait for "OKsetname" message, i.e. 9 chars
  {
    timeout--;
    HC05_Delay(1000); //wait +/- 100us just to give interrupt time to service incoming message
    if (timeout == 0) 
      return 0x02; //if the timeout delay is exeeded, exit with error code
  }
  if(strcmp(HC05_rx_buffer, "OKsetname") == 0)
    return 0x00; //success
  else
    return 0x03; //unknown return AT msg from HC06
}

uint8_t HC05_SetPin(uint8_t *pin)
{
  uint32_t timeout = HC05_TIMEOUT_MAX;
  char buf[20];
  
  HC05_ClearRxBuffer(); //clear rx buffer
  
  if((strlen(pin) < 4) || (strlen(pin) > 4))
    return 0x01; //error - too few or many characetrs in pin
      
  //sprintf(buf, "AT+PIN%s", pin);
  HC05_PutStr(buf); //AT command for SET PIN
  
  while(HC05_rx_counter < 8) //wait for "OKsetpin" message, i.e. 8 chars
  {
    timeout--;
    HC05_Delay(1000); //wait +/- 100us just to give interrupt time to service incoming message
    if (timeout == 0) 
      return 0x02; //if the timeout delay is exeeded, exit with error code
  }
  if(strcmp(HC05_rx_buffer, "OKsetPIN") == 0)
    return 0x00; //success
  else
    return 0x03; //unknown return AT msg from HC06
}