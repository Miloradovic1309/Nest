_InitTimer2:
;timers.h,21 :: 		void InitTimer2(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;timers.h,22 :: 		RCC_APB1ENR.TIM2EN = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
_SX	[R0, ByteOffset(RCC_APB1ENR+0)]
;timers.h,23 :: 		TIM2_CR1.CEN = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
_SX	[R0, ByteOffset(TIM2_CR1+0)]
;timers.h,24 :: 		TIM2_PSC = 319;
MOVW	R1, #319
MOVW	R0, #lo_addr(TIM2_PSC+0)
MOVT	R0, #hi_addr(TIM2_PSC+0)
STR	R1, [R0, #0]
;timers.h,25 :: 		TIM2_ARR = 62499;
MOVW	R1, #62499
MOVW	R0, #lo_addr(TIM2_ARR+0)
MOVT	R0, #hi_addr(TIM2_ARR+0)
STR	R1, [R0, #0]
;timers.h,26 :: 		NVIC_IntEnable(IVT_INT_TIM2);
MOVW	R0, #44
BL	_NVIC_IntEnable+0
;timers.h,27 :: 		TIM2_DIER.UIE = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_DIER+0)
MOVT	R0, #hi_addr(TIM2_DIER+0)
_SX	[R0, ByteOffset(TIM2_DIER+0)]
;timers.h,28 :: 		TIM2_CR1.CEN = 1;
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
_SX	[R0, ByteOffset(TIM2_CR1+0)]
;timers.h,29 :: 		}
L_end_InitTimer2:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _InitTimer2
_setup_IWDG:
;nestLora.c,5 :: 		void setup_IWDG()
;nestLora.c,7 :: 		IWDG_KR = 0x5555;    //Disable write protection of IWDG registers
MOVW	R1, #21845
MOVW	R0, #lo_addr(IWDG_KR+0)
MOVT	R0, #hi_addr(IWDG_KR+0)
STR	R1, [R0, #0]
;nestLora.c,8 :: 		IWDG_PR = 0x06;      //Set PR value
MOVS	R1, #6
MOVW	R0, #lo_addr(IWDG_PR+0)
MOVT	R0, #hi_addr(IWDG_PR+0)
STR	R1, [R0, #0]
;nestLora.c,9 :: 		IWDG_RLR = 0x2FF;     //Set RLR value
MOVW	R1, #767
MOVW	R0, #lo_addr(IWDG_RLR+0)
MOVT	R0, #hi_addr(IWDG_RLR+0)
STR	R1, [R0, #0]
;nestLora.c,10 :: 		IWDG_KR = 0xAAAA;    //Reload IWDG
MOVW	R1, #43690
MOVW	R0, #lo_addr(IWDG_KR+0)
MOVT	R0, #hi_addr(IWDG_KR+0)
STR	R1, [R0, #0]
;nestLora.c,11 :: 		IWDG_KR = 0xCCCC;    //Start IWDG
MOVW	R1, #52428
MOVW	R0, #lo_addr(IWDG_KR+0)
MOVT	R0, #hi_addr(IWDG_KR+0)
STR	R1, [R0, #0]
;nestLora.c,12 :: 		}
L_end_setup_IWDG:
BX	LR
; end of _setup_IWDG
_main:
;nestLora.c,16 :: 		void main() {
;nestLora.c,18 :: 		UART2_Init_Advanced(115200, _UART_8_BIT_DATA, _UART_NOPARITY, _UART_ONE_STOPBIT, &_GPIO_MODULE_USART2_PA23);
MOVW	R0, #lo_addr(__GPIO_MODULE_USART2_PA23+0)
MOVT	R0, #hi_addr(__GPIO_MODULE_USART2_PA23+0)
PUSH	(R0)
MOVW	R3, #0
MOVW	R2, #0
MOVW	R1, #0
MOV	R0, #115200
BL	_UART2_Init_Advanced+0
ADD	SP, SP, #4
;nestLora.c,19 :: 		USART2_CR1bits.RXNEIE = 1;       // enable uart rx interrupt
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(USART2_CR1bits+0)
MOVT	R0, #hi_addr(USART2_CR1bits+0)
_SX	[R0, ByteOffset(USART2_CR1bits+0)]
;nestLora.c,20 :: 		NVIC_IntEnable(IVT_INT_USART2);  // enable interrupt vector
MOVW	R0, #54
BL	_NVIC_IntEnable+0
;nestLora.c,28 :: 		UART3_Init_Advanced(115200, _UART_8_BIT_DATA, _UART_NOPARITY, _UART_ONE_STOPBIT, &_GPIO_MODULE_USART3_PB10_11);
MOVW	R0, #lo_addr(__GPIO_MODULE_USART3_PB10_11+0)
MOVT	R0, #hi_addr(__GPIO_MODULE_USART3_PB10_11+0)
PUSH	(R0)
MOVW	R3, #0
MOVW	R2, #0
MOVW	R1, #0
MOV	R0, #115200
BL	_UART3_Init_Advanced+0
ADD	SP, SP, #4
;nestLora.c,29 :: 		USART3_CR1bits.RXNEIE = 1;       // enable uart rx interrupt
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(USART3_CR1bits+0)
MOVT	R0, #hi_addr(USART3_CR1bits+0)
_SX	[R0, ByteOffset(USART3_CR1bits+0)]
;nestLora.c,30 :: 		NVIC_IntEnable(IVT_INT_USART3);  // enable interrupt vector
MOVW	R0, #55
BL	_NVIC_IntEnable+0
;nestLora.c,33 :: 		GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_0 | _GPIO_PINMASK_1);
MOVW	R1, #3
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Digital_Output+0
;nestLora.c,37 :: 		GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_12);
MOVW	R1, #4096
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Output+0
;nestLora.c,43 :: 		GPIO_Config(&GPIOA_BASE, _GPIO_PINMASK_4, _GPIO_CFG_MODE_INPUT | _GPIO_CFG_PULL_NO);
MOV	R2, #66
MOVW	R1, #16
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Config+0
;nestLora.c,45 :: 		LED = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
_SX	[R0, ByteOffset(GPIOB_ODR+0)]
;nestLora.c,49 :: 		M0 = 0;
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
_SX	[R0, ByteOffset(GPIOA_ODR+0)]
;nestLora.c,50 :: 		M1 = 0;
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
_SX	[R0, ByteOffset(GPIOA_ODR+0)]
;nestLora.c,53 :: 		bitReceivedCheckStatusOfBoat = 0;
MOVW	R0, #lo_addr(_bitReceivedCheckStatusOfBoat+0)
MOVT	R0, #hi_addr(_bitReceivedCheckStatusOfBoat+0)
STR	R1, [R0, #0]
;nestLora.c,54 :: 		bitReceivedStatusOfBoat = 0;
MOVW	R0, #lo_addr(_bitReceivedStatusOfBoat+0)
MOVT	R0, #hi_addr(_bitReceivedStatusOfBoat+0)
STR	R1, [R0, #0]
;nestLora.c,55 :: 		bitExpectAnswer = 0;
MOVW	R0, #lo_addr(_bitExpectAnswer+0)
MOVT	R0, #hi_addr(_bitExpectAnswer+0)
STR	R1, [R0, #0]
;nestLora.c,57 :: 		InitTimer2();
BL	_InitTimer2+0
;nestLora.c,73 :: 		setup_IWDG();
BL	_setup_IWDG+0
;nestLora.c,76 :: 		Delay_ms(100);
MOVW	R7, #4521
MOVT	R7, #4
NOP
NOP
L_main0:
SUBS	R7, R7, #1
BNE	L_main0
NOP
NOP
;nestLora.c,78 :: 		while(1){
L_main2:
;nestLora.c,79 :: 		IWDG_KR = 0xAAAA;    //Reload IWDG
MOVW	R1, #43690
MOVW	R0, #lo_addr(IWDG_KR+0)
MOVT	R0, #hi_addr(IWDG_KR+0)
STR	R1, [R0, #0]
;nestLora.c,87 :: 		if(bitReceivedCheckStatusOfBoat){
MOVW	R1, #lo_addr(_bitReceivedCheckStatusOfBoat+0)
MOVT	R1, #hi_addr(_bitReceivedCheckStatusOfBoat+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_main4
;nestLora.c,88 :: 		bitReceivedCheckStatusOfBoat = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(_bitReceivedCheckStatusOfBoat+0)
MOVT	R0, #hi_addr(_bitReceivedCheckStatusOfBoat+0)
STR	R1, [R0, #0]
;nestLora.c,89 :: 		uartRequestStatusFromBoat();
BL	_uartRequestStatusFromBoat+0
;nestLora.c,90 :: 		}
L_main4:
;nestLora.c,94 :: 		if(bitReceivedStatusOfBoat){
MOVW	R1, #lo_addr(_bitReceivedStatusOfBoat+0)
MOVT	R1, #hi_addr(_bitReceivedStatusOfBoat+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_main5
;nestLora.c,95 :: 		bitReceivedStatusOfBoat = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(_bitReceivedStatusOfBoat+0)
MOVT	R0, #hi_addr(_bitReceivedStatusOfBoat+0)
STR	R1, [R0, #0]
;nestLora.c,96 :: 		sendRequestStatusToAndroid();
BL	_sendRequestStatusToAndroid+0
;nestLora.c,97 :: 		bitExpectAnswer = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(_bitExpectAnswer+0)
MOVT	R0, #hi_addr(_bitExpectAnswer+0)
STR	R1, [R0, #0]
;nestLora.c,98 :: 		boatConnected = 0x00;
MOVS	R1, #0
MOVW	R0, #lo_addr(_boatConnected+0)
MOVT	R0, #hi_addr(_boatConnected+0)
STRB	R1, [R0, #0]
;nestLora.c,101 :: 		}
L_main5:
;nestLora.c,108 :: 		}
IT	AL
BAL	L_main2
;nestLora.c,110 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
