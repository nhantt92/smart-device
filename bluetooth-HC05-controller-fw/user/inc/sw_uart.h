/* Header for Virtual COM          
	Note: VCOM parameters = 9600,1,8,1,NO
*/

#ifndef _SW_UART_H_
#define _SW_UART_H_

#include <string.h>
#include <stdio.h>
#include "stm8s.h"

#define vTxGPIO        	GPIOD        // port used for virtual COM for debug 
#define vTxPIN			   	GPIO_PIN_5	
#define vTx_H()					GPIO_WriteHigh(vTxGPIO, vTxPIN)
#define vTx_L()					GPIO_WriteLow(vTxGPIO, vTxPIN)
 
#define VCOMSTR_MAXLEN 30

extern char vcomstr[VCOMSTR_MAXLEN];

// function to write a string to Vcom
void VCOM_Init(void);
void VCOM_puts(char *str);
void VCOM_TestSpeed(void);
#define VCOM_sprintf   sprintf

#endif