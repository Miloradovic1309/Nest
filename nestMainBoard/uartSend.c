#include "crc.h"
#include "externDef.h"

void uartSendCommandMotor(unsigned short motorDirection, unsigned short motorSpeed){


  char forSend[4];
  
  forSend[0] = 0xCA;
  forSend[1] = 0x41;
  forSend[2] = (char)motorDirection;
  forSend[3] = (char)motorSpeed;

  UART1_RXTX =1;

  UART1_Write(forSend[0]);
  UART1_Write(forSend[1]);
  UART1_Write(forSend[2]);
  UART1_Write(forSend[3]);
  UART1_Write(crc8(forSend[2], forSend[3]));
  Delay_ms(5);
  UART1_RXTX =0;
}




void uartSendStatusToStation(){
  UART6_Write(0x00);
  UART6_Write(ADDRESS_STATION);
  UART6_Write(FREQUENCY);
  
  UART6_Write(0x21);
  UART6_Write(0xC0);
  UART6_Write(duzinaSignala2);
  UART6_Write((gear_status & 0x07) | (velocity_mode_send << 3));
  UART6_Write((boatBattery2 | boatBattery1 | boatNavigationLight | boatInteriorLight | boatControlTaken) & 0x1F);
  UART6_Write(boatBatteriesLavel);
  UART6_Write(0x3B);
}



/************** UART 4 DISPLAY ***************************************************/
void uart4CheckNavigationLightStatus(){

  UART4_Write(0x5A);
  UART4_Write(0xA5);
  UART4_Write(0x04);
  UART4_Write(0x83);
  UART4_Write(0x16);
  UART4_Write(0x00);
  UART4_Write(0x01);
}

void uart4CheckInteriorLightStatus(){

  UART4_Write(0x5A);
  UART4_Write(0xA5);
  UART4_Write(0x04);
  UART4_Write(0x83);
  UART4_Write(0x16);
  UART4_Write(0x20);
  UART4_Write(0x01);
}

void uart4CheckBattery1Status(){

  UART4_Write(0x5A);
  UART4_Write(0xA5);
  UART4_Write(0x04);
  UART4_Write(0x83);
  UART4_Write(0x16);
  UART4_Write(0x40);
  UART4_Write(0x01);
}

void uart4CheckBattery2Status(){

  UART4_Write(0x5A);
  UART4_Write(0xA5);
  UART4_Write(0x04);
  UART4_Write(0x83);
  UART4_Write(0x16);
  UART4_Write(0x60);
  UART4_Write(0x01);
}


void uart4NavigationLightTurnedOn(){

  UART4_Write(0x5A);
  UART4_Write(0xA5);
  UART4_Write(0x05);
  UART4_Write(0x82);
  UART4_Write(0x16);
  UART4_Write(0x00);
  UART4_Write(0x00);
  UART4_Write(0x00);
}

void uart4NavigationLightTurnedOff(){

  UART4_Write(0x5A);
  UART4_Write(0xA5);
  UART4_Write(0x05);
  UART4_Write(0x82);
  UART4_Write(0x16);
  UART4_Write(0x00);
  UART4_Write(0x00);
  UART4_Write(0x01);
}

void uart4InteriorLightTurnedOn(){

  UART4_Write(0x5A);
  UART4_Write(0xA5);
  UART4_Write(0x05);
  UART4_Write(0x82);
  UART4_Write(0x16);
  UART4_Write(0x20);
  UART4_Write(0x00);
  UART4_Write(0x00);
}

void uart4InteriorLightTurnedOff(){

  UART4_Write(0x5A);
  UART4_Write(0xA5);
  UART4_Write(0x05);
  UART4_Write(0x82);
  UART4_Write(0x16);
  UART4_Write(0x20);
  UART4_Write(0x00);
  UART4_Write(0x01);
}


void uart4Battery1TurnedOn(){

  UART4_Write(0x5A);
  UART4_Write(0xA5);
  UART4_Write(0x05);
  UART4_Write(0x82);
  UART4_Write(0x16);
  UART4_Write(0x40);
  UART4_Write(0x00);
  UART4_Write(0x00);
}

void uart4Battery1TurnedOff(){

  UART4_Write(0x5A);
  UART4_Write(0xA5);
  UART4_Write(0x05);
  UART4_Write(0x82);
  UART4_Write(0x16);
  UART4_Write(0x40);
  UART4_Write(0x00);
  UART4_Write(0x01);
}

