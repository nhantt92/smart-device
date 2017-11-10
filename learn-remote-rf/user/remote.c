#include "remote.h"
#include "debug.h"
#include "stm8s_tim1.h"
#include "rom.h"
#include "main.h"
#include "system.h"
#include "stm8s_gpio.h"


#define   MIN_SYN_BIT_TIME_US   5500      /* Syn bit time in µs */
#define   MAX_SYN_BIT_TIME_US   12000      /* Syn bit time in µs */
#define   MIN_LSB_BIT_TIME_US   300       /* Minimum half bit time in µs */
#define   MAX_LSB_BIT_TIME_US   500       /* Maximum half bit time in µs */
#define   MIN_MSB_BIT_TIME_US   700       /* Minimum half bit time in µs */
#define   MAX_MSB_BIT_TIME_US   1200       /* Maximum half bit time in µs */

#define   MAX_BIT_READ          25
#define   BIT_READ              24

REMOTE_STR remote;
void TIM1_EnIn(void)
{
  TIM1_ClearFlag(TIM1_FLAG_UPDATE); 
  TIM1_ITConfig(TIM1_IT_UPDATE, ENABLE);
  TIM1_SetCounter(0);
}

void TIM1_DisIn(void)
{
  TIM1_ClearFlag(TIM1_FLAG_UPDATE); 
  TIM1_ITConfig(TIM1_IT_UPDATE, DISABLE); 
}

void TIM1_Config(void)
{
  CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1 , ENABLE); 
  /* TIM1 Peripheral Configuration */ 
  TIM1_DeInit();
  TIM1_TimeBaseInit(15, TIM1_COUNTERMODE_UP, 65535, 0);
  TIM1_SetCounter(0);
  /* TIM1 counter enable */
  TIM1_Cmd(ENABLE);
}

void GPIO_Configuration(void)
{
  GPIO_Init(GPIOD, GPIO_PIN_3, GPIO_MODE_IN_FL_IT);
  /* Initialize the Interrupt sensitivity */
  EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOD, EXTI_SENSITIVITY_RISE_FALL);
}

void remote_Init(void)
{
  remote_Clear();
  remote.command = 0;
  TIM1_Config();
  GPIO_Configuration();
}

uint32_t remote_CheckCompare(uint32_t dat, uint32_t *buf, uint8_t offset, uint8_t len)
{
  uint8_t add;
  uint8_t compareCnt = 0;
  for(add = 0;add < len;add++)
  {
    if(add == offset)
      add++;
    if(dat == buf[add])
      return dat;
  }
  return 0;
}

void remote_Decode(void)
{
  uint32_t RC_dataIndex = 0;
  uint8_t add;
  for(add = 1;add < (BIT_READ*2)+1;add+=2)
  {
    if((remote.buff[add] >= MIN_LSB_BIT_TIME_US)&&(remote.buff[add] < MAX_LSB_BIT_TIME_US)&&(remote.buff[add+1] >= MIN_MSB_BIT_TIME_US)&&(remote.buff[add+1] < MAX_MSB_BIT_TIME_US))
      RC_dataIndex |= 0;
    else if((remote.buff[add] >= MIN_MSB_BIT_TIME_US)&&(remote.buff[add] < MAX_MSB_BIT_TIME_US)&&(remote.buff[add+1] >= MIN_LSB_BIT_TIME_US)&&(remote.buff[add+1] < MAX_LSB_BIT_TIME_US))
      RC_dataIndex |= 1;
    else
      return;
    RC_dataIndex <<= 1;
  }
  remote.cmdBuff[remote.cntCmd] = RC_dataIndex;
  if(remote.cntCmd < (MAX_BUFF_CMD-1))
    remote.cntCmd++;
  else
    remote.flag = 1;
}

void remote_Clear(void)
{
  remote.startBit = 0;
  remote.cnt = 0;
  remote.cntCmd = 0;
  remote.flag = 0;
  remote.lastCmd = 0;
  remote.compareCnt = 0;
}

void remote_Process(void)
{
  uint16_t dat;
	TIM1_DisIn();
  dat = TIM1_GetCounter();
  if((dat >= MIN_SYN_BIT_TIME_US)&&(dat < MAX_SYN_BIT_TIME_US))
  {
    if(remote.startBit == 0)
    {
      remote.startBit = 1;
      remote.cnt = 0;
    }
  }
  if(remote.startBit == 1)
  {
    remote.buff[remote.cnt] = dat;
    if(++remote.cnt > (MAX_BIT_READ*2))
    {
      remote.startBit = 0;
      remote.cnt = 0;
      remote_Decode();
    }
  }
	TIM1_EnIn();
}

uint8_t ctrFlag = 0;
uint8_t ctrCnt = 0;
void remote_Manager(void)
{
  uint8_t add;
  uint8_t cm[4];
  uint8_t checkCmd;
	if(TIMER_CheckTimeMS(&remote.time, 100) == 0)
  {
    //info("Test \r\n");
    if(ctrCnt != 0)ctrCnt--;
    // else{
    //   //debugInfo("TurnOff", 0, 0);
    //   GPIO_WriteLow(CTR_GPIO, CTR_PIN);
    // }
    if(remote.flag == 1)
    {
      disableInterrupts();
      remote.compareCnt = 0;
      for(add = 0;add < MAX_BUFF_CMD;add++)
      {
        cm[0] = (remote.cmdBuff[add]&0xFF000000)>>24;
        cm[1] = (remote.cmdBuff[add]&0x00FF0000)>>16;
        cm[2] = (remote.cmdBuff[add]&0x0000FF00)>>8;
        cm[3] = (remote.cmdBuff[add]&0x000000FF)>>0;
        debugInfo("Data decoder: ", cm, 4);
        if(remote.cmdBuff[add] != 0)
        {
          if(remote_CheckCompare(remote.cmdBuff[add], remote.cmdBuff, add, MAX_BUFF_CMD))
          {
            remote.lastCmd = remote.cmdBuff[add];
            remote.compareCnt++;
            if(remote.compareCnt >= (MAX_BUFF_CMD - 2))
            {
              remote.compareCnt = 0;
              remote.command = remote.lastCmd;
              remote.lastCmd = 0;
              sys.idKeyGet = remote.command;
              info("Key press \r\n");
              // cm[0] = (remote.command&0xFF000000)>>24;
              // cm[1] = (remote.command&0x00FF0000)>>16;
              // cm[2] = (remote.command&0x0000FF00)>>8;
              // cm[3] = (remote.command&0x000000FF)>>0;
              //debugInfo("Data decoder: ", cm, 4);
              checkCmd = system_checkID(remote.command);
              if((checkCmd == 1)&&(ctrCnt == 0))
              {
                  GPIO_WriteReverse(CTR_GPIO, CTR_PIN);
                  info("TurnOn A \r\n");
                ctrCnt = 20;
                remote.command = 0;
              }
            }
          }
        }
      }
      remote_Clear();
      enableInterrupts();
    }
	}
}



