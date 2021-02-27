#line 1 "C:/Users/Dan/Downloads/NNEESSTT5/NNEESSTT/nestLora/nestLora.c"
#line 1 "c:/users/dan/downloads/nneesstt5/nneesstt/nestlora/def.h"






sbit M0 at GPIOA_ODR.B0;
sbit M1 at GPIOA_ODR.B1;


sbit LED at GPIOB_ODR.B12;





sbit AUX at GPIOA_IDR.B4;




char receive2;
char uart_receive2[12];
unsigned int uart_count2 = 0;
bit startReceivingData2;
unsigned int uartLength2;

char receive3;
char uart_receive3[13];
unsigned int uart_count3 = 0;
bit startReceivingData3;
unsigned int uartLength3;

int i =0;



bit bitReceivedCheckStatusOfBoat;
bit bitReceivedStatusOfBoat;
bit bitExpectAnswer;

char addressBoat[2];

char boatGear = 0;
char boatDir = 150;
char boatInteriorLight = 0;
char boatNavigationLight = 0;
char boatControlTaken = 0;
char boatConnected = 0x00;

char boatBattery1 = 0x00;
char boatBattery2 = 0x00;
char boatBatteriesLavel = 0x00;

char boatStatus = 0x00;
char boatStatusGear = 0x00;
char boatStatusWheel = 0x96;
#line 1 "c:/users/dan/downloads/nneesstt5/nneesstt/nestlora/externdef.h"









extern sfr sbit M0;
extern sfr sbit M1;

extern sfr sbit LED;


extern sfr sbit K0;
extern sfr sbit K1;

extern sfr sbit AUX;



extern char receive2;
extern char uart_receive2[12];
extern unsigned int uart_count2;
extern bit startReceivingData2;
extern unsigned int uartLength2;

extern char receive3;
extern char uart_receive3[13];
extern unsigned int uart_count3;
extern bit startReceivingData3;
extern unsigned int uartLength3;

extern int i;

extern int duty;

extern bit bitReceivedCheckStatusOfBoat;
extern bit bitReceivedStatusOfBoat;
extern bit bitExpectAnswer;


extern char addressBoat[2];

extern char boatGear;
extern char boatDir;
extern char boatInteriorLight;
extern char boatNavigationLight;
extern char boatControlTaken;
extern char boatConnected;

extern char boatStatus;
extern char boatStatusGear;
extern char boatStatusWheel;


extern char boatBattery1;
extern char boatBattery2;
extern char boatBatteriesLavel;



void uartRequestStatusFromBoat();

void sendRequestStatusToAndroid();
#line 1 "c:/users/dan/downloads/nneesstt5/nneesstt/nestlora/timers.h"
#line 21 "c:/users/dan/downloads/nneesstt5/nneesstt/nestlora/timers.h"
void InitTimer2(){
 RCC_APB1ENR.TIM2EN = 1;
 TIM2_CR1.CEN = 0;
 TIM2_PSC = 319;
 TIM2_ARR = 62499;
 NVIC_IntEnable(IVT_INT_TIM2);
 TIM2_DIER.UIE = 1;
 TIM2_CR1.CEN = 1;
}
#line 5 "C:/Users/Dan/Downloads/NNEESSTT5/NNEESSTT/nestLora/nestLora.c"
void setup_IWDG()
{
 IWDG_KR = 0x5555;
 IWDG_PR = 0x06;
 IWDG_RLR = 0x2FF;
 IWDG_KR = 0xAAAA;
 IWDG_KR = 0xCCCC;
}



void main() {

 UART2_Init_Advanced(115200, _UART_8_BIT_DATA, _UART_NOPARITY, _UART_ONE_STOPBIT, &_GPIO_MODULE_USART2_PA23);
 USART2_CR1bits.RXNEIE = 1;
 NVIC_IntEnable(IVT_INT_USART2);
#line 28 "C:/Users/Dan/Downloads/NNEESSTT5/NNEESSTT/nestLora/nestLora.c"
 UART3_Init_Advanced(115200, _UART_8_BIT_DATA, _UART_NOPARITY, _UART_ONE_STOPBIT, &_GPIO_MODULE_USART3_PB10_11);
 USART3_CR1bits.RXNEIE = 1;
 NVIC_IntEnable(IVT_INT_USART3);


 GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_0 | _GPIO_PINMASK_1);



 GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_12);





 GPIO_Config(&GPIOA_BASE, _GPIO_PINMASK_4, _GPIO_CFG_MODE_INPUT | _GPIO_CFG_PULL_NO);

 LED = 0;



 M0 = 0;
 M1 = 0;


 bitReceivedCheckStatusOfBoat = 0;
 bitReceivedStatusOfBoat = 0;
 bitExpectAnswer = 0;

 InitTimer2();
#line 73 "C:/Users/Dan/Downloads/NNEESSTT5/NNEESSTT/nestLora/nestLora.c"
 setup_IWDG();


 Delay_ms(100);

 while(1){
 IWDG_KR = 0xAAAA;







 if(bitReceivedCheckStatusOfBoat){
 bitReceivedCheckStatusOfBoat = 0;
 uartRequestStatusFromBoat();
 }



 if(bitReceivedStatusOfBoat){
 bitReceivedStatusOfBoat = 0;
 sendRequestStatusToAndroid();
 bitExpectAnswer = 0;
 boatConnected = 0x00;


 }






 }

}