void uart4Battery2TurnedOn(){

  UART4_Write(0x5A);
  UART4_Write(0xA5);
  UART4_Write(0x05);
  UART4_Write(0x82);
  UART4_Write(0x16);
  UART4_Write(0x60);
  UART4_Write(0x00);
  UART4_Write(0x00);
}

void uart4Battery2TurnedOff(){

  UART4_Write(0x5A);
  UART4_Write(0xA5);
  UART4_Write(0x05);
  UART4_Write(0x82);
  UART4_Write(0x16);
  UART4_Write(0x60);
  UART4_Write(0x00);
  UART4_Write(0x01);
}


void uart4LightingTurnedOn(){
  /*
  UART4_Write(0x5A);
  UART4_Write(0xA5);
  UART4_Write(0x05);
  UART4_Write(0x82);
  UART4_Write(0x51);
  UART4_Write(0x05);
  UART4_Write(0x00);
  UART4_Write(0x11);
  */
  
  UART4_Write(0x5A);
  UART4_Write(0xA5);
  UART4_Write(0x05);
  UART4_Write(0x82);
  UART4_Write(0x13);
  UART4_Write(0x00);
  UART4_Write(0x00);
  UART4_Write(0x00);
}

void uart4LightingTurnedOff(){
  /*
  UART4_Write(0x5A);
  UART4_Write(0xA5);
  UART4_Write(0x05);
  UART4_Write(0x82);
  UART4_Write(0x51);
  UART4_Write(0x05);
  UART4_Write(0x00);
  UART4_Write(0x10);
  */
  
  UART4_Write(0x5A);
  UART4_Write(0xA5);
  UART4_Write(0x05);
  UART4_Write(0x82);
  UART4_Write(0x13);
  UART4_Write(0x00);
  UART4_Write(0x00);
  UART4_Write(0x01);
}






