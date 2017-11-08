/* Virtual COMPORT

*/
#include "sw_uart.h" 
                                 
//int DELAYTIME = 180;                 // for 9600bps 
//int DELAYTIME = 88;                  // for 19200bps 
int DELAYTIME = 230;                  // for 38400bps 
//int DELAYTIME = 26;                  // for 57600bps
//int DELAYTIME = 10;                  // for 115200bps

char vcomstr[VCOMSTR_MAXLEN];

// delay CPU for UART timing
void Vcomdelay(int dtime)
{  
	int i; 
  for ( ; dtime >= 0; dtime--);
}   

void VCOM_Init(void)
{
	GPIO_Init(vTxGPIO, vTxPIN, GPIO_MODE_OUT_PP_HIGH_FAST);
	vTx_H();
}

// write a string to virtual COM, maximum length of string is 256
void VCOM_puts(char *str)
{
	char c;
	int maxlen=255, i;
	disableInterrupts();
	while ((c=*str) && maxlen--)
	{       
		vTx_L();                                              // start bit
		Vcomdelay(DELAYTIME);          
		if (c&0x01) vTx_H(); else vTx_L();   Vcomdelay(DELAYTIME); 
		if (c&0x02) vTx_H(); else vTx_L();   Vcomdelay(DELAYTIME);
		if (c&0x04) vTx_H(); else vTx_L();   Vcomdelay(DELAYTIME);
		if (c&0x08) vTx_H(); else vTx_L();   Vcomdelay(DELAYTIME);
		if (c&0x10) vTx_H(); else vTx_L();   Vcomdelay(DELAYTIME);
		if (c&0x20) vTx_H(); else vTx_L();   Vcomdelay(DELAYTIME);
		if (c&0x40) vTx_H(); else vTx_L();   Vcomdelay(DELAYTIME);
		if (c&0x80) vTx_H(); else vTx_L();   Vcomdelay(DELAYTIME);
		vTx_H();                                             // stop bit    (1.5bit for sure)
		Vcomdelay(DELAYTIME<<1);             
		str++;
	}
	enableInterrupts();
}                                     

void delaytest(uint32_t x)
{
	uint32_t i;
	while(x--)
	{
		for(;i<3000;i++);
	}
}

void VCOM_TestSpeed(void)
{   
	int i;  
	while(1)
	{
		for(i=250;i>=1;i--)
		{  
			DELAYTIME = i;  
			vTx_H();
			delaytest(10000); 
			VCOM_sprintf(vcomstr,"VCOM at %d TESTING SPEED\r\n",i);
			VCOM_puts(vcomstr); 
			vTx_L(); 
			//delaytest(10000);  
		}       
	}
}

