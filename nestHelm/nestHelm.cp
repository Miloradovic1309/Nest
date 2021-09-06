#line 1 "C:/Users/Dan/Desktop/NNEESSTT/nestHelm/nestHelm.c"
#line 1 "c:/users/dan/desktop/nneesstt/nesthelm/externdef.h"




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
#line 1 "c:/users/dan/desktop/nneesstt/nesthelm/def.h"





sbit R_LIGHT at GPIOB_ODR.B15;
sbit N_LIGHT at GPIOB_ODR.B14;
sbit ONE_LIGHT at GPIOB_ODR.B13;
sbit TWO_LIGHT at GPIOB_ODR.B12;
sbit THREE_LIGHT at GPIOB_ODR.B11;

sbit ONE_TOUCH at GPIOB_IDR.B0;
sbit TWO_TOUCH at GPIOB_IDR.B1;
sbit THREE_TOUCH at GPIOB_IDR.B10;
sbit N_TOUCH at GPIOA_IDR.B7;
sbit R_TOUCH at GPIOA_IDR.B6;








sbit UART1_RXTX at GPIOA_ODR.B8;







sbit WHEEL_LIGHT at GPIOA_ODR.B15;
sbit WHEEL_TOUCH at GPIOA_IDR.B4;
sbit WHEEL_DIODE at GPIOB_ODR.B3;







sbit WTPSC at GPIOA_ODR.B5;
sbit GTPSC at GPIOB_ODR.B9;



sbit LED11 at GPIOC_ODR.B13;



unsigned int i = 0;
bit control_taken;



char receive1 = 0x00;
char uart_receive1[10];
unsigned int uart_count1 = 0;
bit startReceivingData1;
unsigned int uartLength1 = 0;


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
#line 1 "c:/users/dan/desktop/nneesstt/nesthelm/timers.h"


void InitTimer2(){
 RCC_APB1ENR.TIM2EN = 1;
 TIM2_CR1.CEN = 0;
 TIM2_PSC = 59;
 TIM2_ARR = 59999;
 NVIC_IntEnable(IVT_INT_TIM2);
 TIM2_DIER.UIE = 1;
 TIM2_CR1.CEN = 1;
}
#line 1 "c:/users/dan/desktop/nneesstt/nesthelm/eeprom.h"
void EEPROM_24C02_Init();
void EEPROM_24C02_WrSingle(unsigned short wAddr, unsigned short wData);
unsigned short EEPROM_24C02_RdSingle(unsigned int rAddr);
void citajeprom();
void eprompisi();

void eepromSaveRight();
void eepromSaveLeft();
void eepromDir();
#line 7 "C:/Users/Dan/Desktop/NNEESSTT/nestHelm/nestHelm.c"
int arrayDuty[5] = {150, 150, 150, 150, 150};
int dutyCounter = 0;
int dutyOld = 150;

int adc_array[300];
int adc_array_asc[300];
int tmp;
int j = 0;

float sensitivityDuty;
float sensitivityDuty2;
float directF;
float calDirectF;
int sensDuty = 150;



float fHalfSideDif;
float fHalfDuty;
float fHalfDutyAfterFun;
float fAdcAvgHalf;
float fAdcAvg;
float fDuty = 150f;



void setup_IWDG()
{
 IWDG_KR = 0x5555;
 IWDG_PR = 0x06;
 IWDG_RLR = 0x2FF;
 IWDG_KR = 0xAAAA;
 IWDG_KR = 0xCCCC;
}

void resetTouch(){
 WTPSC = 1;
 LED11 = 1;
 Delay_ms(100);
 WTPSC = 0;
 LED11 = 0;
}

