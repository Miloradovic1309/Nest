#line 1 "C:/Users/Dan/Downloads/NNEESSTT5/NNEESSTT/nestMainBoard/nest.c"
#line 1 "c:/users/dan/downloads/nneesstt5/nneesstt/nestmainboard/def.h"
#line 38 "c:/users/dan/downloads/nneesstt5/nneesstt/nestmainboard/def.h"
sbit LED1 at GPIOB_ODR.B14;
sbit LED2 at GPIOB_ODR.B15;
sbit LED3 at GPIOD_ODR.B8;
sbit LED4 at GPIOD_ODR.B9;
sbit LED5 at GPIOD_ODR.B10;
#line 52 "c:/users/dan/downloads/nneesstt5/nneesstt/nestmainboard/def.h"
sbit BUZZER_ALARM at GPIOD_ODR.B11;



sbit LIGHT_NAVIGATION at GPIOD_ODR.B3;
sbit LIGHT_INTERIOR at GPIOD_ODR.B4;








sbit ACCUMULATORS_OFF at GPIOD_ODR.B5;
sbit ACCUMULATOR1_ON at GPIOD_ODR.B7;
sbit ACCUMULATOR2_ON at GPIOD_ODR.B6;
sbit ACCUMULATOR_SENSE at GPIOA_IDR.B6;
#line 100 "c:/users/dan/downloads/nneesstt5/nneesstt/nestmainboard/def.h"
sbit LORA_M0 at GPIOD_ODR.B15;
sbit LORA_M1 at GPIOD_ODR.B14;
sbit LORA_AUX at GPIOD_ODR.B13;







sbit UART1_RXTX at GPIOA_ODR.B8;
sbit UART3_RXTX at GPIOE_ODR.B15;
sbit UART4_RXTX at GPIOB_ODR.B0;
sbit UART6_RXTX at GPIOC_ODR.B8;






int i = 0;
bit countedTimer;
unsigned long buzzerCounter = 0;
int battery_chosen = 1;
int battery_chosen_old = 0;
bit battery_change;
int battery_change_count = 0;
bit battery_change_continue;
bit oldStateInteriorLight;
bit oldStateNavigationLight;
bit oldStateBattery1;
bit oldStateBattery2;






unsigned int pwm_ratio;
unsigned long pwm_frequency = 100;
unsigned int pwm_duty;
double pwm_percent = (double)7.5;
int dutyy = 150;
long duzinaSignala2 = 150;







unsigned short motorSpeed = 0;
unsigned short motorSpeed_old = 127;
unsigned short motorDirection = 0;



unsigned int gear_status = 4;
unsigned int gear_status_old = 0;



unsigned int wheel_position_angle = 0;
unsigned int wheel_position_angle_old = 0;
unsigned int wheel_position_direction = 0;
unsigned int wheel_position_direction_old = 0;
double wheel_position_angle_double = (double)0;



unsigned long adc_read1 = 0;
unsigned long adcSum = 0;
float adc_avg1;
float dutyF;


unsigned long adc_read2 = 0;
unsigned long adcSum2 = 0;
float adc_avg2;
float battery_percentage1;

unsigned long adc_read3 = 0;
unsigned long adcSum3 = 0;
float adc_avg3;
float battery_percentage2;

bit battry_percentage_check;
unsigned int battry_percentage_check_counter = 0;



bit bitDelay3Seconds;
bit bitStart3SecondsCount;
unsigned int delay3secndsCount = 0;



bit control_taken;
bit status_asked;
bit bitControlTaken;
int controlTakenCount = 0;

bit bitBattery1Change;
bit bitBattery2Change;




char receive6 = 0;
char uart_receive6[12];
unsigned int uart_count6 = 0;
bit startReceivingData6;
unsigned int uartLength6 = 0;
bit receivedCheckStatus;

char boatControlTaken = 0x00;
char boatInteriorLight = 0x00;
char boatNavigationLight = 0x00;
char boatWheelDir = 150;

char boatBattery1 = 0x00;
char boatBattery2 = 0x00;
char boatBatteriesLavel = 0x00;



char receive4 = 0;
char uart_receive4[10];
unsigned int uart_count4 = 0;
bit startReceivingData4;
unsigned int uartLength4 = 0;
char rcv_helper4[2];
unsigned short rcv_count_helper4 = 0;



char receive3 = 0x00;
char uart_receive3[10];
unsigned int uart_count3 = 0;
bit startReceivingData3;
unsigned int uartLength3;




