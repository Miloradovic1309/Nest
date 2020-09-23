_InitTimer2:
;timers.h,3 :: 		void InitTimer2(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;timers.h,4 :: 		RCC_APB1ENR.TIM2EN = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
_SX	[R0, ByteOffset(RCC_APB1ENR+0)]
;timers.h,5 :: 		TIM2_CR1.CEN = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
_SX	[R0, ByteOffset(TIM2_CR1+0)]
;timers.h,6 :: 		TIM2_PSC = 59;
MOVS	R1, #59
MOVW	R0, #lo_addr(TIM2_PSC+0)
MOVT	R0, #hi_addr(TIM2_PSC+0)
STR	R1, [R0, #0]
;timers.h,7 :: 		TIM2_ARR = 59999;
MOVW	R1, #59999
MOVW	R0, #lo_addr(TIM2_ARR+0)
MOVT	R0, #hi_addr(TIM2_ARR+0)
STR	R1, [R0, #0]
;timers.h,8 :: 		NVIC_IntEnable(IVT_INT_TIM2);
MOVW	R0, #44
BL	_NVIC_IntEnable+0
;timers.h,9 :: 		TIM2_DIER.UIE = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_DIER+0)
MOVT	R0, #hi_addr(TIM2_DIER+0)
_SX	[R0, ByteOffset(TIM2_DIER+0)]
;timers.h,10 :: 		TIM2_CR1.CEN = 1;
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
_SX	[R0, ByteOffset(TIM2_CR1+0)]
;timers.h,11 :: 		}
L_end_InitTimer2:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _InitTimer2
_setup_IWDG:
;nestHelm.c,17 :: 		void setup_IWDG()
;nestHelm.c,19 :: 		IWDG_KR = 0x5555;    //Disable write protection of IWDG registers
MOVW	R1, #21845
MOVW	R0, #lo_addr(IWDG_KR+0)
MOVT	R0, #hi_addr(IWDG_KR+0)
STR	R1, [R0, #0]
;nestHelm.c,20 :: 		IWDG_PR = 0x06;      //Set PR value
MOVS	R1, #6
MOVW	R0, #lo_addr(IWDG_PR+0)
MOVT	R0, #hi_addr(IWDG_PR+0)
STR	R1, [R0, #0]
;nestHelm.c,21 :: 		IWDG_RLR = 0x2FF;     //Set RLR value
MOVW	R1, #767
MOVW	R0, #lo_addr(IWDG_RLR+0)
MOVT	R0, #hi_addr(IWDG_RLR+0)
STR	R1, [R0, #0]
;nestHelm.c,22 :: 		IWDG_KR = 0xAAAA;    //Reload IWDG
MOVW	R1, #43690
MOVW	R0, #lo_addr(IWDG_KR+0)
MOVT	R0, #hi_addr(IWDG_KR+0)
STR	R1, [R0, #0]
;nestHelm.c,23 :: 		IWDG_KR = 0xCCCC;    //Start IWDG
MOVW	R1, #52428
MOVW	R0, #lo_addr(IWDG_KR+0)
MOVT	R0, #hi_addr(IWDG_KR+0)
STR	R1, [R0, #0]
;nestHelm.c,24 :: 		}
L_end_setup_IWDG:
BX	LR
; end of _setup_IWDG
_resetTouch:
;nestHelm.c,26 :: 		void resetTouch(){
;nestHelm.c,27 :: 		WTPSC = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
_SX	[R0, ByteOffset(GPIOA_ODR+0)]
;nestHelm.c,28 :: 		LED11 = 1;
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
_SX	[R0, ByteOffset(GPIOC_ODR+0)]
;nestHelm.c,29 :: 		Delay_ms(100);
MOVW	R7, #20351
MOVT	R7, #18
NOP
NOP
L_resetTouch0:
SUBS	R7, R7, #1
BNE	L_resetTouch0
NOP
NOP
NOP
;nestHelm.c,30 :: 		WTPSC = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
_SX	[R0, ByteOffset(GPIOA_ODR+0)]
;nestHelm.c,31 :: 		LED11 = 0;
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
_SX	[R0, ByteOffset(GPIOC_ODR+0)]
;nestHelm.c,32 :: 		}
L_end_resetTouch:
BX	LR
; end of _resetTouch
_main:
;nestHelm.c,34 :: 		void main() {
SUB	SP, SP, #12
;nestHelm.c,37 :: 		UART1_Init_Advanced(115200, _UART_8_BIT_DATA, _UART_NOPARITY, _UART_ONE_STOPBIT, &_GPIO_MODULE_USART1_PA9_10);
MOVW	R0, #lo_addr(__GPIO_MODULE_USART1_PA9_10+0)
MOVT	R0, #hi_addr(__GPIO_MODULE_USART1_PA9_10+0)
PUSH	(R0)
MOVW	R3, #0
MOVW	R2, #0
MOVW	R1, #0
MOV	R0, #115200
BL	_UART1_Init_Advanced+0
ADD	SP, SP, #4
;nestHelm.c,38 :: 		USART1_CR1bits.RXNEIE = 1;       // enable uart rx interrupt
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(USART1_CR1bits+0)
MOVT	R0, #hi_addr(USART1_CR1bits+0)
_SX	[R0, ByteOffset(USART1_CR1bits+0)]
;nestHelm.c,39 :: 		NVIC_IntEnable(IVT_INT_USART1);  // enable interrupt vector
MOVW	R0, #53
BL	_NVIC_IntEnable+0
;nestHelm.c,42 :: 		GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_8);                                            // UART1_RXTX
MOVW	R1, #256
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Digital_Output+0
;nestHelm.c,48 :: 		_GPIO_CFG_MODE_INPUT | _GPIO_CFG_PULL_DOWN);
MOV	R2, #258
;nestHelm.c,47 :: 		_GPIO_PINMASK_10,                                                    // THREE_TOUCH
MOVW	R1, #1027
;nestHelm.c,46 :: 		GPIO_Config(&GPIOB_BASE, _GPIO_PINMASK_0 | _GPIO_PINMASK_1 |                                  // ONE_TOUCH, TWO_TOUCH,
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
;nestHelm.c,48 :: 		_GPIO_CFG_MODE_INPUT | _GPIO_CFG_PULL_DOWN);
BL	_GPIO_Config+0
;nestHelm.c,50 :: 		_GPIO_CFG_MODE_INPUT | _GPIO_CFG_PULL_DOWN);
MOV	R2, #258
;nestHelm.c,49 :: 		GPIO_Config(&GPIOA_BASE, _GPIO_PINMASK_7 | _GPIO_PINMASK_6,                                   // N_TOUCH, R_TOUCH,
MOVW	R1, #192
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
;nestHelm.c,50 :: 		_GPIO_CFG_MODE_INPUT | _GPIO_CFG_PULL_DOWN);
BL	_GPIO_Config+0
;nestHelm.c,52 :: 		_GPIO_PINMASK_13 | _GPIO_PINMASK_12 | _GPIO_PINMASK_11);     // ONE_LIGHT, TWO_LIGHT, THREE_LIGHT
MOVW	R1, #63488
;nestHelm.c,51 :: 		GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_15 | _GPIO_PINMASK_14 |                        // R_LIGHT, N_LIGHT
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
;nestHelm.c,52 :: 		_GPIO_PINMASK_13 | _GPIO_PINMASK_12 | _GPIO_PINMASK_11);     // ONE_LIGHT, TWO_LIGHT, THREE_LIGHT
BL	_GPIO_Digital_Output+0
;nestHelm.c,56 :: 		GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_15);                                            // WHEEL_LIGHT
MOVW	R1, #32768
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Digital_Output+0
;nestHelm.c,57 :: 		GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_3);                                             // WHEEL_DIODE
MOVW	R1, #8
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Output+0
;nestHelm.c,59 :: 		_GPIO_CFG_MODE_INPUT | _GPIO_CFG_PULL_NO);
MOV	R2, #66
;nestHelm.c,58 :: 		GPIO_Config(&GPIOA_BASE, _GPIO_PINMASK_4,                                                      // WHEEL_TOUCH
MOVW	R1, #16
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
;nestHelm.c,59 :: 		_GPIO_CFG_MODE_INPUT | _GPIO_CFG_PULL_NO);
BL	_GPIO_Config+0
;nestHelm.c,63 :: 		GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_5);                                             // WTPSC
MOVW	R1, #32
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Digital_Output+0
;nestHelm.c,64 :: 		GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_9);                                             // GTPSC
MOVW	R1, #512
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Output+0
;nestHelm.c,67 :: 		GPIO_Digital_Output(&GPIOC_BASE, _GPIO_PINMASK_13);    // LED11
MOVW	R1, #8192
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Output+0
;nestHelm.c,74 :: 		SWJ_CFG0_bit = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R0, #lo_addr(SWJ_CFG0_bit+0)
MOVT	R0, #hi_addr(SWJ_CFG0_bit+0)
_SX	[R0, ByteOffset(SWJ_CFG0_bit+0)]
;nestHelm.c,75 :: 		SWJ_CFG1_bit = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(SWJ_CFG1_bit+0)
MOVT	R0, #hi_addr(SWJ_CFG1_bit+0)
_SX	[R0, ByteOffset(SWJ_CFG1_bit+0)]
;nestHelm.c,76 :: 		SWJ_CFG2_bit = 0;
MOVW	R0, #lo_addr(SWJ_CFG2_bit+0)
MOVT	R0, #hi_addr(SWJ_CFG2_bit+0)
_SX	[R0, ByteOffset(SWJ_CFG2_bit+0)]
;nestHelm.c,78 :: 		WHEEL_DIODE = 0;
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
_SX	[R0, ByteOffset(GPIOB_ODR+0)]
;nestHelm.c,79 :: 		WHEEL_LIGHT = 0;
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
_SX	[R0, ByteOffset(GPIOA_ODR+0)]
;nestHelm.c,81 :: 		WTPSC = 0;
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
_SX	[R0, ByteOffset(GPIOA_ODR+0)]
;nestHelm.c,85 :: 		GPIO_Analog_Input(&GPIOA_IDR, _GPIO_PINMASK_0);
MOVW	R1, #1
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
BL	_GPIO_Analog_Input+0
;nestHelm.c,86 :: 		ADC1_Init();
BL	_ADC1_Init+0
;nestHelm.c,88 :: 		WTPSC = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
_SX	[R0, ByteOffset(GPIOA_ODR+0)]
;nestHelm.c,89 :: 		LED11 = 1;
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
_SX	[R0, ByteOffset(GPIOC_ODR+0)]
;nestHelm.c,90 :: 		Delay_ms(100);
MOVW	R7, #20351
MOVT	R7, #18
NOP
NOP
L_main2:
SUBS	R7, R7, #1
BNE	L_main2
NOP
NOP
NOP
;nestHelm.c,91 :: 		EEPROM_24C02_Init();
BL	_EEPROM_24C02_Init+0
;nestHelm.c,92 :: 		Delay_ms(100);
MOVW	R7, #20351
MOVT	R7, #18
NOP
NOP
L_main4:
SUBS	R7, R7, #1
BNE	L_main4
NOP
NOP
NOP
;nestHelm.c,94 :: 		Delay_ms(100);
MOVW	R7, #20351
MOVT	R7, #18
NOP
NOP
L_main6:
SUBS	R7, R7, #1
BNE	L_main6
NOP
NOP
NOP
;nestHelm.c,95 :: 		citajeprom();
BL	_citajeprom+0
;nestHelm.c,96 :: 		Delay_ms(100);
MOVW	R7, #20351
MOVT	R7, #18
NOP
NOP
L_main8:
SUBS	R7, R7, #1
BNE	L_main8
NOP
NOP
NOP
;nestHelm.c,97 :: 		WTPSC = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
_SX	[R0, ByteOffset(GPIOA_ODR+0)]
;nestHelm.c,98 :: 		LED11 = 0;
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
_SX	[R0, ByteOffset(GPIOC_ODR+0)]
;nestHelm.c,100 :: 		bitResetTouchSensor = 0;
MOVW	R0, #lo_addr(_bitResetTouchSensor+0)
MOVT	R0, #hi_addr(_bitResetTouchSensor+0)
STR	R1, [R0, #0]
;nestHelm.c,103 :: 		startReceivingData1 = 0;
MOVW	R0, #lo_addr(_startReceivingData1+0)
MOVT	R0, #hi_addr(_startReceivingData1+0)
STR	R1, [R0, #0]
;nestHelm.c,104 :: 		control_taken = 0;
MOVW	R0, #lo_addr(_control_taken+0)
MOVT	R0, #hi_addr(_control_taken+0)
STR	R1, [R0, #0]
;nestHelm.c,105 :: 		bitDelay3Seconds = 0;
MOVW	R0, #lo_addr(_bitDelay3Seconds+0)
MOVT	R0, #hi_addr(_bitDelay3Seconds+0)
STR	R1, [R0, #0]
;nestHelm.c,106 :: 		bitStart3SecondsCount = 0;
MOVW	R0, #lo_addr(_bitStart3SecondsCount+0)
MOVT	R0, #hi_addr(_bitStart3SecondsCount+0)
STR	R1, [R0, #0]
;nestHelm.c,107 :: 		countedTimer = 0;
MOVW	R0, #lo_addr(_countedTimer+0)
MOVT	R0, #hi_addr(_countedTimer+0)
STR	R1, [R0, #0]
;nestHelm.c,108 :: 		bitRespond = 0;
MOVW	R0, #lo_addr(_bitRespond+0)
MOVT	R0, #hi_addr(_bitRespond+0)
STR	R1, [R0, #0]
;nestHelm.c,109 :: 		bitControlTaken = 0;
MOVW	R0, #lo_addr(_bitControlTaken+0)
MOVT	R0, #hi_addr(_bitControlTaken+0)
STR	R1, [R0, #0]
;nestHelm.c,111 :: 		bitCalSend = 0;
MOVW	R0, #lo_addr(_bitCalSend+0)
MOVT	R0, #hi_addr(_bitCalSend+0)
STR	R1, [R0, #0]
;nestHelm.c,113 :: 		if(leftLimit >= rightLimit){
MOVW	R0, #lo_addr(_rightLimit+0)
MOVT	R0, #hi_addr(_rightLimit+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_leftLimit+0)
MOVT	R0, #hi_addr(_leftLimit+0)
LDRH	R0, [R0, #0]
CMP	R0, R1
IT	CC
BCC	L_main10
;nestHelm.c,114 :: 		sideDifference = leftLimit - rightLimit;
MOVW	R0, #lo_addr(_rightLimit+0)
MOVT	R0, #hi_addr(_rightLimit+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_leftLimit+0)
MOVT	R0, #hi_addr(_leftLimit+0)
LDRH	R0, [R0, #0]
SUB	R1, R0, R1
MOVW	R0, #lo_addr(_sideDifference+0)
MOVT	R0, #hi_addr(_sideDifference+0)
STRH	R1, [R0, #0]
;nestHelm.c,115 :: 		}
IT	AL
BAL	L_main11
L_main10:
;nestHelm.c,117 :: 		sideDifference = rightLimit - leftLimit;
MOVW	R0, #lo_addr(_leftLimit+0)
MOVT	R0, #hi_addr(_leftLimit+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_rightLimit+0)
MOVT	R0, #hi_addr(_rightLimit+0)
LDRH	R0, [R0, #0]
SUB	R1, R0, R1
MOVW	R0, #lo_addr(_sideDifference+0)
MOVT	R0, #hi_addr(_sideDifference+0)
STRH	R1, [R0, #0]
;nestHelm.c,118 :: 		}
L_main11:
;nestHelm.c,120 :: 		if(sideDifference == 0){
MOVW	R0, #lo_addr(_sideDifference+0)
MOVT	R0, #hi_addr(_sideDifference+0)
LDRH	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_main12
;nestHelm.c,121 :: 		sideDifference = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_sideDifference+0)
MOVT	R0, #hi_addr(_sideDifference+0)
STRH	R1, [R0, #0]
;nestHelm.c,122 :: 		}
L_main12:
;nestHelm.c,126 :: 		InitTimer2();
BL	_InitTimer2+0
;nestHelm.c,128 :: 		setup_IWDG();
BL	_setup_IWDG+0
;nestHelm.c,130 :: 		while(1){
L_main13:
;nestHelm.c,132 :: 		IWDG_KR = 0xAAAA;
MOVW	R1, #43690
MOVW	R0, #lo_addr(IWDG_KR+0)
MOVT	R0, #hi_addr(IWDG_KR+0)
STR	R1, [R0, #0]
;nestHelm.c,134 :: 		WHEEL_DIODE = WHEEL_TOUCH;
MOVW	R2, #lo_addr(GPIOA_IDR+0)
MOVT	R2, #hi_addr(GPIOA_IDR+0)
_LX	[R2, ByteOffset(GPIOA_IDR+0)]
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
_SX	[R0, ByteOffset(GPIOB_ODR+0)]
;nestHelm.c,135 :: 		WHEEL_LIGHT = WHEEL_TOUCH | bitDelay3Seconds;
MOVW	R0, #lo_addr(_bitDelay3Seconds+0)
MOVT	R0, #hi_addr(_bitDelay3Seconds+0)
LDR	R1, [R0, #0]
MOV	R0, R2
_LX	[R0, ByteOffset(GPIOA_IDR+0)]
ORR	R1, R0, R1, LSL #0
UXTB	R1, R1
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
_SX	[R0, ByteOffset(GPIOA_ODR+0)]
;nestHelm.c,137 :: 		if(!bitControlTaken){
MOVW	R1, #lo_addr(_bitControlTaken+0)
MOVT	R1, #hi_addr(_bitControlTaken+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_main15
;nestHelm.c,139 :: 		if (Button(&GPIOB_IDR, 0, 20, 1)){
MOVS	R3, #1
MOVS	R2, #20
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOB_IDR+0)
MOVT	R0, #hi_addr(GPIOB_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	EQ
BEQ	L_main16
;nestHelm.c,140 :: 		ONE_LIGHT = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
_SX	[R0, ByteOffset(GPIOB_ODR+0)]
;nestHelm.c,141 :: 		TWO_LIGHT = THREE_LIGHT = N_LIGHT = R_LIGHT = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
_SX	[R0, ByteOffset(GPIOB_ODR+0)]
_LX	[R0, ByteOffset(GPIOB_ODR+0)]
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
_SX	[R0, ByteOffset(GPIOB_ODR+0)]
_LX	[R0, ByteOffset(GPIOB_ODR+0)]
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
_SX	[R0, ByteOffset(GPIOB_ODR+0)]
_LX	[R0, ByteOffset(GPIOB_ODR+0)]
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
_SX	[R0, ByteOffset(GPIOB_ODR+0)]
;nestHelm.c,144 :: 		}
L_main16:
;nestHelm.c,146 :: 		if (Button(&GPIOB_IDR, 1, 20, 1)){
MOVS	R3, #1
MOVS	R2, #20
MOVS	R1, #1
MOVW	R0, #lo_addr(GPIOB_IDR+0)
MOVT	R0, #hi_addr(GPIOB_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	EQ
BEQ	L_main17
;nestHelm.c,147 :: 		TWO_LIGHT = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
_SX	[R0, ByteOffset(GPIOB_ODR+0)]
;nestHelm.c,148 :: 		ONE_LIGHT = THREE_LIGHT = N_LIGHT = R_LIGHT = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
_SX	[R0, ByteOffset(GPIOB_ODR+0)]
_LX	[R0, ByteOffset(GPIOB_ODR+0)]
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
_SX	[R0, ByteOffset(GPIOB_ODR+0)]
_LX	[R0, ByteOffset(GPIOB_ODR+0)]
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
_SX	[R0, ByteOffset(GPIOB_ODR+0)]
_LX	[R0, ByteOffset(GPIOB_ODR+0)]
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
_SX	[R0, ByteOffset(GPIOB_ODR+0)]
;nestHelm.c,149 :: 		}
L_main17:
;nestHelm.c,151 :: 		if (Button(&GPIOB_IDR, 10, 20, 1)){
MOVS	R3, #1
MOVS	R2, #20
MOVS	R1, #10
MOVW	R0, #lo_addr(GPIOB_IDR+0)
MOVT	R0, #hi_addr(GPIOB_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	EQ
BEQ	L_main18
;nestHelm.c,152 :: 		THREE_LIGHT = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
_SX	[R0, ByteOffset(GPIOB_ODR+0)]
;nestHelm.c,153 :: 		TWO_LIGHT = ONE_LIGHT = N_LIGHT = R_LIGHT = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
_SX	[R0, ByteOffset(GPIOB_ODR+0)]
_LX	[R0, ByteOffset(GPIOB_ODR+0)]
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
_SX	[R0, ByteOffset(GPIOB_ODR+0)]
_LX	[R0, ByteOffset(GPIOB_ODR+0)]
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
_SX	[R0, ByteOffset(GPIOB_ODR+0)]
_LX	[R0, ByteOffset(GPIOB_ODR+0)]
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
_SX	[R0, ByteOffset(GPIOB_ODR+0)]
;nestHelm.c,154 :: 		}
L_main18:
;nestHelm.c,156 :: 		if (Button(&GPIOA_IDR, 7, 20, 1)){
MOVS	R3, #1
MOVS	R2, #20
MOVS	R1, #7
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	EQ
BEQ	L_main19
;nestHelm.c,157 :: 		N_LIGHT = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
_SX	[R0, ByteOffset(GPIOB_ODR+0)]
;nestHelm.c,158 :: 		TWO_LIGHT = THREE_LIGHT = ONE_LIGHT = R_LIGHT = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
_SX	[R0, ByteOffset(GPIOB_ODR+0)]
_LX	[R0, ByteOffset(GPIOB_ODR+0)]
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
_SX	[R0, ByteOffset(GPIOB_ODR+0)]
_LX	[R0, ByteOffset(GPIOB_ODR+0)]
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
_SX	[R0, ByteOffset(GPIOB_ODR+0)]
_LX	[R0, ByteOffset(GPIOB_ODR+0)]
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
_SX	[R0, ByteOffset(GPIOB_ODR+0)]
;nestHelm.c,165 :: 		}
L_main19:
;nestHelm.c,167 :: 		if (Button(&GPIOA_IDR, 6, 20, 1)){
MOVS	R3, #1
MOVS	R2, #20
MOVS	R1, #6
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	EQ
BEQ	L_main20
;nestHelm.c,168 :: 		R_LIGHT = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
_SX	[R0, ByteOffset(GPIOB_ODR+0)]
;nestHelm.c,169 :: 		TWO_LIGHT = THREE_LIGHT = N_LIGHT = ONE_LIGHT = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
_SX	[R0, ByteOffset(GPIOB_ODR+0)]
_LX	[R0, ByteOffset(GPIOB_ODR+0)]
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
_SX	[R0, ByteOffset(GPIOB_ODR+0)]
_LX	[R0, ByteOffset(GPIOB_ODR+0)]
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
_SX	[R0, ByteOffset(GPIOB_ODR+0)]
_LX	[R0, ByteOffset(GPIOB_ODR+0)]
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
_SX	[R0, ByteOffset(GPIOB_ODR+0)]
;nestHelm.c,170 :: 		}
L_main20:
;nestHelm.c,178 :: 		if(WHEEL_TOUCH || bitDelay3Seconds){
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
_LX	[R0, ByteOffset(GPIOA_IDR+0)]
CMP	R0, #0
IT	NE
BNE	L__main71
MOVW	R1, #lo_addr(_bitDelay3Seconds+0)
MOVT	R1, #hi_addr(_bitDelay3Seconds+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L__main70
IT	AL
BAL	L_main23
L__main71:
L__main70:
;nestHelm.c,179 :: 		if(WHEEL_TOUCH){
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
_LX	[R0, ByteOffset(GPIOA_IDR+0)]
CMP	R0, #0
IT	EQ
BEQ	L_main24
;nestHelm.c,180 :: 		bitDelay3Seconds = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(_bitDelay3Seconds+0)
MOVT	R0, #hi_addr(_bitDelay3Seconds+0)
STR	R1, [R0, #0]
;nestHelm.c,181 :: 		bitStart3SecondsCount = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(_bitStart3SecondsCount+0)
MOVT	R0, #hi_addr(_bitStart3SecondsCount+0)
STR	R1, [R0, #0]
;nestHelm.c,182 :: 		delay3secndsCount = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_delay3secndsCount+0)
MOVT	R0, #hi_addr(_delay3secndsCount+0)
STRH	R1, [R0, #0]
;nestHelm.c,183 :: 		}
IT	AL
BAL	L_main25
L_main24:
;nestHelm.c,185 :: 		bitStart3SecondsCount = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(_bitStart3SecondsCount+0)
MOVT	R0, #hi_addr(_bitStart3SecondsCount+0)
STR	R1, [R0, #0]
;nestHelm.c,186 :: 		}
L_main25:
;nestHelm.c,188 :: 		if(THREE_LIGHT == 1){
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
_LX	[R0, ByteOffset(GPIOB_ODR+0)]
CMP	R0, #0
IT	EQ
BEQ	L_main26
;nestHelm.c,189 :: 		gear_status = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_gear_status+0)
MOVT	R0, #hi_addr(_gear_status+0)
STRH	R1, [R0, #0]
;nestHelm.c,190 :: 		}
L_main26:
;nestHelm.c,192 :: 		if(TWO_LIGHT == 1){
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
_LX	[R0, ByteOffset(GPIOB_ODR+0)]
CMP	R0, #0
IT	EQ
BEQ	L_main27
;nestHelm.c,193 :: 		gear_status = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_gear_status+0)
MOVT	R0, #hi_addr(_gear_status+0)
STRH	R1, [R0, #0]
;nestHelm.c,194 :: 		}
L_main27:
;nestHelm.c,196 :: 		if(ONE_LIGHT == 1){
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
_LX	[R0, ByteOffset(GPIOB_ODR+0)]
CMP	R0, #0
IT	EQ
BEQ	L_main28
;nestHelm.c,197 :: 		gear_status = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_gear_status+0)
MOVT	R0, #hi_addr(_gear_status+0)
STRH	R1, [R0, #0]
;nestHelm.c,198 :: 		}
L_main28:
;nestHelm.c,200 :: 		if(R_LIGHT == 1){
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
_LX	[R0, ByteOffset(GPIOB_ODR+0)]
CMP	R0, #0
IT	EQ
BEQ	L_main29
;nestHelm.c,201 :: 		gear_status = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_gear_status+0)
MOVT	R0, #hi_addr(_gear_status+0)
STRH	R1, [R0, #0]
;nestHelm.c,202 :: 		}
L_main29:
;nestHelm.c,204 :: 		if(N_LIGHT == 1){
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
_LX	[R0, ByteOffset(GPIOB_ODR+0)]
CMP	R0, #0
IT	EQ
BEQ	L_main30
;nestHelm.c,205 :: 		gear_status = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_gear_status+0)
MOVT	R0, #hi_addr(_gear_status+0)
STRH	R1, [R0, #0]
;nestHelm.c,206 :: 		}
L_main30:
;nestHelm.c,208 :: 		}
IT	AL
BAL	L_main31
L_main23:
;nestHelm.c,210 :: 		R_LIGHT = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
_SX	[R0, ByteOffset(GPIOB_ODR+0)]
;nestHelm.c,211 :: 		ONE_LIGHT = 0;
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
_SX	[R0, ByteOffset(GPIOB_ODR+0)]
;nestHelm.c,212 :: 		TWO_LIGHT = 0;
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
_SX	[R0, ByteOffset(GPIOB_ODR+0)]
;nestHelm.c,213 :: 		THREE_LIGHT = 0;
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
_SX	[R0, ByteOffset(GPIOB_ODR+0)]
;nestHelm.c,214 :: 		N_LIGHT = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
_SX	[R0, ByteOffset(GPIOB_ODR+0)]
;nestHelm.c,215 :: 		gear_status = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_gear_status+0)
MOVT	R0, #hi_addr(_gear_status+0)
STRH	R1, [R0, #0]
;nestHelm.c,216 :: 		}
L_main31:
;nestHelm.c,218 :: 		}
L_main15:
;nestHelm.c,225 :: 		if(countedTimer) {
MOVW	R1, #lo_addr(_countedTimer+0)
MOVT	R1, #hi_addr(_countedTimer+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_main32
;nestHelm.c,227 :: 		countedTimer = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(_countedTimer+0)
MOVT	R0, #hi_addr(_countedTimer+0)
STR	R1, [R0, #0]
;nestHelm.c,230 :: 		for(i=0; i<300; i++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
L_main33:
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRH	R0, [R0, #0]
CMP	R0, #300
IT	CS
BCS	L_main34
;nestHelm.c,231 :: 		ADC_Set_Input_Channel(_ADC_CHANNEL_0);
MOVW	R0, #1
BL	_ADC_Set_Input_Channel+0
;nestHelm.c,232 :: 		adc_read1 = ADC1_Get_Sample(0);
MOVS	R0, #0
BL	_ADC1_Get_Sample+0
MOVW	R3, #lo_addr(_adc_read1+0)
MOVT	R3, #hi_addr(_adc_read1+0)
STR	R0, [R3, #0]
;nestHelm.c,234 :: 		adc_array[i] = adc_read1;
MOVW	R2, #lo_addr(_i+0)
MOVT	R2, #hi_addr(_i+0)
LDRH	R0, [R2, #0]
LSLS	R1, R0, #1
MOVW	R0, #lo_addr(_adc_array+0)
MOVT	R0, #hi_addr(_adc_array+0)
ADDS	R1, R0, R1
MOV	R0, R3
LDR	R0, [R0, #0]
STRH	R0, [R1, #0]
;nestHelm.c,230 :: 		for(i=0; i<300; i++){
MOV	R0, R2
LDRH	R0, [R0, #0]
ADDS	R0, R0, #1
STRH	R0, [R2, #0]
;nestHelm.c,235 :: 		}
IT	AL
BAL	L_main33
L_main34:
;nestHelm.c,237 :: 		for(i=0; i<300; i++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
L_main36:
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRH	R0, [R0, #0]
CMP	R0, #300
IT	CS
BCS	L_main37
;nestHelm.c,239 :: 		for(j=i+1; j<300; j++)
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRH	R0, [R0, #0]
ADDS	R1, R0, #1
MOVW	R0, #lo_addr(_j+0)
MOVT	R0, #hi_addr(_j+0)
STRH	R1, [R0, #0]
L_main39:
MOVW	R0, #lo_addr(_j+0)
MOVT	R0, #hi_addr(_j+0)
LDRSH	R0, [R0, #0]
CMP	R0, #300
IT	GE
BGE	L_main40
;nestHelm.c,241 :: 		if(adc_array[j]<adc_array[i])
MOVW	R0, #lo_addr(_j+0)
MOVT	R0, #hi_addr(_j+0)
LDRSH	R0, [R0, #0]
LSLS	R1, R0, #1
MOVW	R0, #lo_addr(_adc_array+0)
MOVT	R0, #hi_addr(_adc_array+0)
ADDS	R0, R0, R1
LDRSH	R2, [R0, #0]
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRH	R0, [R0, #0]
LSLS	R1, R0, #1
MOVW	R0, #lo_addr(_adc_array+0)
MOVT	R0, #hi_addr(_adc_array+0)
ADDS	R0, R0, R1
LDRSH	R0, [R0, #0]
CMP	R2, R0
IT	GE
BGE	L_main42
;nestHelm.c,243 :: 		tmp = adc_array[i];
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRH	R0, [R0, #0]
LSLS	R1, R0, #1
MOVW	R0, #lo_addr(_adc_array+0)
MOVT	R0, #hi_addr(_adc_array+0)
ADDS	R4, R0, R1
LDRSH	R0, [R4, #0]
MOVW	R3, #lo_addr(_tmp+0)
MOVT	R3, #hi_addr(_tmp+0)
STRH	R0, [R3, #0]
;nestHelm.c,244 :: 		adc_array[i] = adc_array[j];
MOVW	R2, #lo_addr(_j+0)
MOVT	R2, #hi_addr(_j+0)
LDRSH	R0, [R2, #0]
LSLS	R1, R0, #1
MOVW	R0, #lo_addr(_adc_array+0)
MOVT	R0, #hi_addr(_adc_array+0)
ADDS	R0, R0, R1
LDRSH	R0, [R0, #0]
STRH	R0, [R4, #0]
;nestHelm.c,245 :: 		adc_array[j] = tmp;
MOV	R0, R2
LDRSH	R0, [R0, #0]
LSLS	R1, R0, #1
MOVW	R0, #lo_addr(_adc_array+0)
MOVT	R0, #hi_addr(_adc_array+0)
ADDS	R1, R0, R1
MOV	R0, R3
LDRSH	R0, [R0, #0]
STRH	R0, [R1, #0]
;nestHelm.c,246 :: 		}
L_main42:
;nestHelm.c,239 :: 		for(j=i+1; j<300; j++)
MOVW	R1, #lo_addr(_j+0)
MOVT	R1, #hi_addr(_j+0)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;nestHelm.c,247 :: 		}
IT	AL
BAL	L_main39
L_main40:
;nestHelm.c,237 :: 		for(i=0; i<300; i++)
MOVW	R1, #lo_addr(_i+0)
MOVT	R1, #hi_addr(_i+0)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;nestHelm.c,248 :: 		}
IT	AL
BAL	L_main36
L_main37:
;nestHelm.c,250 :: 		for(i=100; i<200; i++){
MOVS	R1, #100
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
L_main43:
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRH	R0, [R0, #0]
CMP	R0, #200
IT	CS
BCS	L_main44
;nestHelm.c,251 :: 		adcSum += adc_array[i];
MOVW	R3, #lo_addr(_i+0)
MOVT	R3, #hi_addr(_i+0)
LDRH	R0, [R3, #0]
LSLS	R1, R0, #1
MOVW	R0, #lo_addr(_adc_array+0)
MOVT	R0, #hi_addr(_adc_array+0)
ADDS	R0, R0, R1
LDRSH	R2, [R0, #0]
MOVW	R1, #lo_addr(_adcSum+0)
MOVT	R1, #hi_addr(_adcSum+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, R2
STR	R0, [R1, #0]
;nestHelm.c,250 :: 		for(i=100; i<200; i++){
MOV	R0, R3
LDRH	R0, [R0, #0]
ADDS	R0, R0, #1
STRH	R0, [R3, #0]
;nestHelm.c,252 :: 		}
IT	AL
BAL	L_main43
L_main44:
;nestHelm.c,255 :: 		adc_avg1 = ((float)adcSum)/100f;
MOVW	R0, #lo_addr(_adcSum+0)
MOVT	R0, #hi_addr(_adcSum+0)
STR	R0, [SP, #4]
LDR	R0, [R0, #0]
BL	__UnsignedIntegralToFloat+0
MOVW	R2, #0
MOVT	R2, #17096
BL	__Div_FP+0
MOVW	R1, #lo_addr(_adc_avg1+0)
MOVT	R1, #hi_addr(_adc_avg1+0)
STR	R0, [R1, #0]
;nestHelm.c,256 :: 		calAdcAvg = (long)(adc_avg1 * 100f);
MOVW	R2, #0
MOVT	R2, #17096
BL	__Mul_FP+0
BL	__FloatToSignedIntegral+0
MOVW	R1, #lo_addr(_calAdcAvg+0)
MOVT	R1, #hi_addr(_calAdcAvg+0)
STR	R0, [R1, #0]
;nestHelm.c,258 :: 		adcSum = 0;
MOVS	R1, #0
LDR	R0, [SP, #4]
STR	R1, [R0, #0]
;nestHelm.c,259 :: 		if(leftLimit <= rightLimit){
MOVW	R0, #lo_addr(_rightLimit+0)
MOVT	R0, #hi_addr(_rightLimit+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_leftLimit+0)
MOVT	R0, #hi_addr(_leftLimit+0)
LDRH	R0, [R0, #0]
CMP	R0, R1
IT	HI
BHI	L_main46
;nestHelm.c,260 :: 		adc_avg1 = adc_avg1 - (float)leftLimit;
MOVW	R0, #lo_addr(_leftLimit+0)
MOVT	R0, #hi_addr(_leftLimit+0)
LDRH	R0, [R0, #0]
BL	__UnsignedIntegralToFloat+0
STR	R0, [SP, #8]
MOVW	R0, #lo_addr(_adc_avg1+0)
MOVT	R0, #hi_addr(_adc_avg1+0)
STR	R0, [SP, #4]
LDR	R0, [R0, #0]
STR	R1, [SP, #0]
LDR	R1, [SP, #8]
MOV	R2, R1
BL	__Sub_FP+0
LDR	R1, [SP, #0]
LDR	R1, [SP, #4]
STR	R0, [R1, #0]
;nestHelm.c,261 :: 		}
IT	AL
BAL	L_main47
L_main46:
;nestHelm.c,263 :: 		adc_avg1 = adc_avg1 - (float)rightLimit;
MOVW	R0, #lo_addr(_rightLimit+0)
MOVT	R0, #hi_addr(_rightLimit+0)
LDRH	R0, [R0, #0]
BL	__UnsignedIntegralToFloat+0
STR	R0, [SP, #8]
MOVW	R0, #lo_addr(_adc_avg1+0)
MOVT	R0, #hi_addr(_adc_avg1+0)
STR	R0, [SP, #4]
LDR	R0, [R0, #0]
STR	R1, [SP, #0]
LDR	R1, [SP, #8]
MOV	R2, R1
BL	__Sub_FP+0
LDR	R1, [SP, #0]
LDR	R1, [SP, #4]
STR	R0, [R1, #0]
;nestHelm.c,264 :: 		}
L_main47:
;nestHelm.c,265 :: 		if(adc_avg1 < 0f){
MOVW	R0, #lo_addr(_adc_avg1+0)
MOVT	R0, #hi_addr(_adc_avg1+0)
LDR	R2, [R0, #0]
MOV	R0, #0
BL	__Compare_FP+0
MOVW	R0, #0
BLE	L__main80
MOVS	R0, #1
L__main80:
CMP	R0, #0
IT	EQ
BEQ	L_main48
;nestHelm.c,266 :: 		adc_avg1 = 0f;
MOV	R1, #0
MOVW	R0, #lo_addr(_adc_avg1+0)
MOVT	R0, #hi_addr(_adc_avg1+0)
STR	R1, [R0, #0]
;nestHelm.c,267 :: 		}
IT	AL
BAL	L_main49
L_main48:
;nestHelm.c,268 :: 		else if(adc_avg1 > (float)sideDifference){
MOVW	R0, #lo_addr(_sideDifference+0)
MOVT	R0, #hi_addr(_sideDifference+0)
LDRH	R0, [R0, #0]
BL	__UnsignedIntegralToFloat+0
MOVW	R1, #lo_addr(_adc_avg1+0)
MOVT	R1, #hi_addr(_adc_avg1+0)
LDR	R2, [R1, #0]
BL	__Compare_FP+0
MOVW	R0, #0
BGE	L__main81
MOVS	R0, #1
L__main81:
CMP	R0, #0
IT	EQ
BEQ	L_main50
;nestHelm.c,269 :: 		adc_avg1 = (float)sideDifference;
MOVW	R0, #lo_addr(_sideDifference+0)
MOVT	R0, #hi_addr(_sideDifference+0)
LDRH	R0, [R0, #0]
BL	__UnsignedIntegralToFloat+0
MOVW	R1, #lo_addr(_adc_avg1+0)
MOVT	R1, #hi_addr(_adc_avg1+0)
STR	R0, [R1, #0]
;nestHelm.c,270 :: 		}
L_main50:
L_main49:
;nestHelm.c,273 :: 		if(dir != 0){
MOVW	R0, #lo_addr(_dir+0)
MOVT	R0, #hi_addr(_dir+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_main51
;nestHelm.c,274 :: 		dutyF = ((adc_avg1 * 200f) / ((float)sideDifference)) + 50f;
MOVW	R0, #lo_addr(_adc_avg1+0)
MOVT	R0, #hi_addr(_adc_avg1+0)
LDR	R2, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17224
BL	__Mul_FP+0
STR	R0, [SP, #8]
MOVW	R0, #lo_addr(_sideDifference+0)
MOVT	R0, #hi_addr(_sideDifference+0)
LDRH	R0, [R0, #0]
BL	__UnsignedIntegralToFloat+0
STR	R0, [SP, #4]
LDR	R0, [SP, #8]
STR	R1, [SP, #0]
LDR	R1, [SP, #4]
MOV	R2, R1
BL	__Div_FP+0
LDR	R1, [SP, #0]
MOVW	R2, #0
MOVT	R2, #16968
BL	__Add_FP+0
MOVW	R1, #lo_addr(_dutyF+0)
MOVT	R1, #hi_addr(_dutyF+0)
STR	R0, [R1, #0]
;nestHelm.c,275 :: 		}
IT	AL
BAL	L_main52
L_main51:
;nestHelm.c,277 :: 		dutyF = 250f - ((adc_avg1 * 200f) / ((float)sideDifference));
MOVW	R0, #lo_addr(_adc_avg1+0)
MOVT	R0, #hi_addr(_adc_avg1+0)
LDR	R2, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17224
BL	__Mul_FP+0
STR	R0, [SP, #8]
MOVW	R0, #lo_addr(_sideDifference+0)
MOVT	R0, #hi_addr(_sideDifference+0)
LDRH	R0, [R0, #0]
BL	__UnsignedIntegralToFloat+0
STR	R0, [SP, #4]
LDR	R0, [SP, #8]
STR	R1, [SP, #0]
LDR	R1, [SP, #4]
MOV	R2, R1
BL	__Div_FP+0
STR	R0, [SP, #4]
LDR	R1, [SP, #0]
MOVW	R0, #0
MOVT	R0, #17274
STR	R1, [SP, #0]
LDR	R1, [SP, #4]
MOV	R2, R1
BL	__Sub_FP+0
LDR	R1, [SP, #0]
MOVW	R1, #lo_addr(_dutyF+0)
MOVT	R1, #hi_addr(_dutyF+0)
STR	R0, [R1, #0]
;nestHelm.c,278 :: 		}
L_main52:
;nestHelm.c,279 :: 		calDutyF = (long)(dutyF * 100f);
MOVW	R0, #lo_addr(_dutyF+0)
MOVT	R0, #hi_addr(_dutyF+0)
STR	R0, [SP, #4]
LDR	R2, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17096
BL	__Mul_FP+0
BL	__FloatToSignedIntegral+0
MOVW	R1, #lo_addr(_calDutyF+0)
MOVT	R1, #hi_addr(_calDutyF+0)
STR	R0, [R1, #0]
;nestHelm.c,283 :: 		if(((int)(dutyF * 10f)) % 10 >= 5){
LDR	R0, [SP, #4]
LDR	R2, [R0, #0]
MOVW	R0, #0
MOVT	R0, #16672
BL	__Mul_FP+0
BL	__FloatToSignedIntegral+0
SXTH	R0, R0
MOVS	R2, #10
SXTH	R2, R2
SDIV	R1, R0, R2
MLS	R1, R2, R1, R0
SXTH	R1, R1
CMP	R1, #5
IT	LT
BLT	L_main53
;nestHelm.c,284 :: 		dutyy = (int)dutyF + 1;
MOVW	R0, #lo_addr(_dutyF+0)
MOVT	R0, #hi_addr(_dutyF+0)
LDR	R0, [R0, #0]
BL	__FloatToSignedIntegral+0
SXTH	R0, R0
ADDS	R1, R0, #1
MOVW	R0, #lo_addr(_dutyy+0)
MOVT	R0, #hi_addr(_dutyy+0)
STRH	R1, [R0, #0]
;nestHelm.c,285 :: 		}
IT	AL
BAL	L_main54
L_main53:
;nestHelm.c,287 :: 		dutyy = (int)dutyF;
MOVW	R0, #lo_addr(_dutyF+0)
MOVT	R0, #hi_addr(_dutyF+0)
LDR	R0, [R0, #0]
BL	__FloatToSignedIntegral+0
SXTH	R0, R0
MOVW	R1, #lo_addr(_dutyy+0)
MOVT	R1, #hi_addr(_dutyy+0)
STRH	R0, [R1, #0]
;nestHelm.c,288 :: 		}
L_main54:
;nestHelm.c,290 :: 		calDuty = dutyy;
MOVW	R2, #lo_addr(_dutyy+0)
MOVT	R2, #hi_addr(_dutyy+0)
LDRSH	R1, [R2, #0]
MOVW	R0, #lo_addr(_calDuty+0)
MOVT	R0, #hi_addr(_calDuty+0)
STRH	R1, [R0, #0]
;nestHelm.c,292 :: 		if(dutyy >= 149 && dutyy <= 151){
MOV	R0, R2
LDRSH	R0, [R0, #0]
CMP	R0, #149
IT	LT
BLT	L__main73
MOVW	R0, #lo_addr(_dutyy+0)
MOVT	R0, #hi_addr(_dutyy+0)
LDRSH	R0, [R0, #0]
CMP	R0, #151
IT	GT
BGT	L__main72
L__main68:
;nestHelm.c,293 :: 		dutyy = 150;
MOVS	R1, #150
SXTH	R1, R1
MOVW	R0, #lo_addr(_dutyy+0)
MOVT	R0, #hi_addr(_dutyy+0)
STRH	R1, [R0, #0]
;nestHelm.c,292 :: 		if(dutyy >= 149 && dutyy <= 151){
L__main73:
L__main72:
;nestHelm.c,296 :: 		if((!((dutyOld - 2 < dutyy) && (dutyy < dutyOld + 2))) && (dutyCounter < 4)){
MOVW	R0, #lo_addr(_dutyOld+0)
MOVT	R0, #hi_addr(_dutyOld+0)
LDRSH	R0, [R0, #0]
SUBS	R1, R0, #2
SXTH	R1, R1
MOVW	R0, #lo_addr(_dutyy+0)
MOVT	R0, #hi_addr(_dutyy+0)
LDRSH	R0, [R0, #0]
CMP	R1, R0
IT	GE
BGE	L_main59
MOVW	R0, #lo_addr(_dutyOld+0)
MOVT	R0, #hi_addr(_dutyOld+0)
LDRSH	R0, [R0, #0]
ADDS	R1, R0, #2
SXTH	R1, R1
MOVW	R0, #lo_addr(_dutyy+0)
MOVT	R0, #hi_addr(_dutyy+0)
LDRSH	R0, [R0, #0]
CMP	R0, R1
IT	GE
BGE	L_main59
MOVS	R0, #1
IT	AL
BAL	L_main58
L_main59:
MOVS	R0, #0
L_main58:
CMP	R0, #0
IT	NE
BNE	L__main75
MOVW	R0, #lo_addr(_dutyCounter+0)
MOVT	R0, #hi_addr(_dutyCounter+0)
LDRSH	R0, [R0, #0]
CMP	R0, #4
IT	GE
BGE	L__main74
L__main67:
;nestHelm.c,297 :: 		dutyy = dutyOld;
MOVW	R0, #lo_addr(_dutyOld+0)
MOVT	R0, #hi_addr(_dutyOld+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_dutyy+0)
MOVT	R0, #hi_addr(_dutyy+0)
STRH	R1, [R0, #0]
;nestHelm.c,298 :: 		dutyCounter++;
MOVW	R1, #lo_addr(_dutyCounter+0)
MOVT	R1, #hi_addr(_dutyCounter+0)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;nestHelm.c,299 :: 		}
IT	AL
BAL	L_main63
;nestHelm.c,296 :: 		if((!((dutyOld - 2 < dutyy) && (dutyy < dutyOld + 2))) && (dutyCounter < 4)){
L__main75:
L__main74:
;nestHelm.c,301 :: 		dutyCounter = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_dutyCounter+0)
MOVT	R0, #hi_addr(_dutyCounter+0)
STRH	R1, [R0, #0]
;nestHelm.c,302 :: 		dutyOld = dutyy;
MOVW	R0, #lo_addr(_dutyy+0)
MOVT	R0, #hi_addr(_dutyy+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_dutyOld+0)
MOVT	R0, #hi_addr(_dutyOld+0)
STRH	R1, [R0, #0]
;nestHelm.c,303 :: 		}
L_main63:
;nestHelm.c,306 :: 		dutyyy = dutyy;
MOVW	R0, #lo_addr(_dutyy+0)
MOVT	R0, #hi_addr(_dutyy+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_dutyyy+0)
MOVT	R0, #hi_addr(_dutyyy+0)
STRH	R1, [R0, #0]
;nestHelm.c,308 :: 		adcSum = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_adcSum+0)
MOVT	R0, #hi_addr(_adcSum+0)
STR	R1, [R0, #0]
;nestHelm.c,310 :: 		}
L_main32:
;nestHelm.c,314 :: 		if(bitRespond){
MOVW	R1, #lo_addr(_bitRespond+0)
MOVT	R1, #hi_addr(_bitRespond+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_main64
;nestHelm.c,315 :: 		bitRespond = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(_bitRespond+0)
MOVT	R0, #hi_addr(_bitRespond+0)
STR	R1, [R0, #0]
;nestHelm.c,316 :: 		uart1SendStatus(gear_status, dutyyy);
MOVW	R0, #lo_addr(_dutyyy+0)
MOVT	R0, #hi_addr(_dutyyy+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_gear_status+0)
MOVT	R0, #hi_addr(_gear_status+0)
LDRH	R0, [R0, #0]
BL	_uart1SendStatus+0
;nestHelm.c,317 :: 		}
L_main64:
;nestHelm.c,322 :: 		if(bitCalSend){
MOVW	R1, #lo_addr(_bitCalSend+0)
MOVT	R1, #hi_addr(_bitCalSend+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_main65
;nestHelm.c,323 :: 		bitCalSend = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(_bitCalSend+0)
MOVT	R0, #hi_addr(_bitCalSend+0)
STR	R1, [R0, #0]
;nestHelm.c,325 :: 		uart1SendCallibration();
BL	_uart1SendCallibration+0
;nestHelm.c,326 :: 		}
L_main65:
;nestHelm.c,329 :: 		if(bitResetTouchSensor){
MOVW	R1, #lo_addr(_bitResetTouchSensor+0)
MOVT	R1, #hi_addr(_bitResetTouchSensor+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_main66
;nestHelm.c,330 :: 		bitResetTouchSensor = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(_bitResetTouchSensor+0)
MOVT	R0, #hi_addr(_bitResetTouchSensor+0)
STR	R1, [R0, #0]
;nestHelm.c,331 :: 		resetTouch();
BL	_resetTouch+0
;nestHelm.c,333 :: 		}
L_main66:
;nestHelm.c,336 :: 		}
IT	AL
BAL	L_main13
;nestHelm.c,341 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
