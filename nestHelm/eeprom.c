#include "externDef.h"

#define Lo(x) (char)((x)&0xFF) //eeprom write
#define Hi(x) (char)((x)/256)  //eeprom write

char data_[256];

void EEPROM_24C02_Init() {
   //I2C1_Init();
 I2C1_Init_Advanced(100000, &_GPIO_MODULE_I2C1_PB67);
}//~
void EEPROM_24C02_WrSingle(unsigned short wAddr, unsigned short wData) {
  data_[0] = wAddr;
  data_[1] = wData;
  I2C1_Start();
  // issue I2C start signal
  I2C1_Write(0x50,data_,2,END_MODE_STOP);
}//~


//--------------- Reads data from 24C02 EEPROM - single location (random)
unsigned short EEPROM_24C02_RdSingle(unsigned int rAddr) {
  data_[0] = rAddr;
  I2C1_Start();              // issue I2C start signal
  I2C1_Write(0x50,data_,1,END_MODE_RESTART);
  I2C1_Read(0x50,data_,1,END_MODE_STOP);

  return data_[0];
}
//eeprom rutin_ _______________________________________________________________
void citajeprom(){
  leftLimit = EEPROM_24C02_RdSingle(2);
  leftLimit = leftLimit << 8;
  leftLimit = leftLimit + EEPROM_24C02_RdSingle(1);

  rightLimit= EEPROM_24C02_RdSingle(4);
  rightLimit = rightLimit << 8;
  rightLimit = rightLimit + EEPROM_24C02_RdSingle(3);

  dir = EEPROM_24C02_RdSingle(5);

}

void eprompisi()
{
  EEPROM_24C02_WrSingle(1, Lo(leftLimit));
  Delay_ms(15);
  EEPROM_24C02_WrSingle(2, Hi(leftLimit));
  Delay_ms(15);
  EEPROM_24C02_WrSingle(3, Lo(rightLimit));
  Delay_ms(15);
  EEPROM_24C02_WrSingle(4, Hi(rightLimit));
  Delay_ms(15);
  EEPROM_24C02_WrSingle(5, Lo(dir));
  Delay_ms(15);

}

void eepromSaveLeft(){
  EEPROM_24C02_WrSingle(1, Lo(leftLimit));
  Delay_ms(15);
  EEPROM_24C02_WrSingle(2, Hi(leftLimit));
  Delay_ms(15);
}

void eepromSaveRight(){
  EEPROM_24C02_WrSingle(3, Lo(rightLimit));
  Delay_ms(15);
  EEPROM_24C02_WrSingle(4, Hi(rightLimit));
  Delay_ms(15);
}

void eepromDir(){
  EEPROM_24C02_WrSingle(5, Lo(dir));
  Delay_ms(15);
}
