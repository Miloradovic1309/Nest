#define FREQUENCY                       0x00

#define ADDRESS_PHONE                   0x25
#define ADDRESS_STATION                 0x30
#define ADDRES_BOAT                     0x40




#define PWM_FREQUENCY                    100

#define GEAR_VELOCITY_1                  0x1B//0X19
#define GEAR_VELOCITY_2                  0x2B//0X26
#define GEAR_VELOCITY_3                  0x4A//0x55//0x69//0x7F//0x3F//0x7F//0X39
#define GEAR_VELOCITY_R                  0x35//x26//0X19
#define GEAR_VELOCITY_S                  0x00


#define GEAR_VELOCITY_1_TURTLE           0x1B //255.11811//27
#define GEAR_VELOCITY_2_TURTLE           0x26 //359.05512//38
#define GEAR_VELOCITY_3_TURTLE           0x3B //557.48031//59
#define GEAR_VELOCITY_R_TURTLE           0x35 //500.7874 //53

#define GEAR_VELOCITY_1_RABBIT           0x20 //302.3622 //32
#define GEAR_VELOCITY_2_RABBIT           0x30 //453.54331//48
#define GEAR_VELOCITY_3_RABBIT           0x4A //699.2126 //74
#define GEAR_VELOCITY_R_RABBIT           0x35 //500.7874 //53

#define GEAR_VELOCITY_1_LEOPARD          0x35//500.74//53             //0x35 //500.7874 //53
#define GEAR_VELOCITY_2_LEOPARD          0x50//755.9//80              //0x55 //803.1496 //85
#define GEAR_VELOCITY_3_LEOPARD          0x65//954.3//101             //0x75 //1105.5118 //117
#define GEAR_VELOCITY_R_LEOPARD          0x35 //500.7874 //53


#define GEAR_DIRECTION_STREIGHT          0X01
#define GEAR_DIRECTION_BACK              0X00

/****************** WHEEL DEFINES ******************************************/
#define WHEEL_DIRECTION_STREIGHT         0
#define WHEEL_DIRECTION_LEFT             1
#define WHEEL_DIRECTION_RIGHT            2
/***************************************************************************/

#define GEAR1_TOUCH_PIN                  11//GPIOD_IDR.B11;
#define GEAR2_TOUCH_PIN                  10//GPIOD_IDR.B10;
#define GEAR3_TOUCH_PIN                  9//GPIOD_IDR.B9;
#define GEARN_TOUCH_PIN                  12//GPIOD_IDR.B12;
#define GEARB_TOUCH_PIN                  8//GPIOD_IDR.B8;


#define VELOCITY_TURTLE                  0
#define VELOCITY_RABBIT                  1
#define VELOCITY_LEOPARD                 2


/*
#define TS_NAVIGATION_LIGHT_PIN          5//GPIOE_IDR.B5
#define TS_INTERIOR_LIGHT_PIN            4//GPIOE_IDR.B4
#define TS_BATTERY1_PIN                  2//GPIOE_IDR.B2
#define TS_BATTERY2_PIN                  3//GPIOE_IDR.B3
*/




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
extern sfr sbit TS_NAVIGATION_LIGHT;
extern sfr sbit TS_INTERIOR_LIGHT;
extern sfr sbit TS_BATTERY1;
extern sfr sbit TS_BATTERY2;

extern sfr sbit LED_BATTERY1_100;
extern sfr sbit LED_BATTERY1_75;
extern sfr sbit LED_BATTERY1_50;
extern sfr sbit LED_BATTERY1_25;

extern sfr sbit LED_BATTERY2_100;
extern sfr sbit LED_BATTERY2_75;
extern sfr sbit LED_BATTERY2_50;
extern sfr sbit LED_BATTERY2_25;

extern sfr sbit LED_BATTERY2_TS;
extern sfr sbit LED_BATTERY1_TS;
extern sfr sbit LED_INTERIOR_LIGHT_TS;
extern sfr sbit LED_NAVIGATION_LIGHT_TS;
*/

extern sfr sbit LED1;
extern sfr sbit LED2;
extern sfr sbit LED3;
extern sfr sbit LED4;
extern sfr sbit LED5;



extern sfr sbit BUZZER_ALARM;
/*****************************************************************************/
/************ CONNECTOR1 END *************************************************/
/*****************************************************************************/


/*****************************************************************************/
/************ CONNECTOR2 BEGIN ***********************************************/
/*****************************************************************************/
extern sfr sbit LIGHT_NAVIGATION;
extern sfr sbit LIGHT_INTERIOR;
extern sfr sbit ACCUMULATORS_OFF;
extern sfr sbit ACCUMULATOR1_ON;
extern sfr sbit ACCUMULATOR2_ON;
/*****************************************************************************/
/************ CONNECTOR2 END *************************************************/
/*****************************************************************************/

