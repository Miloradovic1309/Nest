#include "externDef.h"
#include "crc.h"
#include "uartSend.h"


void change_velocity_mode(unsigned int mode){
  switch(mode){
    case 0:
      velocity_gear1 = GEAR_VELOCITY_1_TURTLE;
      velocity_gear2 = GEAR_VELOCITY_2_TURTLE;
      velocity_gear3 = GEAR_VELOCITY_3_TURTLE;
      velocity_gearR = GEAR_VELOCITY_R_TURTLE;
      velocity_gearS = GEAR_VELOCITY_S;
      
      velocity_mode_send = 0x01;
      
      uart4TurtleTurnedOn();
      uart4RabbitTurnedOff();
      uart4LeopardTurnedOff();
      uart4SpeedModeTurtle();
      
      velocity_mode = 0;
      break;
    case 1:
      velocity_gear1 = GEAR_VELOCITY_1_RABBIT;
      velocity_gear2 = GEAR_VELOCITY_2_RABBIT;
      velocity_gear3 = GEAR_VELOCITY_3_RABBIT;
      velocity_gearR = GEAR_VELOCITY_R_RABBIT;
      velocity_gearS = GEAR_VELOCITY_S;
      
      velocity_mode_send = 0x02;
      
      uart4TurtleTurnedOff();
      uart4RabbitTurnedOn();
      uart4LeopardTurnedOff();
      uart4SpeedModeRabbit();
      
      velocity_mode = 1;

      break;
    case 2:
      velocity_gear1 = GEAR_VELOCITY_1_LEOPARD;
      velocity_gear2 = GEAR_VELOCITY_2_LEOPARD;
      velocity_gear3 = GEAR_VELOCITY_3_LEOPARD;
      velocity_gearR = GEAR_VELOCITY_R_LEOPARD;
      velocity_gearS = GEAR_VELOCITY_S;
      
      velocity_mode_send = 0x04;
      
      uart4TurtleTurnedOff();
      uart4RabbitTurnedOff();
      uart4LeopardTurnedOn();
      uart4SpeedModeLeopard();
      velocity_mode = 2;
      break;
    default:
      velocity_gear1 = GEAR_VELOCITY_1_RABBIT;
      velocity_gear2 = GEAR_VELOCITY_2_RABBIT;
      velocity_gear3 = GEAR_VELOCITY_3_RABBIT;
      velocity_gearR = GEAR_VELOCITY_R_RABBIT;
      velocity_gearS = GEAR_VELOCITY_S;
      
      velocity_mode_send = 0x02;
      
      uart4TurtleTurnedOff();
      uart4RabbitTurnedOn();
      uart4LeopardTurnedOff();
      uart4SpeedModeRabbit();
      
      velocity_mode = 1;

      break;
  }
}


void gearVelocityMotorSpeedControl(){
    /*
    if(!control_taken){


      if(!GEAR3_TOUCH){
        GEAR3_LED = 1;
        GEAR2_LED = GEAR1_LED = GEARN_LED = GEARB_LED = 0;
      }
      if(!GEAR2_TOUCH){
        GEAR2_LED = 1;
        GEAR3_LED = GEAR1_LED = GEARN_LED = GEARB_LED = 0;
      }
      if(!GEAR1_TOUCH){
        GEAR1_LED = 1;
        GEAR3_LED = GEAR2_LED = GEARN_LED = GEARB_LED = 0;
      }
      if(!GEARN_TOUCH){
        GEARN_LED = 1;
        GEAR3_LED = GEAR2_LED = GEAR1_LED = GEARB_LED = 0;
      }
      if(!GEARB_TOUCH){
        GEARB_LED = 1;
        GEAR3_LED = GEAR2_LED = GEAR1_LED = GEARN_LED = 0;
      }

        */

      
      /*
      if(Button(&GPIOD_IDR, GEAR3_TOUCH_PIN, 40, 0))  {
        GEAR3_LED = 1;
        GEAR2_LED = GEAR1_LED = GEARN_LED = GEARB_LED = 0;
      }
      if(Button(&GPIOD_IDR, GEAR2_TOUCH_PIN, 40, 0)){
        GEAR2_LED = 1;
        GEAR3_LED = GEAR1_LED = GEARN_LED = GEARB_LED = 0;
      }
      if(Button(&GPIOD_IDR, GEAR1_TOUCH_PIN, 40, 0)){
        GEAR1_LED = 1;
        GEAR3_LED = GEAR2_LED = GEARN_LED = GEARB_LED = 0;
      }
      if(Button(&GPIOD_IDR, GEARN_TOUCH_PIN, 40, 0)){
        GEARN_LED = 1;
        GEAR3_LED = GEAR2_LED = GEAR1_LED = GEARB_LED = 0;
      }
      if(Button(&GPIOD_IDR, GEARB_TOUCH_PIN, 40, 0)){
        GEARB_LED = 1;
        GEAR3_LED = GEAR2_LED = GEAR1_LED = GEARN_LED = 0;
      }
      */


      
      /*
      LED_WHEEL = TOUCH_WHEEL | bitDelay3Seconds;

      if(TOUCH_WHEEL | bitDelay3Seconds){
        if(TOUCH_WHEEL){
          bitDelay3Seconds = 1;
          bitStart3SecondsCount = 0;
          delay3secndsCount = 0;
        }
        else{
          bitStart3SecondsCount = 1;
        }

        if(GEAR3_LED == 1){
          gear_status = 3;
        }

        if(GEAR2_LED == 1){
          gear_status = 2;
        }

        if(GEAR1_LED == 1){
          gear_status = 1;
        }

        if(GEARB_LED == 1){
          gear_status = 5;
        }

        if(GEARN_LED == 1){
          gear_status = 4;
        }




      }
      else{
        GEARB_LED = 0;
        GEAR1_LED = 0;
        GEAR2_LED = 0;
        GEAR3_LED = 0;
        GEARN_LED = 1;
        gear_status = 4;

      }
    
    }
    */






    switch(gear_status){
      case 1:
        motorSpeed = velocity_gear1;
        motorDirection = GEAR_DIRECTION_STREIGHT;
        break;

      case 2:
        motorSpeed = velocity_gear2;
        motorDirection = GEAR_DIRECTION_STREIGHT;
        break;

      case 3:
        motorSpeed = velocity_gear3;
        motorDirection = GEAR_DIRECTION_STREIGHT;
        break;

      case 4:
        motorSpeed = GEAR_VELOCITY_S;
        motorDirection = GEAR_DIRECTION_STREIGHT;
        break;

      case 5:
        motorSpeed = velocity_gearR;
        motorDirection = GEAR_DIRECTION_BACK;
        break;

      default:
        motorSpeed = GEAR_VELOCITY_S;
        motorDirection = GEAR_DIRECTION_STREIGHT;
        break;
    }

}