#include <stdio.h>
#include "timerTick.h"
#include "key.h"
#include "debug.h"
#include "system.h"
#include "rom.h"
#include "ledss.h"

SYS_STRUCT sys;

void system_init(void)
{
	sys.mode = SYS_NOMAL;
	TIMER_InitTime(&sys.tick);
}

uint8_t system_checkID(uint32_t idGet)
{
	uint8_t id;
	for(id = 0; id < MAX_KEY_ID_LEN; id++)
	{
		if(idGet == sysCfg.id[id])
			return 1;
	}
	return 0;
}

void system_manager(void)
{
	uint8_t keyGet;
	if(!TIMER_CheckTimeMS(&sys.tick, 100)){
		switch(sys.mode)
		{
			case SYS_NOMAL:
				keyGet = tp_get(TP_SET);
				if(keyGet == TP_PRESS)
				{
					if(++sys.keyPressTime > 30)
					{
						sys.mode = SYS_SET_ID;
						sys.setTimeOut = 600;
						sys.keyPressTime = 0;
						sys.keyReleaseTime = 100;
						sys.idKeyGet = 0;
						led_change(LED_ON, 0);
						info("\r\nSet key id.....");
					}
				}
				if(sys.idKeyGet != 0)
  				{
  					sys.idKeyGet = 0;
  					led_change(LED_FLASH, 10);
  				}
				break;
			case SYS_SET_ID:
				if((sysCfg.idLen != 0)&&(led_getstatus() != LED_FLASH))
					led_change(LED_ON, 0);
				if(sys.keyReleaseTime != 0)
				{
					sys.keyReleaseTime--;
					sys.keyPressTime = 0;
				}
				keyGet = tp_get(TP_SET);
				if((keyGet == TP_PRESS)&&(sys.keyReleaseTime == 0))
				{
					if(++sys.keyPressTime > 10)
					{
						for(sysCfg.idLen = 0; sysCfg.idLen < MAX_KEY_ID_LEN; sysCfg.idLen++)
							sysCfg.id[sysCfg.idLen] = 0;
						sysCfg.idLen = 0;
						sys_WriteCfg();
						led_change(LED_OFF, 0);
						info("\r\nClear all key.....");
					}
				}
				if(sys.setTimeOut != 0)
				{
					sys.setTimeOut--;
  					if(sys.idKeyGet != 0)
  					{
  						sys.setTimeOut = 600;
  						if(system_checkID(sys.idKeyGet) == 0)
  						{
  							info("\r\nSave key.....");
  							sysCfg.id[sysCfg.idLen] = sys.idKeyGet;
  							if(++sysCfg.idLen >= MAX_KEY_ID_LEN)sysCfg.idLen = 0;
  							sys_WriteCfg();
  							led_change(LED_FLASH, 10);
  						}
  						sys.idKeyGet = 0;
  					}
				}
				else
				{
					sys.keyPressTime = 0;
					sys.mode = SYS_NOMAL;
					led_change(LED_OFF, 0);
				}
				break;
		}
	}
}