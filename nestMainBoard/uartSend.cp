#line 1 "C:/Users/Dan/Downloads/NNEESSTT5/NNEESSTT/nestMainBoard/uartSend.c"
#line 1 "c:/users/dan/downloads/nneesstt5/nneesstt/nestmainboard/crc.h"

unsigned int ModRTU_CRC(char buf[], int len);
unsigned short ModRTU_CRC_Hb(char buf[], int len);
unsigned short ModRTU_CRC_Lb(char buf[], int len);

unsigned short crc8(unsigned short dir, unsigned short speed);
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
#line 4 "C:/Users/Dan/Downloads/NNEESSTT5/NNEESSTT/nestMainBoard/uartSend.c"
void uartSendCommandMotor(unsigned short motorDirection, unsigned short motorSpeed){


 char forSend[4];

 forSend[0] = 0xCA;
 forSend[1] = 0x41;
 forSend[2] = (char)motorDirection;
 forSend[3] = (char)motorSpeed;

 UART1_RXTX =1;

 UART1_Write(forSend[0]);
 UART1_Write(forSend[1]);
 UART1_Write(forSend[2]);
 UART1_Write(forSend[3]);
 UART1_Write(crc8(forSend[2], forSend[3]));
 Delay_ms(5);
 UART1_RXTX =0;
}




void uartSendStatusToStation(){
 UART6_Write(0x00);
 UART6_Write( 0x30 );
 UART6_Write( 0x00 );

 UART6_Write(0x21);
 UART6_Write(0xC0);
 UART6_Write(duzinaSignala2);
 UART6_Write((gear_status & 0x07) | (velocity_mode_send << 3));
 UART6_Write((boatBattery2 | boatBattery1 | boatNavigationLight | boatInteriorLight | boatControlTaken) & 0x1F);
 UART6_Write(boatBatteriesLavel);
 UART6_Write(0x3B);
}




void uart4CheckNavigationLightStatus(){

 UART4_Write(0x5A);
 UART4_Write(0xA5);
 UART4_Write(0x04);
 UART4_Write(0x83);
 UART4_Write(0x16);
 UART4_Write(0x00);
 UART4_Write(0x01);
}

void uart4CheckInteriorLightStatus(){

 UART4_Write(0x5A);
 UART4_Write(0xA5);
 UART4_Write(0x04);
 UART4_Write(0x83);
 UART4_Write(0x16);
 UART4_Write(0x20);
 UART4_Write(0x01);
}

void uart4CheckBattery1Status(){

 UART4_Write(0x5A);
 UART4_Write(0xA5);
 UART4_Write(0x04);
 UART4_Write(0x83);
 UART4_Write(0x16);
 UART4_Write(0x40);
 UART4_Write(0x01);
}

void uart4CheckBattery2Status(){

 UART4_Write(0x5A);
 UART4_Write(0xA5);
 UART4_Write(0x04);
 UART4_Write(0x83);
 UART4_Write(0x16);
 UART4_Write(0x60);
 UART4_Write(0x01);
}


void uart4NavigationLightTurnedOn(){

 UART4_Write(0x5A);
 UART4_Write(0xA5);
 UART4_Write(0x05);
 UART4_Write(0x82);
 UART4_Write(0x16);
 UART4_Write(0x00);
 UART4_Write(0x00);
 UART4_Write(0x00);
}

void uart4NavigationLightTurnedOff(){

 UART4_Write(0x5A);
 UART4_Write(0xA5);
 UART4_Write(0x05);
 UART4_Write(0x82);
 UART4_Write(0x16);
 UART4_Write(0x00);
 UART4_Write(0x00);
 UART4_Write(0x01);
}

void uart4InteriorLightTurnedOn(){

 UART4_Write(0x5A);
 UART4_Write(0xA5);
 UART4_Write(0x05);
 UART4_Write(0x82);
 UART4_Write(0x16);
 UART4_Write(0x20);
 UART4_Write(0x00);
 UART4_Write(0x00);
}

void uart4InteriorLightTurnedOff(){

 UART4_Write(0x5A);
 UART4_Write(0xA5);
 UART4_Write(0x05);
 UART4_Write(0x82);
 UART4_Write(0x16);
 UART4_Write(0x20);
 UART4_Write(0x00);
 UART4_Write(0x01);
}