unsigned int activeBattery = 0;

unsigned int interiorLightState = 0;
unsigned int interiorLightState_old = 0;

unsigned int navigationLightState = 0;
unsigned int navigationLightState_old = 0;


unsigned int wannaBeActiveBattery1 = 0;
unsigned int wannaBeActiveBattery2 = 0;
unsigned int wannaBeActiveBattery1_old = 0;
unsigned int wannaBeActiveBattery2_old = 0;

bit bitCheckJoystick;
unsigned int countJoystickConnection = 0;

bit navLightOn;
bit navLightOff;
bit intLightOn;
bit intLightOff;
bit bat1On;
bit bat1Off;
bit bat2On;
bit bat2Off;



bit bitCheckStatusJoystick;
bit bitCheckStatusDisplay;
unsigned int couterJoystickDisplay = 0;

int paljenjeLedTestcounter = 0;
unsigned int countedTimerCount = 0;
bit countedTimer2;

bit sentToJoystick;
bit sentToMotor;


unsigned long adc_array2[300];
unsigned long adc_array3[300];
unsigned int j = 0;
unsigned long tmp = 0;

bit resetTouchSensor;
bit resetedTouchSensor;




unsigned int velocity_mode;
unsigned int velocity_gear1;
unsigned int velocity_gear2;
unsigned int velocity_gear3;
unsigned int velocity_gearR;
unsigned int velocity_gearS;

unsigned int velocity_mode_new = 3;
unsigned int velocity_mode_mobile = 1;

unsigned int velocity_mode_send = 0;
unsigned int velocity_mode_save = 1;

bit beingControlledByMobile;

bit controlWasTaken;
bit stopGearBit;
bit bitCheckIsItStoppedGear;


bit bitBatteryChangeBlockCounter;
unsigned int batteryChangeBlockCounter = 0;
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
#line 1 "c:/users/dan/downloads/nneesstt5/nneesstt/nestmainboard/crc.h"

unsigned int ModRTU_CRC(char buf[], int len);
unsigned short ModRTU_CRC_Hb(char buf[], int len);
unsigned short ModRTU_CRC_Lb(char buf[], int len);

unsigned short crc8(unsigned short dir, unsigned short speed);
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
#line 1 "c:/users/dan/downloads/nneesstt5/nneesstt/nestmainboard/timers.h"


void InitTimer2(){
 RCC_APB1ENR.TIM2EN = 1;
 TIM2_CR1.CEN = 0;
 TIM2_PSC = 13;
 TIM2_ARR = 59999;
 NVIC_IntEnable(IVT_INT_TIM2);
 TIM2_DIER.UIE = 1;
 TIM2_CR1.CEN = 1;
}



void InitTimer4(){
 RCC_APB1ENR.TIM4EN = 1;
 TIM4_CR1.CEN = 0;
 TIM4_PSC = 69;
 TIM4_ARR = 59999;
 NVIC_IntEnable(IVT_INT_TIM4);
 TIM4_DIER.UIE = 1;
 TIM4_CR1.CEN = 1;
}
#line 7 "C:/Users/Dan/Downloads/NNEESSTT5/NNEESSTT/nestMainBoard/nest.c"
void batteryChangeState(void);
void batteryLavelMeasure(void);
void directionWheelADC(void);
void gearVelocityMotorSpeedControl(void);
void batteryControlSwitches(void);
void lightControlSwitches(void);






void setup_IWDG()
{
 IWDG_KR = 0x5555;
 IWDG_PR = 0x06;
 IWDG_RLR = 0x1FF;
 IWDG_KR = 0xAAAA;
 IWDG_KR = 0xCCCC;
}





