
#include "externDef.h"

void interruptJoystick() iv IVT_INT_USART3 ics ICS_AUTO {
  receive3 = UART3_Read();
  
  if((receive3 == 0x21)&&(!startReceivingData3)){
      uart_count3=0;
      startReceivingData3 = 1;
      for(i=0; i<10; i++){
            uart_receive3[i] = 0;
    }
  }
  
  else if((receive3 == 0x3B)&&(startReceivingData3)&&(uart_count3 + 1 == uartLength3)){
    uart_receive3[uart_count3] = receive3;
    uart_count3 = 0;
    startReceivingData3 = 0;
    uartLength3 = 0;
    
    /**********************************************************************************/
    /**********************************************************************************/
    /**********************************************************************************/
    if((uart_receive3[0]==0x21)&&(uart_receive3[1]==0x50)&&(uart_receive3[5] = 0x3B)){
    
      countJoystickConnection = 0;
      bitCheckJoystick = 0;
      
    
      if(!control_taken){
        gear_status = uart_receive3[2];
        dutyy = uart_receive3[3];
        
        if((gear_status == 4) && (!resetedTouchSensor)){
          resetedTouchSensor = 1;
          resetTouchSensor = 1;
        }
        else if(gear_status != 4){
          resetedTouchSensor = 0;
        }
        

      }
      
      if(bitCheckIsItStoppedGear){
        bitCheckIsItStoppedGear = 0;
        if(gear_status != 4){
          stopGearBit = 1;
        }
      }
    
    }
    
    for(i=0; i<10; i++){
      uart_receive3[i] = 0;
    }
        
  }
  
  
  if(startReceivingData3 == 1){
    uart_receive3[uart_count3] = receive3;
    uart_count3++;

    if(uart_count3 == 2)
    {
        switch (uart_receive3[1])
        {
          case 0x50:
              uartLength3 = 6;
              break;
      }
    }

    if(uart_count3 > 9){
        uart_count3 = 0;
        uartLength3 = 0;
        startReceivingData3 = 0;
        for(i=0; i<10; i++){
            uart_receive3[i] = 0;
        }
    }
  }

}