void uart4Battery1TurnedOn(){

 UART4_Write(0x5A);
 UART4_Write(0xA5);
 UART4_Write(0x05);
 UART4_Write(0x82);
 UART4_Write(0x16);
 UART4_Write(0x40);
 UART4_Write(0x00);
 UART4_Write(0x00);
}

void uart4Battery1TurnedOff(){

 UART4_Write(0x5A);
 UART4_Write(0xA5);
 UART4_Write(0x05);
 UART4_Write(0x82);
 UART4_Write(0x16);
 UART4_Write(0x40);
 UART4_Write(0x00);
 UART4_Write(0x01);
}

void uart4Battery2TurnedOn(){

 UART4_Write(0x5A);
 UART4_Write(0xA5);
 UART4_Write(0x05);
 UART4_Write(0x82);
 UART4_Write(0x16);
 UART4_Write(0x60);
 UART4_Write(0x00);
 UART4_Write(0x00);
}

void uart4Battery2TurnedOff(){

 UART4_Write(0x5A);
 UART4_Write(0xA5);
 UART4_Write(0x05);
 UART4_Write(0x82);
 UART4_Write(0x16);
 UART4_Write(0x60);
 UART4_Write(0x00);
 UART4_Write(0x01);
}


void uart4LightingTurnedOn(){
#line 200 "C:/Users/Dan/Downloads/NNEESSTT5/NNEESSTT/nestMainBoard/uartSend.c"
 UART4_Write(0x5A);
 UART4_Write(0xA5);
 UART4_Write(0x05);
 UART4_Write(0x82);
 UART4_Write(0x13);
 UART4_Write(0x00);
 UART4_Write(0x00);
 UART4_Write(0x00);
}

void uart4LightingTurnedOff(){
#line 222 "C:/Users/Dan/Downloads/NNEESSTT5/NNEESSTT/nestMainBoard/uartSend.c"
 UART4_Write(0x5A);
 UART4_Write(0xA5);
 UART4_Write(0x05);
 UART4_Write(0x82);
 UART4_Write(0x13);
 UART4_Write(0x00);
 UART4_Write(0x00);
 UART4_Write(0x01);
}






