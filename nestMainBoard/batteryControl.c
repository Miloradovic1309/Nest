#include "externDef.h"
#include "crc.h"
#include "uartSend.h"

void batteryControlSwitches(){

    /*
    if(!control_taken){

      if(Button(&GPIOE_IDR, TS_BATTERY1_PIN, 40, 0)){
        oldStateBattery1 = 1;
      }
      if((oldStateBattery1 && TS_BATTERY1) || (bitBattery1Change)){
        bitBattery1Change = 0;
        oldStateBattery1 = 0;
        if(LED_BATTERY1_TS){
          LED_BATTERY1_TS = 0;
          LED_BATTERY2_TS = 0;
          battery_chosen = 0;
        }
        else{
          LED_BATTERY1_TS = 1;
          LED_BATTERY2_TS = 0;
          battery_chosen = 1;
        }
        battery_change_continue = 0;
        battery_change = 0;
        battery_change_count = 0;

      }


      if(Button(&GPIOE_IDR, TS_BATTERY2_PIN, 40, 0)){
        oldStateBattery2 = 1;
      }
      if((oldStateBattery2 && TS_BATTERY2) || (bitBattery2Change)){
        bitBattery2Change = 0;
        oldStateBattery2 = 0;
        if(LED_BATTERY2_TS){
          LED_BATTERY2_TS = 0;
          LED_BATTERY1_TS = 0;
          battery_chosen = 0;
        }
        else{
          LED_BATTERY2_TS = 1;
          LED_BATTERY1_TS = 0;
          battery_chosen = 2;
        }
        battery_change_continue = 0;
        battery_change = 0;
        battery_change_count = 0;

      }
      
    }


    if(wannaBeActiveBattery1_old != wannaBeActiveBattery1){
      uart4Battery1TurnedOn();
      uart4Battery2TurnedOff();
      battery_chosen = 1;
      wannaBeActiveBattery1_old = wannaBeActiveBattery1;
    }
    
    if(wannaBeActiveBattery2_old != wannaBeActiveBattery2){
      uart4Battery1TurnedOff();
      uart4Battery2TurnedOn();
      battery_chosen = 2;
      wannaBeActiveBattery2_old = wannaBeActiveBattery2;
    }
    */

    if(((battery_percentage1 < 1.0f && battery_chosen == 1)
        || (battery_percentage2 < 1.0f && battery_chosen == 2))
        || ((battery_chosen == 1 && !ACCUMULATOR_SENSE && !battery_change) || (battery_chosen == 2 && !ACCUMULATOR_SENSE && !battery_change)))
    {

      if(buzzerCounter % 25 == 0){
        BUZZER_ALARM = 1;
      }
      else{
        BUZZER_ALARM = 0;
      }

    }
    else{
      BUZZER_ALARM = 0;
    }
}