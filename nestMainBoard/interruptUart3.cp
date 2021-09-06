#line 1 "E:/ComoBoats/NNEESSTT/nestMainBoard/interruptUart3.c"
#line 1 "e:/comoboats/nneesstt/nestmainboard/externdef.h"
#line 99 "e:/comoboats/nneesstt/nestmainboard/externdef.h"
extern sfr sbit LED1;
extern sfr sbit LED2;
extern sfr sbit LED3;
extern sfr sbit LED4;
extern sfr sbit LED5;



extern sfr sbit BUZZER_ALARM;








extern sfr sbit LIGHT_NAVIGATION;
extern sfr sbit LIGHT_INTERIOR;
extern sfr sbit ACCUMULATORS_OFF;
extern sfr sbit ACCUMULATOR1_ON;
extern sfr sbit ACCUMULATOR2_ON;
#line 146 "e:/comoboats/nneesstt/nestmainboard/externdef.h"
extern sfr sbit ACCUMULATOR_SENSE;









extern sfr sbit LORA_M0;
extern sfr sbit LORA_M1;
extern sfr sbit LORA_AUX;







extern sfr sbit UART1_RXTX;
extern sfr sbit UART3_RXTX;








extern int i;
extern bit countedTimer;
extern unsigned int buzzerCounter;
extern int battery_chosen;
extern int battery_chosen_old;
extern bit battery_change;
extern int battery_change_count;
extern bit battery_change_continue;
extern bit oldStateInteriorLight;
extern bit oldStateNavigationLight;
extern bit oldStateBattery1;
extern bit oldStateBattery2;


extern unsigned int pwm_ratio;
extern unsigned long pwm_frequency;
extern unsigned int pwm_duty;
extern double pwm_percent;
extern int dutyy;
extern long duzinaSignala2;





extern unsigned short motorSpeed;
extern unsigned short motorSpeed_old;
extern unsigned short motorDirection;



extern unsigned int gear_status;
extern unsigned int gear_status_old;


extern unsigned int wheel_position_angle;
extern unsigned int wheel_position_angle_old;
extern unsigned int wheel_position_direction;
extern unsigned int wheel_position_direction_old;
extern double wheel_position_angle_double;



extern bit bitDelay3Seconds;
extern bit bitStart3SecondsCount;
extern unsigned int delay3secndsCount;



extern unsigned long adc_read1;
extern unsigned long adcSum;
extern float adc_avg1;
extern float dutyF;


extern unsigned long adc_read2;
extern unsigned long adcSum2;
extern float adc_avg2;
extern float battery_percentage1;

extern unsigned long adc_read3;
extern unsigned long adcSum3;
extern float adc_avg3;
extern float battery_percentage2;

extern bit battry_percentage_check;
extern unsigned int battry_percentage_check_counter;



extern bit control_taken;
extern bit status_asked;
extern bit bitControlTaken;
extern int controlTakenCount;

extern bit bitBattery1Change;
extern bit bitBattery2Change;




extern char receive6;
extern char uart_receive6[12];
extern unsigned int uart_count6;
extern bit startReceivingData6;
extern unsigned int uartLength6;
extern bit receivedCheckStatus;

extern char boatControlTaken;
extern char boatInteriorLight;
extern char boatNavigationLight;
extern char boatWheelDir;

extern char boatBattery1;
extern char boatBattery2;
extern char boatBatteriesLavel;








extern char receive4;
extern char uart_receive4[10];
extern unsigned int uart_count4;
extern bit startReceivingData4;
extern unsigned int uartLength4;
extern char rcv_helper4[2];
extern unsigned short rcv_count_helper4;



extern char receive3;
extern char uart_receive3[10];
extern unsigned int uart_count3;
extern bit startReceivingData3;
extern unsigned int uartLength3;




extern unsigned int activeBattery;

extern unsigned int interiorLightState;
extern unsigned int interiorLightState_old;

