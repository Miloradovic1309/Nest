
#include "externDef.h"


void interruptUart3() iv IVT_INT_USART3 ics ICS_AUTO {
  receive3 = UART3_Read();

    if((receive3 == 0x21)&&(!startReceivingData3)){
        uart_count3=0;
        startReceivingData3 = 1;
        uartLength3 = 0;
        for(i=0; i<13; i++){
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
        if((uart_receive3[0]==0x21)&&(uart_receive3[1]==ADDRESS_STATION)&&(uart_receive3[2]==ADDRESS_PHONE)
            && (uart_receive3[5]==0xC0)&&(uart_receive3[9] = 0x3B)){

            //LED0 = ~LED0;

            bitReceivedCheckStatusOfBoat = 1;
            addressBoat[0] = uart_receive3[3];
            addressBoat[1] = uart_receive3[4];
            boatStatus = uart_receive3[8];
            boatStatusGear = uart_receive3[7];
            boatStatusWheel = uart_receive3[6];

            if(!bitExpectAnswer){
              TIM2_CNT = 0x00;
              bitExpectAnswer = 1;
            }


        }






        for(i=0; i<13; i++){
          uart_receive3[i] = 0;
        }



    /************************************************************************************************/
  }


  if(startReceivingData3 == 1){
    uart_receive3[uart_count3] = receive3;
    uart_count3++;

    if(uart_count3 == 2){
      if(uart_receive3[1] != ADDRESS_STATION){
        uart_count3 = 0;
        uartLength3 = 0;
        startReceivingData3 = 0;
        for(i=0; i<12; i++){
          uart_receive3[i] = 0;
        }
      }
    }
    else if(uart_count3 == 6)
    {
        switch (uart_receive3[5])
        {
          case 0xC0:
              uartLength3 = 10;
              break;
      }
    }

    if(uart_count3 > 12){
        uart_count3 = 0;
        uartLength3 = 0;
        startReceivingData3 = 0;
        for(i=0; i<13; i++){
            uart_receive3[i] = 0;
        }
    }
  }

}