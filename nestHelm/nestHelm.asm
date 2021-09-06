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
;nestHelm.c,33 :: 		void setup_IWDG()
;nestHelm.c,35 :: 		IWDG_KR = 0x5555;    //Disable write protection of IWDG registers
MOVW	R1, #21845
MOVW	R0, #lo_addr(IWDG_KR+0)
MOVT	R0, #hi_addr(IWDG_KR+0)
STR	R1, [R0, #0]
;nestHelm.c,36 :: 		IWDG_PR = 0x06;      //Set PR value
MOVS	R1, #6
MOVW	R0, #lo_addr(IWDG_PR+0)
MOVT	R0, #hi_addr(IWDG_PR+0)
STR	R1, [R0, #0]
;nestHelm.c,37 :: 		IWDG_RLR = 0x2FF;     //Set RLR value
MOVW	R1, #767
MOVW	R0, #lo_addr(IWDG_RLR+0)
MOVT	R0, #hi_addr(IWDG_RLR+0)
STR	R1, [R0, #0]
;nestHelm.c,38 :: 		IWDG_KR = 0xAAAA;    //Reload IWDG
MOVW	R1, #43690
MOVW	R0, #lo_addr(IWDG_KR+0)
MOVT	R0, #hi_addr(IWDG_KR+0)
STR	R1, [R0, #0]
;nestHelm.c,39 :: 		IWDG_KR = 0xCCCC;    //Start IWDG
MOVW	R1, #52428
MOVW	R0, #lo_addr(IWDG_KR+0)
MOVT	R0, #hi_addr(IWDG_KR+0)
STR	R1, [R0, #0]
;nestHelm.c,40 :: 		}
L_end_setup_IWDG:
BX	LR
; end of _setup_IWDG
_resetTouch:
;nestHelm.c,42 :: 		void resetTouch(){
;nestHelm.c,43 :: 		WTPSC = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
_SX	[R0, ByteOffset(GPIOA_ODR+0)]
;nestHelm.c,44 :: 		LED11 = 1;
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
_SX	[R0, ByteOffset(GPIOC_ODR+0)]
;nestHelm.c,45 :: 		Delay_ms(100);
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
;nestHelm.c,46 :: 		WTPSC = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
_SX	[R0, ByteOffset(GPIOA_ODR+0)]
;nestHelm.c,47 :: 		LED11 = 0;
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
_SX	[R0, ByteOffset(GPIOC_ODR+0)]
;nestHelm.c,48 :: 		}
L_end_resetTouch:
BX	LR
; end of _resetTouch
_main:
;nestHelm.c,50 :: 		void main() {
SUB	SP, SP, #16
;nestHelm.c,53 :: 		UART1_Init_Advanced(115200, _UART_8_BIT_DATA, _UART_NOPARITY, _UART_ONE_STOPBIT, &_GPIO_MODULE_USART1_PA9_10);
MOVW	R0, #lo_addr(__GPIO_MODULE_USART1_PA9_10+0)
MOVT	R0, #hi_addr(__GPIO_MODULE_USART1_PA9_10+0)
PUSH	(R0)
MOVW	R3, #0
MOVW	R2, #0
MOVW	R1, #0
MOV	R0, #115200
BL	_UART1_Init_Advanced+0
ADD	SP, SP, #4
;nestHelm.c,54 :: 		USART1_CR1bits.RXNEIE = 1;       // enable uart rx interrupt
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(USART1_CR1bits+0)
MOVT	R0, #hi_addr(USART1_CR1bits+0)
_SX	[R0, ByteOffset(USART1_CR1bits+0)]
;nestHelm.c,55 :: 		NVIC_IntEnable(IVT_INT_USART1);  // enable interrupt vector
MOVW	R0, #53
BL	_NVIC_IntEnable+0
;nestHelm.c,58 :: 		GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_8);                                            // UART1_RXTX
MOVW	R1, #256
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Digital_Output+0
;nestHelm.c,64 :: 		_GPIO_CFG_MODE_INPUT | _GPIO_CFG_PULL_DOWN);
MOV	R2, #258
;nestHelm.c,63 :: 		_GPIO_PINMASK_10,                                                    // THREE_TOUCH
MOVW	R1, #1027
;nestHelm.c,62 :: 		GPIO_Config(&GPIOB_BASE, _GPIO_PINMASK_0 | _GPIO_PINMASK_1 |                                  // ONE_TOUCH, TWO_TOUCH,
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
;nestHelm.c,64 :: 		_GPIO_CFG_MODE_INPUT | _GPIO_CFG_PULL_DOWN);
BL	_GPIO_Config+0
;nestHelm.c,66 :: 		_GPIO_CFG_MODE_INPUT | _GPIO_CFG_PULL_DOWN);
MOV	R2, #258
;nestHelm.c,65 :: 		GPIO_Config(&GPIOA_BASE, _GPIO_PINMASK_7 | _GPIO_PINMASK_6,                                   // N_TOUCH, R_TOUCH,
MOVW	R1, #192
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
;nestHelm.c,66 :: 		_GPIO_CFG_MODE_INPUT | _GPIO_CFG_PULL_DOWN);
BL	_GPIO_Config+0
;nestHelm.c,68 :: 		_GPIO_PINMASK_13 | _GPIO_PINMASK_12 | _GPIO_PINMASK_11);     // ONE_LIGHT, TWO_LIGHT, THREE_LIGHT
MOVW	R1, #63488
;nestHelm.c,67 :: 		GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_15 | _GPIO_PINMASK_14 |                        // R_LIGHT, N_LIGHT
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
;nestHelm.c,68 :: 		_GPIO_PINMASK_13 | _GPIO_PINMASK_12 | _GPIO_PINMASK_11);     // ONE_LIGHT, TWO_LIGHT, THREE_LIGHT
BL	_GPIO_Digital_Output+0
;nestHelm.c,72 :: 		GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_15);                                            // WHEEL_LIGHT
MOVW	R1, #32768
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Digital_Output+0
;nestHelm.c,73 :: 		GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_3);                                             // WHEEL_DIODE
MOVW	R1, #8
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Output+0
;nestHelm.c,75 :: 		_GPIO_CFG_MODE_INPUT | _GPIO_CFG_PULL_NO);
MOV	R2, #66
;nestHelm.c,74 :: 		GPIO_Config(&GPIOA_BASE, _GPIO_PINMASK_4,                                                      // WHEEL_TOUCH
MOVW	R1, #16
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
;nestHelm.c,75 :: 		_GPIO_CFG_MODE_INPUT | _GPIO_CFG_PULL_NO);
BL	_GPIO_Config+0
;nestHelm.c,79 :: 		GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_5);                                             // WTPSC
MOVW	R1, #32
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Digital_Output+0
;nestHelm.c,80 :: 		GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_9);                                             // GTPSC
MOVW	R1, #512
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Output+0
;nestHelm.c,83 :: 		GPIO_Digital_Output(&GPIOC_BASE, _GPIO_PINMASK_13);    // LED11
MOVW	R1, #8192
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Output+0
;nestHelm.c,90 :: 		SWJ_CFG0_bit = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R0, #lo_addr(SWJ_CFG0_bit+0)
MOVT	R0, #hi_addr(SWJ_CFG0_bit+0)
_SX	[R0, ByteOffset(SWJ_CFG0_bit+0)]
;nestHelm.c,91 :: 		SWJ_CFG1_bit = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(SWJ_CFG1_bit+0)
MOVT	R0, #hi_addr(SWJ_CFG1_bit+0)
_SX	[R0, ByteOffset(SWJ_CFG1_bit+0)]
;nestHelm.c,92 :: 		SWJ_CFG2_bit = 0;
MOVW	R0, #lo_addr(SWJ_CFG2_bit+0)
MOVT	R0, #hi_addr(SWJ_CFG2_bit+0)
_SX	[R0, ByteOffset(SWJ_CFG2_bit+0)]
;nestHelm.c,94 :: 		WHEEL_DIODE = 0;
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
_SX	[R0, ByteOffset(GPIOB_ODR+0)]
;nestHelm.c,95 :: 		WHEEL_LIGHT = 0;
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
_SX	[R0, ByteOffset(GPIOA_ODR+0)]
;nestHelm.c,97 :: 		WTPSC = 0;
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
_SX	[R0, ByteOffset(GPIOA_ODR+0)]
;nestHelm.c,101 :: 		GPIO_Analog_Input(&GPIOA_IDR, _GPIO_PINMASK_0);
MOVW	R1, #1
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
BL	_GPIO_Analog_Input+0
;nestHelm.c,102 :: 		ADC1_Init();
BL	_ADC1_Init+0
;nestHelm.c,104 :: 		WTPSC = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
_SX	[R0, ByteOffset(GPIOA_ODR+0)]
;nestHelm.c,105 :: 		LED11 = 1;
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
_SX	[R0, ByteOffset(GPIOC_ODR+0)]
;nestHelm.c,106 :: 		Delay_ms(100);
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
;nestHelm.c,107 :: 		EEPROM_24C02_Init();
BL	_EEPROM_24C02_Init+0
;nestHelm.c,108 :: 		Delay_ms(100);
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
;nestHelm.c,110 :: 		Delay_ms(100);
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
;nestHelm.c,111 :: 		citajeprom();
BL	_citajeprom+0
;nestHelm.c,112 :: 		Delay_ms(100);
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
;nestHelm.c,113 :: 		WTPSC = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
_SX	[R0, ByteOffset(GPIOA_ODR+0)]
;nestHelm.c,114 :: 		LED11 = 0;
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
_SX	[R0, ByteOffset(GPIOC_ODR+0)]
;nestHelm.c,116 :: 		bitResetTouchSensor = 0;
MOVW	R0, #lo_addr(_bitResetTouchSensor+0)
MOVT	R0, #hi_addr(_bitResetTouchSensor+0)
STR	R1, [R0, #0]
;nestHelm.c,119 :: 		startReceivingData1 = 0;
MOVW	R0, #lo_addr(_startReceivingData1+0)
MOVT	R0, #hi_addr(_startReceivingData1+0)
STR	R1, [R0, #0]
;nestHelm.c,120 :: 		control_taken = 0;
MOVW	R0, #lo_addr(_control_taken+0)
MOVT	R0, #hi_addr(_control_taken+0)
STR	R1, [R0, #0]
;nestHelm.c,121 :: 		bitDelay3Seconds = 0;
MOVW	R0, #lo_addr(_bitDelay3Seconds+0)
MOVT	R0, #hi_addr(_bitDelay3Seconds+0)
STR	R1, [R0, #0]
;nestHelm.c,122 :: 		bitStart3SecondsCount = 0;
MOVW	R0, #lo_addr(_bitStart3SecondsCount+0)
MOVT	R0, #hi_addr(_bitStart3SecondsCount+0)
STR	R1, [R0, #0]
;nestHelm.c,123 :: 		countedTimer = 0;
MOVW	R0, #lo_addr(_countedTimer+0)
MOVT	R0, #hi_addr(_countedTimer+0)
STR	R1, [R0, #0]
;nestHelm.c,124 :: 		bitRespond = 0;
MOVW	R0, #lo_addr(_bitRespond+0)
MOVT	R0, #hi_addr(_bitRespond+0)
STR	R1, [R0, #0]
;nestHelm.c,125 :: 		bitControlTaken = 0;
MOVW	R0, #lo_addr(_bitControlTaken+0)
MOVT	R0, #hi_addr(_bitControlTaken+0)
STR	R1, [R0, #0]
;nestHelm.c,127 :: 		bitCalSend = 0;
MOVW	R0, #lo_addr(_bitCalSend+0)
MOVT	R0, #hi_addr(_bitCalSend+0)
STR	R1, [R0, #0]
;nestHelm.c,129 :: 		if(leftLimit >= rightLimit){
MOVW	R0, #lo_addr(_rightLimit+0)
MOVT	R0, #hi_addr(_rightLimit+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_leftLimit+0)
MOVT	R0, #hi_addr(_leftLimit+0)
LDRH	R0, [R0, #0]
CMP	R0, R1
IT	CC
BCC	L_main10
;nestHelm.c,130 :: 		sideDifference = leftLimit - rightLimit;
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
;nestHelm.c,131 :: 		}
IT	AL
BAL	L_main11
L_main10:
;nestHelm.c,133 :: 		sideDifference = rightLimit - leftLimit;
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
;nestHelm.c,134 :: 		}
L_main11:
;nestHelm.c,136 :: 		if(sideDifference == 0){
MOVW	R0, #lo_addr(_sideDifference+0)
MOVT	R0, #hi_addr(_sideDifference+0)
LDRH	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_main12
;nestHelm.c,137 :: 		sideDifference = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_sideDifference+0)
MOVT	R0, #hi_addr(_sideDifference+0)
STRH	R1, [R0, #0]
;nestHelm.c,138 :: 		}
L_main12:
;nestHelm.c,142 :: 		InitTimer2();
BL	_InitTimer2+0
;nestHelm.c,146 :: 		while(1){
L_main13:
;nestHelm.c,150 :: 		WHEEL_DIODE = WHEEL_TOUCH;
MOVW	R2, #lo_addr(GPIOA_IDR+0)
MOVT	R2, #hi_addr(GPIOA_IDR+0)
_LX	[R2, ByteOffset(GPIOA_IDR+0)]
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
_SX	[R0, ByteOffset(GPIOB_ODR+0)]
;nestHelm.c,151 :: 		WHEEL_LIGHT = WHEEL_TOUCH | bitDelay3Seconds;
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
;nestHelm.c,153 :: 		if(!bitControlTaken){
MOVW	R1, #lo_addr(_bitControlTaken+0)
MOVT	R1, #hi_addr(_bitControlTaken+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_main15
;nestHelm.c,155 :: 		if (Button(&GPIOB_IDR, 0, 20, 1)){
MOVS	R3, #1
MOVS	R2, #20
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOB_IDR+0)
MOVT	R0, #hi_addr(GPIOB_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	EQ
BEQ	L_main16
;nestHelm.c,156 :: 		ONE_LIGHT = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
_SX	[R0, ByteOffset(GPIOB_ODR+0)]
;nestHelm.c,157 :: 		TWO_LIGHT = THREE_LIGHT = N_LIGHT = R_LIGHT = 0;
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
;nestHelm.c,160 :: 		}
L_main16:
;nestHelm.c,162 :: 		if (Button(&GPIOB_IDR, 1, 20, 1)){
MOVS	R3, #1
MOVS	R2, #20
MOVS	R1, #1
MOVW	R0, #lo_addr(GPIOB_IDR+0)
MOVT	R0, #hi_addr(GPIOB_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	EQ
BEQ	L_main17
;nestHelm.c,163 :: 		TWO_LIGHT = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
_SX	[R0, ByteOffset(GPIOB_ODR+0)]
;nestHelm.c,164 :: 		ONE_LIGHT = THREE_LIGHT = N_LIGHT = R_LIGHT = 0;
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
L_main17:
;nestHelm.c,167 :: 		if (Button(&GPIOB_IDR, 10, 20, 1)){
MOVS	R3, #1
MOVS	R2, #20
MOVS	R1, #10
MOVW	R0, #lo_addr(GPIOB_IDR+0)
MOVT	R0, #hi_addr(GPIOB_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	EQ
BEQ	L_main18
;nestHelm.c,168 :: 		THREE_LIGHT = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
_SX	[R0, ByteOffset(GPIOB_ODR+0)]
;nestHelm.c,169 :: 		TWO_LIGHT = ONE_LIGHT = N_LIGHT = R_LIGHT = 0;
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
L_main18:
;nestHelm.c,172 :: 		if (Button(&GPIOA_IDR, 7, 20, 1)){
MOVS	R3, #1
MOVS	R2, #20
MOVS	R1, #7
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	EQ
BEQ	L_main19
;nestHelm.c,173 :: 		N_LIGHT = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
_SX	[R0, ByteOffset(GPIOB_ODR+0)]
;nestHelm.c,174 :: 		TWO_LIGHT = THREE_LIGHT = ONE_LIGHT = R_LIGHT = 0;
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
;nestHelm.c,181 :: 		}
L_main19:
;nestHelm.c,183 :: 		if (Button(&GPIOA_IDR, 6, 20, 1)){
MOVS	R3, #1
MOVS	R2, #20
MOVS	R1, #6
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	EQ
BEQ	L_main20
;nestHelm.c,184 :: 		R_LIGHT = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
_SX	[R0, ByteOffset(GPIOB_ODR+0)]
;nestHelm.c,185 :: 		TWO_LIGHT = THREE_LIGHT = N_LIGHT = ONE_LIGHT = 0;
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
;nestHelm.c,186 :: 		}
L_main20:
;nestHelm.c,194 :: 		if(WHEEL_TOUCH || bitDelay3Seconds){
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
_LX	[R0, ByteOffset(GPIOA_IDR+0)]
CMP	R0, #0
IT	NE
BNE	L__main81
MOVW	R1, #lo_addr(_bitDelay3Seconds+0)
MOVT	R1, #hi_addr(_bitDelay3Seconds+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L__main80
IT	AL
BAL	L_main23
L__main81:
L__main80:
;nestHelm.c,195 :: 		if(WHEEL_TOUCH){
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
_LX	[R0, ByteOffset(GPIOA_IDR+0)]
CMP	R0, #0
IT	EQ
BEQ	L_main24
;nestHelm.c,196 :: 		bitDelay3Seconds = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(_bitDelay3Seconds+0)
MOVT	R0, #hi_addr(_bitDelay3Seconds+0)
STR	R1, [R0, #0]
;nestHelm.c,197 :: 		bitStart3SecondsCount = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(_bitStart3SecondsCount+0)
MOVT	R0, #hi_addr(_bitStart3SecondsCount+0)
STR	R1, [R0, #0]
;nestHelm.c,198 :: 		delay3secndsCount = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_delay3secndsCount+0)
MOVT	R0, #hi_addr(_delay3secndsCount+0)
STRH	R1, [R0, #0]
;nestHelm.c,199 :: 		}
IT	AL
BAL	L_main25
L_main24:
;nestHelm.c,201 :: 		bitStart3SecondsCount = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(_bitStart3SecondsCount+0)
MOVT	R0, #hi_addr(_bitStart3SecondsCount+0)
STR	R1, [R0, #0]
;nestHelm.c,202 :: 		}
L_main25:
;nestHelm.c,204 :: 		if(THREE_LIGHT == 1){
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
_LX	[R0, ByteOffset(GPIOB_ODR+0)]
CMP	R0, #0
IT	EQ
BEQ	L_main26
;nestHelm.c,205 :: 		gear_status = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_gear_status+0)
MOVT	R0, #hi_addr(_gear_status+0)
STRH	R1, [R0, #0]
;nestHelm.c,206 :: 		}
L_main26:
;nestHelm.c,208 :: 		if(TWO_LIGHT == 1){
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
_LX	[R0, ByteOffset(GPIOB_ODR+0)]
CMP	R0, #0
IT	EQ
BEQ	L_main27
;nestHelm.c,209 :: 		gear_status = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_gear_status+0)
MOVT	R0, #hi_addr(_gear_status+0)
STRH	R1, [R0, #0]
;nestHelm.c,210 :: 		}
L_main27:
;nestHelm.c,212 :: 		if(ONE_LIGHT == 1){
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
_LX	[R0, ByteOffset(GPIOB_ODR+0)]
CMP	R0, #0
IT	EQ
BEQ	L_main28
;nestHelm.c,213 :: 		gear_status = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_gear_status+0)
MOVT	R0, #hi_addr(_gear_status+0)
STRH	R1, [R0, #0]
;nestHelm.c,214 :: 		}
L_main28:
;nestHelm.c,216 :: 		if(R_LIGHT == 1){
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
_LX	[R0, ByteOffset(GPIOB_ODR+0)]
CMP	R0, #0
IT	EQ
BEQ	L_main29
;nestHelm.c,217 :: 		gear_status = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_gear_status+0)
MOVT	R0, #hi_addr(_gear_status+0)
STRH	R1, [R0, #0]
;nestHelm.c,218 :: 		}
L_main29:
;nestHelm.c,220 :: 		if(N_LIGHT == 1){
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
_LX	[R0, ByteOffset(GPIOB_ODR+0)]
CMP	R0, #0
IT	EQ
BEQ	L_main30
;nestHelm.c,221 :: 		gear_status = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_gear_status+0)
MOVT	R0, #hi_addr(_gear_status+0)
STRH	R1, [R0, #0]
;nestHelm.c,222 :: 		}
L_main30:
;nestHelm.c,224 :: 		}
IT	AL
BAL	L_main31
L_main23:
;nestHelm.c,226 :: 		R_LIGHT = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
_SX	[R0, ByteOffset(GPIOB_ODR+0)]
;nestHelm.c,227 :: 		ONE_LIGHT = 0;
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
_SX	[R0, ByteOffset(GPIOB_ODR+0)]
;nestHelm.c,228 :: 		TWO_LIGHT = 0;
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
_SX	[R0, ByteOffset(GPIOB_ODR+0)]
;nestHelm.c,229 :: 		THREE_LIGHT = 0;
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
_SX	[R0, ByteOffset(GPIOB_ODR+0)]
;nestHelm.c,230 :: 		N_LIGHT = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
_SX	[R0, ByteOffset(GPIOB_ODR+0)]
;nestHelm.c,231 :: 		gear_status = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_gear_status+0)
MOVT	R0, #hi_addr(_gear_status+0)
STRH	R1, [R0, #0]
;nestHelm.c,232 :: 		}
L_main31:
;nestHelm.c,234 :: 		}
L_main15:
;nestHelm.c,241 :: 		if(countedTimer) {
MOVW	R1, #lo_addr(_countedTimer+0)
MOVT	R1, #hi_addr(_countedTimer+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_main32
;nestHelm.c,243 :: 		countedTimer = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(_countedTimer+0)
MOVT	R0, #hi_addr(_countedTimer+0)
STR	R1, [R0, #0]
;nestHelm.c,246 :: 		for(i=0; i<300; i++){
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
;nestHelm.c,247 :: 		ADC_Set_Input_Channel(_ADC_CHANNEL_0);
MOVW	R0, #1
BL	_ADC_Set_Input_Channel+0
;nestHelm.c,248 :: 		adc_read1 = ADC1_Get_Sample(0);
MOVS	R0, #0
BL	_ADC1_Get_Sample+0
MOVW	R3, #lo_addr(_adc_read1+0)
MOVT	R3, #hi_addr(_adc_read1+0)
STR	R0, [R3, #0]
;nestHelm.c,250 :: 		adc_array[i] = adc_read1;
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
;nestHelm.c,246 :: 		for(i=0; i<300; i++){
MOV	R0, R2
LDRH	R0, [R0, #0]
ADDS	R0, R0, #1
STRH	R0, [R2, #0]
;nestHelm.c,251 :: 		}
IT	AL
BAL	L_main33
L_main34:
;nestHelm.c,253 :: 		for(i=0; i<300; i++)
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
;nestHelm.c,255 :: 		for(j=i+1; j<300; j++)
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
;nestHelm.c,257 :: 		if(adc_array[j]<adc_array[i])
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
;nestHelm.c,259 :: 		tmp = adc_array[i];
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
;nestHelm.c,260 :: 		adc_array[i] = adc_array[j];
MOVW	R2, #lo_addr(_j+0)
MOVT	R2, #hi_addr(_j+0)
LDRSH	R0, [R2, #0]
LSLS	R1, R0, #1
MOVW	R0, #lo_addr(_adc_array+0)
MOVT	R0, #hi_addr(_adc_array+0)
ADDS	R0, R0, R1
LDRSH	R0, [R0, #0]
STRH	R0, [R4, #0]
;nestHelm.c,261 :: 		adc_array[j] = tmp;
MOV	R0, R2
LDRSH	R0, [R0, #0]
LSLS	R1, R0, #1
MOVW	R0, #lo_addr(_adc_array+0)
MOVT	R0, #hi_addr(_adc_array+0)
ADDS	R1, R0, R1
MOV	R0, R3
LDRSH	R0, [R0, #0]
STRH	R0, [R1, #0]
;nestHelm.c,262 :: 		}
L_main42:
;nestHelm.c,255 :: 		for(j=i+1; j<300; j++)
MOVW	R1, #lo_addr(_j+0)
MOVT	R1, #hi_addr(_j+0)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;nestHelm.c,263 :: 		}
IT	AL
BAL	L_main39
L_main40:
;nestHelm.c,253 :: 		for(i=0; i<300; i++)
MOVW	R1, #lo_addr(_i+0)
MOVT	R1, #hi_addr(_i+0)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;nestHelm.c,264 :: 		}
IT	AL
BAL	L_main36
L_main37:
;nestHelm.c,266 :: 		for(i=100; i<200; i++){
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
;nestHelm.c,267 :: 		adcSum += adc_array[i];
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
;nestHelm.c,266 :: 		for(i=100; i<200; i++){
MOV	R0, R3
LDRH	R0, [R0, #0]
ADDS	R0, R0, #1
STRH	R0, [R3, #0]
;nestHelm.c,268 :: 		}
IT	AL
BAL	L_main43
L_main44:
;nestHelm.c,271 :: 		adc_avg1 = ((float)adcSum)/100f;
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
;nestHelm.c,272 :: 		calAdcAvg = (long)(adc_avg1 * 100f);
MOVW	R2, #0
MOVT	R2, #17096
BL	__Mul_FP+0
BL	__FloatToSignedIntegral+0
MOVW	R1, #lo_addr(_calAdcAvg+0)
MOVT	R1, #hi_addr(_calAdcAvg+0)
STR	R0, [R1, #0]
;nestHelm.c,274 :: 		adcSum = 0;
MOVS	R1, #0
LDR	R0, [SP, #4]
STR	R1, [R0, #0]
;nestHelm.c,275 :: 		if(leftLimit <= rightLimit){
MOVW	R0, #lo_addr(_rightLimit+0)
MOVT	R0, #hi_addr(_rightLimit+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_leftLimit+0)
MOVT	R0, #hi_addr(_leftLimit+0)
LDRH	R0, [R0, #0]
CMP	R0, R1
IT	HI
BHI	L_main46
;nestHelm.c,276 :: 		adc_avg1 = adc_avg1 - (float)leftLimit;
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
;nestHelm.c,277 :: 		}
IT	AL
BAL	L_main47
L_main46:
;nestHelm.c,279 :: 		adc_avg1 = adc_avg1 - (float)rightLimit;
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
;nestHelm.c,280 :: 		}
L_main47:
;nestHelm.c,281 :: 		if(adc_avg1 < 0f){
MOVW	R0, #lo_addr(_adc_avg1+0)
MOVT	R0, #hi_addr(_adc_avg1+0)
LDR	R2, [R0, #0]
MOV	R0, #0
BL	__Compare_FP+0
MOVW	R0, #0
BLE	L__main88
MOVS	R0, #1
L__main88:
CMP	R0, #0
IT	EQ
BEQ	L_main48
;nestHelm.c,282 :: 		adc_avg1 = 0f;
MOV	R1, #0
MOVW	R0, #lo_addr(_adc_avg1+0)
MOVT	R0, #hi_addr(_adc_avg1+0)
STR	R1, [R0, #0]
;nestHelm.c,283 :: 		}
IT	AL
BAL	L_main49
L_main48:
;nestHelm.c,284 :: 		else if(adc_avg1 > (float)sideDifference){
MOVW	R0, #lo_addr(_sideDifference+0)
MOVT	R0, #hi_addr(_sideDifference+0)
LDRH	R0, [R0, #0]
BL	__UnsignedIntegralToFloat+0
MOVW	R1, #lo_addr(_adc_avg1+0)
MOVT	R1, #hi_addr(_adc_avg1+0)
LDR	R2, [R1, #0]
BL	__Compare_FP+0
MOVW	R0, #0
BGE	L__main89
MOVS	R0, #1
L__main89:
CMP	R0, #0
IT	EQ
BEQ	L_main50
;nestHelm.c,285 :: 		adc_avg1 = (float)sideDifference;
MOVW	R0, #lo_addr(_sideDifference+0)
MOVT	R0, #hi_addr(_sideDifference+0)
LDRH	R0, [R0, #0]
BL	__UnsignedIntegralToFloat+0
MOVW	R1, #lo_addr(_adc_avg1+0)
MOVT	R1, #hi_addr(_adc_avg1+0)
STR	R0, [R1, #0]
;nestHelm.c,286 :: 		}
L_main50:
L_main49:
;nestHelm.c,304 :: 		fHalfSideDif = sideDifference / 2f;
MOVW	R0, #lo_addr(_sideDifference+0)
MOVT	R0, #hi_addr(_sideDifference+0)
LDRH	R0, [R0, #0]
BL	__UnsignedIntegralToFloat+0
MOV	R2, #1073741824
BL	__Div_FP+0
MOVW	R1, #lo_addr(_fHalfSideDif+0)
MOVT	R1, #hi_addr(_fHalfSideDif+0)
STR	R0, [R1, #0]
;nestHelm.c,306 :: 		if(adc_avg1 > fHalfSideDif){
MOVW	R1, #lo_addr(_adc_avg1+0)
MOVT	R1, #hi_addr(_adc_avg1+0)
LDR	R2, [R1, #0]
BL	__Compare_FP+0
MOVW	R0, #0
BGE	L__main90
MOVS	R0, #1
L__main90:
CMP	R0, #0
IT	EQ
BEQ	L_main51
;nestHelm.c,307 :: 		fAdcAvg = adc_avg1-fHalfSideDif;
MOVW	R0, #lo_addr(_fHalfSideDif+0)
MOVT	R0, #hi_addr(_fHalfSideDif+0)
LDR	R2, [R0, #0]
MOVW	R0, #lo_addr(_adc_avg1+0)
MOVT	R0, #hi_addr(_adc_avg1+0)
LDR	R0, [R0, #0]
BL	__Sub_FP+0
MOVW	R1, #lo_addr(_fAdcAvg+0)
MOVT	R1, #hi_addr(_fAdcAvg+0)
STR	R0, [R1, #0]
;nestHelm.c,308 :: 		}
IT	AL
BAL	L_main52
L_main51:
;nestHelm.c,309 :: 		else if(adc_avg1 < fHalfSideDif){
MOVW	R0, #lo_addr(_fHalfSideDif+0)
MOVT	R0, #hi_addr(_fHalfSideDif+0)
LDR	R2, [R0, #0]
MOVW	R0, #lo_addr(_adc_avg1+0)
MOVT	R0, #hi_addr(_adc_avg1+0)
LDR	R0, [R0, #0]
BL	__Compare_FP+0
MOVW	R0, #0
BGE	L__main91
MOVS	R0, #1
L__main91:
CMP	R0, #0
IT	EQ
BEQ	L_main53
;nestHelm.c,310 :: 		fAdcAvg = fHalfSideDif-adc_avg1;
MOVW	R0, #lo_addr(_adc_avg1+0)
MOVT	R0, #hi_addr(_adc_avg1+0)
LDR	R2, [R0, #0]
MOVW	R0, #lo_addr(_fHalfSideDif+0)
MOVT	R0, #hi_addr(_fHalfSideDif+0)
LDR	R0, [R0, #0]
BL	__Sub_FP+0
MOVW	R1, #lo_addr(_fAdcAvg+0)
MOVT	R1, #hi_addr(_fAdcAvg+0)
STR	R0, [R1, #0]
;nestHelm.c,311 :: 		}
IT	AL
BAL	L_main54
L_main53:
;nestHelm.c,313 :: 		fAdcAvg = 0f;
MOV	R1, #0
MOVW	R0, #lo_addr(_fAdcAvg+0)
MOVT	R0, #hi_addr(_fAdcAvg+0)
STR	R1, [R0, #0]
;nestHelm.c,314 :: 		}
L_main54:
L_main52:
;nestHelm.c,316 :: 		fHalfDuty = (fAdcAvg * 5f) / (float)fHalfSideDif;
MOVW	R0, #lo_addr(_fAdcAvg+0)
MOVT	R0, #hi_addr(_fAdcAvg+0)
LDR	R2, [R0, #0]
MOVW	R0, #0
MOVT	R0, #16544
BL	__Mul_FP+0
MOVW	R1, #lo_addr(_fHalfSideDif+0)
MOVT	R1, #hi_addr(_fHalfSideDif+0)
LDR	R2, [R1, #0]
BL	__Div_FP+0
MOVW	R1, #lo_addr(_fHalfDuty+0)
MOVT	R1, #hi_addr(_fHalfDuty+0)
STR	R1, [SP, #4]
STR	R0, [R1, #0]
;nestHelm.c,317 :: 		fHalfDutyAfterFun = 4f * fHalfDuty * fHalfDuty;
MOV	R2, #1082130432
BL	__Mul_FP+0
LDR	R1, [SP, #4]
LDR	R2, [R1, #0]
BL	__Mul_FP+0
MOVW	R1, #lo_addr(_fHalfDutyAfterFun+0)
MOVT	R1, #hi_addr(_fHalfDutyAfterFun+0)
STR	R0, [R1, #0]
;nestHelm.c,319 :: 		if(dir != 0){
MOVW	R0, #lo_addr(_dir+0)
MOVT	R0, #hi_addr(_dir+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_main55
;nestHelm.c,320 :: 		dutyF = ((adc_avg1 * 200f) / ((float)sideDifference)) + 50f;
MOVW	R0, #lo_addr(_adc_avg1+0)
MOVT	R0, #hi_addr(_adc_avg1+0)
STR	R0, [SP, #12]
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
;nestHelm.c,322 :: 		if(adc_avg1 < fHalfSideDif){
MOVW	R0, #lo_addr(_fHalfSideDif+0)
MOVT	R0, #hi_addr(_fHalfSideDif+0)
LDR	R2, [R0, #0]
LDR	R0, [SP, #12]
LDR	R0, [R0, #0]
BL	__Compare_FP+0
MOVW	R0, #0
BGE	L__main92
MOVS	R0, #1
L__main92:
CMP	R0, #0
IT	EQ
BEQ	L_main56
;nestHelm.c,323 :: 		fDuty = 150f - fHalfDutyAfterFun;
MOVW	R0, #lo_addr(_fHalfDutyAfterFun+0)
MOVT	R0, #hi_addr(_fHalfDutyAfterFun+0)
LDR	R2, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17174
BL	__Sub_FP+0
MOVW	R1, #lo_addr(_fDuty+0)
MOVT	R1, #hi_addr(_fDuty+0)
STR	R0, [R1, #0]
;nestHelm.c,324 :: 		}
IT	AL
BAL	L_main57
L_main56:
;nestHelm.c,325 :: 		else if(adc_avg1 > fHalfSideDif){
MOVW	R0, #lo_addr(_fHalfSideDif+0)
MOVT	R0, #hi_addr(_fHalfSideDif+0)
LDR	R2, [R0, #0]
MOVW	R0, #lo_addr(_adc_avg1+0)
MOVT	R0, #hi_addr(_adc_avg1+0)
LDR	R0, [R0, #0]
BL	__Compare_FP+0
MOVW	R0, #0
BLE	L__main93
MOVS	R0, #1
L__main93:
CMP	R0, #0
IT	EQ
BEQ	L_main58
;nestHelm.c,326 :: 		fDuty = 150f + fHalfDutyAfterFun;
MOVW	R0, #lo_addr(_fHalfDutyAfterFun+0)
MOVT	R0, #hi_addr(_fHalfDutyAfterFun+0)
LDR	R2, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17174
BL	__Add_FP+0
MOVW	R1, #lo_addr(_fDuty+0)
MOVT	R1, #hi_addr(_fDuty+0)
STR	R0, [R1, #0]
;nestHelm.c,327 :: 		}
IT	AL
BAL	L_main59
L_main58:
;nestHelm.c,329 :: 		fDuty = 150f;
MOVW	R1, #0
MOVT	R1, #17174
MOVW	R0, #lo_addr(_fDuty+0)
MOVT	R0, #hi_addr(_fDuty+0)
STR	R1, [R0, #0]
;nestHelm.c,330 :: 		}
L_main59:
L_main57:
;nestHelm.c,333 :: 		}
IT	AL
BAL	L_main60
L_main55:
;nestHelm.c,335 :: 		dutyF = 250f - ((adc_avg1 * 200f) / ((float)sideDifference));
MOVW	R0, #lo_addr(_adc_avg1+0)
MOVT	R0, #hi_addr(_adc_avg1+0)
STR	R0, [SP, #12]
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
;nestHelm.c,337 :: 		if(adc_avg1 < fHalfSideDif){
MOVW	R0, #lo_addr(_fHalfSideDif+0)
MOVT	R0, #hi_addr(_fHalfSideDif+0)
LDR	R2, [R0, #0]
LDR	R0, [SP, #12]
LDR	R0, [R0, #0]
BL	__Compare_FP+0
MOVW	R0, #0
BGE	L__main94
MOVS	R0, #1
L__main94:
CMP	R0, #0
IT	EQ
BEQ	L_main61
;nestHelm.c,338 :: 		fDuty = 150f + fHalfDutyAfterFun;
MOVW	R0, #lo_addr(_fHalfDutyAfterFun+0)
MOVT	R0, #hi_addr(_fHalfDutyAfterFun+0)
LDR	R2, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17174
BL	__Add_FP+0
MOVW	R1, #lo_addr(_fDuty+0)
MOVT	R1, #hi_addr(_fDuty+0)
STR	R0, [R1, #0]
;nestHelm.c,339 :: 		}
IT	AL
BAL	L_main62
L_main61:
;nestHelm.c,340 :: 		else if(adc_avg1 > fHalfSideDif){
MOVW	R0, #lo_addr(_fHalfSideDif+0)
MOVT	R0, #hi_addr(_fHalfSideDif+0)
LDR	R2, [R0, #0]
MOVW	R0, #lo_addr(_adc_avg1+0)
MOVT	R0, #hi_addr(_adc_avg1+0)
LDR	R0, [R0, #0]
BL	__Compare_FP+0
MOVW	R0, #0
BLE	L__main95
MOVS	R0, #1
L__main95:
CMP	R0, #0
IT	EQ
BEQ	L_main63
;nestHelm.c,341 :: 		fDuty = 150f - fHalfDutyAfterFun;
MOVW	R0, #lo_addr(_fHalfDutyAfterFun+0)
MOVT	R0, #hi_addr(_fHalfDutyAfterFun+0)
LDR	R2, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17174
BL	__Sub_FP+0
MOVW	R1, #lo_addr(_fDuty+0)
MOVT	R1, #hi_addr(_fDuty+0)
STR	R0, [R1, #0]
;nestHelm.c,342 :: 		}
IT	AL
BAL	L_main64
L_main63:
;nestHelm.c,344 :: 		fDuty = 150f;
MOVW	R1, #0
MOVT	R1, #17174
MOVW	R0, #lo_addr(_fDuty+0)
MOVT	R0, #hi_addr(_fDuty+0)
STR	R1, [R0, #0]
;nestHelm.c,345 :: 		}
L_main64:
L_main62:
;nestHelm.c,346 :: 		}
L_main60:
;nestHelm.c,347 :: 		calDutyF = (long)(fDuty * 100f);
MOVW	R0, #lo_addr(_fDuty+0)
MOVT	R0, #hi_addr(_fDuty+0)
LDR	R2, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17096
BL	__Mul_FP+0
BL	__FloatToSignedIntegral+0
MOVW	R1, #lo_addr(_calDutyF+0)
MOVT	R1, #hi_addr(_calDutyF+0)
STR	R0, [R1, #0]
;nestHelm.c,351 :: 		if(((int)(dutyF * 10f)) % 10 >= 5){
MOVW	R0, #lo_addr(_dutyF+0)
MOVT	R0, #hi_addr(_dutyF+0)
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
BLT	L_main65
;nestHelm.c,352 :: 		dutyy = (int)dutyF + 1;
MOVW	R0, #lo_addr(_dutyF+0)
MOVT	R0, #hi_addr(_dutyF+0)
LDR	R0, [R0, #0]
BL	__FloatToSignedIntegral+0
SXTH	R0, R0
ADDS	R1, R0, #1
MOVW	R0, #lo_addr(_dutyy+0)
MOVT	R0, #hi_addr(_dutyy+0)
STRH	R1, [R0, #0]
;nestHelm.c,353 :: 		}
IT	AL
BAL	L_main66
L_main65:
;nestHelm.c,355 :: 		dutyy = (int)dutyF;
MOVW	R0, #lo_addr(_dutyF+0)
MOVT	R0, #hi_addr(_dutyF+0)
LDR	R0, [R0, #0]
BL	__FloatToSignedIntegral+0
SXTH	R0, R0
MOVW	R1, #lo_addr(_dutyy+0)
MOVT	R1, #hi_addr(_dutyy+0)
STRH	R0, [R1, #0]
;nestHelm.c,356 :: 		}
L_main66:
;nestHelm.c,360 :: 		calDuty = dutyy;
MOVW	R0, #lo_addr(_dutyy+0)
MOVT	R0, #hi_addr(_dutyy+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_calDuty+0)
MOVT	R0, #hi_addr(_calDuty+0)
STRH	R1, [R0, #0]
;nestHelm.c,365 :: 		if(((int)(fDuty * 10f)) % 10 >= 5){
MOVW	R0, #lo_addr(_fDuty+0)
MOVT	R0, #hi_addr(_fDuty+0)
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
BLT	L_main67
;nestHelm.c,366 :: 		dutyy = (int)fDuty + 1;
MOVW	R0, #lo_addr(_fDuty+0)
MOVT	R0, #hi_addr(_fDuty+0)
LDR	R0, [R0, #0]
BL	__FloatToSignedIntegral+0
SXTH	R0, R0
ADDS	R1, R0, #1
MOVW	R0, #lo_addr(_dutyy+0)
MOVT	R0, #hi_addr(_dutyy+0)
STRH	R1, [R0, #0]
;nestHelm.c,367 :: 		}
IT	AL
BAL	L_main68
L_main67:
;nestHelm.c,369 :: 		dutyy = (int)fDuty;
MOVW	R0, #lo_addr(_fDuty+0)
MOVT	R0, #hi_addr(_fDuty+0)
LDR	R0, [R0, #0]
BL	__FloatToSignedIntegral+0
SXTH	R0, R0
MOVW	R1, #lo_addr(_dutyy+0)
MOVT	R1, #hi_addr(_dutyy+0)
STRH	R0, [R1, #0]
;nestHelm.c,370 :: 		}
L_main68:
;nestHelm.c,385 :: 		if((!((dutyOld - 2 < dutyy) && (dutyy < dutyOld + 2))) && (dutyCounter < 3)){
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
BGE	L_main70
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
BGE	L_main70
MOVS	R0, #1
IT	AL
BAL	L_main69
L_main70:
MOVS	R0, #0
L_main69:
CMP	R0, #0
IT	NE
BNE	L__main83
MOVW	R0, #lo_addr(_dutyCounter+0)
MOVT	R0, #hi_addr(_dutyCounter+0)
LDRSH	R0, [R0, #0]
CMP	R0, #3
IT	GE
BGE	L__main82
L__main78:
;nestHelm.c,386 :: 		dutyy = dutyOld;
MOVW	R0, #lo_addr(_dutyOld+0)
MOVT	R0, #hi_addr(_dutyOld+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_dutyy+0)
MOVT	R0, #hi_addr(_dutyy+0)
STRH	R1, [R0, #0]
;nestHelm.c,387 :: 		dutyCounter++;
MOVW	R1, #lo_addr(_dutyCounter+0)
MOVT	R1, #hi_addr(_dutyCounter+0)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;nestHelm.c,388 :: 		}
IT	AL
BAL	L_main74
;nestHelm.c,385 :: 		if((!((dutyOld - 2 < dutyy) && (dutyy < dutyOld + 2))) && (dutyCounter < 3)){
L__main83:
L__main82:
;nestHelm.c,390 :: 		dutyCounter = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_dutyCounter+0)
MOVT	R0, #hi_addr(_dutyCounter+0)
STRH	R1, [R0, #0]
;nestHelm.c,391 :: 		dutyOld = dutyy;
MOVW	R0, #lo_addr(_dutyy+0)
MOVT	R0, #hi_addr(_dutyy+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_dutyOld+0)
MOVT	R0, #hi_addr(_dutyOld+0)
STRH	R1, [R0, #0]
;nestHelm.c,392 :: 		}
L_main74:
;nestHelm.c,400 :: 		dutyyy = dutyy;
MOVW	R0, #lo_addr(_dutyy+0)
MOVT	R0, #hi_addr(_dutyy+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_dutyyy+0)
MOVT	R0, #hi_addr(_dutyyy+0)
STRH	R1, [R0, #0]
;nestHelm.c,402 :: 		adcSum = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_adcSum+0)
MOVT	R0, #hi_addr(_adcSum+0)
STR	R1, [R0, #0]
;nestHelm.c,404 :: 		}
L_main32:
;nestHelm.c,408 :: 		if(bitRespond){
MOVW	R1, #lo_addr(_bitRespond+0)
MOVT	R1, #hi_addr(_bitRespond+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_main75
;nestHelm.c,409 :: 		bitRespond = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(_bitRespond+0)
MOVT	R0, #hi_addr(_bitRespond+0)
STR	R1, [R0, #0]
;nestHelm.c,410 :: 		uart1SendStatus(gear_status, dutyyy);
MOVW	R0, #lo_addr(_dutyyy+0)
MOVT	R0, #hi_addr(_dutyyy+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_gear_status+0)
MOVT	R0, #hi_addr(_gear_status+0)
LDRH	R0, [R0, #0]
BL	_uart1SendStatus+0
;nestHelm.c,411 :: 		}
L_main75:
;nestHelm.c,416 :: 		if(bitCalSend){
MOVW	R1, #lo_addr(_bitCalSend+0)
MOVT	R1, #hi_addr(_bitCalSend+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_main76
;nestHelm.c,417 :: 		bitCalSend = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(_bitCalSend+0)
MOVT	R0, #hi_addr(_bitCalSend+0)
STR	R1, [R0, #0]
;nestHelm.c,419 :: 		uart1SendCallibration();
BL	_uart1SendCallibration+0
;nestHelm.c,420 :: 		}
L_main76:
;nestHelm.c,423 :: 		if(bitResetTouchSensor){
MOVW	R1, #lo_addr(_bitResetTouchSensor+0)
MOVT	R1, #hi_addr(_bitResetTouchSensor+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_main77
;nestHelm.c,424 :: 		bitResetTouchSensor = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(_bitResetTouchSensor+0)
MOVT	R0, #hi_addr(_bitResetTouchSensor+0)
STR	R1, [R0, #0]
;nestHelm.c,425 :: 		resetTouch();
BL	_resetTouch+0
;nestHelm.c,427 :: 		}
L_main77:
;nestHelm.c,430 :: 		}
IT	AL
BAL	L_main13
;nestHelm.c,435 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
