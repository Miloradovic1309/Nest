

/*****************************************************************************/
/************ CONTROLLER BEGIN ************************************************/
/*****************************************************************************/
//sbit LED_C                    at GPIOA_ODR.B1;
//sbit TS_C                     at GPIOA_IDR.B0;
/*****************************************************************************/
/************ CONTROLLER END **************************************************/
/*****************************************************************************/

/*****************************************************************************/
/************ CONNECTOR1 BEGIN ***********************************************/
/*****************************************************************************/
/*
sbit TS_NAVIGATION_LIGHT      at GPIOE_IDR.B5;
sbit TS_INTERIOR_LIGHT        at GPIOE_IDR.B4;
sbit TS_BATTERY1              at GPIOE_IDR.B2;
sbit TS_BATTERY2              at GPIOE_IDR.B3;

sbit LED_BATTERY1_100         at GPIOE_ODR.B13;
sbit LED_BATTERY1_75          at GPIOE_ODR.B14;
sbit LED_BATTERY1_50          at GPIOE_ODR.B11;
sbit LED_BATTERY1_25          at GPIOE_ODR.B12;

sbit LED_BATTERY2_100         at GPIOE_ODR.B9;
sbit LED_BATTERY2_75          at GPIOE_ODR.B10;
sbit LED_BATTERY2_50          at GPIOE_ODR.B7;
sbit LED_BATTERY2_25          at GPIOE_ODR.B8;

sbit LED_BATTERY2_TS          at GPIOB_ODR.B0;
sbit LED_BATTERY1_TS          at GPIOC_ODR.B4;
sbit LED_INTERIOR_LIGHT_TS    at GPIOC_ODR.B0;
sbit LED_NAVIGATION_LIGHT_TS  at GPIOC_ODR.B2;
*/


sbit LED1                     at GPIOB_ODR.B14;
sbit LED2                     at GPIOB_ODR.B15;
sbit LED3                     at GPIOD_ODR.B8;
sbit LED4                     at GPIOD_ODR.B9;
sbit LED5                     at GPIOD_ODR.B10;

/*
sbit D_LORA                   at GPIOD_ODR.B10;
sbit D_HELM                   at GPIOD_ODR.B9;
sbit D_LVL2                   at GPIOD_ODR.B8;
sbit D_LVL1                   at GPIOB_ODR.B15;
sbit D_SENS                   at GPIOD_ODR.B14;
*/

sbit BUZZER_ALARM             at GPIOD_ODR.B11;
/*****************************************************************************/
/************ LIGHT BEGIN ****************************************************/
/*****************************************************************************/
sbit LIGHT_NAVIGATION         at GPIOD_ODR.B3;
sbit LIGHT_INTERIOR           at GPIOD_ODR.B4;
/*****************************************************************************/
/************ LIGHT END *************************************************/
/*****************************************************************************/


/*****************************************************************************/
/************ ACCUMULATOR BEGIN ***********************************************/
/*****************************************************************************/
sbit ACCUMULATORS_OFF         at GPIOD_ODR.B5;
sbit ACCUMULATOR1_ON          at GPIOD_ODR.B7;
sbit ACCUMULATOR2_ON          at GPIOD_ODR.B6;
sbit ACCUMULATOR_SENSE        at GPIOA_IDR.B6;
/*****************************************************************************/
/************ ACCUMULATOR END *************************************************/
/*****************************************************************************/

/*****************************************************************************/
/************ GEAR BEGIN ***********************************************/
/*****************************************************************************/
/*
sbit GEAR1_TOUCH              at GPIOD_IDR.B11;//GPIOD_IDR.B12;
sbit GEAR2_TOUCH              at GPIOD_IDR.B10;//GPIOD_IDR.B11;
sbit GEAR3_TOUCH              at GPIOD_IDR.B9;//GPIOD_IDR.B10;
sbit GEARN_TOUCH              at GPIOD_IDR.B12;//GPIOD_IDR.B9;
sbit GEARB_TOUCH              at GPIOD_IDR.B8;

sbit GEAR1_LED                at GPIOD_ODR.B4;//GPIOD_ODR.B7;
sbit GEAR2_LED                at GPIOD_ODR.B3;//GPIOD_ODR.B4;
sbit GEAR3_LED                at GPIOD_ODR.B1;//GPIOD_ODR.B3;
sbit GEARN_LED                at GPIOD_ODR.B7;//GPIOD_ODR.B1;
sbit GEARB_LED                at GPIOD_ODR.B0;

sbit TOUCH_WHEEL              at GPIOB_IDR.B9;
sbit LED_WHEEL                at GPIOB_ODR.B8;
*/
/*****************************************************************************/
/************ GEAR END *************************************************/
/*****************************************************************************/