void main() {


 FLASH_OPTKEYR = 0x08192A3B;
 FLASH_OPTKEYR = 0x4C5D6E7F;

 BOR_LEV0_bit = 0;
 BOR_LEV1_bit = 1;

 FLASH_OPTCR |= 0x01;
 FLASH_OPTCR |= 0x02;



 UART6_Init_Advanced(115200, _UART_8_BIT_DATA, _UART_NOPARITY, _UART_ONE_STOPBIT, &_GPIO_MODULE_USART6_PC67);
 USART6_CR1bits.RXNEIE = 1;
 NVIC_IntEnable(IVT_INT_USART6);



 UART4_Init_Advanced(115200, _UART_8_BIT_DATA, _UART_NOPARITY, _UART_ONE_STOPBIT, &_GPIO_MODULE_UART4_PA01 );
 UART4_CR1bits.RXNEIE = 1;
 NVIC_IntEnable(IVT_INT_UART4);









 UART1_Init_Advanced(38400, _UART_8_BIT_DATA, _UART_NOPARITY, _UART_ONE_STOPBIT, &_GPIO_MODULE_USART1_PA9_10);





 UART3_Init_Advanced(115200, _UART_8_BIT_DATA, _UART_NOPARITY, _UART_ONE_STOPBIT, &_GPIO_MODULE_USART3_PB10_11);
 USART3_CR1bits.RXNEIE = 1;
 NVIC_IntEnable(IVT_INT_USART3);



 I2C1_Init_Advanced(100000, &_GPIO_MODULE_I2C1_PB67);



 GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_15);
 GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_8);
 GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_4);
 GPIO_Digital_Output(&GPIOC_BASE, _GPIO_PINMASK_8);






 GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_11);
 GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_3 | _GPIO_PINMASK_4);
 GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_7 | _GPIO_PINMASK_6
 | _GPIO_PINMASK_5);

 GPIO_Config(&GPIOA_BASE, _GPIO_PINMASK_6,
 _GPIO_CFG_MODE_INPUT | _GPIO_CFG_PULL_DOWN);

 GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_15 | _GPIO_PINMASK_14);

 GPIO_Config(&GPIOD_BASE, _GPIO_PINMASK_13,
 _GPIO_CFG_MODE_INPUT | _GPIO_CFG_PULL_UP);

 GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_14 | _GPIO_PINMASK_15);
 GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_8 | _GPIO_PINMASK_9 | _GPIO_PINMASK_10);



 GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_7);
 pwm_ratio = PWM_TIM3_Init(pwm_frequency);
 pwm_duty = ((unsigned int)((double)(((double)(((double)pwm_ratio) * pwm_percent)) / ((double)100))));
 PWM_TIM3_Set_Duty(pwm_duty, _PWM_NON_INVERTED, _PWM_CHANNEL2);
 PWM_TIM3_Start(_PWM_CHANNEL2, &_GPIO_MODULE_TIM3_CH2_PA7);
#line 119 "C:/Users/Dan/Downloads/NNEESSTT5/NNEESSTT/nestMainBoard/nest.c"
 GPIO_Analog_Input(&GPIOA_IDR, _GPIO_PINMASK_5);
 GPIO_Analog_Input(&GPIOA_IDR, _GPIO_PINMASK_4);
 ADC2_Init();
#line 148 "C:/Users/Dan/Downloads/NNEESSTT5/NNEESSTT/nestMainBoard/nest.c"
 uart4Battery1Level0();
 uart4Battery2Level0();
 uart4Battery1TurnedOff();
 uart4Battery2TurnedOff();
 uart4InteriorLightTurnedOff();
 uart4NavigationLightTurnedOff();
 uart4LightingTurnedOff();


 LIGHT_NAVIGATION = 0;
 LIGHT_INTERIOR = 0;
#line 170 "C:/Users/Dan/Downloads/NNEESSTT5/NNEESSTT/nestMainBoard/nest.c"
 countedTimer = 0;

 bitDelay3Seconds = 0;
 bitStart3SecondsCount = 0;
 battery_change = 0;
 battery_change_continue = 0;
 oldStateInteriorLight = 0;
 oldStateNavigationLight = 0;
 battery_chosen = 0;
 battery_chosen_old = 0;
 oldStateBattery1 = 0;
 oldStateBattery2 = 0;
 battry_percentage_check = 0;
 control_taken = 0;
 status_asked = 0;

 startReceivingData6 = 0;
 receivedCheckStatus = 0;

 bitBattery1Change = 0;
 bitBattery2Change = 0;

 bitCheckJoystick = 0;

 startReceivingData4 = 0;
 startReceivingData3 = 0;

 resetTouchSensor = 0;
 resetedTouchSensor = 0;

 bitBatteryChangeBlockCounter = 0;




 ACCUMULATORS_OFF = 0;
 ACCUMULATOR1_ON = 0;
 ACCUMULATOR2_ON = 0;



 LORA_M0 = 0;
 LORA_M1 = 0;

 navLightOff = 0;
 navLightOn = 0;
 intLightOn = 0;
 intLightOff = 0;
 bat1On = 0;
 bat1Off = 0;
 bat2On = 0;
 bat2Off = 0;

 bitCheckStatusJoystick = 0;
 bitCheckStatusDisplay = 0;

 countedTimer2 = 0;

 controlWasTaken = 0;
 stopGearBit = 0;
 bitCheckIsItStoppedGear = 0;
