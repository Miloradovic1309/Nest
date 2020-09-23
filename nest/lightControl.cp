#line 1 "C:/Users/Dan/Desktop/New folder (2)/Nest4/nest/lightControl.c"
#line 1 "c:/users/dan/desktop/new folder (2)/nest4/nest/externdef.h"
#line 99 "c:/users/dan/desktop/new folder (2)/nest4/nest/externdef.h"
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
#line 146 "c:/users/dan/desktop/new folder (2)/nest4/nest/externdef.h"
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





void change_velocity_mode(unsigned int mode);
#line 1 "c:/users/dan/desktop/new folder (2)/nest4/nest/crc.h"

unsigned int ModRTU_CRC(char buf[], int len);
unsigned short ModRTU_CRC_Hb(char buf[], int len);
unsigned short ModRTU_CRC_Lb(char buf[], int len);

unsigned short crc8(unsigned short dir, unsigned short speed);
#line 1 "c:/users/dan/desktop/new folder (2)/nest4/nest/uartsend.h"


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
#line 5 "C:/Users/Dan/Desktop/New folder (2)/Nest4/nest/lightControl.c"
void lightControlSwitches(){
#line 38 "C:/Users/Dan/Desktop/New folder (2)/Nest4/nest/lightControl.c"
 if(navigationLightState_old != navigationLightState){

 navigationLightState_old = navigationLightState;
 LIGHT_NAVIGATION = navigationLightState;


 }


 if(interiorLightState_old != interiorLightState){
 interiorLightState_old = interiorLightState;
 LIGHT_INTERIOR = interiorLightState;
 }
}
