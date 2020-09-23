#include "externDef.h"
#include "crc.h"
#include "uartSend.h"


void directionWheelADC(){

    if(dutyy > 150){
      wheel_position_angle_double = (((double)dutyy - 150) * (double)45) / (double)100;
      wheel_position_angle = (unsigned int)wheel_position_angle_double;
      //wheel_position_angle = ((dutyy - 150) * 4500) / 100;
      wheel_position_direction = WHEEL_DIRECTION_LEFT;
    }
    else if(dutyy < 150){
      wheel_position_angle_double = (((double)150 - (double)dutyy) * (double)45) / (double)100;
      wheel_position_angle = (unsigned int)wheel_position_angle_double;
      //wheel_position_angle = ((150 - duty) * 4500) / 100;
      wheel_position_direction = WHEEL_DIRECTION_RIGHT;
    }
    else{
      wheel_position_angle = 0;
      wheel_position_direction = WHEEL_DIRECTION_STREIGHT;
    }


    /*
    if(countedTimer2){
      countedTimer2 = 0;
      uart3SendJoystick();
    } */
    if(countedTimer){
      countedTimer = 0;
      //LED4 = ~LED4;
      //if(LED_BATTERY2_TS || LED_BATTERY1_TS){
      if(activeBattery != 0){
        uartSendCommandMotor(motorDirection, motorSpeed);
      }
      if(control_taken){
        dutyy = boatWheelDir;
      }
      
      uart3SendJoystick();
      

      
      /*
      if(!control_taken) {

        for(i=0; i<300; i++){
          ADC_Set_Input_Channel(_ADC_CHANNEL_6);
          adc_read1 = ADC1_Get_Sample(6);
          adcSum += adc_read1;
        }
        adc_avg1 = ((float)adcSum)/300f;
        adcSum = 0;

        adc_avg1 = adc_avg1 - 1669f;
        if(adc_avg1 < 0f){
          adc_avg1 = 0f;
        }
        else if(adc_avg1 > 1549f){
          adc_avg1 = 1549f;
        }

        //dutyF = (adc_sum * 200f) / 4095f + 50f;
        dutyF = (adc_avg1 * 200f) / 1549f + 50f;

        if(((int)(dutyF * 10f)) % 10 >= 5){
          dutyy = (int)dutyF + 1;
        }
        else{
          dutyy = (int)dutyF;
        }
        adcSum = 0;
      
      }
      else{
        dutyy = boatWheelDir;
      }
      */
      
      
    }

}