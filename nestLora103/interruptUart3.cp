#line 1 "C:/Users/Dan/Desktop/NEST/nestLora103/interruptUart3.c"
#line 1 "c:/users/dan/desktop/nest/nestlora103/externdef.h"









extern sfr sbit M0;
extern sfr sbit M1;

extern sfr sbit LED;


extern sfr sbit K0;
extern sfr sbit K1;

extern sfr sbit AUX;



extern char receive2;
extern char uart_receive2[12];
extern unsigned int uart_count2;
extern bit startReceivingData2;
extern unsigned int uartLength2;

extern char receive3;
extern char uart_receive3[13];
extern unsigned int uart_count3;
extern bit startReceivingData3;
extern unsigned int uartLength3;

extern int i;

extern int duty;

extern bit bitReceivedCheckStatusOfBoat;
extern bit bitReceivedStatusOfBoat;
extern bit bitExpectAnswer;


extern char addressBoat[2];

extern char boatGear;
extern char boatDir;
extern char boatInteriorLight;
extern char boatNavigationLight;
extern char boatControlTaken;
extern char boatConnected;

extern char boatStatus;
extern char boatStatusGear;
extern char boatStatusWheel;


extern char boatBattery1;
extern char boatBattery2;
extern char boatBatteriesLavel;



void uartRequestStatusFromBoat();

void sendRequestStatusToAndroid();
#line 5 "C:/Users/Dan/Desktop/NEST/nestLora103/interruptUart3.c"
void interruptUart3() iv IVT_INT_USART3 ics ICS_AUTO {
 receive3 = UART3_Read();

 if((receive3 == 0x21)&&(!startReceivingData3)){
 uart_count3=0;
 startReceivingData3 = 1;
 uartLength3 = 0;
 for(i=0; i<13; i++){
 uart_receive3[i] = 0;
 }
 }



 else if((receive3 == 0x3B)&&(startReceivingData3)&&(uart_count3 + 1 == uartLength3)){
 uart_receive3[uart_count3] = receive3;
 uart_count3 = 0;
 startReceivingData3 = 0;
 uartLength3 = 0;





 if((uart_receive3[0]==0x21)&&(uart_receive3[1]== 0x30 )&&(uart_receive3[2]== 0x25 )
 && (uart_receive3[5]==0xC0)&&(uart_receive3[9] = 0x3B)){



 bitReceivedCheckStatusOfBoat = 1;
 addressBoat[0] = uart_receive3[3];
 addressBoat[1] = uart_receive3[4];
 boatStatus = uart_receive3[8];
 boatStatusGear = uart_receive3[7];
 boatStatusWheel = uart_receive3[6];

 if(!bitExpectAnswer){
 TIM2_CNT = 0x00;
 bitExpectAnswer = 1;
 }


 }






 for(i=0; i<13; i++){
 uart_receive3[i] = 0;
 }




 }


 if(startReceivingData3 == 1){
 uart_receive3[uart_count3] = receive3;
 uart_count3++;

 if(uart_count3 == 2){
 if(uart_receive3[1] !=  0x30 ){
 uart_count3 = 0;
 uartLength3 = 0;
 startReceivingData3 = 0;
 for(i=0; i<12; i++){
 uart_receive3[i] = 0;
 }
 }
 }
 else if(uart_count3 == 6)
 {
 switch (uart_receive3[5])
 {
 case 0xC0:
 uartLength3 = 10;
 break;
 }
 }

 if(uart_count3 > 12){
 uart_count3 = 0;
 uartLength3 = 0;
 startReceivingData3 = 0;
 for(i=0; i<13; i++){
 uart_receive3[i] = 0;
 }
 }
 }

}
