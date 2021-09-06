#line 1 "C:/Users/Dan/Desktop/NNEESSTT/nestHelm/interruptUart1.c"
#line 1 "c:/users/dan/desktop/nneesstt/nesthelm/externdef.h"




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
#line 1 "c:/users/dan/desktop/nneesstt/nesthelm/eeprom.h"
void EEPROM_24C02_Init();
void EEPROM_24C02_WrSingle(unsigned short wAddr, unsigned short wData);
unsigned short EEPROM_24C02_RdSingle(unsigned int rAddr);
void citajeprom();
void eprompisi();

void eepromSaveRight();
void eepromSaveLeft();
void eepromDir();
#line 5 "C:/Users/Dan/Desktop/NNEESSTT/nestHelm/interruptUart1.c"
void interruptJoystick() iv IVT_INT_USART1 ics ICS_AUTO {
 receive1 = UART1_Read();



 if((receive1 == 0x21)&&(!startReceivingData1)){
 uart_count1=0;
 startReceivingData1 = 1;
 for(i=0; i<10; i++){
 uart_receive1[i] = 0;
 }
 }

 else if((receive1 == 0x3B)&&(startReceivingData1)&&(uart_count1 + 1 == uartLength1)){
 uart_receive1[uart_count1] = receive1;
 uart_count1 = 0;
 startReceivingData1 = 0;
 uartLength1 = 0;





 if((uart_receive1[0]==0x21)&&(uart_receive1[1]==0x40)&&(uart_receive1[5] = 0x3B)){

 bitRespond = 1;

 if(uart_receive1[4]&=0x01){
 bitControlTaken = 1;
 gear_status = (unsigned int)uart_receive1[2];
 dir_status = (unsigned int)uart_receive1[3];
 switch(gear_status){
 case 0x01:
 ONE_LIGHT = 1;
 TWO_LIGHT = THREE_LIGHT = N_LIGHT = R_LIGHT = 0;
 break;
 case 0x02:
 TWO_LIGHT = 1;
 ONE_LIGHT = THREE_LIGHT = N_LIGHT = R_LIGHT = 0;
 break;
 case 0x03:
 THREE_LIGHT = 1;
 TWO_LIGHT = ONE_LIGHT = N_LIGHT = R_LIGHT = 0;
 break;
 case 0x04:
 N_LIGHT = 1;
 TWO_LIGHT = THREE_LIGHT = ONE_LIGHT = R_LIGHT = 0;
 break;
 case 0x05:
 R_LIGHT = 1;
 TWO_LIGHT = THREE_LIGHT = N_LIGHT = ONE_LIGHT = 0;
 break;
 }
 }
 else{
 bitControlTaken = 0;
 }


 }

 else if((uart_receive1[0]==0x21)&&(uart_receive1[1]==0x41)&&(uart_receive1[5] = 0x3B)){

 bitCalSend = 1;

 }

 else if((uart_receive1[0]==0x21)&&(uart_receive1[1]==0x42)&&(uart_receive1[5] = 0x3B)){

 leftLimit = (uart_receive1[2] << 8) + uart_receive1[3];
 eepromSaveLeft();

 if(leftLimit >= rightLimit){
 sideDifference = leftLimit - rightLimit;
 }
 else{
 sideDifference = rightLimit - leftLimit;
 }

 if(sideDifference == 0){
 sideDifference = 1;
 }

 }

 else if((uart_receive1[0]==0x21)&&(uart_receive1[1]==0x43)&&(uart_receive1[5] = 0x3B)){

 rightLimit = (uart_receive1[2] << 8) + uart_receive1[3];
 eepromSaveRight();

 if(leftLimit >= rightLimit){
 sideDifference = leftLimit - rightLimit;
 }
 else{
 sideDifference = rightLimit - leftLimit;
 }

 if(sideDifference == 0){
 sideDifference = 1;
 }

 }

 else if((uart_receive1[0]==0x21)&&(uart_receive1[1]==0x44)&&(uart_receive1[5] = 0x3B)){

 dir = uart_receive1[2];
 eepromDir();

 }


 else if((uart_receive1[0]==0x21)&&(uart_receive1[1]==0x45)&&(uart_receive1[5] = 0x3B)){

 bitResetTouchSensor = 1;
 }

 for(i=0; i<10; i++){
 uart_receive1[i] = 0;
 }

 }


 if(startReceivingData1 == 1){
 uart_receive1[uart_count1] = receive1;
 uart_count1++;

 if(uart_count1 == 2)
 {
 switch (uart_receive1[1])
 {
 case 0x40:
 uartLength1 = 6;
 break;
 case 0x41:
 uartLength1 = 6;
 break;
 case 0x42:
 uartLength1 = 6;
 break;
 case 0x43:
 uartLength1 = 6;
 break;
 case 0x44:
 uartLength1 = 6;
 break;
 case 0x45:
 uartLength1 = 6;
 break;

 }
 }

 if(uart_count1 > 9){
 uart_count1 = 0;
 uartLength1 = 0;
 startReceivingData1 = 0;
 for(i=0; i<10; i++){
 uart_receive1[i] = 0;
 }
 }
 }

}
