#line 1 "C:/Users/Dan/Downloads/NNEESSTT5/NNEESSTT/nestMainBoard/interruptUart6.c"
#line 1 "c:/users/dan/downloads/nneesstt5/nneesstt/nestmainboard/externdef.h"
#line 99 "c:/users/dan/downloads/nneesstt5/nneesstt/nestmainboard/externdef.h"
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
#line 146 "c:/users/dan/downloads/nneesstt5/nneesstt/nestmainboard/externdef.h"
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
#line 1 "c:/users/dan/downloads/nneesstt5/nneesstt/nestmainboard/uartsend.h"


void uartSendCommandMotor(unsigned short motorDirection, unsigned short motorSpeed);
void uartSendStatusToStation();



void uart4CheckNavigationLightStatus();
void uart4CheckInteriorLightStatus();
void uart4CheckBattery1Status();
void uart4CheckBattery2Status();
void uart4NavigationLightTurnedOn();
void uart4NavigationLightTurnedOff();
void uart4InteriorLightTurnedOn();
void uart4InteriorLightTurnedOff();
void uart4Battery1TurnedOn();
void uart4Battery1TurnedOff();
void uart4Battery2TurnedOn();
void uart4Battery2TurnedOff();
void uart4LightingTurnedOn();
void uart4LightingTurnedOff();

void uart4Battery1Level4();
void uart4Battery1Level3();
void uart4Battery1Level2();
void uart4Battery1Level1();
void uart4Battery1Level0();

void uart4Battery2Level4();
void uart4Battery2Level3();
void uart4Battery2Level2();
void uart4Battery2Level1();
void uart4Battery2Level0();




void uart4TurtleCheckStatus();
void uart4RabbitCheckStatus();
void uart4LeopardCheckStatus();

void uart4TurtleTurnedOn();
void uart4TurtleTurnedOff();
void uart4RabbitTurnedOn();
void uart4RabbitTurnedOff();
void uart4LeopardTurnedOn();
void uart4LeopardTurnedOff();

void uart4SpeedModeTurtle();
void uart4SpeedModeRabbit();
void uart4SpeedModeLeopard();



