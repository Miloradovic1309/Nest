
#include "externDef.h"
#include "uartSend.h"




void interruptDisplay() iv IVT_INT_UART4 ics ICS_AUTO {
  receive4 = UART4_Read();
  
  if (receive4 == 0x5A && rcv_count_helper4 == 0 && startReceivingData4 == 0x00) {
    rcv_helper4[0] = receive4;
    rcv_count_helper4 = 1;
  } 
  else if (receive4 == 0xA5 && rcv_count_helper4 == 1 && startReceivingData4 == 0x00) {
    rcv_helper4[1] = receive4;
    rcv_count_helper4 = 2;
    startReceivingData4 = 0x01;
  } 
  else if (rcv_count_helper4 != 2 && startReceivingData4 == 0x00) {
    rcv_helper4[0] = 0x00;
    rcv_helper4[1] = 0x00;
    rcv_count_helper4 = 0;
    uart_count4 = 0;
  }
  else if (rcv_count_helper4 == 2 && startReceivingData4 == 0x01) {
    uart_receive4[0] = rcv_helper4[0];
    uart_receive4[1] = rcv_helper4[1];
    rcv_count_helper4 = 0;
    rcv_helper4[0] = 0x00;
    rcv_helper4[1] = 0x00;
    uart_receive4[2] = receive4;
    uart_count4 = 3;
    if (uart_receive4[2] > 6) {
      rcv_helper4[0] = 0x00;
      rcv_helper4[1] = 0x00;
      uart_count4 = 0;
      startReceivingData4 = 0x00;
      rcv_count_helper4 = 0;
      rcv_helper4[0] = 0x00;
      rcv_helper4[1] = 0x00;

      for (i = 0; i < 10; i++) {
        uart_receive4[i] = 0x00;
      }
    }
  } 
  else if (rcv_count_helper4 == 0 && startReceivingData4 == 0x01 && uart_count4 < uart_receive4[2] + 3) {
    uart_receive4[uart_count4] = receive4;
    uart_count4++;
  }

  if (rcv_count_helper4 == 0 && startReceivingData4 == 0x01 && uart_count4 >= uart_receive4[2] + 3) {
    if (uart_receive4[0] == 0x5A && uart_receive4[1] == 0xA5 && uart_receive4[2] == 0x06
         && uart_receive4[3] == 0x83 && uart_receive4[4] == 0x16
         && uart_receive4[5] == 0x00 && uart_receive4[6] == 0x01
         && uart_receive4[7] == 0x00) {

      if(!control_taken){
        if (uart_receive4[8] == 0x00) {

          navigationLightState = 1;
        }
        else {

          navigationLightState = 0;
        }
      }
      else{
        if(navigationLightState_old == 1){

            navLightOn = 1;


        }
        else{

            navLightOff = 1;

        }
      }
    }
    else if (uart_receive4[0] == 0x5A && uart_receive4[1] == 0xA5 && uart_receive4[2] == 0x06
               && uart_receive4[3] == 0x83 && uart_receive4[4] == 0x16
               && uart_receive4[5] == 0x20 && uart_receive4[6] == 0x01
               && uart_receive4[7] == 0x00) {

      if(!control_taken){
        if (uart_receive4[8] == 0x00) {
          //interiorLightTurnedOnOff = 1;
          interiorLightState = 1;
        }
        else {
          //interiorLightTurnedOnOff = 0;
          interiorLightState = 0;
        }
      }
      else{
        if(interiorLightState_old == 1){
          //uart4InteriorLightTurnedOn();
          intLightOn = 1;
        }
        else{
          //uart4InteriorLightTurnedOff();
          intLightOff = 1;
        }
      }
    }
    else if (uart_receive4[0] == 0x5A && uart_receive4[1] == 0xA5 && uart_receive4[2] == 0x06
                                && uart_receive4[3] == 0x83 && uart_receive4[4] == 0x16
                                && uart_receive4[5] == 0x40 && uart_receive4[6] == 0x01
                                && uart_receive4[7] == 0x00) {
                                
      if((!control_taken)&&(!bitBatteryChangeBlockCounter)){
        if (uart_receive4[8] == 0x00) {
          //battery1TurnedOnOff = 1;
          //HAL_GPIO_WritePin(LED_GPIO_Port, LED_Pin, GPIO_PIN_RESET);
          wannaBeActiveBattery1 = 1;
          if(wannaBeActiveBattery1 != wannaBeActiveBattery1_old){
             wannaBeActiveBattery1_old = wannaBeActiveBattery1;
             
             uart4Battery2TurnedOff();
             wannaBeActiveBattery2_old = 0;
             wannaBeActiveBattery2 = 0;
             
             battery_change_continue = 0;
             battery_change = 0;
             battery_change_count = 0;
             battery_chosen = 1;
          }
        }
        else
        {
         //battery1TurnedOnOff = 0;
          //HAL_GPIO_WritePin(LED_GPIO_Port, LED_Pin, GPIO_PIN_SET);
          wannaBeActiveBattery1 = 0;
          if(wannaBeActiveBattery1 != wannaBeActiveBattery1_old){
             wannaBeActiveBattery1_old = wannaBeActiveBattery1;

             battery_change_continue = 0;
             battery_change = 0;
             battery_change_count = 0;
             battery_chosen = 0;
          }
        }
      }
      else{
        if(wannaBeActiveBattery1_old == 1){
          uart4Battery1TurnedOn();
          uart4Battery2TurnedOff();
          uart4LightingTurnedOn();
        }
        else{
          uart4Battery1TurnedOff();
          if(wannaBeActiveBattery2_old == 1){
            uart4Battery2TurnedOn();
            uart4LightingTurnedOn();
          }
          else{
            uart4Battery2TurnedOff();
            uart4LightingTurnedOff();
          }
        }
      }



    }
    else if (uart_receive4[0] == 0x5A && uart_receive4[1] == 0xA5 && uart_receive4[2] == 0x06
                                && uart_receive4[3] == 0x83 && uart_receive4[4] == 0x16
                                && uart_receive4[5] == 0x60 && uart_receive4[6] == 0x01
                                && uart_receive4[7] == 0x00) {

      if((!control_taken)&&(!bitBatteryChangeBlockCounter)){
        if (uart_receive4[8] == 0x00) {
          //battery2TurnedOnOff = 1;
          wannaBeActiveBattery2 = 1;
          if(wannaBeActiveBattery2 != wannaBeActiveBattery2_old){
             wannaBeActiveBattery2_old = wannaBeActiveBattery2;
             
             uart4Battery1TurnedOff();
             wannaBeActiveBattery1_old = 0;
             wannaBeActiveBattery1 = 0;


             battery_change_continue = 0;
             battery_change = 0;
             battery_change_count = 0;
             battery_chosen = 2;
          }
        }
        else{
          wannaBeActiveBattery2 = 0;
          if(wannaBeActiveBattery2 != wannaBeActiveBattery2_old){
             wannaBeActiveBattery2_old = wannaBeActiveBattery2;

             battery_change_continue = 0;
             battery_change = 0;
             battery_change_count = 0;
             battery_chosen = 0;
          }
        }

      }
      else{
        if(wannaBeActiveBattery2_old == 1){
          uart4Battery2TurnedOn();
          uart4Battery1TurnedOff();
          uart4LightingTurnedOn();
        }
        else{
          uart4Battery2TurnedOff();
          if(wannaBeActiveBattery1_old == 1){
            uart4Battery1TurnedOn();
            uart4LightingTurnedOn();
          }
          else{
            uart4Battery1TurnedOff();
            uart4LightingTurnedOff();
          }
        }
      }

    }
    
   /***************** Velocity Turtle ****************************************************/
    else if (uart_receive4[0] == 0x5A && uart_receive4[1] == 0xA5 && uart_receive4[2] == 0x06
                                && uart_receive4[3] == 0x83 && uart_receive4[4] == 0x18
                                && uart_receive4[5] == 0x00 && uart_receive4[6] == 0x01
                                && uart_receive4[7] == 0x00) {
                                
      if(!control_taken){
      
        if (uart_receive4[8] == 0x00) {
          if(velocity_mode != VELOCITY_TURTLE){
            velocity_mode_new = VELOCITY_TURTLE;
            velocity_mode = VELOCITY_TURTLE;
            change_velocity_mode(velocity_mode);
          }
        }
        else{
          if(velocity_mode == VELOCITY_TURTLE){
            change_velocity_mode(velocity_mode);
          }
        }
      }
      else{
        change_velocity_mode(velocity_mode);
        /*if(!beingControlledByMobile){
          beingControlledByMobile = 1;
          velocity_mode = velocity_mode_mobile;
          change_velocity_mode(velocity_mode_mobile);
        } */
      
      }
                                
    }
    /******************** End Velocity Turtle*********************************************************/
    
    /***************** Velocity Rabbit ****************************************************/
    else if (uart_receive4[0] == 0x5A && uart_receive4[1] == 0xA5 && uart_receive4[2] == 0x06
                                && uart_receive4[3] == 0x83 && uart_receive4[4] == 0x18
                                && uart_receive4[5] == 0x20 && uart_receive4[6] == 0x01
                                && uart_receive4[7] == 0x00) {

      if(!control_taken){

        if (uart_receive4[8] == 0x00) {
          if(velocity_mode != VELOCITY_RABBIT){
            velocity_mode_new = VELOCITY_RABBIT;
            velocity_mode = VELOCITY_RABBIT;
            change_velocity_mode(velocity_mode);
          }
        }
        else{
          if(velocity_mode == VELOCITY_RABBIT){
            change_velocity_mode(velocity_mode);
          }
        }
      }
      else{
        change_velocity_mode(velocity_mode);
        /*if(!beingControlledByMobile){
          beingControlledByMobile = 1;
          velocity_mode = velocity_mode_mobile;
          change_velocity_mode(velocity_mode_mobile);
        } */


      }

    }
    /******************** End Rabbit Turtle*********************************************************/
    
    
    /***************** Velocity Leopard ****************************************************/
    else if (uart_receive4[0] == 0x5A && uart_receive4[1] == 0xA5 && uart_receive4[2] == 0x06
                                && uart_receive4[3] == 0x83 && uart_receive4[4] == 0x18
                                && uart_receive4[5] == 0x40 && uart_receive4[6] == 0x01
                                && uart_receive4[7] == 0x00) {

      if(!control_taken){

        if (uart_receive4[8] == 0x00) {
          if(velocity_mode != VELOCITY_LEOPARD){
            velocity_mode_new = VELOCITY_LEOPARD;
            velocity_mode = VELOCITY_LEOPARD;
            change_velocity_mode(velocity_mode);
          }
        }
        else{
          if(velocity_mode == VELOCITY_LEOPARD){
            change_velocity_mode(velocity_mode);
          }
        }
      }
      else{
         change_velocity_mode(velocity_mode);
        /*if(!beingControlledByMobile){
          beingControlledByMobile = 1;
          velocity_mode = velocity_mode_mobile;
          change_velocity_mode(velocity_mode_mobile);
        }   */

      }

    }
    /******************** End Velocity Leopard *********************************************************/
    
    uart_count4 = 0;
    startReceivingData4 = 0x00;
    rcv_count_helper4 = 0;
    rcv_helper4[0] = 0x00;
    rcv_helper4[1] = 0x00;

    for (i = 0; i < 10; i++) {
      uart_receive4[i] = 0x00;
    }
  }
}