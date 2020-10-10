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
;timers.h,6 :: 		TIM2_PSC = 13;
MOVS	R1, #13
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
_InitTimer4:
;timers.h,15 :: 		void InitTimer4(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;timers.h,16 :: 		RCC_APB1ENR.TIM4EN = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
_SX	[R0, ByteOffset(RCC_APB1ENR+0)]
;timers.h,17 :: 		TIM4_CR1.CEN = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM4_CR1+0)
MOVT	R0, #hi_addr(TIM4_CR1+0)
_SX	[R0, ByteOffset(TIM4_CR1+0)]
;timers.h,18 :: 		TIM4_PSC = 69;
MOVS	R1, #69
MOVW	R0, #lo_addr(TIM4_PSC+0)
MOVT	R0, #hi_addr(TIM4_PSC+0)
STR	R1, [R0, #0]
;timers.h,19 :: 		TIM4_ARR = 59999;
MOVW	R1, #59999
MOVW	R0, #lo_addr(TIM4_ARR+0)
MOVT	R0, #hi_addr(TIM4_ARR+0)
STR	R1, [R0, #0]
;timers.h,20 :: 		NVIC_IntEnable(IVT_INT_TIM4);
MOVW	R0, #46
BL	_NVIC_IntEnable+0
;timers.h,21 :: 		TIM4_DIER.UIE = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM4_DIER+0)
MOVT	R0, #hi_addr(TIM4_DIER+0)
_SX	[R0, ByteOffset(TIM4_DIER+0)]
;timers.h,22 :: 		TIM4_CR1.CEN = 1;
MOVW	R0, #lo_addr(TIM4_CR1+0)
MOVT	R0, #hi_addr(TIM4_CR1+0)
_SX	[R0, ByteOffset(TIM4_CR1+0)]
;timers.h,23 :: 		}
L_end_InitTimer4:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _InitTimer4
_setup_IWDG:
;nest.c,19 :: 		void setup_IWDG()
;nest.c,21 :: 		IWDG_KR = 0x5555;    //Disable write protection of IWDG registers
MOVW	R1, #21845
MOVW	R0, #lo_addr(IWDG_KR+0)
MOVT	R0, #hi_addr(IWDG_KR+0)
STR	R1, [R0, #0]
;nest.c,22 :: 		IWDG_PR = 0x06;      //Set PR value
MOVS	R1, #6
MOVW	R0, #lo_addr(IWDG_PR+0)
MOVT	R0, #hi_addr(IWDG_PR+0)
STR	R1, [R0, #0]
;nest.c,23 :: 		IWDG_RLR = 0x1FF;     //Set RLR value
MOVW	R1, #511
MOVW	R0, #lo_addr(IWDG_RLR+0)
MOVT	R0, #hi_addr(IWDG_RLR+0)
STR	R1, [R0, #0]
;nest.c,24 :: 		IWDG_KR = 0xAAAA;    //Reload IWDG
MOVW	R1, #43690
MOVW	R0, #lo_addr(IWDG_KR+0)
MOVT	R0, #hi_addr(IWDG_KR+0)
STR	R1, [R0, #0]
;nest.c,25 :: 		IWDG_KR = 0xCCCC;    //Start IWDG
MOVW	R1, #52428
MOVW	R0, #lo_addr(IWDG_KR+0)
MOVT	R0, #hi_addr(IWDG_KR+0)
STR	R1, [R0, #0]
;nest.c,26 :: 		}
L_end_setup_IWDG:
BX	LR
; end of _setup_IWDG
_main:
;nest.c,32 :: 		void main() {
;nest.c,35 :: 		FLASH_OPTKEYR = 0x08192A3B;
MOVW	R1, #10811
MOVT	R1, #2073
MOVW	R0, #lo_addr(FLASH_OPTKEYR+0)
MOVT	R0, #hi_addr(FLASH_OPTKEYR+0)
STR	R1, [R0, #0]
;nest.c,36 :: 		FLASH_OPTKEYR = 0x4C5D6E7F;
MOVW	R1, #28287
MOVT	R1, #19549
MOVW	R0, #lo_addr(FLASH_OPTKEYR+0)
MOVT	R0, #hi_addr(FLASH_OPTKEYR+0)
STR	R1, [R0, #0]
;nest.c,38 :: 		BOR_LEV0_bit = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(BOR_LEV0_bit+0)
MOVT	R0, #hi_addr(BOR_LEV0_bit+0)
_SX	[R0, ByteOffset(BOR_LEV0_bit+0)]
;nest.c,39 :: 		BOR_LEV1_bit = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(BOR_LEV1_bit+0)
MOVT	R0, #hi_addr(BOR_LEV1_bit+0)
_SX	[R0, ByteOffset(BOR_LEV1_bit+0)]
;nest.c,41 :: 		FLASH_OPTCR |= 0x01;
MOVW	R0, #lo_addr(FLASH_OPTCR+0)
MOVT	R0, #hi_addr(FLASH_OPTCR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1
MOVW	R0, #lo_addr(FLASH_OPTCR+0)
MOVT	R0, #hi_addr(FLASH_OPTCR+0)
STR	R1, [R0, #0]
;nest.c,42 :: 		FLASH_OPTCR |= 0x02;
MOVW	R0, #lo_addr(FLASH_OPTCR+0)
MOVT	R0, #hi_addr(FLASH_OPTCR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #2
MOVW	R0, #lo_addr(FLASH_OPTCR+0)
MOVT	R0, #hi_addr(FLASH_OPTCR+0)
STR	R1, [R0, #0]
;nest.c,46 :: 		UART6_Init_Advanced(115200, _UART_8_BIT_DATA, _UART_NOPARITY, _UART_ONE_STOPBIT, &_GPIO_MODULE_USART6_PC67);
MOVW	R0, #lo_addr(__GPIO_MODULE_USART6_PC67+0)
MOVT	R0, #hi_addr(__GPIO_MODULE_USART6_PC67+0)
PUSH	(R0)
MOVW	R3, #0
MOVW	R2, #0
MOVW	R1, #0
MOV	R0, #115200
BL	_UART6_Init_Advanced+0
ADD	SP, SP, #4
;nest.c,47 :: 		USART6_CR1bits.RXNEIE = 1;       // enable uart rx interrupt
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(USART6_CR1bits+0)
MOVT	R0, #hi_addr(USART6_CR1bits+0)
_SX	[R0, ByteOffset(USART6_CR1bits+0)]
;nest.c,48 :: 		NVIC_IntEnable(IVT_INT_USART6);  // enable interrupt vector
MOVW	R0, #87
BL	_NVIC_IntEnable+0
;nest.c,52 :: 		UART4_Init_Advanced(115200, _UART_8_BIT_DATA, _UART_NOPARITY, _UART_ONE_STOPBIT, &_GPIO_MODULE_UART4_PA01 );
MOVW	R0, #lo_addr(__GPIO_MODULE_UART4_PA01+0)
MOVT	R0, #hi_addr(__GPIO_MODULE_UART4_PA01+0)
PUSH	(R0)
MOVW	R3, #0
MOVW	R2, #0
MOVW	R1, #0
MOV	R0, #115200
BL	_UART4_Init_Advanced+0
ADD	SP, SP, #4
;nest.c,53 :: 		UART4_CR1bits.RXNEIE = 1;       // enable uart rx interrupt
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(UART4_CR1bits+0)
MOVT	R0, #hi_addr(UART4_CR1bits+0)
_SX	[R0, ByteOffset(UART4_CR1bits+0)]
;nest.c,54 :: 		NVIC_IntEnable(IVT_INT_UART4);  // enable interrupt vector
MOVW	R0, #68
BL	_NVIC_IntEnable+0
;nest.c,64 :: 		UART1_Init_Advanced(38400, _UART_8_BIT_DATA, _UART_NOPARITY, _UART_ONE_STOPBIT, &_GPIO_MODULE_USART1_PA9_10);
MOVW	R0, #lo_addr(__GPIO_MODULE_USART1_PA9_10+0)
MOVT	R0, #hi_addr(__GPIO_MODULE_USART1_PA9_10+0)
PUSH	(R0)
MOVW	R3, #0
MOVW	R2, #0
MOVW	R1, #0
MOVW	R0, #38400
BL	_UART1_Init_Advanced+0
ADD	SP, SP, #4
;nest.c,70 :: 		UART3_Init_Advanced(115200, _UART_8_BIT_DATA, _UART_NOPARITY, _UART_ONE_STOPBIT, &_GPIO_MODULE_USART3_PB10_11);
MOVW	R0, #lo_addr(__GPIO_MODULE_USART3_PB10_11+0)
MOVT	R0, #hi_addr(__GPIO_MODULE_USART3_PB10_11+0)
PUSH	(R0)
MOVW	R3, #0
MOVW	R2, #0
MOVW	R1, #0
MOV	R0, #115200
BL	_UART3_Init_Advanced+0
ADD	SP, SP, #4
;nest.c,71 :: 		USART3_CR1bits.RXNEIE = 1;       // enable uart rx interrupt
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(USART3_CR1bits+0)
MOVT	R0, #hi_addr(USART3_CR1bits+0)
_SX	[R0, ByteOffset(USART3_CR1bits+0)]
;nest.c,72 :: 		NVIC_IntEnable(IVT_INT_USART3);  // enable interrupt vector
MOVW	R0, #55
BL	_NVIC_IntEnable+0
;nest.c,76 :: 		I2C1_Init_Advanced(100000, &_GPIO_MODULE_I2C1_PB67);
MOVW	R1, #lo_addr(__GPIO_MODULE_I2C1_PB67+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_I2C1_PB67+0)
MOVW	R0, #34464
MOVT	R0, #1
BL	_I2C1_Init_Advanced+0
;nest.c,80 :: 		GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_15);                           // UART3_RXTX
MOVW	R1, #32768
MOVW	R0, #lo_addr(GPIOE_BASE+0)
MOVT	R0, #hi_addr(GPIOE_BASE+0)
BL	_GPIO_Digital_Output+0
;nest.c,81 :: 		GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_8);                            // UART1_RXTX
MOVW	R1, #256
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Digital_Output+0
;nest.c,82 :: 		GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_4);                            // UART4_RXTX
MOVW	R1, #16
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Output+0
;nest.c,83 :: 		GPIO_Digital_Output(&GPIOC_BASE, _GPIO_PINMASK_8);                            // UART6_RXTX
MOVW	R1, #256
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Output+0
;nest.c,90 :: 		GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_11);                           // BUZ
MOVW	R1, #2048
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Digital_Output+0
;nest.c,91 :: 		GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_3 | _GPIO_PINMASK_4);          // LIGHT_NAVIGATION, LIGHT_INTERIOR
MOVW	R1, #24
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Digital_Output+0
;nest.c,93 :: 		| _GPIO_PINMASK_5);                          // ACCUMULATORS_OFF
MOVW	R1, #224
;nest.c,92 :: 		GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_7 | _GPIO_PINMASK_6            // ACCUMULATOR1_ON, ACCUMULATOR2_ON
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
;nest.c,93 :: 		| _GPIO_PINMASK_5);                          // ACCUMULATORS_OFF
BL	_GPIO_Digital_Output+0
;nest.c,96 :: 		_GPIO_CFG_MODE_INPUT | _GPIO_CFG_PULL_DOWN);
MOV	R2, #258
;nest.c,95 :: 		GPIO_Config(&GPIOA_BASE, _GPIO_PINMASK_6,                                     // ACCUMULATOR_SENSE
MOVW	R1, #64
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
;nest.c,96 :: 		_GPIO_CFG_MODE_INPUT | _GPIO_CFG_PULL_DOWN);
BL	_GPIO_Config+0
;nest.c,98 :: 		GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_15 | _GPIO_PINMASK_14);        // LORA_M0, LORA_M1
MOVW	R1, #49152
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Digital_Output+0
;nest.c,101 :: 		_GPIO_CFG_MODE_INPUT | _GPIO_CFG_PULL_UP);
MOV	R2, #130
;nest.c,100 :: 		GPIO_Config(&GPIOD_BASE, _GPIO_PINMASK_13,                                    // LORA_AUX
MOVW	R1, #8192
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
;nest.c,101 :: 		_GPIO_CFG_MODE_INPUT | _GPIO_CFG_PULL_UP);
BL	_GPIO_Config+0
;nest.c,103 :: 		GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_14 | _GPIO_PINMASK_15);        // LED1, LED2
MOVW	R1, #49152
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Output+0
;nest.c,104 :: 		GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_8 | _GPIO_PINMASK_9 | _GPIO_PINMASK_10);        // LED3, LED4, LED5
MOVW	R1, #1792
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Digital_Output+0
;nest.c,108 :: 		GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_7);
MOVW	R1, #128
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Digital_Output+0
;nest.c,109 :: 		pwm_ratio = PWM_TIM3_Init(pwm_frequency);
MOVW	R0, #lo_addr(_pwm_frequency+0)
MOVT	R0, #hi_addr(_pwm_frequency+0)
LDR	R0, [R0, #0]
BL	_PWM_TIM3_Init+0
MOVW	R1, #lo_addr(_pwm_ratio+0)
MOVT	R1, #hi_addr(_pwm_ratio+0)
STRH	R0, [R1, #0]
;nest.c,110 :: 		pwm_duty = ((unsigned int)((double)(((double)(((double)pwm_ratio) * pwm_percent)) / ((double)100))));
VMOV	S1, R0
VCVT.F32	#0, S1, S1
MOVW	R0, #lo_addr(_pwm_percent+0)
MOVT	R0, #hi_addr(_pwm_percent+0)
VLDR	#1, S0, [R0, #0]
VMUL.F32	S1, S1, S0
MOVW	R0, #0
MOVT	R0, #17096
VMOV	S0, R0
VDIV.F32	S0, S1, S0
VCVT	#1, .F32, S0, S0
VMOV	R1, S0
UXTH	R1, R1
MOVW	R0, #lo_addr(_pwm_duty+0)
MOVT	R0, #hi_addr(_pwm_duty+0)
STRH	R1, [R0, #0]
;nest.c,111 :: 		PWM_TIM3_Set_Duty(pwm_duty, _PWM_NON_INVERTED, _PWM_CHANNEL2);
UXTH	R0, R1
MOVS	R2, #1
MOVS	R1, #0
BL	_PWM_TIM3_Set_Duty+0
;nest.c,112 :: 		PWM_TIM3_Start(_PWM_CHANNEL2, &_GPIO_MODULE_TIM3_CH2_PA7);
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM3_CH2_PA7+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM3_CH2_PA7+0)
MOVS	R0, #1
BL	_PWM_TIM3_Start+0
;nest.c,119 :: 		GPIO_Analog_Input(&GPIOA_IDR, _GPIO_PINMASK_5);
MOVW	R1, #32
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
BL	_GPIO_Analog_Input+0
;nest.c,120 :: 		GPIO_Analog_Input(&GPIOA_IDR, _GPIO_PINMASK_4);
MOVW	R1, #16
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
BL	_GPIO_Analog_Input+0
;nest.c,121 :: 		ADC2_Init();
BL	_ADC2_Init+0
;nest.c,148 :: 		uart4Battery1Level0();
BL	_uart4Battery1Level0+0
;nest.c,149 :: 		uart4Battery2Level0();
BL	_uart4Battery2Level0+0
;nest.c,150 :: 		uart4Battery1TurnedOff();
BL	_uart4Battery1TurnedOff+0
;nest.c,151 :: 		uart4Battery2TurnedOff();
BL	_uart4Battery2TurnedOff+0
;nest.c,152 :: 		uart4InteriorLightTurnedOff();
BL	_uart4InteriorLightTurnedOff+0
;nest.c,153 :: 		uart4NavigationLightTurnedOff();
BL	_uart4NavigationLightTurnedOff+0
;nest.c,154 :: 		uart4LightingTurnedOff();
BL	_uart4LightingTurnedOff+0
;nest.c,157 :: 		LIGHT_NAVIGATION = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
_SX	[R0, ByteOffset(GPIOD_ODR+0)]
;nest.c,158 :: 		LIGHT_INTERIOR = 0;
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
_SX	[R0, ByteOffset(GPIOD_ODR+0)]
;nest.c,170 :: 		countedTimer = 0;
MOVW	R0, #lo_addr(_countedTimer+0)
MOVT	R0, #hi_addr(_countedTimer+0)
STR	R2, [R0, #0]
;nest.c,172 :: 		bitDelay3Seconds = 0;
MOVW	R0, #lo_addr(_bitDelay3Seconds+0)
MOVT	R0, #hi_addr(_bitDelay3Seconds+0)
STR	R2, [R0, #0]
;nest.c,173 :: 		bitStart3SecondsCount = 0;
MOVW	R0, #lo_addr(_bitStart3SecondsCount+0)
MOVT	R0, #hi_addr(_bitStart3SecondsCount+0)
STR	R2, [R0, #0]
;nest.c,174 :: 		battery_change = 0;
MOVW	R0, #lo_addr(_battery_change+0)
MOVT	R0, #hi_addr(_battery_change+0)
STR	R2, [R0, #0]
;nest.c,175 :: 		battery_change_continue = 0;
MOVW	R0, #lo_addr(_battery_change_continue+0)
MOVT	R0, #hi_addr(_battery_change_continue+0)
STR	R2, [R0, #0]
;nest.c,176 :: 		oldStateInteriorLight = 0;
MOVW	R0, #lo_addr(_oldStateInteriorLight+0)
MOVT	R0, #hi_addr(_oldStateInteriorLight+0)
STR	R2, [R0, #0]
;nest.c,177 :: 		oldStateNavigationLight = 0;
MOVW	R0, #lo_addr(_oldStateNavigationLight+0)
MOVT	R0, #hi_addr(_oldStateNavigationLight+0)
STR	R2, [R0, #0]
;nest.c,178 :: 		battery_chosen = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_battery_chosen+0)
MOVT	R0, #hi_addr(_battery_chosen+0)
STRH	R1, [R0, #0]
;nest.c,179 :: 		battery_chosen_old = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_battery_chosen_old+0)
MOVT	R0, #hi_addr(_battery_chosen_old+0)
STRH	R1, [R0, #0]
;nest.c,180 :: 		oldStateBattery1 = 0;
MOVW	R0, #lo_addr(_oldStateBattery1+0)
MOVT	R0, #hi_addr(_oldStateBattery1+0)
STR	R2, [R0, #0]
;nest.c,181 :: 		oldStateBattery2 = 0;
MOVW	R0, #lo_addr(_oldStateBattery2+0)
MOVT	R0, #hi_addr(_oldStateBattery2+0)
STR	R2, [R0, #0]
;nest.c,182 :: 		battry_percentage_check = 0;
MOVW	R0, #lo_addr(_battry_percentage_check+0)
MOVT	R0, #hi_addr(_battry_percentage_check+0)
STR	R2, [R0, #0]
;nest.c,183 :: 		control_taken = 0;
MOVW	R0, #lo_addr(_control_taken+0)
MOVT	R0, #hi_addr(_control_taken+0)
STR	R2, [R0, #0]
;nest.c,184 :: 		status_asked = 0;
MOVW	R0, #lo_addr(_status_asked+0)
MOVT	R0, #hi_addr(_status_asked+0)
STR	R2, [R0, #0]
;nest.c,186 :: 		startReceivingData6 = 0;
MOVW	R0, #lo_addr(_startReceivingData6+0)
MOVT	R0, #hi_addr(_startReceivingData6+0)
STR	R2, [R0, #0]
;nest.c,187 :: 		receivedCheckStatus = 0;
MOVW	R0, #lo_addr(_receivedCheckStatus+0)
MOVT	R0, #hi_addr(_receivedCheckStatus+0)
STR	R2, [R0, #0]
;nest.c,189 :: 		bitBattery1Change = 0;
MOVW	R0, #lo_addr(_bitBattery1Change+0)
MOVT	R0, #hi_addr(_bitBattery1Change+0)
STR	R2, [R0, #0]
;nest.c,190 :: 		bitBattery2Change = 0;
MOVW	R0, #lo_addr(_bitBattery2Change+0)
MOVT	R0, #hi_addr(_bitBattery2Change+0)
STR	R2, [R0, #0]
;nest.c,192 :: 		bitCheckJoystick = 0;
MOVW	R0, #lo_addr(_bitCheckJoystick+0)
MOVT	R0, #hi_addr(_bitCheckJoystick+0)
STR	R2, [R0, #0]
;nest.c,194 :: 		startReceivingData4 = 0;
MOVW	R0, #lo_addr(_startReceivingData4+0)
MOVT	R0, #hi_addr(_startReceivingData4+0)
STR	R2, [R0, #0]
;nest.c,195 :: 		startReceivingData3 = 0;
MOVW	R0, #lo_addr(_startReceivingData3+0)
MOVT	R0, #hi_addr(_startReceivingData3+0)
STR	R2, [R0, #0]
;nest.c,197 :: 		resetTouchSensor = 0;
MOVW	R0, #lo_addr(_resetTouchSensor+0)
MOVT	R0, #hi_addr(_resetTouchSensor+0)
STR	R2, [R0, #0]
;nest.c,198 :: 		resetedTouchSensor = 0;
MOVW	R0, #lo_addr(_resetedTouchSensor+0)
MOVT	R0, #hi_addr(_resetedTouchSensor+0)
STR	R2, [R0, #0]
;nest.c,203 :: 		ACCUMULATORS_OFF = 0;
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
_SX	[R0, ByteOffset(GPIOD_ODR+0)]
;nest.c,204 :: 		ACCUMULATOR1_ON = 0;
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
_SX	[R0, ByteOffset(GPIOD_ODR+0)]
;nest.c,205 :: 		ACCUMULATOR2_ON = 0;
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
_SX	[R0, ByteOffset(GPIOD_ODR+0)]
;nest.c,209 :: 		LORA_M0 = 0;
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
_SX	[R0, ByteOffset(GPIOD_ODR+0)]
;nest.c,210 :: 		LORA_M1 = 0;
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
_SX	[R0, ByteOffset(GPIOD_ODR+0)]
;nest.c,212 :: 		navLightOff = 0;
MOVW	R0, #lo_addr(_navLightOff+0)
MOVT	R0, #hi_addr(_navLightOff+0)
STR	R2, [R0, #0]
;nest.c,213 :: 		navLightOn = 0;
MOVW	R0, #lo_addr(_navLightOn+0)
MOVT	R0, #hi_addr(_navLightOn+0)
STR	R2, [R0, #0]
;nest.c,214 :: 		intLightOn = 0;
MOVW	R0, #lo_addr(_intLightOn+0)
MOVT	R0, #hi_addr(_intLightOn+0)
STR	R2, [R0, #0]
;nest.c,215 :: 		intLightOff = 0;
MOVW	R0, #lo_addr(_intLightOff+0)
MOVT	R0, #hi_addr(_intLightOff+0)
STR	R2, [R0, #0]
;nest.c,216 :: 		bat1On = 0;
MOVW	R0, #lo_addr(_bat1On+0)
MOVT	R0, #hi_addr(_bat1On+0)
STR	R2, [R0, #0]
;nest.c,217 :: 		bat1Off = 0;
MOVW	R0, #lo_addr(_bat1Off+0)
MOVT	R0, #hi_addr(_bat1Off+0)
STR	R2, [R0, #0]
;nest.c,218 :: 		bat2On = 0;
MOVW	R0, #lo_addr(_bat2On+0)
MOVT	R0, #hi_addr(_bat2On+0)
STR	R2, [R0, #0]
;nest.c,219 :: 		bat2Off = 0;
MOVW	R0, #lo_addr(_bat2Off+0)
MOVT	R0, #hi_addr(_bat2Off+0)
STR	R2, [R0, #0]
;nest.c,221 :: 		bitCheckStatusJoystick = 0;
MOVW	R0, #lo_addr(_bitCheckStatusJoystick+0)
MOVT	R0, #hi_addr(_bitCheckStatusJoystick+0)
STR	R2, [R0, #0]
;nest.c,222 :: 		bitCheckStatusDisplay = 0;
MOVW	R0, #lo_addr(_bitCheckStatusDisplay+0)
MOVT	R0, #hi_addr(_bitCheckStatusDisplay+0)
STR	R2, [R0, #0]
;nest.c,224 :: 		countedTimer2 = 0;
MOVW	R0, #lo_addr(_countedTimer2+0)
MOVT	R0, #hi_addr(_countedTimer2+0)
STR	R2, [R0, #0]
;nest.c,226 :: 		controlWasTaken = 0;
MOVW	R0, #lo_addr(_controlWasTaken+0)
MOVT	R0, #hi_addr(_controlWasTaken+0)
STR	R2, [R0, #0]
;nest.c,227 :: 		stopGearBit = 0;
MOVW	R0, #lo_addr(_stopGearBit+0)
MOVT	R0, #hi_addr(_stopGearBit+0)
STR	R2, [R0, #0]
;nest.c,228 :: 		bitCheckIsItStoppedGear = 0;
MOVW	R0, #lo_addr(_bitCheckIsItStoppedGear+0)
MOVT	R0, #hi_addr(_bitCheckIsItStoppedGear+0)
STR	R2, [R0, #0]
;nest.c,241 :: 		LED1 = 0;
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
_SX	[R0, ByteOffset(GPIOB_ODR+0)]
;nest.c,242 :: 		LED2 = 0;
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
_SX	[R0, ByteOffset(GPIOB_ODR+0)]
;nest.c,243 :: 		LED3 = 0;
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
_SX	[R0, ByteOffset(GPIOD_ODR+0)]
;nest.c,244 :: 		LED4 = 0;
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
_SX	[R0, ByteOffset(GPIOD_ODR+0)]
;nest.c,245 :: 		LED5 = 0;
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
_SX	[R0, ByteOffset(GPIOD_ODR+0)]
;nest.c,246 :: 		Delay_ms(500);
MOVW	R7, #16126
MOVT	R7, #427
NOP
NOP
L_main0:
SUBS	R7, R7, #1
BNE	L_main0
NOP
NOP
NOP
;nest.c,248 :: 		battery_chosen = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_battery_chosen+0)
MOVT	R0, #hi_addr(_battery_chosen+0)
STRH	R1, [R0, #0]
;nest.c,249 :: 		battery_chosen_old = 3;
MOVS	R1, #3
SXTH	R1, R1
MOVW	R0, #lo_addr(_battery_chosen_old+0)
MOVT	R0, #hi_addr(_battery_chosen_old+0)
STRH	R1, [R0, #0]
;nest.c,250 :: 		battry_percentage_check = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(_battry_percentage_check+0)
MOVT	R0, #hi_addr(_battry_percentage_check+0)
STR	R1, [R0, #0]
;nest.c,252 :: 		InitTimer2();
BL	_InitTimer2+0
;nest.c,253 :: 		InitTimer4();
BL	_InitTimer4+0
;nest.c,273 :: 		beingControlledByMobile = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(_beingControlledByMobile+0)
MOVT	R0, #hi_addr(_beingControlledByMobile+0)
STR	R1, [R0, #0]
;nest.c,274 :: 		velocity_mode_new = VELOCITY_RABBIT;
MOVS	R1, #1
MOVW	R0, #lo_addr(_velocity_mode_new+0)
MOVT	R0, #hi_addr(_velocity_mode_new+0)
STRH	R1, [R0, #0]
;nest.c,275 :: 		velocity_mode = VELOCITY_RABBIT;
MOVS	R1, #1
MOVW	R0, #lo_addr(_velocity_mode+0)
MOVT	R0, #hi_addr(_velocity_mode+0)
STRH	R1, [R0, #0]
;nest.c,281 :: 		Delay_ms(700);
MOVW	R7, #9470
MOVT	R7, #598
NOP
NOP
L_main2:
SUBS	R7, R7, #1
BNE	L_main2
NOP
NOP
NOP
;nest.c,282 :: 		change_velocity_mode(velocity_mode);
MOVW	R0, #lo_addr(_velocity_mode+0)
MOVT	R0, #hi_addr(_velocity_mode+0)
LDRH	R0, [R0, #0]
BL	_change_velocity_mode+0
;nest.c,283 :: 		Delay_ms(50);
MOVW	R7, #47486
MOVT	R7, #42
NOP
NOP
L_main4:
SUBS	R7, R7, #1
BNE	L_main4
NOP
NOP
NOP
;nest.c,286 :: 		setup_IWDG();
BL	_setup_IWDG+0
;nest.c,288 :: 		while(1){
L_main6:
;nest.c,294 :: 		batteryChangeState();
BL	_batteryChangeState+0
;nest.c,295 :: 		lightControlSwitches();
BL	_lightControlSwitches+0
;nest.c,296 :: 		batteryControlSwitches();
BL	_batteryControlSwitches+0
;nest.c,297 :: 		gearVelocityMotorSpeedControl();
BL	_gearVelocityMotorSpeedControl+0
;nest.c,298 :: 		directionWheelADC();
BL	_directionWheelADC+0
;nest.c,299 :: 		batteryLavelMeasure();
BL	_batteryLavelMeasure+0
;nest.c,301 :: 		LED5 = ACCUMULATOR_SENSE;
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
_LX	[R0, ByteOffset(GPIOA_IDR+0)]
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
_SX	[R0, ByteOffset(GPIOD_ODR+0)]
;nest.c,303 :: 		if(control_taken){
MOVW	R1, #lo_addr(_control_taken+0)
MOVT	R1, #hi_addr(_control_taken+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_main8
;nest.c,304 :: 		controlWasTaken = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(_controlWasTaken+0)
MOVT	R0, #hi_addr(_controlWasTaken+0)
STR	R1, [R0, #0]
;nest.c,305 :: 		}
L_main8:
;nest.c,307 :: 		if(controlWasTaken && !control_taken){
MOVW	R1, #lo_addr(_controlWasTaken+0)
MOVT	R1, #hi_addr(_controlWasTaken+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L__main47
MOVW	R1, #lo_addr(_control_taken+0)
MOVT	R1, #hi_addr(_control_taken+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L__main46
L__main45:
;nest.c,308 :: 		controlWasTaken = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(_controlWasTaken+0)
MOVT	R0, #hi_addr(_controlWasTaken+0)
STR	R1, [R0, #0]
;nest.c,309 :: 		if(gear_status != 4){
MOVW	R0, #lo_addr(_gear_status+0)
MOVT	R0, #hi_addr(_gear_status+0)
LDRH	R0, [R0, #0]
CMP	R0, #4
IT	EQ
BEQ	L_main12
;nest.c,310 :: 		stopGearBit = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(_stopGearBit+0)
MOVT	R0, #hi_addr(_stopGearBit+0)
STR	R1, [R0, #0]
;nest.c,311 :: 		}
L_main12:
;nest.c,307 :: 		if(controlWasTaken && !control_taken){
L__main47:
L__main46:
;nest.c,317 :: 		if(receivedCheckStatus){
MOVW	R1, #lo_addr(_receivedCheckStatus+0)
MOVT	R1, #hi_addr(_receivedCheckStatus+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_main13
;nest.c,318 :: 		receivedCheckStatus = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(_receivedCheckStatus+0)
MOVT	R0, #hi_addr(_receivedCheckStatus+0)
STR	R1, [R0, #0]
;nest.c,319 :: 		uartSendStatusToStation();
BL	_uartSendStatusToStation+0
;nest.c,321 :: 		}
L_main13:
;nest.c,323 :: 		if(control_taken){boatControlTaken = 0x01;}
MOVW	R1, #lo_addr(_control_taken+0)
MOVT	R1, #hi_addr(_control_taken+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_main14
MOVS	R1, #1
MOVW	R0, #lo_addr(_boatControlTaken+0)
MOVT	R0, #hi_addr(_boatControlTaken+0)
STRB	R1, [R0, #0]
IT	AL
BAL	L_main15
L_main14:
;nest.c,324 :: 		else{boatControlTaken = 0x00;}
MOVS	R1, #0
MOVW	R0, #lo_addr(_boatControlTaken+0)
MOVT	R0, #hi_addr(_boatControlTaken+0)
STRB	R1, [R0, #0]
L_main15:
;nest.c,326 :: 		if(LIGHT_INTERIOR){boatInteriorLight = 0x02; LED2 = 1;}
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
_LX	[R0, ByteOffset(GPIOD_ODR+0)]
CMP	R0, #0
IT	EQ
BEQ	L_main16
MOVS	R1, #2
MOVW	R0, #lo_addr(_boatInteriorLight+0)
MOVT	R0, #hi_addr(_boatInteriorLight+0)
STRB	R1, [R0, #0]
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
_SX	[R0, ByteOffset(GPIOB_ODR+0)]
IT	AL
BAL	L_main17
L_main16:
;nest.c,327 :: 		else{boatInteriorLight = 0x00; LED2 = 0;}
MOVS	R1, #0
MOVW	R0, #lo_addr(_boatInteriorLight+0)
MOVT	R0, #hi_addr(_boatInteriorLight+0)
STRB	R1, [R0, #0]
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
_SX	[R0, ByteOffset(GPIOB_ODR+0)]
L_main17:
;nest.c,329 :: 		if(LIGHT_NAVIGATION){boatNavigationLight = 0x04; LED3 = 1;}
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
_LX	[R0, ByteOffset(GPIOD_ODR+0)]
CMP	R0, #0
IT	EQ
BEQ	L_main18
MOVS	R1, #4
MOVW	R0, #lo_addr(_boatNavigationLight+0)
MOVT	R0, #hi_addr(_boatNavigationLight+0)
STRB	R1, [R0, #0]
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
_SX	[R0, ByteOffset(GPIOD_ODR+0)]
IT	AL
BAL	L_main19
L_main18:
;nest.c,330 :: 		else{boatNavigationLight = 0x00; LED3 = 0;}
MOVS	R1, #0
MOVW	R0, #lo_addr(_boatNavigationLight+0)
MOVT	R0, #hi_addr(_boatNavigationLight+0)
STRB	R1, [R0, #0]
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
_SX	[R0, ByteOffset(GPIOD_ODR+0)]
L_main19:
;nest.c,333 :: 		if(activeBattery == 1){boatBattery1 = 0x08;}
MOVW	R0, #lo_addr(_activeBattery+0)
MOVT	R0, #hi_addr(_activeBattery+0)
LDRH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_main20
MOVS	R1, #8
MOVW	R0, #lo_addr(_boatBattery1+0)
MOVT	R0, #hi_addr(_boatBattery1+0)
STRB	R1, [R0, #0]
IT	AL
BAL	L_main21
L_main20:
;nest.c,334 :: 		else{boatBattery1 = 0x00;}
MOVS	R1, #0
MOVW	R0, #lo_addr(_boatBattery1+0)
MOVT	R0, #hi_addr(_boatBattery1+0)
STRB	R1, [R0, #0]
L_main21:
;nest.c,336 :: 		if(activeBattery == 2){boatBattery2 = 0x10;}
MOVW	R0, #lo_addr(_activeBattery+0)
MOVT	R0, #hi_addr(_activeBattery+0)
LDRH	R0, [R0, #0]
CMP	R0, #2
IT	NE
BNE	L_main22
MOVS	R1, #16
MOVW	R0, #lo_addr(_boatBattery2+0)
MOVT	R0, #hi_addr(_boatBattery2+0)
STRB	R1, [R0, #0]
IT	AL
BAL	L_main23
L_main22:
;nest.c,337 :: 		else{boatBattery2 = 0x00;}
MOVS	R1, #0
MOVW	R0, #lo_addr(_boatBattery2+0)
MOVT	R0, #hi_addr(_boatBattery2+0)
STRB	R1, [R0, #0]
L_main23:
;nest.c,339 :: 		if(activeBattery == 0){
MOVW	R0, #lo_addr(_activeBattery+0)
MOVT	R0, #hi_addr(_activeBattery+0)
LDRH	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_main24
;nest.c,340 :: 		boatBattery1 = 0x00;
MOVS	R1, #0
MOVW	R0, #lo_addr(_boatBattery1+0)
MOVT	R0, #hi_addr(_boatBattery1+0)
STRB	R1, [R0, #0]
;nest.c,341 :: 		boatBattery2 = 0x00;
MOVS	R1, #0
MOVW	R0, #lo_addr(_boatBattery2+0)
MOVT	R0, #hi_addr(_boatBattery2+0)
STRB	R1, [R0, #0]
;nest.c,342 :: 		}
L_main24:
;nest.c,350 :: 		if(bitCheckJoystick){
MOVW	R1, #lo_addr(_bitCheckJoystick+0)
MOVT	R1, #hi_addr(_bitCheckJoystick+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_main25
;nest.c,351 :: 		gear_status = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_gear_status+0)
MOVT	R0, #hi_addr(_gear_status+0)
STRH	R1, [R0, #0]
;nest.c,352 :: 		dutyy = 150;
MOVS	R1, #150
SXTH	R1, R1
MOVW	R0, #lo_addr(_dutyy+0)
MOVT	R0, #hi_addr(_dutyy+0)
STRH	R1, [R0, #0]
;nest.c,353 :: 		}
L_main25:
;nest.c,355 :: 		if(navLightOn){
MOVW	R1, #lo_addr(_navLightOn+0)
MOVT	R1, #hi_addr(_navLightOn+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_main26
;nest.c,356 :: 		navLightOn = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(_navLightOn+0)
MOVT	R0, #hi_addr(_navLightOn+0)
STR	R1, [R0, #0]
;nest.c,357 :: 		if(navigationLightState == 1){
MOVW	R0, #lo_addr(_navigationLightState+0)
MOVT	R0, #hi_addr(_navigationLightState+0)
LDRH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_main27
;nest.c,358 :: 		uart4NavigationLightTurnedOn();
BL	_uart4NavigationLightTurnedOn+0
;nest.c,359 :: 		}
L_main27:
;nest.c,360 :: 		}
L_main26:
;nest.c,361 :: 		if(navLightOff){
MOVW	R1, #lo_addr(_navLightOff+0)
MOVT	R1, #hi_addr(_navLightOff+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_main28
;nest.c,362 :: 		navLightOff = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(_navLightOff+0)
MOVT	R0, #hi_addr(_navLightOff+0)
STR	R1, [R0, #0]
;nest.c,363 :: 		if(navigationLightState == 0){
MOVW	R0, #lo_addr(_navigationLightState+0)
MOVT	R0, #hi_addr(_navigationLightState+0)
LDRH	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_main29
;nest.c,364 :: 		uart4NavigationLightTurnedOff();
BL	_uart4NavigationLightTurnedOff+0
;nest.c,365 :: 		}
L_main29:
;nest.c,366 :: 		}
L_main28:
;nest.c,368 :: 		if(intLightOn){
MOVW	R1, #lo_addr(_intLightOn+0)
MOVT	R1, #hi_addr(_intLightOn+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_main30
;nest.c,369 :: 		intLightOn = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(_intLightOn+0)
MOVT	R0, #hi_addr(_intLightOn+0)
STR	R1, [R0, #0]
;nest.c,370 :: 		if(interiorLightState == 1){
MOVW	R0, #lo_addr(_interiorLightState+0)
MOVT	R0, #hi_addr(_interiorLightState+0)
LDRH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_main31
;nest.c,371 :: 		uart4InteriorLightTurnedOn();
BL	_uart4InteriorLightTurnedOn+0
;nest.c,372 :: 		}
L_main31:
;nest.c,373 :: 		}
L_main30:
;nest.c,375 :: 		if(intLightOff){
MOVW	R1, #lo_addr(_intLightOff+0)
MOVT	R1, #hi_addr(_intLightOff+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_main32
;nest.c,376 :: 		intLightOff = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(_intLightOff+0)
MOVT	R0, #hi_addr(_intLightOff+0)
STR	R1, [R0, #0]
;nest.c,377 :: 		if(interiorLightState == 0){
MOVW	R0, #lo_addr(_interiorLightState+0)
MOVT	R0, #hi_addr(_interiorLightState+0)
LDRH	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_main33
;nest.c,378 :: 		uart4InteriorLightTurnedOff();
BL	_uart4InteriorLightTurnedOff+0
;nest.c,379 :: 		}
L_main33:
;nest.c,380 :: 		}
L_main32:
;nest.c,405 :: 		if(bitCheckStatusDisplay){
MOVW	R1, #lo_addr(_bitCheckStatusDisplay+0)
MOVT	R1, #hi_addr(_bitCheckStatusDisplay+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_main34
;nest.c,406 :: 		bitCheckStatusDisplay = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(_bitCheckStatusDisplay+0)
MOVT	R0, #hi_addr(_bitCheckStatusDisplay+0)
STR	R1, [R0, #0]
;nest.c,408 :: 		IWDG_KR = 0xAAAA;    //Reload IWDG
MOVW	R1, #43690
MOVW	R0, #lo_addr(IWDG_KR+0)
MOVT	R0, #hi_addr(IWDG_KR+0)
STR	R1, [R0, #0]
;nest.c,410 :: 		LED1 = ~LED1;
MOVW	R1, #lo_addr(GPIOB_ODR+0)
MOVT	R1, #hi_addr(GPIOB_ODR+0)
_LX	[R1, ByteOffset(GPIOB_ODR+0)]
EOR	R0, R0, #1
UXTB	R0, R0
_SX	[R1, ByteOffset(GPIOB_ODR+0)]
;nest.c,411 :: 		uart4CheckNavigationLightStatus();
BL	_uart4CheckNavigationLightStatus+0
;nest.c,412 :: 		uart4CheckInteriorLightStatus();
BL	_uart4CheckInteriorLightStatus+0
;nest.c,413 :: 		uart4CheckBattery1Status();
BL	_uart4CheckBattery1Status+0
;nest.c,414 :: 		uart4CheckBattery2Status();
BL	_uart4CheckBattery2Status+0
;nest.c,416 :: 		uart4TurtleCheckStatus();
BL	_uart4TurtleCheckStatus+0
;nest.c,417 :: 		uart4RabbitCheckStatus();
BL	_uart4RabbitCheckStatus+0
;nest.c,418 :: 		uart4LeopardCheckStatus();
BL	_uart4LeopardCheckStatus+0
;nest.c,420 :: 		if((beingControlledByMobile) && (!control_taken)){
MOVW	R1, #lo_addr(_beingControlledByMobile+0)
MOVT	R1, #hi_addr(_beingControlledByMobile+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L__main49
MOVW	R1, #lo_addr(_control_taken+0)
MOVT	R1, #hi_addr(_control_taken+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L__main48
L__main44:
;nest.c,421 :: 		beingControlledByMobile = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(_beingControlledByMobile+0)
MOVT	R0, #hi_addr(_beingControlledByMobile+0)
STR	R1, [R0, #0]
;nest.c,422 :: 		velocity_mode = velocity_mode_new;
MOVW	R2, #lo_addr(_velocity_mode_new+0)
MOVT	R2, #hi_addr(_velocity_mode_new+0)
LDRH	R1, [R2, #0]
MOVW	R0, #lo_addr(_velocity_mode+0)
MOVT	R0, #hi_addr(_velocity_mode+0)
STRH	R1, [R0, #0]
;nest.c,423 :: 		change_velocity_mode(velocity_mode);
MOV	R0, R2
LDRH	R0, [R0, #0]
BL	_change_velocity_mode+0
;nest.c,420 :: 		if((beingControlledByMobile) && (!control_taken)){
L__main49:
L__main48:
;nest.c,425 :: 		}
L_main34:
;nest.c,427 :: 		if(bitCheckStatusJoystick){
MOVW	R1, #lo_addr(_bitCheckStatusJoystick+0)
MOVT	R1, #hi_addr(_bitCheckStatusJoystick+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_main38
;nest.c,428 :: 		bitCheckStatusJoystick = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(_bitCheckStatusJoystick+0)
MOVT	R0, #hi_addr(_bitCheckStatusJoystick+0)
STR	R1, [R0, #0]
;nest.c,430 :: 		LED1 = ~LED1;
MOVW	R1, #lo_addr(GPIOB_ODR+0)
MOVT	R1, #hi_addr(GPIOB_ODR+0)
_LX	[R1, ByteOffset(GPIOB_ODR+0)]
EOR	R0, R0, #1
UXTB	R0, R0
_SX	[R1, ByteOffset(GPIOB_ODR+0)]
;nest.c,431 :: 		if(stopGearBit){
MOVW	R1, #lo_addr(_stopGearBit+0)
MOVT	R1, #hi_addr(_stopGearBit+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_main39
;nest.c,432 :: 		stopGearBit = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(_stopGearBit+0)
MOVT	R0, #hi_addr(_stopGearBit+0)
STR	R1, [R0, #0]
;nest.c,433 :: 		gear_status = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_gear_status+0)
MOVT	R0, #hi_addr(_gear_status+0)
STRH	R1, [R0, #0]
;nest.c,434 :: 		bitCheckIsItStoppedGear = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(_bitCheckIsItStoppedGear+0)
MOVT	R0, #hi_addr(_bitCheckIsItStoppedGear+0)
STR	R1, [R0, #0]
;nest.c,435 :: 		uart3SendJoystickForced();
BL	_uart3SendJoystickForced+0
;nest.c,436 :: 		}
IT	AL
BAL	L_main40
L_main39:
;nest.c,437 :: 		else if(resetTouchSensor){
MOVW	R1, #lo_addr(_resetTouchSensor+0)
MOVT	R1, #hi_addr(_resetTouchSensor+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_main41
;nest.c,438 :: 		resetTouchSensor = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(_resetTouchSensor+0)
MOVT	R0, #hi_addr(_resetTouchSensor+0)
STR	R1, [R0, #0]
;nest.c,439 :: 		uart3ResetSensorTouch();
BL	_uart3ResetSensorTouch+0
;nest.c,440 :: 		}
IT	AL
BAL	L_main42
L_main41:
;nest.c,442 :: 		uart3SendJoystick();
BL	_uart3SendJoystick+0
;nest.c,443 :: 		}
L_main42:
L_main40:
;nest.c,444 :: 		}
L_main38:
;nest.c,447 :: 		if(bitCheckJoystick){
MOVW	R1, #lo_addr(_bitCheckJoystick+0)
MOVT	R1, #hi_addr(_bitCheckJoystick+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_main43
;nest.c,448 :: 		bitCheckJoystick = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(_bitCheckJoystick+0)
MOVT	R0, #hi_addr(_bitCheckJoystick+0)
STR	R1, [R0, #0]
;nest.c,449 :: 		gear_status = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_gear_status+0)
MOVT	R0, #hi_addr(_gear_status+0)
STRH	R1, [R0, #0]
;nest.c,450 :: 		}
L_main43:
;nest.c,457 :: 		}
IT	AL
BAL	L_main6
;nest.c,459 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
