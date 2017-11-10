#ifndef __ROM_H
#define __ROM_H

#include "stm8s.h"

#define CFG_HOLDER              0x44
#define CFG_ADDRESS_START       FLASH_DATA_START_PHYSICAL_ADDRESS
#define CFG_LEN                 24
#define DEFAULT_ID_1			0x014392C6
#define DEFAULT_ID_2			0x0160B7C6

#define MAX_KEY_ID_LEN			5

typedef struct{
  uint16_t  holder;
  uint16_t  idLen;
  uint32_t  id[MAX_KEY_ID_LEN];
}SYSCFG;

extern SYSCFG sysCfg;
void sys_WriteCfg(void);
void sys_readCfg(void);
#endif