void uart4Battery1Level4(){

  UART4_Write(0x5A);
  UART4_Write(0xA5);
  UART4_Write(0x05);
  UART4_Write(0x82);
  UART4_Write(0x51);
  UART4_Write(0x25);
  UART4_Write(0x00);
  UART4_Write(0x01);
  
  UART4_Write(0x5A);
  UART4_Write(0xA5);
  UART4_Write(0x05);
  UART4_Write(0x82);
  UART4_Write(0x51);
  UART4_Write(0x45);
  UART4_Write(0x00);
  UART4_Write(0x03);
  
  UART4_Write(0x5A);
  UART4_Write(0xA5);
  UART4_Write(0x05);
  UART4_Write(0x82);
  UART4_Write(0x51);
  UART4_Write(0x65);
  UART4_Write(0x00);
  UART4_Write(0x05);
  
  UART4_Write(0x5A);
  UART4_Write(0xA5);
  UART4_Write(0x05);
  UART4_Write(0x82);
  UART4_Write(0x51);
  UART4_Write(0x85);
  UART4_Write(0x00);
  UART4_Write(0x07);
}
void uart4Battery1Level3(){

  UART4_Write(0x5A);
  UART4_Write(0xA5);
  UART4_Write(0x05);
  UART4_Write(0x82);
  UART4_Write(0x51);
  UART4_Write(0x25);
  UART4_Write(0x00);
  UART4_Write(0x00);

  UART4_Write(0x5A);
  UART4_Write(0xA5);
  UART4_Write(0x05);
  UART4_Write(0x82);
  UART4_Write(0x51);
  UART4_Write(0x45);
  UART4_Write(0x00);
  UART4_Write(0x03);

  UART4_Write(0x5A);
  UART4_Write(0xA5);
  UART4_Write(0x05);
  UART4_Write(0x82);
  UART4_Write(0x51);
  UART4_Write(0x65);
  UART4_Write(0x00);
  UART4_Write(0x05);

  UART4_Write(0x5A);
  UART4_Write(0xA5);
  UART4_Write(0x05);
  UART4_Write(0x82);
  UART4_Write(0x51);
  UART4_Write(0x85);
  UART4_Write(0x00);
  UART4_Write(0x07);
}
void uart4Battery1Level2(){

  UART4_Write(0x5A);
  UART4_Write(0xA5);
  UART4_Write(0x05);
  UART4_Write(0x82);
  UART4_Write(0x51);
  UART4_Write(0x25);
  UART4_Write(0x00);
  UART4_Write(0x00);

  UART4_Write(0x5A);
  UART4_Write(0xA5);
  UART4_Write(0x05);
  UART4_Write(0x82);
  UART4_Write(0x51);
  UART4_Write(0x45);
  UART4_Write(0x00);
  UART4_Write(0x02);

  UART4_Write(0x5A);
  UART4_Write(0xA5);
  UART4_Write(0x05);
  UART4_Write(0x82);
  UART4_Write(0x51);
  UART4_Write(0x65);
  UART4_Write(0x00);
  UART4_Write(0x05);

  UART4_Write(0x5A);
  UART4_Write(0xA5);
  UART4_Write(0x05);
  UART4_Write(0x82);
  UART4_Write(0x51);
  UART4_Write(0x85);
  UART4_Write(0x00);
  UART4_Write(0x07);
}
void uart4Battery1Level1(){

  UART4_Write(0x5A);
  UART4_Write(0xA5);
  UART4_Write(0x05);
  UART4_Write(0x82);
  UART4_Write(0x51);
  UART4_Write(0x25);
  UART4_Write(0x00);
  UART4_Write(0x00);

  UART4_Write(0x5A);
  UART4_Write(0xA5);
  UART4_Write(0x05);
  UART4_Write(0x82);
  UART4_Write(0x51);
  UART4_Write(0x45);
  UART4_Write(0x00);
  UART4_Write(0x02);

  UART4_Write(0x5A);
  UART4_Write(0xA5);
  UART4_Write(0x05);
  UART4_Write(0x82);
  UART4_Write(0x51);
  UART4_Write(0x65);
  UART4_Write(0x00);
  UART4_Write(0x04);

  UART4_Write(0x5A);
  UART4_Write(0xA5);
  UART4_Write(0x05);
  UART4_Write(0x82);
  UART4_Write(0x51);
  UART4_Write(0x85);
  UART4_Write(0x00);
  UART4_Write(0x10);
}
void uart4Battery1Level0(){

  UART4_Write(0x5A);
  UART4_Write(0xA5);
  UART4_Write(0x05);
  UART4_Write(0x82);
  UART4_Write(0x51);
  UART4_Write(0x25);
  UART4_Write(0x00);
  UART4_Write(0x00);

  UART4_Write(0x5A);
  UART4_Write(0xA5);
  UART4_Write(0x05);
  UART4_Write(0x82);
  UART4_Write(0x51);
  UART4_Write(0x45);
  UART4_Write(0x00);
  UART4_Write(0x02);

  UART4_Write(0x5A);
  UART4_Write(0xA5);
  UART4_Write(0x05);
  UART4_Write(0x82);
  UART4_Write(0x51);
  UART4_Write(0x65);
  UART4_Write(0x00);
  UART4_Write(0x04);

  UART4_Write(0x5A);
  UART4_Write(0xA5);
  UART4_Write(0x05);
  UART4_Write(0x82);
  UART4_Write(0x51);
  UART4_Write(0x85);
  UART4_Write(0x00);
  UART4_Write(0x06);
}







