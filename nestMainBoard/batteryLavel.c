#include "externDef.h"
#include "crc.h"
#include "uartSend.h"

void batteryLavelMeasure(){

    if(battry_percentage_check)
    {
      battry_percentage_check = 0;
      battry_percentage_check_counter = 0;


      /*
      for(i=0; i<300; i++){
        ADC_Set_Input_Channel(_ADC_CHANNEL_4);
        adc_read2 = ADC2_Get_Sample(4);
        adcSum2 += adc_read2;
      }
      adc_avg2 = ((float)adcSum2)/300f;
      adcSum2 = 0;
      */
      
      for(i=0; i<300; i++){
        ADC_Set_Input_Channel(_ADC_CHANNEL_4);
        adc_read2 = ADC2_Get_Sample(4);
        adc_array2[i] = adc_read2;
      }

      for(i=0; i<300; i++)
      {
        for(j=i+1; j<300; j++)
        {
            if(adc_array2[j]<adc_array2[i])
            {
                tmp = adc_array2[i];
                adc_array2[i] = adc_array2[j];
                adc_array2[j] = tmp;
            }
        }
      }

      for(i=100; i<200; i++){
        adcSum2 += adc_array2[i];
      }


      adc_avg2 = ((float)adcSum2)/100f;
      adcSum2 = 0;








      adc_avg2 = adc_avg2 - 2860f;//adc_avg2 = adc_avg2 - 2953f;//adc_avg2 = adc_avg2 - 2910;

      if(adc_avg2 < 0f){
        adc_avg2 = 0f;
      }
      else if(adc_avg2 > 340f){         //297f
        adc_avg2 = 340f;
      }
      

      battery_percentage1 = (100f/340f)*adc_avg2;
      

      if(battery_percentage1 >= 87.5){
        /*
        LED_BATTERY1_100 = 1;
        LED_BATTERY1_75 = 1;
        LED_BATTERY1_50 = 1;
        LED_BATTERY1_25 = 1;
        */
        
        uart4Battery1Level4();
        
        boatBatteriesLavel =  boatBatteriesLavel & 0xF8;
        boatBatteriesLavel =  boatBatteriesLavel | 0x04;
      }
      else if(battery_percentage1 >= 62.5){
        /*
        LED_BATTERY1_100 = 0;
        LED_BATTERY1_75 = 1;
        LED_BATTERY1_50 = 1;
        LED_BATTERY1_25 = 1;
        */
        
        uart4Battery1Level3();
        
        boatBatteriesLavel =  boatBatteriesLavel & 0xF8;
        boatBatteriesLavel =  boatBatteriesLavel | 0x03;
      }
      else if(battery_percentage1 >= 37.5){
        /*
        LED_BATTERY1_100 = 0;
        LED_BATTERY1_75 = 0;
        LED_BATTERY1_50 = 1;
        LED_BATTERY1_25 = 1;
        */
        
        uart4Battery1Level2();
        
        boatBatteriesLavel =  boatBatteriesLavel & 0xF8;
        boatBatteriesLavel =  boatBatteriesLavel | 0x02;
      }
      else if(battery_percentage1 >= 1.0){
        /*
        LED_BATTERY1_100 = 0;
        LED_BATTERY1_75 = 0;
        LED_BATTERY1_50 = 0;
        LED_BATTERY1_25 = 1;
        */
        
        uart4Battery1Level1();
        
        boatBatteriesLavel =  boatBatteriesLavel & 0xF8;
        boatBatteriesLavel =  boatBatteriesLavel | 0x01;
      }
      else if(battery_percentage1 < 1.0){
        /*
        LED_BATTERY1_100 = 0;
        LED_BATTERY1_75 = 0;
        LED_BATTERY1_50 = 0;
        LED_BATTERY1_25 = 0;
        */
        
        uart4Battery1Level0();
        
        boatBatteriesLavel =  boatBatteriesLavel & 0xF8;
        boatBatteriesLavel =  boatBatteriesLavel | 0x00;
      }



      /*
      for(i=0; i<300; i++){
        ADC_Set_Input_Channel(_ADC_CHANNEL_5);
        adc_read3 = ADC2_Get_Sample(5);
        adcSum3 += adc_read3;
      }
      adc_avg3 = ((float)adcSum3)/300f;
      adcSum3 = 0;
      */
      
      for(i=0; i<300; i++){
        ADC_Set_Input_Channel(_ADC_CHANNEL_5);
        adc_read3 = ADC2_Get_Sample(5);
        adc_array3[i] = adc_read3;
      }

      for(i=0; i<300; i++)
      {
        for(j=i+1; j<300; j++)
        {
            if(adc_array3[j]<adc_array3[i])
            {
                tmp = adc_array3[i];
                adc_array3[i] = adc_array3[j];
                adc_array3[j] = tmp;
            }
        }
      }

      for(i=100; i<200; i++){
        adcSum3 += adc_array3[i];
      }


      adc_avg3 = ((float)adcSum3)/100f;
      adcSum3 = 0;
      



      
      adc_avg3 = adc_avg3 - 2860f;//adc_avg3 = adc_avg3 - 2910;

      if(adc_avg3 < 0f){
        adc_avg3 = 0f;
      }
      else if(adc_avg3 > 340f){
        adc_avg3 = 340f;
      }

      battery_percentage2 = (100f/340f)*adc_avg3;

      //battery_percentage2 = (1f/4f)*adc_avg3;

      if(battery_percentage2 >= 87.5){
        /*
        LED_BATTERY2_100 = 1;
        LED_BATTERY2_75 = 1;
        LED_BATTERY2_50 = 1;
        LED_BATTERY2_25 = 1;
        */
        
        uart4Battery2Level4();
        
        boatBatteriesLavel =  boatBatteriesLavel & 0xC7;
        boatBatteriesLavel =  boatBatteriesLavel | (0x04 << 3);

      }
      else if(battery_percentage2 >= 62.5){
        /*
        LED_BATTERY2_100 = 0;
        LED_BATTERY2_75 = 1;
        LED_BATTERY2_50 = 1;
        LED_BATTERY2_25 = 1;
        */
        
        uart4Battery2Level3();
        
        boatBatteriesLavel =  boatBatteriesLavel & 0xC7;
        boatBatteriesLavel =  boatBatteriesLavel | (0x03 << 3);
      }
      else if(battery_percentage2 >= 37.5){
        /*
        LED_BATTERY2_100 = 0;
        LED_BATTERY2_75 = 0;
        LED_BATTERY2_50 = 1;
        LED_BATTERY2_25 = 1;
        */
        
        uart4Battery2Level2();
        
        boatBatteriesLavel =  boatBatteriesLavel & 0xC7;
        boatBatteriesLavel =  boatBatteriesLavel | (0x02 << 3);
      }
      else if(battery_percentage2 >= 1.0){
        /*
        LED_BATTERY2_100 = 0;
        LED_BATTERY2_75 = 0;
        LED_BATTERY2_50 = 0;
        LED_BATTERY2_25 = 1;
        */
        
        uart4Battery2Level1();
        
        boatBatteriesLavel =  boatBatteriesLavel & 0xC7;
        boatBatteriesLavel =  boatBatteriesLavel | (0x01 << 3);
      }
      else if(battery_percentage2 < 1.0){
        /*
        LED_BATTERY2_100 = 0;
        LED_BATTERY2_75 = 0;
        LED_BATTERY2_50 = 0;
        LED_BATTERY2_25 = 0;
        */
        
        uart4Battery2Level0();
        
        boatBatteriesLavel =  boatBatteriesLavel & 0xC7;
        boatBatteriesLavel =  boatBatteriesLavel | (0x00 << 3);
      }
    }
}