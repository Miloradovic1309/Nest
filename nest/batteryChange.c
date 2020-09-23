#include "externDef.h"
#include "crc.h"
#include "uartSend.h"

void batteryChangeState(){
  if((battery_chosen != battery_chosen_old) || (battery_change)){
    BUZZER_ALARM = 0;
    battery_change = 1;
    battery_chosen_old = 3;
    if(battery_change_count <=  10){
      ACCUMULATOR1_ON = 0;
      ACCUMULATOR2_ON = 0;
      ACCUMULATORS_OFF = 1;
      BUZZER_ALARM = 0;
      if(battery_chosen == 1){
        wannaBeActiveBattery2 = 0;
        wannaBeActiveBattery2_old = 0;
        uart4Battery2TurnedOff();
      }
      else if(battery_chosen == 2){
        wannaBeActiveBattery1 = 0;
        wannaBeActiveBattery1_old = 0;
        uart4Battery1TurnedOff();
      }
      else{
        wannaBeActiveBattery1 = 0;
        wannaBeActiveBattery1_old = 0;
        wannaBeActiveBattery2 = 0;
        wannaBeActiveBattery2_old = 0;
        uart4Battery1TurnedOff();
        uart4Battery2TurnedOff();
        uart4LightingTurnedOff();
        activeBattery = 0;
      }

    }
    else if((battery_change_count > 10) && (battery_change_count <= 20)){
      ACCUMULATOR1_ON = 0;
      ACCUMULATOR2_ON = 0;
      ACCUMULATORS_OFF = 0;
      
    }
    else if((battery_change_count > 20) && (battery_change_count <= 30)){
      if(!ACCUMULATOR_SENSE){
        battery_change_continue = 1;
      }
      else{
        battery_change_continue = 0;
      }
    }
    else if((battery_change_count > 30) && (battery_change_count <= 80)){
      if(battery_change_count <= 60){

        if(battery_change_continue){
          if(battery_chosen == 1){
            ACCUMULATOR1_ON = 1;
            ACCUMULATOR2_ON = 0;
            ACCUMULATORS_OFF = 0;

            //LED_BATTERY1_TS = 1;
            //LED_BATTERY2_TS = 0;
            uart4Battery1TurnedOn();
            uart4Battery2TurnedOff();
            uart4LightingTurnedOn();
            activeBattery = 1;
          }
          else if(battery_chosen == 2){
            ACCUMULATOR1_ON = 0;
            ACCUMULATOR2_ON = 1;
            ACCUMULATORS_OFF = 0;

            //LED_BATTERY1_TS = 0;
            //LED_BATTERY2_TS = 1;
            uart4Battery1TurnedOff();
            uart4Battery2TurnedOn();
            uart4LightingTurnedOn();
            activeBattery = 2;
          }
          else{
            ACCUMULATOR1_ON = 0;
            ACCUMULATOR2_ON = 0;
            ACCUMULATORS_OFF = 0;
            activeBattery = 0;

          }
        }
        else{
          battery_change_count = 0;
          ACCUMULATOR1_ON = 0;
          ACCUMULATOR2_ON = 0;
          ACCUMULATORS_OFF = 0;

          //LED_BATTERY1_TS = 0;
          //LED_BATTERY2_TS = 0;
          uart4Battery1TurnedOff();
          uart4Battery2TurnedOff();
          uart4LightingTurnedOff();
          activeBattery = 0;

          battery_change_continue = 0;
          battery_change = 0;
          battery_change_count = 0;

          battery_chosen = 0;
          battery_chosen_old = 0;

        }
      }
      else{
        ACCUMULATOR1_ON = 0;
        ACCUMULATOR2_ON = 0;
        ACCUMULATORS_OFF = 0;
        
        battry_percentage_check = 1;
        battry_percentage_check_counter = 0;
        

      }
    }
    else{
      ACCUMULATOR1_ON = 0;
      ACCUMULATOR2_ON = 0;
      ACCUMULATORS_OFF = 0;

      battery_chosen_old = battery_chosen;
      battery_change_continue = 0;
      battery_change = 0;
      battery_change_count = 0;
      
      battry_percentage_check = 1;
      battry_percentage_check_counter = 0;
    }
  }
  else{
    ACCUMULATOR1_ON = 0;
    ACCUMULATOR2_ON = 0;
    ACCUMULATORS_OFF = 0;

    battery_change_continue = 0;
    battery_change = 0;
    battery_change_count = 0;
    
  }
}