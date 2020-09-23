#include "def.h"
#include "externDef.h"
#include "crc.h"
#include "uartSend.h"
#include "timers.h"

void batteryChangeState(void);
void batteryLavelMeasure(void);
void directionWheelADC(void);
void gearVelocityMotorSpeedControl(void);
void batteryControlSwitches(void);
void lightControlSwitches(void);






void setup_IWDG()
{
     IWDG_KR = 0x5555;    //Disable write protection of IWDG registers
     IWDG_PR = 0x06;      //Set PR value
     IWDG_RLR = 0x1FF;     //Set RLR value
     IWDG_KR = 0xAAAA;    //Reload IWDG
     IWDG_KR = 0xCCCC;    //Start IWDG
}





void main() {


  FLASH_OPTKEYR = 0x08192A3B;
  FLASH_OPTKEYR = 0x4C5D6E7F;

  BOR_LEV0_bit = 0;
  BOR_LEV1_bit = 1;
  
  FLASH_OPTCR |= 0x01;
  FLASH_OPTCR |= 0x02;


  /********** LORA UART6 ************************************************************************/
  UART6_Init_Advanced(115200, _UART_8_BIT_DATA, _UART_NOPARITY, _UART_ONE_STOPBIT, &_GPIO_MODULE_USART6_PC67);
  USART6_CR1bits.RXNEIE = 1;       // enable uart rx interrupt
  NVIC_IntEnable(IVT_INT_USART6);  // enable interrupt vector
  /***********************************************************************************************/
  
  /********** DISPLAY UART4 ************************************************************************/
  UART4_Init_Advanced(115200, _UART_8_BIT_DATA, _UART_NOPARITY, _UART_ONE_STOPBIT, &_GPIO_MODULE_UART4_PA01 );
  UART4_CR1bits.RXNEIE = 1;       // enable uart rx interrupt
  NVIC_IntEnable(IVT_INT_UART4);  // enable interrupt vector
  /*************************************************************************************************/
  
  /********** GPS UART2 *************************************************************************/
  //UART2_Init_Advanced(115200, _UART_8_BIT_DATA, _UART_NOPARITY, _UART_ONE_STOPBIT, &_GPIO_MODULE_USART2_PD56);
  //USART2_CR1bits.RXNEIE = 1;       // enable uart rx interrupt
  //NVIC_IntEnable(IVT_INT_USART2);  // enable interrupt vector
  /**********************************************************************************************/
  
  /********** MOTOR UART1 *************************************************************************/
  UART1_Init_Advanced(38400, _UART_8_BIT_DATA, _UART_NOPARITY, _UART_ONE_STOPBIT, &_GPIO_MODULE_USART1_PA9_10);
  //USART1_CR1bits.RXNEIE = 1;       // enable uart rx interrupt
  //NVIC_IntEnable(IVT_INT_USART1);  // enable interrupt vector
  /************************************************************************************************/
  
  /********** JOYSTICK UART3 *************************************************************************/
  UART3_Init_Advanced(115200, _UART_8_BIT_DATA, _UART_NOPARITY, _UART_ONE_STOPBIT, &_GPIO_MODULE_USART3_PB10_11);
  USART3_CR1bits.RXNEIE = 1;       // enable uart rx interrupt
  NVIC_IntEnable(IVT_INT_USART3);  // enable interrupt vector
  /************************************************************************************************/
  
  /********** EEPROM I2C1 *************************************************************************/
  I2C1_Init_Advanced(100000, &_GPIO_MODULE_I2C1_PB67);
  /************************************************************************************************/
  
  /*************** UART EN BITS *******************************************************************/
  GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_15);                           // UART3_RXTX
  GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_8);                            // UART1_RXTX
  GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_4);                            // UART4_RXTX
  GPIO_Digital_Output(&GPIOC_BASE, _GPIO_PINMASK_8);                            // UART6_RXTX
  /************************************************************************************************/
  
  


  
  GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_11);                           // BUZ
  GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_3 | _GPIO_PINMASK_4);          // LIGHT_NAVIGATION, LIGHT_INTERIOR
  GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_7 | _GPIO_PINMASK_6            // ACCUMULATOR1_ON, ACCUMULATOR2_ON
                                   | _GPIO_PINMASK_5);                          // ACCUMULATORS_OFF
                                   
  GPIO_Config(&GPIOA_BASE, _GPIO_PINMASK_6,                                     // ACCUMULATOR_SENSE
                           _GPIO_CFG_MODE_INPUT | _GPIO_CFG_PULL_DOWN);
  
  GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_15 | _GPIO_PINMASK_14);        // LORA_M0, LORA_M1
  
  GPIO_Config(&GPIOD_BASE, _GPIO_PINMASK_13,                                    // LORA_AUX
                           _GPIO_CFG_MODE_INPUT | _GPIO_CFG_PULL_UP);
                           
  GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_14 | _GPIO_PINMASK_15);        // LED1, LED2
  GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_8 | _GPIO_PINMASK_9 | _GPIO_PINMASK_10);        // LED3, LED4, LED5
  
  
  
  GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_7);
  pwm_ratio = PWM_TIM3_Init(pwm_frequency);
  pwm_duty = ((unsigned int)((double)(((double)(((double)pwm_ratio) * pwm_percent)) / ((double)100))));
  PWM_TIM3_Set_Duty(pwm_duty, _PWM_NON_INVERTED, _PWM_CHANNEL2);
  PWM_TIM3_Start(_PWM_CHANNEL2, &_GPIO_MODULE_TIM3_CH2_PA7);
  
  /*
  GPIO_Analog_Input(&GPIOA_IDR, _GPIO_PINMASK_6);        //
  ADC1_Init();
  
  */
  GPIO_Analog_Input(&GPIOA_IDR, _GPIO_PINMASK_5);
  GPIO_Analog_Input(&GPIOA_IDR, _GPIO_PINMASK_4);
  ADC2_Init();

  
  
  
  
  
  
  //LED_C = 0;
  /*
  LED_BATTERY1_100 = 0;
  LED_BATTERY1_75 = 0;
  LED_BATTERY1_50 = 0;
  LED_BATTERY1_25 = 0;
  LED_BATTERY2_100 = 0;
  LED_BATTERY2_75 = 0;
  LED_BATTERY2_50 = 0;
  LED_BATTERY2_25 = 0;
  */
  
  /*
  LED_INTERIOR_LIGHT_TS = 0;
  LED_NAVIGATION_LIGHT_TS = 0;
  LED_BATTERY1_TS = 0;
  LED_BATTERY2_TS = 0;
  */
  
  uart4Battery1Level0();
  uart4Battery2Level0();
  uart4Battery1TurnedOff();
  uart4Battery2TurnedOff();
  uart4InteriorLightTurnedOff();
  uart4NavigationLightTurnedOff();
  uart4LightingTurnedOff();
  
  
  LIGHT_NAVIGATION = 0;
  LIGHT_INTERIOR = 0;

  /*
  GEAR1_LED = 0;
  GEAR2_LED = 0;
  GEAR3_LED = 0;
  GEARN_LED = 1;
  GEARB_LED = 0;

  LED_WHEEL = 0;
  */
  
  countedTimer = 0;
  
  bitDelay3Seconds = 0;
  bitStart3SecondsCount = 0;
  battery_change = 0;
  battery_change_continue = 0;
  oldStateInteriorLight = 0;
  oldStateNavigationLight = 0;
  battery_chosen = 0;
  battery_chosen_old = 0;
  oldStateBattery1 = 0;
  oldStateBattery2 = 0;
  battry_percentage_check = 0;
  control_taken = 0;
  status_asked = 0;
  
  startReceivingData6 = 0;
  receivedCheckStatus = 0;
  
  bitBattery1Change = 0;
  bitBattery2Change = 0;
  
  bitCheckJoystick = 0;
  
  startReceivingData4 = 0;
  startReceivingData3 = 0;
  
  resetTouchSensor = 0;
  resetedTouchSensor = 0;

  
  //LED_C = 1;
  
  ACCUMULATORS_OFF = 0;
  ACCUMULATOR1_ON = 0;
  ACCUMULATOR2_ON = 0;
  
  
  
  LORA_M0 = 0;
  LORA_M1 = 0;
  
  navLightOff = 0;
  navLightOn = 0;
  intLightOn = 0;
  intLightOff = 0;
  bat1On = 0;
  bat1Off = 0;
  bat2On = 0;
  bat2Off = 0;
  
  bitCheckStatusJoystick = 0;
  bitCheckStatusDisplay = 0;
  
  countedTimer2 = 0;
  
  controlWasTaken = 0;
  stopGearBit = 0;
  bitCheckIsItStoppedGear = 0;
  
  /*
  UART1_Write(0xC0);
  UART1_Write(0x00);
  UART1_Write(0x11);
  UART1_Write(0x1A);
  UART1_Write(0x17);
  UART1_Write(0xC4);
  */



  LED1 = 0;
  LED2 = 0;
  LED3 = 0;
  LED4 = 0;
  LED5 = 0;
  Delay_ms(500);
  
  battery_chosen = 0;
  battery_chosen_old = 3;
  battry_percentage_check = 1;
  
  InitTimer2();
  InitTimer4();
  
  /*
  FLASH_OPTKEYR = 0x08192A3B;
  FLASH_OPTKEYR = 0x4C5D6E7F;
  
  BOR_LEV0_bit = 1;
  BOR_LEV1_bit = 1;
  */
  
  //FLASH_OPTCR &= 0XFFFFFFF7;
  /*
  PVDE_bit = 1;
  PLS0_bit = 1;
  PLS1_bit = 1;
  PLS2_bit = 1;
  
  PVDO_bit = 1;
  */
  
  beingControlledByMobile = 1;
  velocity_mode_new = VELOCITY_RABBIT;
  velocity_mode = VELOCITY_RABBIT;

  
  
  
  //uart3ResetSensorTouch();
  Delay_ms(700);
  change_velocity_mode(velocity_mode);
  Delay_ms(50);

  
  setup_IWDG();
  
  while(1){

  



    batteryChangeState();
    lightControlSwitches();
    batteryControlSwitches();
    gearVelocityMotorSpeedControl();
    directionWheelADC();
    batteryLavelMeasure();
    
    LED5 = ACCUMULATOR_SENSE;
    
    if(control_taken){
      controlWasTaken = 1;
    }
    
    if(controlWasTaken && !control_taken){
      controlWasTaken = 0;
      if(gear_status != 4){
        stopGearBit = 1;
      }
    }




    if(receivedCheckStatus){
      receivedCheckStatus = 0;
      uartSendStatusToStation();
      
    }
    
    if(control_taken){boatControlTaken = 0x01;}
    else{boatControlTaken = 0x00;}
    
    if(LIGHT_INTERIOR){boatInteriorLight = 0x02; LED2 = 1;}
    else{boatInteriorLight = 0x00; LED2 = 0;}
    
    if(LIGHT_NAVIGATION){boatNavigationLight = 0x04; LED3 = 1;}
    else{boatNavigationLight = 0x00; LED3 = 0;}
    

    if(activeBattery == 1){boatBattery1 = 0x08;}
    else{boatBattery1 = 0x00;}
    
    if(activeBattery == 2){boatBattery2 = 0x10;}
    else{boatBattery2 = 0x00;}
    
    if(activeBattery == 0){
      boatBattery1 = 0x00;
      boatBattery2 = 0x00;
    }
    

    




    if(bitCheckJoystick){
      gear_status = 4;
      dutyy = 150;
    }
    
    if(navLightOn){
      navLightOn = 0;
      if(navigationLightState == 1){
        uart4NavigationLightTurnedOn();
      }
    }
    if(navLightOff){
      navLightOff = 0;
      if(navigationLightState == 0){
        uart4NavigationLightTurnedOff();
      }
    }
    
    if(intLightOn){
      intLightOn = 0;
      if(interiorLightState == 1){
        uart4InteriorLightTurnedOn();
      }
    }
    
    if(intLightOff){
      intLightOff = 0;
      if(interiorLightState == 0){
        uart4InteriorLightTurnedOff();
      }
    }
    /*
    if(bat1On){
      bat1On = 0;
      uart4Battery1TurnedOn();
    }
    
    if(bat1Off){
      bat1Off = 0;
      uart4Battery1TurnedOff();
    }
    
    if(bat2On){
      bat2On = 0;
      uart4Battery2TurnedOn();
    }

    if(bat2Off){
      bat2Off = 0;
      uart4Battery2TurnedOff();
    }
    */

    
    
    if(bitCheckStatusDisplay){
      bitCheckStatusDisplay = 0;
      
      IWDG_KR = 0xAAAA;    //Reload IWDG

      LED1 = ~LED1;
      uart4CheckNavigationLightStatus();
      uart4CheckInteriorLightStatus();
      uart4CheckBattery1Status();
      uart4CheckBattery2Status();
      
      uart4TurtleCheckStatus();
      uart4RabbitCheckStatus();
      uart4LeopardCheckStatus();
      
      if((beingControlledByMobile) && (!control_taken)){
        beingControlledByMobile = 0;
        velocity_mode = velocity_mode_new;
        change_velocity_mode(velocity_mode);
      }
    }
    
    if(bitCheckStatusJoystick){
      bitCheckStatusJoystick = 0;

      LED1 = ~LED1;
      if(stopGearBit){
        stopGearBit = 0;
        gear_status = 4;
        bitCheckIsItStoppedGear = 1;
        uart3SendJoystickForced();
      }
      else if(resetTouchSensor){
        resetTouchSensor = 0;
        uart3ResetSensorTouch();
      }
      else{
        uart3SendJoystick();
      }
    }
    
    
    if(bitCheckJoystick){
      bitCheckJoystick = 0;
      gear_status = 4;
    }
    

    
    
    
  
  }

}