/*****************************************************************************/
/************ CONNECTOR3 BEGIN ***********************************************/
/*****************************************************************************/
 /*
extern sfr sbit GEAR1_TOUCH;//GPIOD_IDR.B12;
extern sfr sbit GEAR2_TOUCH;//GPIOD_IDR.B11;
extern sfr sbit GEAR3_TOUCH;//GPIOD_IDR.B10;
extern sfr sbit GEARN_TOUCH;//GPIOD_IDR.B9;
extern sfr sbit GEARB_TOUCH;

extern sfr sbit GEAR1_LED;//GPIOD_ODR.B7;
extern sfr sbit GEAR2_LED;//GPIOD_ODR.B4;
extern sfr sbit GEAR3_LED;//GPIOD_ODR.B3;
extern sfr sbit GEARN_LED;//GPIOD_ODR.B1;
extern sfr sbit GEARB_LED;


extern sfr sbit TOUCH_WHEEL;
extern sfr sbit LED_WHEEL;
*/

extern sfr sbit ACCUMULATOR_SENSE;


/*****************************************************************************/
/************ CONNECTOR3 END *************************************************/
/*****************************************************************************/

/*****************************************************************************/
/************ LORA BEGIN *****************************************************/
/*****************************************************************************/
extern sfr sbit LORA_M0;
extern sfr sbit LORA_M1;
extern sfr sbit LORA_AUX;
/*****************************************************************************/
/************ LORA END *******************************************************/
/*****************************************************************************/

/*****************************************************************************/
/************ CONNECTOR4 BEGIN ***********************************************/
/*****************************************************************************/
extern sfr sbit UART1_RXTX;
extern sfr sbit UART3_RXTX;
/*****************************************************************************/
/************ CONNECTOR4 END *************************************************/
/*****************************************************************************/





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

/********************* PWM ***************************************************/
extern unsigned int pwm_ratio;
extern unsigned long pwm_frequency;
extern unsigned int pwm_duty;
extern double pwm_percent;
extern int dutyy;
extern long duzinaSignala2;
/*****************************************************************************/



/**************** MOTOR VELOCITY ********************************************/
extern unsigned short motorSpeed;
extern unsigned short motorSpeed_old;
extern unsigned short motorDirection;

/****************************************************************************/
/**************** GEAR POSITION *********************************************/
extern unsigned int gear_status;
extern unsigned int gear_status_old;
/****************************************************************************/
/**************** WHEEL POSITION ********************************************/
extern unsigned int wheel_position_angle;
extern unsigned int wheel_position_angle_old;
extern unsigned int wheel_position_direction;
extern unsigned int wheel_position_direction_old;
extern double wheel_position_angle_double;
/****************************************************************************/

/**************** Delay *****************************************************/
extern bit bitDelay3Seconds;
extern bit bitStart3SecondsCount;
extern unsigned int delay3secndsCount;
/****************************************************************************/

/**************** ADC1 MOTOR SERVO *******************************************************/
extern unsigned long adc_read1;
extern unsigned long adcSum;
extern float adc_avg1;
extern float dutyF;
/****************************************************************************/
/**************** ADC2 BATTERY *******************************************************/
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
/****************************************************************************/

/***************** communication *********************************************/
extern bit control_taken;
extern bit status_asked;
extern bit bitControlTaken;
extern int controlTakenCount;

extern bit bitBattery1Change;
extern bit bitBattery2Change;
/*****************************************************************************/


/********************* UART 6 LORA ***********************************************/
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

/*****************************************************************************/





/********************* UART 4 DISPLAY ***********************************************/
extern char receive4;
extern char uart_receive4[10];
extern unsigned int uart_count4;
extern bit startReceivingData4;
extern unsigned int uartLength4;
extern char rcv_helper4[2];
extern unsigned short rcv_count_helper4;
/*****************************************************************************/

/********************* UART 3 JOYSTICK ***********************************************/
extern char receive3;
extern char uart_receive3[10];
extern unsigned int uart_count3;
extern bit startReceivingData3;
extern unsigned int uartLength3;
/*****************************************************************************/


/******************** NEW COMMANDS *******************************************/
extern unsigned int activeBattery;
//extern unsigned int interiorLight;
extern unsigned int interiorLightState;
extern unsigned int interiorLightState_old;
//extern unsigned int navigationLight;
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


/*****************************************************************************/


void change_velocity_mode(unsigned int mode);