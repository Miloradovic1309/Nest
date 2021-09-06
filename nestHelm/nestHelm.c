#include "externDef.h"
#include "def.h"
#include "timers.h"
#include "eeprom.h"

// 868
int arrayDuty[5] = {150, 150, 150, 150, 150};
int dutyCounter = 0;
int dutyOld = 150;

int adc_array[300];
int adc_array_asc[300];
int tmp;
int j = 0;

float sensitivityDuty;
float sensitivityDuty2;
float directF;
float calDirectF;
int sensDuty = 150;



float fHalfSideDif;
float fHalfDuty;
float fHalfDutyAfterFun;
float fAdcAvgHalf;
float fAdcAvg;
float fDuty = 150f;



void setup_IWDG()
{
     IWDG_KR = 0x5555;    //Disable write protection of IWDG registers
     IWDG_PR = 0x06;      //Set PR value
     IWDG_RLR = 0x2FF;     //Set RLR value
     IWDG_KR = 0xAAAA;    //Reload IWDG
     IWDG_KR = 0xCCCC;    //Start IWDG
}

void resetTouch(){
  WTPSC = 1;
  LED11 = 1;
  Delay_ms(100);
  WTPSC = 0;
  LED11 = 0;
}

void main() {

  /********** UART1 *******************************************************************************/
  UART1_Init_Advanced(115200, _UART_8_BIT_DATA, _UART_NOPARITY, _UART_ONE_STOPBIT, &_GPIO_MODULE_USART1_PA9_10);
  USART1_CR1bits.RXNEIE = 1;       // enable uart rx interrupt
  NVIC_IntEnable(IVT_INT_USART1);  // enable interrupt vector
  /************************************************************************************************/
  /************ UART1 *****************************************************************/
  GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_8);                                            // UART1_RXTX
  /************************************************************************************/
  
  /************ GEAR *****************************************************/
  GPIO_Config(&GPIOB_BASE, _GPIO_PINMASK_0 | _GPIO_PINMASK_1 |                                  // ONE_TOUCH, TWO_TOUCH,
                           _GPIO_PINMASK_10,                                                    // THREE_TOUCH
              _GPIO_CFG_MODE_INPUT | _GPIO_CFG_PULL_DOWN);
  GPIO_Config(&GPIOA_BASE, _GPIO_PINMASK_7 | _GPIO_PINMASK_6,                                   // N_TOUCH, R_TOUCH,
              _GPIO_CFG_MODE_INPUT | _GPIO_CFG_PULL_DOWN);
  GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_15 | _GPIO_PINMASK_14 |                        // R_LIGHT, N_LIGHT
                                   _GPIO_PINMASK_13 | _GPIO_PINMASK_12 | _GPIO_PINMASK_11);     // ONE_LIGHT, TWO_LIGHT, THREE_LIGHT
  /*****************************************************************************/
  
  /************ JOYSTICK *****************************************************************/
  GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_15);                                            // WHEEL_LIGHT
  GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_3);                                             // WHEEL_DIODE
  GPIO_Config(&GPIOA_BASE, _GPIO_PINMASK_4,                                                      // WHEEL_TOUCH
              _GPIO_CFG_MODE_INPUT | _GPIO_CFG_PULL_NO);
  /************************************************************************************/
  
  /************ DJO *****************************************************************/
  GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_5);                                             // WTPSC
  GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_9);                                             // GTPSC
  /************************************************************************************/
  
  GPIO_Digital_Output(&GPIOC_BASE, _GPIO_PINMASK_13);    // LED11
  
  


  
  
  SWJ_CFG0_bit = 0;
  SWJ_CFG1_bit = 1;
  SWJ_CFG2_bit = 0;
  
  WHEEL_DIODE = 0;
  WHEEL_LIGHT = 0;
  
  WTPSC = 0;
  
  
  
  GPIO_Analog_Input(&GPIOA_IDR, _GPIO_PINMASK_0);
  ADC1_Init();
  
  WTPSC = 1;
  LED11 = 1;
  Delay_ms(100);
  EEPROM_24C02_Init();
  Delay_ms(100);

  Delay_ms(100);
  citajeprom();
  Delay_ms(100);
  WTPSC = 0;
  LED11 = 0;
  
  bitResetTouchSensor = 0;
  
  
  startReceivingData1 = 0;
  control_taken = 0;
  bitDelay3Seconds = 0;
  bitStart3SecondsCount = 0;
  countedTimer = 0;
  bitRespond = 0;
  bitControlTaken = 0;
  
  bitCalSend = 0;
  
  if(leftLimit >= rightLimit){
    sideDifference = leftLimit - rightLimit;
  }
  else{
    sideDifference = rightLimit - leftLimit;
  }
  
  if(sideDifference == 0){
    sideDifference = 1;
  }
  

  
  InitTimer2();
  
  //setup_IWDG();
  
  while(1){
  
    //IWDG_KR = 0xAAAA;
  
    WHEEL_DIODE = WHEEL_TOUCH;
    WHEEL_LIGHT = WHEEL_TOUCH | bitDelay3Seconds;
  
    if(!bitControlTaken){
      // ONE TOUCH
      if (Button(&GPIOB_IDR, 0, 20, 1)){
        ONE_LIGHT = 1;
        TWO_LIGHT = THREE_LIGHT = N_LIGHT = R_LIGHT = 0;


      }
      // TWO TOUCH
      if (Button(&GPIOB_IDR, 1, 20, 1)){
        TWO_LIGHT = 1;
        ONE_LIGHT = THREE_LIGHT = N_LIGHT = R_LIGHT = 0;
      }
      // THREE TOUCH
      if (Button(&GPIOB_IDR, 10, 20, 1)){
        THREE_LIGHT = 1;
        TWO_LIGHT = ONE_LIGHT = N_LIGHT = R_LIGHT = 0;
      }
      // N TOUCH
      if (Button(&GPIOA_IDR, 7, 20, 1)){
        N_LIGHT = 1;
        TWO_LIGHT = THREE_LIGHT = ONE_LIGHT = R_LIGHT = 0;
        //resetTouch();
        /*WHEEL_LIGHT = 1;
        bitDelay3Seconds = 1;
        bitStart3SecondsCount = 1;
        delay3secndsCount = -10;*/
        //while(Button(&GPIOB_IDR, 1, 20, 0)){}
      }
      // R TOUCH
      if (Button(&GPIOA_IDR, 6, 20, 1)){
        R_LIGHT = 1;
        TWO_LIGHT = THREE_LIGHT = N_LIGHT = ONE_LIGHT = 0;
      }
      

    
    

    

      if(WHEEL_TOUCH || bitDelay3Seconds){
        if(WHEEL_TOUCH){
          bitDelay3Seconds = 1;
          bitStart3SecondsCount = 0;
          delay3secndsCount = 0;
        }
        else{
          bitStart3SecondsCount = 1;
        }

        if(THREE_LIGHT == 1){
          gear_status = 3;
        }

        if(TWO_LIGHT == 1){
          gear_status = 2;
        }

        if(ONE_LIGHT == 1){
          gear_status = 1;
        }

        if(R_LIGHT == 1){
          gear_status = 5;
        }

        if(N_LIGHT == 1){
          gear_status = 4;
        }
      
      }
      else{
        R_LIGHT = 0;
        ONE_LIGHT = 0;
        TWO_LIGHT = 0;
        THREE_LIGHT = 0;
        N_LIGHT = 1;
        gear_status = 4;
      }
      
    }

    
    
    
    
    
    if(countedTimer) {
    
      countedTimer = 0;


      for(i=0; i<300; i++){
        ADC_Set_Input_Channel(_ADC_CHANNEL_0);
        adc_read1 = ADC1_Get_Sample(0);
        //adcSum += adc_read1;
        adc_array[i] = adc_read1;
      }
      
      for(i=0; i<300; i++)
      {
        for(j=i+1; j<300; j++)
        {
            if(adc_array[j]<adc_array[i])
            {
                tmp = adc_array[i];
                adc_array[i] = adc_array[j];
                adc_array[j] = tmp;
            }
        }
      }
      
      for(i=100; i<200; i++){
        adcSum += adc_array[i];
      }
      
      
      adc_avg1 = ((float)adcSum)/100f;
      calAdcAvg = (long)(adc_avg1 * 100f);
      
      adcSum = 0;
      if(leftLimit <= rightLimit){
        adc_avg1 = adc_avg1 - (float)leftLimit;
      }
      else{
        adc_avg1 = adc_avg1 - (float)rightLimit;
      }
      if(adc_avg1 < 0f){
        adc_avg1 = 0f;
      }
      else if(adc_avg1 > (float)sideDifference){
        adc_avg1 = (float)sideDifference;
      }
      
      
      
      
      

      
      
      
      
      
      
      

      //dutyF = (adc_sum * 200f) / 4095f + 50f;
      

      fHalfSideDif = sideDifference / 2f;

      if(adc_avg1 > fHalfSideDif){
        fAdcAvg = adc_avg1-fHalfSideDif;
      }
      else if(adc_avg1 < fHalfSideDif){
        fAdcAvg = fHalfSideDif-adc_avg1;
      }
      else{
        fAdcAvg = 0f;
      }
      
      fHalfDuty = (fAdcAvg * 5f) / (float)fHalfSideDif;
      fHalfDutyAfterFun = 4f * fHalfDuty * fHalfDuty;

      if(dir != 0){
        dutyF = ((adc_avg1 * 200f) / ((float)sideDifference)) + 50f;
        
        if(adc_avg1 < fHalfSideDif){
          fDuty = 150f - fHalfDutyAfterFun;
        }
        else if(adc_avg1 > fHalfSideDif){
          fDuty = 150f + fHalfDutyAfterFun;
        }
        else{
          fDuty = 150f;
        }
        

      }
      else{
        dutyF = 250f - ((adc_avg1 * 200f) / ((float)sideDifference));
        
        if(adc_avg1 < fHalfSideDif){
          fDuty = 150f + fHalfDutyAfterFun;
        }
        else if(adc_avg1 > fHalfSideDif){
          fDuty = 150f - fHalfDutyAfterFun;
        }
        else{
          fDuty = 150f;
        }
      }
      calDutyF = (long)(fDuty * 100f);
      


      if(((int)(dutyF * 10f)) % 10 >= 5){
        dutyy = (int)dutyF + 1;
      }
      else{
        dutyy = (int)dutyF;
      }


      
      calDuty = dutyy;
      

      
      
      if(((int)(fDuty * 10f)) % 10 >= 5){
        dutyy = (int)fDuty + 1;
      }
      else{
        dutyy = (int)fDuty;
      }


      //calDuty = dutyy;
      



      /*
      if(dutyy >= 149 && dutyy <= 151){
        dutyy = 150;
      }
      */


      if((!((dutyOld - 2 < dutyy) && (dutyy < dutyOld + 2))) && (dutyCounter < 3)){
        dutyy = dutyOld;
        dutyCounter++;
      }
      else{
        dutyCounter = 0;
        dutyOld = dutyy;
      }
      

      
      


      
      dutyyy = dutyy;

      adcSum = 0;

    }
    
    
    
    if(bitRespond){
      bitRespond = 0;
      uart1SendStatus(gear_status, dutyyy);
    }
    
    
    
    
    if(bitCalSend){
      bitCalSend = 0;
      
      uart1SendCallibration();
    }
    
    
    if(bitResetTouchSensor){
      bitResetTouchSensor = 0;
      resetTouch();
      
    }


  }
    
  


}