void uart4Battery1Level4(){

 UART4_Write(0x5A);
 UART4_Write(0xA5);
 UART4_Write(0x05);
 UART4_Write(0x82);
 UART4_Write(0x51);
 UART4_Write(0x25);
 UART4_Write(0x00);
 UART4_Write(0x01);

 UART4_Write(0x5A);
 UART4_Write(0xA5);
 UART4_Write(0x05);
 UART4_Write(0x82);
 UART4_Write(0x51);
 UART4_Write(0x45);
 UART4_Write(0x00);
 UART4_Write(0x03);

 UART4_Write(0x5A);
 UART4_Write(0xA5);
 UART4_Write(0x05);
 UART4_Write(0x82);
 UART4_Write(0x51);
 UART4_Write(0x65);
 UART4_Write(0x00);
 UART4_Write(0x05);

 UART4_Write(0x5A);
 UART4_Write(0xA5);
 UART4_Write(0x05);
 UART4_Write(0x82);
 UART4_Write(0x51);
 UART4_Write(0x85);
 UART4_Write(0x00);
 UART4_Write(0x07);
}
void uart4Battery1Level3(){

 UART4_Write(0x5A);
 UART4_Write(0xA5);
 UART4_Write(0x05);
 UART4_Write(0x82);
 UART4_Write(0x51);
 UART4_Write(0x25);
 UART4_Write(0x00);
 UART4_Write(0x00);

 UART4_Write(0x5A);
 UART4_Write(0xA5);
 UART4_Write(0x05);
 UART4_Write(0x82);
 UART4_Write(0x51);
 UART4_Write(0x45);
 UART4_Write(0x00);
 UART4_Write(0x03);

 UART4_Write(0x5A);
 UART4_Write(0xA5);
 UART4_Write(0x05);
 UART4_Write(0x82);
 UART4_Write(0x51);
 UART4_Write(0x65);
 UART4_Write(0x00);
 UART4_Write(0x05);

 UART4_Write(0x5A);
 UART4_Write(0xA5);
 UART4_Write(0x05);
 UART4_Write(0x82);
 UART4_Write(0x51);
 UART4_Write(0x85);
 UART4_Write(0x00);
 UART4_Write(0x07);
}
void uart4Battery1Level2(){

 UART4_Write(0x5A);
 UART4_Write(0xA5);
 UART4_Write(0x05);
 UART4_Write(0x82);
 UART4_Write(0x51);
 UART4_Write(0x25);
 UART4_Write(0x00);
 UART4_Write(0x00);

 UART4_Write(0x5A);
 UART4_Write(0xA5);
 UART4_Write(0x05);
 UART4_Write(0x82);
 UART4_Write(0x51);
 UART4_Write(0x45);
 UART4_Write(0x00);
 UART4_Write(0x02);

 UART4_Write(0x5A);
 UART4_Write(0xA5);
 UART4_Write(0x05);
 UART4_Write(0x82);
 UART4_Write(0x51);
 UART4_Write(0x65);
 UART4_Write(0x00);
 UART4_Write(0x05);

 UART4_Write(0x5A);
 UART4_Write(0xA5);
 UART4_Write(0x05);
 UART4_Write(0x82);
 UART4_Write(0x51);
 UART4_Write(0x85);
 UART4_Write(0x00);
 UART4_Write(0x07);
}
void uart4Battery1Level1(){

 UART4_Write(0x5A);
 UART4_Write(0xA5);
 UART4_Write(0x05);
 UART4_Write(0x82);
 UART4_Write(0x51);
 UART4_Write(0x25);
 UART4_Write(0x00);
 UART4_Write(0x00);

 UART4_Write(0x5A);
 UART4_Write(0xA5);
 UART4_Write(0x05);
 UART4_Write(0x82);
 UART4_Write(0x51);
 UART4_Write(0x45);
 UART4_Write(0x00);
 UART4_Write(0x02);

 UART4_Write(0x5A);
 UART4_Write(0xA5);
 UART4_Write(0x05);
 UART4_Write(0x82);
 UART4_Write(0x51);
 UART4_Write(0x65);
 UART4_Write(0x00);
 UART4_Write(0x04);

 UART4_Write(0x5A);
 UART4_Write(0xA5);
 UART4_Write(0x05);
 UART4_Write(0x82);
 UART4_Write(0x51);
 UART4_Write(0x85);
 UART4_Write(0x00);
 UART4_Write(0x10);
}
void uart4Battery1Level0(){

 UART4_Write(0x5A);
 UART4_Write(0xA5);
 UART4_Write(0x05);
 UART4_Write(0x82);
 UART4_Write(0x51);
 UART4_Write(0x25);
 UART4_Write(0x00);
 UART4_Write(0x00);

 UART4_Write(0x5A);
 UART4_Write(0xA5);
 UART4_Write(0x05);
 UART4_Write(0x82);
 UART4_Write(0x51);
 UART4_Write(0x45);
 UART4_Write(0x00);
 UART4_Write(0x02);

 UART4_Write(0x5A);
 UART4_Write(0xA5);
 UART4_Write(0x05);
 UART4_Write(0x82);
 UART4_Write(0x51);
 UART4_Write(0x65);
 UART4_Write(0x00);
 UART4_Write(0x04);

 UART4_Write(0x5A);
 UART4_Write(0xA5);
 UART4_Write(0x05);
 UART4_Write(0x82);
 UART4_Write(0x51);
 UART4_Write(0x85);
 UART4_Write(0x00);
 UART4_Write(0x06);
}







