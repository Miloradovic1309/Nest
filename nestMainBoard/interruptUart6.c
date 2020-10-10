
#include "externDef.h"
#include "uartSend.h"





void interruptLora() iv IVT_INT_USART6 ics ICS_AUTO {
  receive6 = UART6_Read();

  if((receive6 == 0x21)&&(!startReceivingData6)){
        uart_count6=0;
        startReceivingData6 = 1;
        for(i=0; i<12; i++){
            uart_receive6[i] = 0;
        }
    }



    else if((receive6 == 0x3B)&&(startReceivingData6)&&(uart_count6 + 1 == uartLength6)){
        uart_receive6[uart_count6] = receive6;
        uart_count6 = 0;
        startReceivingData6 = 0;
        uartLength6 = 0;
        



        /**********************************************************************************/
        /**********************************************************************************/
        /**********************************************************************************/
        if((uart_receive6[0]==0x21)&&(uart_receive6[1]==0xC0)&&(uart_receive6[6] = 0x3B)){
        
          receivedCheckStatus = 1;

          
          if(uart_receive6[4] & 0x02){
            //LIGHT_INTERIOR = ~LIGHT_INTERIOR;
            //LED_INTERIOR_LIGHT_TS = ~LED_INTERIOR_LIGHT_TS;
            if(interiorLightState_old == 0){
              interiorLightState = 1;
              uart4InteriorLightTurnedOn();
            }
            else if(interiorLightState_old == 1){
              interiorLightState = 0;
              uart4InteriorLightTurnedOff();
            }
          }
          if(uart_receive6[4] & 0x04){
            //LIGHT_NAVIGATION = ~LIGHT_NAVIGATION;
            //LED_NAVIGATION_LIGHT_TS = ~LED_NAVIGATION_LIGHT_TS;
            if(navigationLightState_old == 0){
              navigationLightState = 1;
              uart4NavigationLightTurnedOn();
            }
            else if(navigationLightState_old == 1){
              navigationLightState = 0;
              uart4NavigationLightTurnedOff();
            }
          }
          
          if(uart_receive6[4] & 0x08){
            if(wannaBeActiveBattery1_old==0){
              uart4Battery2TurnedOff();
              wannaBeActiveBattery2_old = 0;
              wannaBeActiveBattery2 = 0;
              
              uart4Battery1TurnedOn();
              wannaBeActiveBattery1_old = 1;
              wannaBeActiveBattery1 = 1;
              
              battery_change_continue = 0;
              battery_change = 0;
              battery_change_count = 0;
              battery_chosen = 1;
              
            }
            else{
              uart4Battery1TurnedOff();
              wannaBeActiveBattery1_old = 0;
              wannaBeActiveBattery1 = 0;

              battery_change_continue = 0;
              battery_change = 0;
              battery_change_count = 0;
              battery_chosen = 0;
            }
            //bitBattery1Change = 1;
          }

          
          if(uart_receive6[4] & 0x10){
            if(wannaBeActiveBattery2_old==0){
              uart4Battery1TurnedOff();
              wannaBeActiveBattery1_old = 0;
              wannaBeActiveBattery1 = 0;

              uart4Battery2TurnedOn();
              wannaBeActiveBattery2_old = 1;
              wannaBeActiveBattery2 = 1;

              battery_change_continue = 0;
              battery_change = 0;
              battery_change_count = 0;
              battery_chosen = 2;

            }
            else{
              uart4Battery2TurnedOff();
              wannaBeActiveBattery2_old = 0;
              wannaBeActiveBattery2 = 0;

              battery_change_continue = 0;
              battery_change = 0;
              battery_change_count = 0;
              battery_chosen = 0;
            }
            //bitBattery2Change = 1;
          }
          

          
          if(uart_receive6[4] & 0x01 == 0x01){
            control_taken = 1;
            bitControlTaken = 1;
            controlTakenCount = 0;
            countJoystickConnection = 0;
            bitCheckJoystick = 0;
          }
          else{
            control_taken = 0;
            bitControlTaken = 0;
            controlTakenCount = 0;
          }
          
          switch(uart_receive6[3] & 0x07){
            case 1:
              /*
              GEAR1_LED = 1;
              GEAR2_LED = GEAR3_LED = GEARN_LED = GEARB_LED = 0;
              */
              if(control_taken){
                gear_status = 1;
              }

              break;
            case 2:
              /*
              GEAR2_LED = 1;
              GEAR1_LED = GEAR3_LED = GEARN_LED = GEARB_LED = 0;
              */
              if(control_taken){
                gear_status = 2;
              }

              break;
            case 3:
              /*
              GEAR3_LED = 1;
              GEAR1_LED = GEAR2_LED = GEARN_LED = GEARB_LED = 0;
              */
              if(control_taken){
                gear_status = 3;
              }

              break;
            case 4:
              /*
              GEARN_LED = 1;
              GEAR1_LED = GEAR2_LED = GEARB_LED = GEAR3_LED = 0;
              */
              if(control_taken){
                gear_status = 4;
              }
              stopGearBit = 1;

            break;
            case 5:
              /*
              GEARB_LED = 1;
              GEAR1_LED = GEAR2_LED = GEARN_LED = GEAR3_LED = 0;
              */
              if(control_taken){
                gear_status = 5;
              }

            break;
            default:
              gear_status = gear_status;
            break;
          }
          
          switch(uart_receive6[3] & 0x38){

            case 0x08:
              velocity_mode_save = VELOCITY_TURTLE;
              velocity_mode = VELOCITY_TURTLE;
              change_velocity_mode(velocity_mode);
            break;
            
            case 0x10:
              velocity_mode_save = VELOCITY_RABBIT;
              velocity_mode = VELOCITY_RABBIT;
              change_velocity_mode(velocity_mode);
            break;
            
            case 0x20:
              velocity_mode_save = VELOCITY_LEOPARD;
              velocity_mode = VELOCITY_LEOPARD;
              change_velocity_mode(velocity_mode);
            break;
            
            default:
            break;
            
          }
          
          boatWheelDir = uart_receive6[2];

        }




        for(i=0; i<12; i++){
          uart_receive6[i] = 0;
        }



    /************************************************************************************************/
  }


  if(startReceivingData6 == 1){
    uart_receive6[uart_count6] = receive6;
    uart_count6++;

    if(uart_count6 == 2)
    {
        switch (uart_receive6[1])
        {
          case 0xC0:
              uartLength6 = 7;
              break;
      }
    }

    if(uart_count6 > 11){
        uart_count6 = 0;
        uartLength6 = 0;
        startReceivingData6 = 0;
        for(i=0; i<12; i++){
            uart_receive6[i] = 0;
        }
    }
  }
  
  
}