void main() {


 UART1_Init_Advanced(115200, _UART_8_BIT_DATA, _UART_NOPARITY, _UART_ONE_STOPBIT, &_GPIO_MODULE_USART1_PA9_10);
 USART1_CR1bits.RXNEIE = 1;
 NVIC_IntEnable(IVT_INT_USART1);


 GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_8);



 GPIO_Config(&GPIOB_BASE, _GPIO_PINMASK_0 | _GPIO_PINMASK_1 |
 _GPIO_PINMASK_10,
 _GPIO_CFG_MODE_INPUT | _GPIO_CFG_PULL_DOWN);
 GPIO_Config(&GPIOA_BASE, _GPIO_PINMASK_7 | _GPIO_PINMASK_6,
 _GPIO_CFG_MODE_INPUT | _GPIO_CFG_PULL_DOWN);
 GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_15 | _GPIO_PINMASK_14 |
 _GPIO_PINMASK_13 | _GPIO_PINMASK_12 | _GPIO_PINMASK_11);



 GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_15);
 GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_3);
 GPIO_Config(&GPIOA_BASE, _GPIO_PINMASK_4,
 _GPIO_CFG_MODE_INPUT | _GPIO_CFG_PULL_NO);



 GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_5);
 GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_9);


 GPIO_Digital_Output(&GPIOC_BASE, _GPIO_PINMASK_13);






 SWJ_CFG0_bit = 0;
 SWJ_CFG1_bit = 1;
 SWJ_CFG2_bit = 0;

 WHEEL_DIODE = 0;
 WHEEL_LIGHT = 0;

 WTPSC = 0;



 GPIO_Analog_Input(&GPIOA_IDR, _GPIO_PINMASK_0);
 ADC1_Init();

 WTPSC = 1;
 LED11 = 1;
 Delay_ms(100);
 EEPROM_24C02_Init();
 Delay_ms(100);

 Delay_ms(100);
 citajeprom();
 Delay_ms(100);
 WTPSC = 0;
 LED11 = 0;

 bitResetTouchSensor = 0;


 startReceivingData1 = 0;
 control_taken = 0;
 bitDelay3Seconds = 0;
 bitStart3SecondsCount = 0;
 countedTimer = 0;
 bitRespond = 0;
 bitControlTaken = 0;

 bitCalSend = 0;

 if(leftLimit >= rightLimit){
 sideDifference = leftLimit - rightLimit;
 }
 else{
 sideDifference = rightLimit - leftLimit;
 }

 if(sideDifference == 0){
 sideDifference = 1;
 }



 InitTimer2();



 while(1){



 WHEEL_DIODE = WHEEL_TOUCH;
 WHEEL_LIGHT = WHEEL_TOUCH | bitDelay3Seconds;

 if(!bitControlTaken){

 if (Button(&GPIOB_IDR, 0, 20, 1)){
 ONE_LIGHT = 1;
 TWO_LIGHT = THREE_LIGHT = N_LIGHT = R_LIGHT = 0;


 }

 if (Button(&GPIOB_IDR, 1, 20, 1)){
 TWO_LIGHT = 1;
 ONE_LIGHT = THREE_LIGHT = N_LIGHT = R_LIGHT = 0;
 }

 if (Button(&GPIOB_IDR, 10, 20, 1)){
 THREE_LIGHT = 1;
 TWO_LIGHT = ONE_LIGHT = N_LIGHT = R_LIGHT = 0;
 }

 if (Button(&GPIOA_IDR, 7, 20, 1)){
 N_LIGHT = 1;
 TWO_LIGHT = THREE_LIGHT = ONE_LIGHT = R_LIGHT = 0;
#line 181 "C:/Users/Dan/Desktop/NNEESSTT/nestHelm/nestHelm.c"
 }

 if (Button(&GPIOA_IDR, 6, 20, 1)){
 R_LIGHT = 1;
 TWO_LIGHT = THREE_LIGHT = N_LIGHT = ONE_LIGHT = 0;
 }







 if(WHEEL_TOUCH || bitDelay3Seconds){
 if(WHEEL_TOUCH){
 bitDelay3Seconds = 1;
 bitStart3SecondsCount = 0;
 delay3secndsCount = 0;
 }
 else{
 bitStart3SecondsCount = 1;
 }

 if(THREE_LIGHT == 1){
 gear_status = 3;
 }

 if(TWO_LIGHT == 1){
 gear_status = 2;
 }

 if(ONE_LIGHT == 1){
 gear_status = 1;
 }

 if(R_LIGHT == 1){
 gear_status = 5;
 }

 if(N_LIGHT == 1){
 gear_status = 4;
 }

 }
 else{
 R_LIGHT = 0;
 ONE_LIGHT = 0;
 TWO_LIGHT = 0;
 THREE_LIGHT = 0;
 N_LIGHT = 1;
 gear_status = 4;
 }

 }






 if(countedTimer) {

 countedTimer = 0;


 for(i=0; i<300; i++){
 ADC_Set_Input_Channel(_ADC_CHANNEL_0);
 adc_read1 = ADC1_Get_Sample(0);

 adc_array[i] = adc_read1;
 }

 for(i=0; i<300; i++)
 {
 for(j=i+1; j<300; j++)
 {
 if(adc_array[j]<adc_array[i])
 {
 tmp = adc_array[i];
 adc_array[i] = adc_array[j];
 adc_array[j] = tmp;
 }
 }
 }

 for(i=100; i<200; i++){
 adcSum += adc_array[i];
 }


 adc_avg1 = ((float)adcSum)/100f;
 calAdcAvg = (long)(adc_avg1 * 100f);

 adcSum = 0;
 if(leftLimit <= rightLimit){
 adc_avg1 = adc_avg1 - (float)leftLimit;
 }
 else{
 adc_avg1 = adc_avg1 - (float)rightLimit;
 }
 if(adc_avg1 < 0f){
 adc_avg1 = 0f;
 }
 else if(adc_avg1 > (float)sideDifference){
 adc_avg1 = (float)sideDifference;
 }
#line 304 "C:/Users/Dan/Desktop/NNEESSTT/nestHelm/nestHelm.c"
 fHalfSideDif = sideDifference / 2f;

 if(adc_avg1 > fHalfSideDif){
 fAdcAvg = adc_avg1-fHalfSideDif;
 }
 else if(adc_avg1 < fHalfSideDif){
 fAdcAvg = fHalfSideDif-adc_avg1;
 }
 else{
 fAdcAvg = 0f;
 }

 fHalfDuty = (fAdcAvg * 5f) / (float)fHalfSideDif;
 fHalfDutyAfterFun = 4f * fHalfDuty * fHalfDuty;

 if(dir != 0){
 dutyF = ((adc_avg1 * 200f) / ((float)sideDifference)) + 50f;

 if(adc_avg1 < fHalfSideDif){
 fDuty = 150f - fHalfDutyAfterFun;
 }
 else if(adc_avg1 > fHalfSideDif){
 fDuty = 150f + fHalfDutyAfterFun;
 }
 else{
 fDuty = 150f;
 }


 }
 else{
 dutyF = 250f - ((adc_avg1 * 200f) / ((float)sideDifference));

 if(adc_avg1 < fHalfSideDif){
 fDuty = 150f + fHalfDutyAfterFun;
 }
 else if(adc_avg1 > fHalfSideDif){
 fDuty = 150f - fHalfDutyAfterFun;
 }
 else{
 fDuty = 150f;
 }
 }
 calDutyF = (long)(fDuty * 100f);



 if(((int)(dutyF * 10f)) % 10 >= 5){
 dutyy = (int)dutyF + 1;
 }
 else{
 dutyy = (int)dutyF;
 }



 calDuty = dutyy;




 if(((int)(fDuty * 10f)) % 10 >= 5){
 dutyy = (int)fDuty + 1;
 }
 else{
 dutyy = (int)fDuty;
 }
#line 385 "C:/Users/Dan/Desktop/NNEESSTT/nestHelm/nestHelm.c"
 if((!((dutyOld - 2 < dutyy) && (dutyy < dutyOld + 2))) && (dutyCounter < 3)){
 dutyy = dutyOld;
 dutyCounter++;
 }
 else{
 dutyCounter = 0;
 dutyOld = dutyy;
 }







 dutyyy = dutyy;

 adcSum = 0;

 }



 if(bitRespond){
 bitRespond = 0;
 uart1SendStatus(gear_status, dutyyy);
 }




 if(bitCalSend){
 bitCalSend = 0;

 uart1SendCallibration();
 }


 if(bitResetTouchSensor){
 bitResetTouchSensor = 0;
 resetTouch();

 }


 }




}
