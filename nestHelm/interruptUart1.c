#include "externDef.h"
#include "eeprom.h"


void interruptJoystick() iv IVT_INT_USART1 ics ICS_AUTO {
  receive1 = UART1_Read();
  

  
  if((receive1 == 0x21)&&(!startReceivingData1)){
      uart_count1=0;
      startReceivingData1 = 1;
      for(i=0; i<10; i++){
            uart_receive1[i] = 0;
    }
  }

  else if((receive1 == 0x3B)&&(startReceivingData1)&&(uart_count1 + 1 == uartLength1)){
    uart_receive1[uart_count1] = receive1;
    uart_count1 = 0;
    startReceivingData1 = 0;
    uartLength1 = 0;
    

    /**********************************************************************************/
    /**********************************************************************************/
    /**********************************************************************************/
    if((uart_receive1[0]==0x21)&&(uart_receive1[1]==0x40)&&(uart_receive1[5] = 0x3B)){
    
      bitRespond = 1;
      
      if(uart_receive1[4]&=0x01){
        bitControlTaken = 1;
        gear_status = (unsigned int)uart_receive1[2];
        dir_status = (unsigned int)uart_receive1[3];
        switch(gear_status){
          case 0x01:
            ONE_LIGHT = 1;
            TWO_LIGHT = THREE_LIGHT = N_LIGHT = R_LIGHT = 0;
          break;
          case 0x02:
            TWO_LIGHT = 1;
            ONE_LIGHT = THREE_LIGHT = N_LIGHT = R_LIGHT = 0;
          break;
          case 0x03:
            THREE_LIGHT = 1;
            TWO_LIGHT = ONE_LIGHT = N_LIGHT = R_LIGHT = 0;
          break;
          case 0x04:
            N_LIGHT = 1;
            TWO_LIGHT = THREE_LIGHT = ONE_LIGHT = R_LIGHT = 0;
          break;
          case 0x05:
            R_LIGHT = 1;
            TWO_LIGHT = THREE_LIGHT = N_LIGHT = ONE_LIGHT = 0;
          break;
        }
      }
      else{
        bitControlTaken = 0;
      }


    }
    
    else if((uart_receive1[0]==0x21)&&(uart_receive1[1]==0x41)&&(uart_receive1[5] = 0x3B)){

      bitCalSend = 1;

    }
    
    else if((uart_receive1[0]==0x21)&&(uart_receive1[1]==0x42)&&(uart_receive1[5] = 0x3B)){

      leftLimit = (uart_receive1[2] << 8) + uart_receive1[3];
      eepromSaveLeft();
      
      if(leftLimit >= rightLimit){
        sideDifference = leftLimit - rightLimit;
      }
      else{
        sideDifference = rightLimit - leftLimit;
      }

      if(sideDifference == 0){
        sideDifference = 1;
      }

    }
    
    else if((uart_receive1[0]==0x21)&&(uart_receive1[1]==0x43)&&(uart_receive1[5] = 0x3B)){

      rightLimit = (uart_receive1[2] << 8) + uart_receive1[3];
      eepromSaveRight();
      
      if(leftLimit >= rightLimit){
        sideDifference = leftLimit - rightLimit;
      }
      else{
        sideDifference = rightLimit - leftLimit;
      }

      if(sideDifference == 0){
        sideDifference = 1;
      }

    }
    
    else if((uart_receive1[0]==0x21)&&(uart_receive1[1]==0x44)&&(uart_receive1[5] = 0x3B)){

      dir = uart_receive1[2];
      eepromDir();

    }
    
    // Reset touch sensor
    else if((uart_receive1[0]==0x21)&&(uart_receive1[1]==0x45)&&(uart_receive1[5] = 0x3B)){
    
      bitResetTouchSensor = 1;
    }

    for(i=0; i<10; i++){
      uart_receive1[i] = 0;
    }

  }


  if(startReceivingData1 == 1){
    uart_receive1[uart_count1] = receive1;
    uart_count1++;

    if(uart_count1 == 2)
    {
        switch (uart_receive1[1])
        {
          case 0x40:
              uartLength1 = 6;
              break;
          case 0x41:
              uartLength1 = 6;
              break;
          case 0x42:
              uartLength1 = 6;
              break;
          case 0x43:
              uartLength1 = 6;
              break;
          case 0x44:
              uartLength1 = 6;
              break;
          case 0x45:
              uartLength1 = 6;
              break;
          
      }
    }

    if(uart_count1 > 9){
        uart_count1 = 0;
        uartLength1 = 0;
        startReceivingData1 = 0;
        for(i=0; i<10; i++){
            uart_receive1[i] = 0;
        }
    }
  }

}