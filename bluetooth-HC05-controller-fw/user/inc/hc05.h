#ifndef __HC05_H
#define __HC05_H
#include "stm8s.h"
#include "stm8s_uart1.h"
#define RX_BUFF_SIZE 			100
#define TX_BUFF_SIZE 			100

#define HC05_RX_BUFFER_LENGTH 40
#define HC05_TIMEOUT_MAX 94000

typedef enum{
	READ_FROM_SERIAL = 0,
	SEND_TO_SERIAL = 1,
	SEND_WAIT = 2,
    WAIT = 3
}RS485_STATUS;

typedef struct{
    uint16_t txLen;
	uint16_t rxLen;
    uint16_t rxGetLen;
	uint8_t txBuff[TX_BUFF_SIZE];
	uint8_t rxBuff[RX_BUFF_SIZE];
    uint8_t rxGetBuff[RX_BUFF_SIZE];
	RS485_STATUS serialStatus;
    uint8_t readTick;
    uint8_t Flag;
}HC05;

void HC05_Init(uint32_t baudrate);
void HC05_Read(void);
//void SERIAL_ReadBuff(uint8_t *buff, uint16_t len, uint8_t tmout);
void HC05_PutChar(uint8_t c);
void HC05_PutStr(char *str);
void HC05_ClearRxBuffer(void);
uint8_t HC05_Test(void);
uint8_t HC05_SetBaud(uint32_t speed);
uint8_t HC05_SetName(char *name);
uint8_t HC05_SetPin(uint8_t *pin);


#endif