void uart4Battery2Level4(){

  UART4_Write(0x5A);
  UART4_Write(0xA5);
  UART4_Write(0x05);
  UART4_Write(0x82);
  UART4_Write(0x51);
  UART4_Write(0xA5);
  UART4_Write(0x00);
  UART4_Write(0x09);

  UART4_Write(0x5A);
  UART4_Write(0xA5);
  UART4_Write(0x05);
  UART4_Write(0x82);
  UART4_Write(0x51);
  UART4_Write(0xC5);
  UART4_Write(0x00);
  UART4_Write(0x0B);

  UART4_Write(0x5A);
  UART4_Write(0xA5);
  UART4_Write(0x05);
  UART4_Write(0x82);
  UART4_Write(0x51);
  UART4_Write(0xE5);
  UART4_Write(0x00);
  UART4_Write(0x0D);

  UART4_Write(0x5A);
  UART4_Write(0xA5);
  UART4_Write(0x05);
  UART4_Write(0x82);
  UART4_Write(0x52);
  UART4_Write(0x05);
  UART4_Write(0x00);
  UART4_Write(0x0F);
}
void uart4Battery2Level3(){

  UART4_Write(0x5A);
  UART4_Write(0xA5);
  UART4_Write(0x05);
  UART4_Write(0x82);
  UART4_Write(0x51);
  UART4_Write(0xA5);
  UART4_Write(0x00);
  UART4_Write(0x08);

  UART4_Write(0x5A);
  UART4_Write(0xA5);
  UART4_Write(0x05);
  UART4_Write(0x82);
  UART4_Write(0x51);
  UART4_Write(0xC5);
  UART4_Write(0x00);
  UART4_Write(0x0B);

  UART4_Write(0x5A);
  UART4_Write(0xA5);
  UART4_Write(0x05);
  UART4_Write(0x82);
  UART4_Write(0x51);
  UART4_Write(0xE5);
  UART4_Write(0x00);
  UART4_Write(0x0D);

  UART4_Write(0x5A);
  UART4_Write(0xA5);
  UART4_Write(0x05);
  UART4_Write(0x82);
  UART4_Write(0x52);
  UART4_Write(0x05);
  UART4_Write(0x00);
  UART4_Write(0x0F);
}
void uart4Battery2Level2(){

  UART4_Write(0x5A);
  UART4_Write(0xA5);
  UART4_Write(0x05);
  UART4_Write(0x82);
  UART4_Write(0x51);
  UART4_Write(0xA5);
  UART4_Write(0x00);
  UART4_Write(0x08);

  UART4_Write(0x5A);
  UART4_Write(0xA5);
  UART4_Write(0x05);
  UART4_Write(0x82);
  UART4_Write(0x51);
  UART4_Write(0xC5);
  UART4_Write(0x00);
  UART4_Write(0x0A);

  UART4_Write(0x5A);
  UART4_Write(0xA5);
  UART4_Write(0x05);
  UART4_Write(0x82);
  UART4_Write(0x51);
  UART4_Write(0xE5);
  UART4_Write(0x00);
  UART4_Write(0x0D);

  UART4_Write(0x5A);
  UART4_Write(0xA5);
  UART4_Write(0x05);
  UART4_Write(0x82);
  UART4_Write(0x52);
  UART4_Write(0x05);
  UART4_Write(0x00);
  UART4_Write(0x0F);
}
void uart4Battery2Level1(){

  UART4_Write(0x5A);
  UART4_Write(0xA5);
  UART4_Write(0x05);
  UART4_Write(0x82);
  UART4_Write(0x51);
  UART4_Write(0xA5);
  UART4_Write(0x00);
  UART4_Write(0x08);

  UART4_Write(0x5A);
  UART4_Write(0xA5);
  UART4_Write(0x05);
  UART4_Write(0x82);
  UART4_Write(0x51);
  UART4_Write(0xC5);
  UART4_Write(0x00);
  UART4_Write(0x0A);

  UART4_Write(0x5A);
  UART4_Write(0xA5);
  UART4_Write(0x05);
  UART4_Write(0x82);
  UART4_Write(0x51);
  UART4_Write(0xE5);
  UART4_Write(0x00);
  UART4_Write(0x0C);

  UART4_Write(0x5A);
  UART4_Write(0xA5);
  UART4_Write(0x05);
  UART4_Write(0x82);
  UART4_Write(0x52);
  UART4_Write(0x05);
  UART4_Write(0x00);
  UART4_Write(0x11);
}
void uart4Battery2Level0(){

  UART4_Write(0x5A);
  UART4_Write(0xA5);
  UART4_Write(0x05);
  UART4_Write(0x82);
  UART4_Write(0x51);
  UART4_Write(0xA5);
  UART4_Write(0x00);
  UART4_Write(0x08);

  UART4_Write(0x5A);
  UART4_Write(0xA5);
  UART4_Write(0x05);
  UART4_Write(0x82);
  UART4_Write(0x51);
  UART4_Write(0xC5);
  UART4_Write(0x00);
  UART4_Write(0x0A);

  UART4_Write(0x5A);
  UART4_Write(0xA5);
  UART4_Write(0x05);
  UART4_Write(0x82);
  UART4_Write(0x51);
  UART4_Write(0xE5);
  UART4_Write(0x00);
  UART4_Write(0x0C);

  UART4_Write(0x5A);
  UART4_Write(0xA5);
  UART4_Write(0x05);
  UART4_Write(0x82);
  UART4_Write(0x52);
  UART4_Write(0x05);
  UART4_Write(0x00);
  UART4_Write(0x0E);
}

void uart4TurtleCheckStatus(){

  UART4_Write(0x5A);
  UART4_Write(0xA5);
  UART4_Write(0x04);
  UART4_Write(0x83);
  UART4_Write(0x18);
  UART4_Write(0x00);
  UART4_Write(0x01);
}

