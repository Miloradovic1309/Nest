





sbit M0         at GPIOA_ODR.B0;
sbit M1         at GPIOA_ODR.B1;

//sbit LED       at GPIOA_ODR.B7;
sbit LED       at GPIOB_ODR.B12;
//sbit LED1       at GPIOF_ODR.B10;

//sbit K0         at GPIOB_IDR.B8;
//sbit K1         at GPIOB_IDR.B9;

sbit AUX        at GPIOA_IDR.B4;




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

//int duty = 150;

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