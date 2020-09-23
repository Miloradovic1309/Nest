

/*****************************************************************************/
/************ GEAR ***********************************************/
/*****************************************************************************/
sbit R_LIGHT                  at GPIOB_ODR.B15;
sbit N_LIGHT                  at GPIOB_ODR.B14;
sbit ONE_LIGHT                at GPIOB_ODR.B13;
sbit TWO_LIGHT                at GPIOB_ODR.B12;
sbit THREE_LIGHT              at GPIOB_ODR.B11;

sbit ONE_TOUCH                at GPIOB_IDR.B0;
sbit TWO_TOUCH                at GPIOB_IDR.B1;
sbit THREE_TOUCH              at GPIOB_IDR.B10;
sbit N_TOUCH                  at GPIOA_IDR.B7;
sbit R_TOUCH                  at GPIOA_IDR.B6;

/*****************************************************************************/
/************ GEAR END *******************************************************/
/*****************************************************************************/

/*****************************************************************************/
/************ UART1 BEGIN ****************************************************/
/*****************************************************************************/
sbit UART1_RXTX               at GPIOA_ODR.B8;
/*****************************************************************************/
/************ UART1 END ******************************************************/
/*****************************************************************************/

/*****************************************************************************/
/************ JOYSTICK BEGIN *************************************************/
/*****************************************************************************/
sbit WHEEL_LIGHT              at GPIOA_ODR.B15;
sbit WHEEL_TOUCH              at GPIOA_IDR.B4;
sbit WHEEL_DIODE              at GPIOB_ODR.B3;
/*****************************************************************************/
/************ JOYSTICK END ***************************************************/
/*****************************************************************************/

/*****************************************************************************/
/************ DJO BEGIN *************************************************/
/*****************************************************************************/
sbit WTPSC                    at GPIOA_ODR.B5;
sbit GTPSC                    at GPIOB_ODR.B9;
/*****************************************************************************/
/************ DJO END ***************************************************/
/*****************************************************************************/
sbit LED11                    at GPIOC_ODR.B13;



unsigned int i = 0;
bit control_taken;


/********************* UART 1 JOYSTICK ***********************************************/
char receive1 = 0x00;
char uart_receive1[10];
unsigned int uart_count1 = 0;
bit startReceivingData1;
unsigned int uartLength1 = 0;
/*****************************************************************************/

unsigned int gear_status = 4;
unsigned int dir_status = 150;
bit bitDelay3Seconds;
bit bitStart3SecondsCount;
int delay3secndsCount;

bit countedTimer;
unsigned long adc_read1 = 0;
unsigned long adcSum = 0;
float adc_avg1;
float dutyF;

int dutyy = 150;
int dutyyy = 150;
bit bitRespond;
bit bitControlTaken;

bit bitCalSend;
long calAdcAvg = 0;
long calDutyF = 0;
int calDuty = 0;


unsigned int leftLimit = 0;
unsigned int rightLimit = 0;
unsigned short dir;
unsigned int sideDifference = 0;


bit bitResetTouchSensor;