#line 243 "C:/Users/Dan/Downloads/NNEESSTT5/NNEESSTT/nestMainBoard/nest.c"
 LED1 = 0;
 LED2 = 0;
 LED3 = 0;
 LED4 = 0;
 LED5 = 0;
 Delay_ms(500);

 battery_chosen = 0;
 battery_chosen_old = 3;
 battry_percentage_check = 1;

 InitTimer2();
 InitTimer4();
#line 275 "C:/Users/Dan/Downloads/NNEESSTT5/NNEESSTT/nestMainBoard/nest.c"
 beingControlledByMobile = 1;
 velocity_mode_new =  1 ;
 velocity_mode =  1 ;





 Delay_ms(700);
 change_velocity_mode(velocity_mode);
 Delay_ms(50);


 setup_IWDG();

 while(1){





 batteryChangeState();
 lightControlSwitches();
 batteryControlSwitches();
 gearVelocityMotorSpeedControl();
 directionWheelADC();
 batteryLavelMeasure();

 LED5 = ACCUMULATOR_SENSE;

 if(control_taken){
 controlWasTaken = 1;
 }

 if(controlWasTaken && !control_taken){
 controlWasTaken = 0;
 if(gear_status != 4){
 stopGearBit = 1;
 }
 }




 if(receivedCheckStatus){
 receivedCheckStatus = 0;
 uartSendStatusToStation();

 }

 if(control_taken){boatControlTaken = 0x01;}
 else{boatControlTaken = 0x00;}

 if(LIGHT_INTERIOR){boatInteriorLight = 0x02; LED2 = 1;}
 else{boatInteriorLight = 0x00; LED2 = 0;}

 if(LIGHT_NAVIGATION){boatNavigationLight = 0x04; LED3 = 1;}
 else{boatNavigationLight = 0x00; LED3 = 0;}


 if(activeBattery == 1){boatBattery1 = 0x08;}
 else{boatBattery1 = 0x00;}

 if(activeBattery == 2){boatBattery2 = 0x10;}
 else{boatBattery2 = 0x00;}

 if(activeBattery == 0){
 boatBattery1 = 0x00;
 boatBattery2 = 0x00;
 }







 if(bitCheckJoystick){
 gear_status = 4;
 dutyy = 150;
 }

 if(navLightOn){
 navLightOn = 0;
 if(navigationLightState == 1){
 uart4NavigationLightTurnedOn();
 }
 }
 if(navLightOff){
 navLightOff = 0;
 if(navigationLightState == 0){
 uart4NavigationLightTurnedOff();
 }
 }

 if(intLightOn){
 intLightOn = 0;
 if(interiorLightState == 1){
 uart4InteriorLightTurnedOn();
 }
 }

 if(intLightOff){
 intLightOff = 0;
 if(interiorLightState == 0){
 uart4InteriorLightTurnedOff();
 }
 }
#line 407 "C:/Users/Dan/Downloads/NNEESSTT5/NNEESSTT/nestMainBoard/nest.c"
 if(bitCheckStatusDisplay){
 bitCheckStatusDisplay = 0;

 IWDG_KR = 0xAAAA;

 LED1 = ~LED1;
 uart4CheckNavigationLightStatus();
 uart4CheckInteriorLightStatus();
 uart4CheckBattery1Status();
 uart4CheckBattery2Status();

 uart4TurtleCheckStatus();
 uart4RabbitCheckStatus();
 uart4LeopardCheckStatus();

 if((beingControlledByMobile) && (!control_taken)){
 beingControlledByMobile = 0;
 velocity_mode = velocity_mode_new;
 change_velocity_mode(velocity_mode);
 }
 }

 if(bitCheckStatusJoystick){
 bitCheckStatusJoystick = 0;

 LED1 = ~LED1;
 if(stopGearBit){
 stopGearBit = 0;
 gear_status = 4;
 bitCheckIsItStoppedGear = 1;
 uart3SendJoystickForced();
 }
 else if(resetTouchSensor){
 resetTouchSensor = 0;
 uart3ResetSensorTouch();
 }
 else{
 uart3SendJoystick();
 }
 }


 if(bitCheckJoystick){
 bitCheckJoystick = 0;
 gear_status = 4;
 }






 }

}