extern unsigned int navigationLightState;
extern unsigned int navigationLightState_old;

extern unsigned int wannaBeActiveBattery1;
extern unsigned int wannaBeActiveBattery2;
extern unsigned int wannaBeActiveBattery1_old;
extern unsigned int wannaBeActiveBattery2_old;


extern bit bitCheckJoystick;
extern unsigned int countJoystickConnection;



extern bit navLightOn;
extern bit navLightOff;
extern bit intLightOn;
extern bit intLightOff;
extern bit bat1On;
extern bit bat1Off;
extern bit bat2On;
extern bit bat2Off;


extern bit bitCheckStatusJoystick;
extern bit bitCheckStatusDisplay;
extern unsigned int couterJoystickDisplay;

extern int paljenjeLedTestcounter;
extern unsigned int countedTimerCount;
extern bit countedTimer2;

extern bit sentToJoystick;
extern bit sentToMotor;

extern unsigned long adc_array2[300];
extern unsigned long adc_array3[300];
extern unsigned int j;
extern unsigned long tmp;

extern bit resetTouchSensor;
extern bit resetedTouchSensor;




extern unsigned int velocity_mode;
extern unsigned int velocity_gear1;
extern unsigned int velocity_gear2;
extern unsigned int velocity_gear3;
extern unsigned int velocity_gearR;
extern unsigned int velocity_gearS;

extern unsigned int velocity_mode_new;
extern unsigned int velocity_mode_mobile;
extern unsigned int velocity_mode_send;
extern unsigned int velocity_mode_save;

extern bit beingControlledByMobile;

extern bit controlWasTaken;
extern bit stopGearBit;
extern bit bitCheckIsItStoppedGear;

extern bit bitBatteryChangeBlockCounter;
extern unsigned int batteryChangeBlockCounter;





void change_velocity_mode(unsigned int mode);
#line 4 "E:/ComoBoats/NNEESSTT/nestMainBoard/interruptUart3.c"
void interruptJoystick() iv IVT_INT_USART3 ics ICS_AUTO {
 receive3 = UART3_Read();

 if((receive3 == 0x21)&&(!startReceivingData3)){
 uart_count3=0;
 startReceivingData3 = 1;
 for(i=0; i<10; i++){
 uart_receive3[i] = 0;
 }
 }

 else if((receive3 == 0x3B)&&(startReceivingData3)&&(uart_count3 + 1 == uartLength3)){
 uart_receive3[uart_count3] = receive3;
 uart_count3 = 0;
 startReceivingData3 = 0;
 uartLength3 = 0;




 if((uart_receive3[0]==0x21)&&(uart_receive3[1]==0x50)&&(uart_receive3[5] = 0x3B)){

 countJoystickConnection = 0;
 bitCheckJoystick = 0;


 if(!control_taken){
 gear_status = uart_receive3[2];
 dutyy = uart_receive3[3];

 if((gear_status == 4) && (!resetedTouchSensor)){
 resetedTouchSensor = 1;
 resetTouchSensor = 1;
 }
 else if(gear_status != 4){
 resetedTouchSensor = 0;
 }


 }

 if(bitCheckIsItStoppedGear){
 bitCheckIsItStoppedGear = 0;
 if(gear_status != 4){
 stopGearBit = 1;
 }
 }

 }

 for(i=0; i<10; i++){
 uart_receive3[i] = 0;
 }

 }


 if(startReceivingData3 == 1){
 uart_receive3[uart_count3] = receive3;
 uart_count3++;

 if(uart_count3 == 2)
 {
 switch (uart_receive3[1])
 {
 case 0x50:
 uartLength3 = 6;
 break;
 }
 }

 if(uart_count3 > 9){
 uart_count3 = 0;
 uartLength3 = 0;
 startReceivingData3 = 0;
 for(i=0; i<10; i++){
 uart_receive3[i] = 0;
 }
 }
 }

}
