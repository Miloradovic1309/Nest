#include "externDef.h"


void Timer2_interrupt() iv IVT_INT_TIM2 {
  TIM2_SR.UIF = 0;
  //Enter your code here

  //LED = ~LED;

  if(bitExpectAnswer){
    sendRequestStatusToAndroid();
    bitExpectAnswer = 0;
    boatConnected = 0x00;

  }

}