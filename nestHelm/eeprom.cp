#line 1 "C:/Users/Dan/Desktop/New folder (2)/Nest4/nestHelm/eeprom.c"
#line 1 "c:/users/dan/desktop/new folder (2)/nest4/nesthelm/externdef.h"




extern sfr sbit R_LIGHT;
extern sfr sbit N_LIGHT;
extern sfr sbit ONE_LIGHT;
extern sfr sbit TWO_LIGHT;
extern sfr sbit THREE_LIGHT;

extern sfr sbit ONE_TOUCH;
extern sfr sbit TWO_TOUCH;
extern sfr sbit THREE_TOUCH;
extern sfr sbit N_TOUCH;
extern sfr sbit R_TOUCH;








extern sfr sbit UART1_RXTX;







extern sfr sbit WHEEL_LIGHT;
extern sfr sbit WHEEL_TOUCH;
extern sfr sbit WHEEL_DIODE;







extern sfr sbit WTPSC;
extern sfr sbit GTPSC;



extern sfr sbit LED11;


extern unsigned int i;
extern bit control_taken;



extern char receive1;
extern char uart_receive1[10];
extern unsigned int uart_count1;
extern bit startReceivingData1;
extern unsigned int uartLength1;



extern unsigned int gear_status;
extern unsigned int dir_status;
extern bit bitDelay3Seconds;
extern bit bitStart3SecondsCount;
extern int delay3secndsCount;


extern bit countedTimer;
extern unsigned long adc_read1;
extern unsigned long adcSum;
extern float adc_avg1;
extern float dutyF;

extern int dutyy;
extern int dutyyy;
extern bit bitRespond;
extern bit bitControlTaken;


extern bit bitCalSend;

extern long calAdcAvg;
extern long calDutyF;
extern int calDuty;

extern unsigned int leftLimit;
extern unsigned int rightLimit;
extern unsigned short dir;
extern unsigned int sideDifference;

extern bit bitResetTouchSensor;






void uart1SendStatus(unsigned int gear_status, unsigned int dutyyy);
void uart1SendCallibration();
#line 6 "C:/Users/Dan/Desktop/New folder (2)/Nest4/nestHelm/eeprom.c"
char data_[256];

void EEPROM_24C02_Init() {

 I2C1_Init_Advanced(100000, &_GPIO_MODULE_I2C1_PB67);
}
void EEPROM_24C02_WrSingle(unsigned short wAddr, unsigned short wData) {
 data_[0] = wAddr;
 data_[1] = wData;
 I2C1_Start();

 I2C1_Write(0x50,data_,2,END_MODE_STOP);
}



unsigned short EEPROM_24C02_RdSingle(unsigned int rAddr) {
 data_[0] = rAddr;
 I2C1_Start();
 I2C1_Write(0x50,data_,1,END_MODE_RESTART);
 I2C1_Read(0x50,data_,1,END_MODE_STOP);

 return data_[0];
}

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
 EEPROM_24C02_WrSingle(1,  (char)((leftLimit)&0xFF) );
 Delay_ms(15);
 EEPROM_24C02_WrSingle(2,  (char)((leftLimit)/256) );
 Delay_ms(15);
 EEPROM_24C02_WrSingle(3,  (char)((rightLimit)&0xFF) );
 Delay_ms(15);
 EEPROM_24C02_WrSingle(4,  (char)((rightLimit)/256) );
 Delay_ms(15);
 EEPROM_24C02_WrSingle(5,  (char)((dir)&0xFF) );
 Delay_ms(15);

}

void eepromSaveLeft(){
 EEPROM_24C02_WrSingle(1,  (char)((leftLimit)&0xFF) );
 Delay_ms(15);
 EEPROM_24C02_WrSingle(2,  (char)((leftLimit)/256) );
 Delay_ms(15);
}

void eepromSaveRight(){
 EEPROM_24C02_WrSingle(3,  (char)((rightLimit)&0xFF) );
 Delay_ms(15);
 EEPROM_24C02_WrSingle(4,  (char)((rightLimit)/256) );
 Delay_ms(15);
}

void eepromDir(){
 EEPROM_24C02_WrSingle(5,  (char)((dir)&0xFF) );
 Delay_ms(15);
}
