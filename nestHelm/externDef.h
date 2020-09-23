
/*****************************************************************************/
/************ GEAR ***********************************************/
/*****************************************************************************/
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

/*****************************************************************************/
/************ GEAR END *******************************************************/
/*****************************************************************************/

/*****************************************************************************/
/************ UART1 BEGIN ****************************************************/
/*****************************************************************************/
extern sfr sbit UART1_RXTX;
/*****************************************************************************/
/************ UART1 END ******************************************************/
/*****************************************************************************/

/*****************************************************************************/
/************ JOYSTICK BEGIN *************************************************/
/*****************************************************************************/
extern sfr sbit WHEEL_LIGHT;
extern sfr sbit WHEEL_TOUCH;
extern sfr sbit WHEEL_DIODE;
/*****************************************************************************/
/************ JOYSTICK END ***************************************************/
/*****************************************************************************/

/*****************************************************************************/
/************ DJO BEGIN *************************************************/
/*****************************************************************************/
extern sfr sbit WTPSC;
extern sfr sbit GTPSC;
/*****************************************************************************/
/************ DJO END ***************************************************/
/*****************************************************************************/
extern sfr sbit LED11;


extern unsigned int i;
extern bit control_taken;


/********************* UART 1 JOYSTICK ***********************************************/
extern char receive1;
extern char uart_receive1[10];
extern unsigned int uart_count1;
extern bit startReceivingData1;
extern unsigned int uartLength1;
/*****************************************************************************/


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