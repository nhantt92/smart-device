#include "rom.h"
#include "debug.h"

SYSCFG sysCfg;
void sys_WriteCfg(void)
{
  uint8_t add;
  uint8_t *pSys;
  pSys = (uint8_t*)&sysCfg;
  // Unclock flash
  FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
  FLASH->DUKR = FLASH_RASS_KEY1;
  while((FLASH->IAPSR & (uint8_t)FLASH_FLAG_DUL) == RESET);
  for(add = 0; add < CFG_LEN; add++)
  {
    *(PointerAttr uint8_t*) (MemoryAddressCast)(CFG_ADDRESS_START+add) = *pSys;
    pSys++;
  }
  /* Lock memory */
  FLASH->IAPSR &= (uint8_t)FLASH_MEMTYPE_DATA;
}

void sys_readCfg(void)
{
  uint8_t add;
  uint8_t *pSys;
  uint8_t cm[4];
  pSys = (uint8_t*)&sysCfg;
  // Deinit flash
  // FLASH->CR1 = FLASH_CR1_RESET_VALUE;
  // FLASH->CR2 = FLASH_CR2_RESET_VALUE;
  // FLASH->NCR2 = FLASH_NCR2_RESET_VALUE;
  // FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_DUL);
  // FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_PUL);
  (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
  // Unclock flash
  FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
  FLASH->DUKR = FLASH_RASS_KEY1;
  while((FLASH->IAPSR & (uint8_t)FLASH_FLAG_DUL) == RESET);
  for(add = 0; add < CFG_LEN; add++)
  {
    *pSys = (*(PointerAttr uint8_t *) (MemoryAddressCast)(CFG_ADDRESS_START+add));
    pSys++;
  }
  if(sysCfg.holder != CFG_HOLDER)
  {
    sysCfg.holder = CFG_HOLDER;
    sysCfg.id[0] = DEFAULT_ID_1;
    sysCfg.id[1] = DEFAULT_ID_2;
    sys_WriteCfg();
  }
  /* Lock memory */
  FLASH->IAPSR &= (uint8_t)FLASH_MEMTYPE_DATA;

  cm[0] = (sysCfg.id[0]&0xFF000000)>>24;
  cm[1] = (sysCfg.id[0]&0x00FF0000)>>16;
  cm[2] = (sysCfg.id[0]&0x0000FF00)>>8;
  cm[3] = (sysCfg.id[0]&0x000000FF)>>0;
  debugInfo("Key 1: ", cm, 4);
  cm[0] = (sysCfg.id[1]&0xFF000000)>>24;
  cm[1] = (sysCfg.id[1]&0x00FF0000)>>16;
  cm[2] = (sysCfg.id[1]&0x0000FF00)>>8;
  cm[3] = (sysCfg.id[1]&0x000000FF)>>0;
  debugInfo("Key 2: ", cm, 4);
}
