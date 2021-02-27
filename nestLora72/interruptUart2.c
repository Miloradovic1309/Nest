
#include "externDef.h"

void interruptUart2() iv IVT_INT_USART2 ics ICS_AUTO {
  receive2 = UART2_Read();

    if((receive2 == 0x21)&&(!startReceivingData2)){
        uart_count2=0;
        startReceivingData2 = 1;
        uartLength2 = 0;
        for(i=0; i<12; i++){
            uart_receive2[i] = 0;
        }
    }



    else if((receive2 == 0x3B)&&(startReceivingData2)&&(uart_count2 + 1 == uartLength2)){
        uart_receive2[uart_count2] = receive2;
        uart_count2 = 0;
        startReceivingData2 = 0;
        uartLength2 = 0;


        /**********************************************************************************/
        /**********************************************************************************/
        /**********************************************************************************/
        if((uart_receive2[0]==0x21)&&(uart_receive2[1]==0xC0)&&(uart_receive2[6] = 0x3B)){

            boatDir = uart_receive2[2];
            boatGear = uart_receive2[3];

            boatControlTaken =  uart_receive2[4] & 0x01;
            boatInteriorLight = uart_receive2[4] & 0x02;
            boatNavigationLight = uart_receive2[4] & 0x04;

            boatBattery1 =  uart_receive2[4] & 0x08;
            boatBattery2 =  uart_receive2[4] & 0x10;

            boatBatteriesLavel = uart_receive2[5];

            boatConnected = 0x20;


            bitReceivedStatusOfBoat = 1;

        }




        for(i=0; i<12; i++){
          uart_receive2[i] = 0;
        }



    /************************************************************************************************/
  }


  if(startReceivingData2 == 1){
    uart_receive2[uart_count2] = receive2;
    uart_count2++;

    if(uart_count2 == 2)
    {
        switch (uart_receive2[1])
        {
          case 0xC0:
              uartLength2 = 7;
              break;
      }
    }

    if(uart_count2 > 11){
        uart_count2 = 0;
        uartLength2 = 0;
        startReceivingData2 = 0;
        for(i=0; i<12; i++){
            uart_receive2[i] = 0;
        }
    }
  }


}