void uart4Battery2Level4(){

 UART4_Write(0x5A);
 UART4_Write(0xA5);
 UART4_Write(0x05);
 UART4_Write(0x82);
 UART4_Write(0x51);
 UART4_Write(0xA5);
 UART4_Write(0x00);
 UART4_Write(0x09);

 UART4_Write(0x5A);
 UART4_Write(0xA5);
 UART4_Write(0x05);
 UART4_Write(0x82);
 UART4_Write(0x51);
 UART4_Write(0xC5);
 UART4_Write(0x00);
 UART4_Write(0x0B);

 UART4_Write(0x5A);
 UART4_Write(0xA5);
 UART4_Write(0x05);
 UART4_Write(0x82);
 UART4_Write(0x51);
 UART4_Write(0xE5);
 UART4_Write(0x00);
 UART4_Write(0x0D);

 UART4_Write(0x5A);
 UART4_Write(0xA5);
 UART4_Write(0x05);
 UART4_Write(0x82);
 UART4_Write(0x52);
 UART4_Write(0x05);
 UART4_Write(0x00);
 UART4_Write(0x0F);
}
void uart4Battery2Level3(){

 UART4_Write(0x5A);
 UART4_Write(0xA5);
 UART4_Write(0x05);
 UART4_Write(0x82);
 UART4_Write(0x51);
 UART4_Write(0xA5);
 UART4_Write(0x00);
 UART4_Write(0x08);

 UART4_Write(0x5A);
 UART4_Write(0xA5);
 UART4_Write(0x05);
 UART4_Write(0x82);
 UART4_Write(0x51);
 UART4_Write(0xC5);
 UART4_Write(0x00);
 UART4_Write(0x0B);

 UART4_Write(0x5A);
 UART4_Write(0xA5);
 UART4_Write(0x05);
 UART4_Write(0x82);
 UART4_Write(0x51);
 UART4_Write(0xE5);
 UART4_Write(0x00);
 UART4_Write(0x0D);

 UART4_Write(0x5A);
 UART4_Write(0xA5);
 UART4_Write(0x05);
 UART4_Write(0x82);
 UART4_Write(0x52);
 UART4_Write(0x05);
 UART4_Write(0x00);
 UART4_Write(0x0F);
}
void uart4Battery2Level2(){

 UART4_Write(0x5A);
 UART4_Write(0xA5);
 UART4_Write(0x05);
 UART4_Write(0x82);
 UART4_Write(0x51);
 UART4_Write(0xA5);
 UART4_Write(0x00);
 UART4_Write(0x08);

 UART4_Write(0x5A);
 UART4_Write(0xA5);
 UART4_Write(0x05);
 UART4_Write(0x82);
 UART4_Write(0x51);
 UART4_Write(0xC5);
 UART4_Write(0x00);
 UART4_Write(0x0A);

 UART4_Write(0x5A);
 UART4_Write(0xA5);
 UART4_Write(0x05);
 UART4_Write(0x82);
 UART4_Write(0x51);
 UART4_Write(0xE5);
 UART4_Write(0x00);
 UART4_Write(0x0D);

 UART4_Write(0x5A);
 UART4_Write(0xA5);
 UART4_Write(0x05);
 UART4_Write(0x82);
 UART4_Write(0x52);
 UART4_Write(0x05);
 UART4_Write(0x00);
 UART4_Write(0x0F);
}
void uart4Battery2Level1(){

 UART4_Write(0x5A);
 UART4_Write(0xA5);
 UART4_Write(0x05);
 UART4_Write(0x82);
 UART4_Write(0x51);
 UART4_Write(0xA5);
 UART4_Write(0x00);
 UART4_Write(0x08);

 UART4_Write(0x5A);
 UART4_Write(0xA5);
 UART4_Write(0x05);
 UART4_Write(0x82);
 UART4_Write(0x51);
 UART4_Write(0xC5);
 UART4_Write(0x00);
 UART4_Write(0x0A);

 UART4_Write(0x5A);
 UART4_Write(0xA5);
 UART4_Write(0x05);
 UART4_Write(0x82);
 UART4_Write(0x51);
 UART4_Write(0xE5);
 UART4_Write(0x00);
 UART4_Write(0x0C);

 UART4_Write(0x5A);
 UART4_Write(0xA5);
 UART4_Write(0x05);
 UART4_Write(0x82);
 UART4_Write(0x52);
 UART4_Write(0x05);
 UART4_Write(0x00);
 UART4_Write(0x11);
}
void uart4Battery2Level0(){

 UART4_Write(0x5A);
 UART4_Write(0xA5);
 UART4_Write(0x05);
 UART4_Write(0x82);
 UART4_Write(0x51);
 UART4_Write(0xA5);
 UART4_Write(0x00);
 UART4_Write(0x08);

 UART4_Write(0x5A);
 UART4_Write(0xA5);
 UART4_Write(0x05);
 UART4_Write(0x82);
 UART4_Write(0x51);
 UART4_Write(0xC5);
 UART4_Write(0x00);
 UART4_Write(0x0A);

 UART4_Write(0x5A);
 UART4_Write(0xA5);
 UART4_Write(0x05);
 UART4_Write(0x82);
 UART4_Write(0x51);
 UART4_Write(0xE5);
 UART4_Write(0x00);
 UART4_Write(0x0C);

 UART4_Write(0x5A);
 UART4_Write(0xA5);
 UART4_Write(0x05);
 UART4_Write(0x82);
 UART4_Write(0x52);
 UART4_Write(0x05);
 UART4_Write(0x00);
 UART4_Write(0x0E);
}

