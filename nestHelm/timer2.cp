#line 1 "C:/Users/Dan/Desktop/New folder (2)/Nest4/nestHelm/timer2.c"
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
#line 4 "C:/Users/Dan/Desktop/New folder (2)/Nest4/nestHelm/timer2.c"
void Timer2_interrupt() iv IVT_INT_TIM2 {
 TIM2_SR.UIF = 0;


 countedTimer = 1;

 if(bitStart3SecondsCount){
 delay3secndsCount++;
 if(delay3secndsCount >= 60){
 bitDelay3Seconds = 0;
 bitStart3SecondsCount = 0;
 delay3secndsCount = 0;
 }
 }


}
