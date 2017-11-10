#ifndef _SYS_H_
#define _SYS_H_
 
#include "stm8s.h"
#include "timerTick.h"

typedef enum {
	SYS_NOMAL = 0,
	SYS_SET_ID,
}SYS_MODE;

typedef struct {
	SYS_MODE    mode;
	uint32_t  	idKeyGet;
	TIME 		tick;
	uint32_t    setTimeOut;
	uint8_t     keyPressTime;
	uint8_t     keyReleaseTime;
}SYS_STRUCT;

extern SYS_STRUCT sys;

void system_init(void);
uint8_t system_checkID(uint32_t idGet);
void system_manager(void);
#endif