void uart4RabbitCheckStatus(){

  UART4_Write(0x5A);
  UART4_Write(0xA5);
  UART4_Write(0x04);
  UART4_Write(0x83);
  UART4_Write(0x18);
  UART4_Write(0x20);
  UART4_Write(0x01);
}

void uart4LeopardCheckStatus(){

  UART4_Write(0x5A);
  UART4_Write(0xA5);
  UART4_Write(0x04);
  UART4_Write(0x83);
  UART4_Write(0x18);
  UART4_Write(0x40);
  UART4_Write(0x01);
}

void uart4TurtleTurnedOn(){
  UART4_Write(0x5A);
  UART4_Write(0xA5);
  UART4_Write(0x05);
  UART4_Write(0x82);
  UART4_Write(0x18);
  UART4_Write(0x00);
  UART4_Write(0x00);
  UART4_Write(0x00);
}

void uart4TurtleTurnedOff(){
  UART4_Write(0x5A);
  UART4_Write(0xA5);
  UART4_Write(0x05);
  UART4_Write(0x82);
  UART4_Write(0x18);
  UART4_Write(0x00);
  UART4_Write(0x00);
  UART4_Write(0x01);
}

void uart4RabbitTurnedOn(){
  UART4_Write(0x5A);
  UART4_Write(0xA5);
  UART4_Write(0x05);
  UART4_Write(0x82);
  UART4_Write(0x18);
  UART4_Write(0x20);
  UART4_Write(0x00);
  UART4_Write(0x00);
}

void uart4RabbitTurnedOff(){
  UART4_Write(0x5A);
  UART4_Write(0xA5);
  UART4_Write(0x05);
  UART4_Write(0x82);
  UART4_Write(0x18);
  UART4_Write(0x20);
  UART4_Write(0x00);
  UART4_Write(0x01);
}

void uart4LeopardTurnedOn(){
  UART4_Write(0x5A);
  UART4_Write(0xA5);
  UART4_Write(0x05);
  UART4_Write(0x82);
  UART4_Write(0x18);
  UART4_Write(0x40);
  UART4_Write(0x00);
  UART4_Write(0x00);
}

void uart4LeopardTurnedOff(){
  UART4_Write(0x5A);
  UART4_Write(0xA5);
  UART4_Write(0x05);
  UART4_Write(0x82);
  UART4_Write(0x18);
  UART4_Write(0x40);
  UART4_Write(0x00);
  UART4_Write(0x01);
}

void uart4SpeedModeTurtle(){
  UART4_Write(0x5A);
  UART4_Write(0xA5);
  UART4_Write(0x05);
  UART4_Write(0x82);
  UART4_Write(0x54);
  UART4_Write(0x65);
  UART4_Write(0x00);
  UART4_Write(0x00);
}

void uart4SpeedModeRabbit(){
  UART4_Write(0x5A);
  UART4_Write(0xA5);
  UART4_Write(0x05);
  UART4_Write(0x82);
  UART4_Write(0x54);
  UART4_Write(0x65);
  UART4_Write(0x00);
  UART4_Write(0x01);
}

void uart4SpeedModeLeopard(){
  UART4_Write(0x5A);
  UART4_Write(0xA5);
  UART4_Write(0x05);
  UART4_Write(0x82);
  UART4_Write(0x54);
  UART4_Write(0x65);
  UART4_Write(0x00);
  UART4_Write(0x02);
}

/***************************************************************************/



void uart3SendJoystick(){

  UART3_Write(0x21);
  UART3_Write(0x40);
  UART3_Write((char)gear_status);
  UART3_Write((char)dutyy);
  if(control_taken){
    UART3_Write(0x01);
  }
  else{
    UART3_Write(0x00);
  }
  UART3_Write(0x3B);
}

void uart3SendJoystickForced(){

  UART3_Write(0x21);
  UART3_Write(0x40);
  UART3_Write((char)gear_status);
  UART3_Write((char)dutyy);
  UART3_Write(0x01);
  UART3_Write(0x3B);
}

void uart3ResetSensorTouch(){
  UART3_Write(0x21);
  UART3_Write(0x45);
  UART3_Write(0x01);
  UART3_Write(0x01);
  UART3_Write(0x01);
  UART3_Write(0x3B);
}
/**********************************************************************************/