/*****************************************************************************/
/************ LORA BEGIN *****************************************************/
/*****************************************************************************/
sbit LORA_M0                  at GPIOD_ODR.B15;
sbit LORA_M1                  at GPIOD_ODR.B14;
sbit LORA_AUX                 at GPIOD_ODR.B13;
/*****************************************************************************/
/************ LORA END *******************************************************/
/*****************************************************************************/

/*****************************************************************************/
/************ UART BITS BEGIN ***********************************************/
/*****************************************************************************/
sbit UART1_RXTX               at GPIOA_ODR.B8;     // Motor
sbit UART3_RXTX               at GPIOE_ODR.B15;    // Joystick
sbit UART4_RXTX               at GPIOB_ODR.B0;     // Display
sbit UART6_RXTX               at GPIOC_ODR.B8;     // Lora
/*****************************************************************************/
/************ UART BITS END *************************************************/
/*****************************************************************************/



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





/********************* PWM ***************************************************/
unsigned int pwm_ratio;
unsigned long pwm_frequency = 100;
unsigned int pwm_duty;
double pwm_percent = (double)7.5;
int dutyy = 150;
long duzinaSignala2 = 150;
/*****************************************************************************/





/**************** MOTOR VELOCITY ********************************************/
unsigned short motorSpeed = 0;
unsigned short motorSpeed_old = 127;
unsigned short motorDirection = 0;

/****************************************************************************/
/**************** GEAR POSITION *********************************************/
unsigned int gear_status = 4;
unsigned int gear_status_old =  0;
/****************************************************************************/

/**************** WHEEL POSITION ********************************************/
unsigned int wheel_position_angle = 0;
unsigned int wheel_position_angle_old = 0;
unsigned int wheel_position_direction = 0;
unsigned int wheel_position_direction_old = 0;
double wheel_position_angle_double = (double)0;
/****************************************************************************/

/**************** ADC1 *******************************************************/
unsigned long adc_read1 = 0;
unsigned long adcSum = 0;
float adc_avg1;
float dutyF;
/****************************************************************************/
/**************** ADC2 *******************************************************/
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
/****************************************************************************/

/**************** Delay *****************************************************/
bit bitDelay3Seconds;
bit bitStart3SecondsCount;
unsigned int delay3secndsCount = 0;
/****************************************************************************/

/***************** communication *********************************************/
bit control_taken;
bit status_asked;
bit bitControlTaken;
int controlTakenCount = 0;

bit bitBattery1Change;
bit bitBattery2Change;
/*****************************************************************************/


/********************* UART 6 LORA ***********************************************/
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
/*****************************************************************************/

/********************* UART 4 DISPLAY ***********************************************/
char receive4 = 0;
char uart_receive4[10];
unsigned int uart_count4 = 0;
bit startReceivingData4;
unsigned int uartLength4 = 0;
char rcv_helper4[2];
unsigned short rcv_count_helper4 = 0;
/*****************************************************************************/

/********************* UART 3 JOYSTICK ***********************************************/
char receive3 = 0x00;
char uart_receive3[10];
unsigned int uart_count3 = 0;
bit startReceivingData3;
unsigned int uartLength3;
/*****************************************************************************/


/******************** NEW COMMANDS *******************************************/
unsigned int activeBattery = 0;
//unsigned int interiorLight = 0;
unsigned int interiorLightState = 0;
unsigned int interiorLightState_old = 0;
//unsigned int navigationLight = 0;
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




/*****************************************************************************/