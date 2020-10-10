#include "externDef.h"
#include "crc.h"
#include "uartSend.h"

void lightControlSwitches(){

    /*
    if(!control_taken){
    

    
      if(Button(&GPIOE_IDR, TS_INTERIOR_LIGHT_PIN, 40, 0)){
        oldStateInteriorLight = 1;
      }
      if(oldStateInteriorLight && TS_INTERIOR_LIGHT){
        oldStateInteriorLight = 0;
        LED_INTERIOR_LIGHT_TS = ~LED_INTERIOR_LIGHT_TS;
        LIGHT_INTERIOR = ~LIGHT_INTERIOR;


      }



      if(Button(&GPIOE_IDR, TS_NAVIGATION_LIGHT_PIN, 40, 0)){
        oldStateNavigationLight = 1;
      }
      if(oldStateNavigationLight && TS_NAVIGATION_LIGHT){
        oldStateNavigationLight = 0;
        LED_NAVIGATION_LIGHT_TS = ~LED_NAVIGATION_LIGHT_TS;
        LIGHT_NAVIGATION = ~LIGHT_NAVIGATION;
      }
      
      
    }
    */
    
    if(navigationLightState_old != navigationLightState){

      navigationLightState_old = navigationLightState;
      LIGHT_NAVIGATION = navigationLightState;
      

    }
    
    
    if(interiorLightState_old != interiorLightState){
      interiorLightState_old = interiorLightState;
      LIGHT_INTERIOR = interiorLightState;
    }
}