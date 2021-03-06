#line 1 "C:/Users/Dan/Desktop/NNEESSTT/nestLora72/timer2.c"
#line 1 "c:/users/dan/desktop/nneesstt/nestlora72/externdef.h"









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
#line 4 "C:/Users/Dan/Desktop/NNEESSTT/nestLora72/timer2.c"
void Timer2_interrupt() iv IVT_INT_TIM2 {
 TIM2_SR.UIF = 0;




 if(bitExpectAnswer){
 sendRequestStatusToAndroid();
 bitExpectAnswer = 0;
 boatConnected = 0x00;

 }

}