void uart4TurtleCheckStatus(){

 UART4_Write(0x5A);
 UART4_Write(0xA5);
 UART4_Write(0x04);
 UART4_Write(0x83);
 UART4_Write(0x18);
 UART4_Write(0x00);
 UART4_Write(0x01);
}

void uart4RabbitCheckStatus(){

 UART4_Write(0x5A);
 UART4_Write(0xA5);
 UART4_Write(0x04);
 UART4_Write(0x83);
 UART4_Write(0x18);
 UART4_Write(0x20);
 UART4_Write(0x01);
}

void uart4LeopardCheckStatus(){

 UART4_Write(0x5A);
 UART4_Write(0xA5);
 UART4_Write(0x04);
 UART4_Write(0x83);
 UART4_Write(0x18);
 UART4_Write(0x40);
 UART4_Write(0x01);
}

void uart4TurtleTurnedOn(){
 UART4_Write(0x5A);
 UART4_Write(0xA5);
 UART4_Write(0x05);
 UART4_Write(0x82);
 UART4_Write(0x18);
 UART4_Write(0x00);
 UART4_Write(0x00);
 UART4_Write(0x00);
}

void uart4TurtleTurnedOff(){
 UART4_Write(0x5A);
 UART4_Write(0xA5);
 UART4_Write(0x05);
 UART4_Write(0x82);
 UART4_Write(0x18);
 UART4_Write(0x00);
 UART4_Write(0x00);
 UART4_Write(0x01);
}

void uart4RabbitTurnedOn(){
 UART4_Write(0x5A);
 UART4_Write(0xA5);
 UART4_Write(0x05);
 UART4_Write(0x82);
 UART4_Write(0x18);
 UART4_Write(0x20);
 UART4_Write(0x00);
 UART4_Write(0x00);
}

void uart4RabbitTurnedOff(){
 UART4_Write(0x5A);
 UART4_Write(0xA5);
 UART4_Write(0x05);
 UART4_Write(0x82);
 UART4_Write(0x18);
 UART4_Write(0x20);
 UART4_Write(0x00);
 UART4_Write(0x01);
}

void uart4LeopardTurnedOn(){
 UART4_Write(0x5A);
 UART4_Write(0xA5);
 UART4_Write(0x05);
 UART4_Write(0x82);
 UART4_Write(0x18);
 UART4_Write(0x40);
 UART4_Write(0x00);
 UART4_Write(0x00);
}

void uart4LeopardTurnedOff(){
 UART4_Write(0x5A);
 UART4_Write(0xA5);
 UART4_Write(0x05);
 UART4_Write(0x82);
 UART4_Write(0x18);
 UART4_Write(0x40);
 UART4_Write(0x00);
 UART4_Write(0x01);
}

void uart4SpeedModeTurtle(){
 UART4_Write(0x5A);
 UART4_Write(0xA5);
 UART4_Write(0x05);
 UART4_Write(0x82);
 UART4_Write(0x54);
 UART4_Write(0x65);
 UART4_Write(0x00);
 UART4_Write(0x00);
}

void uart4SpeedModeRabbit(){
 UART4_Write(0x5A);
 UART4_Write(0xA5);
 UART4_Write(0x05);
 UART4_Write(0x82);
 UART4_Write(0x54);
 UART4_Write(0x65);
 UART4_Write(0x00);
 UART4_Write(0x01);
}

void uart4SpeedModeLeopard(){
 UART4_Write(0x5A);
 UART4_Write(0xA5);
 UART4_Write(0x05);
 UART4_Write(0x82);
 UART4_Write(0x54);
 UART4_Write(0x65);
 UART4_Write(0x00);
 UART4_Write(0x02);
}





void uart3SendJoystick(){

 UART3_Write(0x21);
 UART3_Write(0x40);
 UART3_Write((char)gear_status);
 UART3_Write((char)dutyy);
 if(control_taken){
 UART3_Write(0x01);
 }
 else{
 UART3_Write(0x00);
 }
 UART3_Write(0x3B);
}

void uart3SendJoystickForced(){

 UART3_Write(0x21);
 UART3_Write(0x40);
 UART3_Write((char)gear_status);
 UART3_Write((char)dutyy);
 UART3_Write(0x01);
 UART3_Write(0x3B);
}

void uart3ResetSensorTouch(){
 UART3_Write(0x21);
 UART3_Write(0x45);
 UART3_Write(0x01);
 UART3_Write(0x01);
 UART3_Write(0x01);
 UART3_Write(0x3B);
}
