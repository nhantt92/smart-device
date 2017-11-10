#ifndef __REMOTE_H
#define __REMOTE_H

#include "stm8s.h"
#include "timerTick.h"
#include "stm8s_gpio.h"

#define CTR_GPIO       									GPIOD
#define CTR_PIN      	 								GPIO_PIN_2

#define MAX_BUFF				60
#define MAX_BUFF_CMD			5

typedef struct
{
	uint8_t startBit;
	uint8_t cnt;
	uint8_t flag;
	uint16_t buff[MAX_BUFF];
	uint8_t cntCmd;
	uint32_t cmdBuff[MAX_BUFF_CMD];
	uint32_t lastCmd;
  	uint8_t compareCnt;
	uint32_t command;
	TIME time;
}REMOTE_STR;

void remote_Init(void);
void remote_Clear(void);
uint32_t remote_CheckCompare(uint32_t dat, uint32_t *buf, uint8_t offset, uint8_t len);
void remote_Process(void);
void remote_Manager(void);
#endif
