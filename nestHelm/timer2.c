
#include "externDef.h"

void Timer2_interrupt() iv IVT_INT_TIM2 {
  TIM2_SR.UIF = 0;
  //Enter your code here
  
  countedTimer = 1;

  if(bitStart3SecondsCount){
    delay3secndsCount++;
    if(delay3secndsCount >= 60){
      bitDelay3Seconds = 0;
      bitStart3SecondsCount = 0;
      delay3secndsCount = 0;
    }
  }


}