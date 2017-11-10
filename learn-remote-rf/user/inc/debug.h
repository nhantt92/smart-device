#ifndef __DEBUG_H
#define __DEBUG_H

#include "stm8s.h"
#include "stm8s_conf.h"
#include "timerTick.h"

void debug_Init(void);
void info(const uint8_t* str);
void debugInfoDec(const uint8_t* str, uint16_t *data, uint8_t len);
void debugInfo(const uint8_t* str, uint8_t *data, uint8_t len);
#endif