void uart3SendJoystick();
void uart3ResetSensorTouch();
void uart3SendJoystickForced();
#line 9 "C:/Users/Dan/Downloads/NNEESSTT5/NNEESSTT/nestMainBoard/interruptUart6.c"
void interruptLora() iv IVT_INT_USART6 ics ICS_AUTO {
 receive6 = UART6_Read();

 if((receive6 == 0x21)&&(!startReceivingData6)){
 uart_count6=0;
 startReceivingData6 = 1;
 for(i=0; i<12; i++){
 uart_receive6[i] = 0;
 }
 }



 else if((receive6 == 0x3B)&&(startReceivingData6)&&(uart_count6 + 1 == uartLength6)){
 uart_receive6[uart_count6] = receive6;
 uart_count6 = 0;
 startReceivingData6 = 0;
 uartLength6 = 0;







 if((uart_receive6[0]==0x21)&&(uart_receive6[1]==0xC0)&&(uart_receive6[6] = 0x3B)){

 receivedCheckStatus = 1;


 if(uart_receive6[4] & 0x02){


 if(interiorLightState_old == 0){
 interiorLightState = 1;
 uart4InteriorLightTurnedOn();
 }
 else if(interiorLightState_old == 1){
 interiorLightState = 0;
 uart4InteriorLightTurnedOff();
 }
 }
 if(uart_receive6[4] & 0x04){


 if(navigationLightState_old == 0){
 navigationLightState = 1;
 uart4NavigationLightTurnedOn();
 }
 else if(navigationLightState_old == 1){
 navigationLightState = 0;
 uart4NavigationLightTurnedOff();
 }
 }

 if(!bitBatteryChangeBlockCounter){
 if(uart_receive6[4] & 0x08){
 if(wannaBeActiveBattery1_old==0){
 uart4Battery2TurnedOff();
 wannaBeActiveBattery2_old = 0;
 wannaBeActiveBattery2 = 0;

 uart4Battery1TurnedOn();
 wannaBeActiveBattery1_old = 1;
 wannaBeActiveBattery1 = 1;

 battery_change_continue = 0;
 battery_change = 0;
 battery_change_count = 0;
 battery_chosen = 1;

 }
 else{
 uart4Battery1TurnedOff();
 wannaBeActiveBattery1_old = 0;
 wannaBeActiveBattery1 = 0;

 battery_change_continue = 0;
 battery_change = 0;
 battery_change_count = 0;
 battery_chosen = 0;
 }

 }



 if(uart_receive6[4] & 0x10){
 if(wannaBeActiveBattery2_old==0){
 uart4Battery1TurnedOff();
 wannaBeActiveBattery1_old = 0;
 wannaBeActiveBattery1 = 0;

 uart4Battery2TurnedOn();
 wannaBeActiveBattery2_old = 1;
 wannaBeActiveBattery2 = 1;

 battery_change_continue = 0;
 battery_change = 0;
 battery_change_count = 0;
 battery_chosen = 2;

 }
 else{
 uart4Battery2TurnedOff();
 wannaBeActiveBattery2_old = 0;
 wannaBeActiveBattery2 = 0;

 battery_change_continue = 0;
 battery_change = 0;
 battery_change_count = 0;
 battery_chosen = 0;
 }

 }
 }



 if(uart_receive6[4] & 0x01 == 0x01){
 control_taken = 1;
 bitControlTaken = 1;
 controlTakenCount = 0;
 countJoystickConnection = 0;
 bitCheckJoystick = 0;
 }
 else{
 control_taken = 0;
 bitControlTaken = 0;
 controlTakenCount = 0;
 }

 switch(uart_receive6[3] & 0x07){
 case 1:
#line 147 "C:/Users/Dan/Downloads/NNEESSTT5/NNEESSTT/nestMainBoard/interruptUart6.c"
 if(control_taken){
 gear_status = 1;
 }

 break;
 case 2:
#line 157 "C:/Users/Dan/Downloads/NNEESSTT5/NNEESSTT/nestMainBoard/interruptUart6.c"
 if(control_taken){
 gear_status = 2;
 }

 break;
 case 3:
#line 167 "C:/Users/Dan/Downloads/NNEESSTT5/NNEESSTT/nestMainBoard/interruptUart6.c"
 if(control_taken){
 gear_status = 3;
 }

 break;
 case 4:
#line 177 "C:/Users/Dan/Downloads/NNEESSTT5/NNEESSTT/nestMainBoard/interruptUart6.c"
 if(control_taken){
 gear_status = 4;
 }
 stopGearBit = 1;

 break;
 case 5:
#line 188 "C:/Users/Dan/Downloads/NNEESSTT5/NNEESSTT/nestMainBoard/interruptUart6.c"
 if(control_taken){
 gear_status = 5;
 }

 break;
 default:
 gear_status = gear_status;
 break;
 }

 switch(uart_receive6[3] & 0x38){

 case 0x08:
 velocity_mode_save =  0 ;
 velocity_mode =  0 ;
 change_velocity_mode(velocity_mode);
 break;

 case 0x10:
 velocity_mode_save =  1 ;
 velocity_mode =  1 ;
 change_velocity_mode(velocity_mode);
 break;

 case 0x20:
 velocity_mode_save =  2 ;
 velocity_mode =  2 ;
 change_velocity_mode(velocity_mode);
 break;

 default:
 break;

 }

 boatWheelDir = uart_receive6[2];

 }




 for(i=0; i<12; i++){
 uart_receive6[i] = 0;
 }




 }


 if(startReceivingData6 == 1){
 uart_receive6[uart_count6] = receive6;
 uart_count6++;

 if(uart_count6 == 2)
 {
 switch (uart_receive6[1])
 {
 case 0xC0:
 uartLength6 = 7;
 break;
 }
 }

 if(uart_count6 > 11){
 uart_count6 = 0;
 uartLength6 = 0;
 startReceivingData6 = 0;
 for(i=0; i<12; i++){
 uart_receive6[i] = 0;
 }
 }
 }


}
