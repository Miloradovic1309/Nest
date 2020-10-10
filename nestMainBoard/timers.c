
#include "externDef.h"



void Timer2_interrupt() iv IVT_INT_TIM2 {
  TIM2_SR.UIF = 0;
  //Enter your code here
  /*countedTimerCount++;
  if(countedTimerCount == 4){
    countedTimer2 = 1;
  }
  else if(countedTimerCount>=8){
    countedTimerCount = 0;
    countedTimer = 1;
  } */
  


  
  if((battery_chosen_old == 1 || battery_chosen_old == 2)&& ACCUMULATOR_SENSE)
  {
    if(duzinaSignala2 > dutyy){
      duzinaSignala2--;
    }
    else if(duzinaSignala2 < dutyy){
      duzinaSignala2++;
    }

    pwm_percent =  (double)(((double)(((double)duzinaSignala2) * ((double)100))) / ((double)2000));
    pwm_duty = ((unsigned int)((double)(((double)(((double)pwm_ratio) * pwm_percent)) / ((double)100))));
    PWM_TIM3_Set_Duty(pwm_duty, _PWM_NON_INVERTED, _PWM_CHANNEL2);
  }
}


void Timer4_interrupt() iv IVT_INT_TIM4 {
  TIM4_SR.UIF = 0;
  //Enter your code here
  //LED1 = ~LED1;
  //LED2 = ~LED2;
  //LED3 = ~LED3;
  //LED4 = ~LED4;
  //LED5 = ~LED5;
  
  /*
  paljenjeLedTestcounter++;
  if(paljenjeLedTestcounter >= 20){
    paljenjeLedTestcounter = 0;
    LED4 = ~LED4;
  }
  */
  

  
  countedTimer = 1;
  buzzerCounter++;
  battry_percentage_check_counter++;
  if(battry_percentage_check_counter >= 80){
    battry_percentage_check = 1;
    battry_percentage_check_counter = 0;
  }
  
  if(buzzerCounter >= 10000){
    buzzerCounter = 0;
  }
  
  if(battery_change){
    battery_change_count++;
    if(battery_change_count> 100){
      battery_change_count = 0;
    }
  }
  
  if(bitStart3SecondsCount){
    delay3secndsCount++;
    if(delay3secndsCount >= 60){
      bitDelay3Seconds = 0;
      bitStart3SecondsCount = 0;
      delay3secndsCount = 0;
    }
  }
  
  if(bitControlTaken){
    controlTakenCount++;
    if(controlTakenCount>60){
      controlTakenCount = 0;
      bitControlTaken = 0;
      control_taken = 0;
    }
  }
  
  countJoystickConnection++;
  if(countJoystickConnection > 60){
    countJoystickConnection = 60;
    bitCheckJoystick = 1;
  }
  
  
  couterJoystickDisplay++;
  if(couterJoystickDisplay == 1){
    bitCheckStatusDisplay = 1;
  }
  else if(couterJoystickDisplay >= 2){
    bitCheckStatusJoystick = 1;
    couterJoystickDisplay = 0;
  }
  
  

  

  

}