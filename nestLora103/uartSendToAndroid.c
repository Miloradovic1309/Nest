#include "externDef.h"

void sendRequestStatusToAndroid(){
  UART3_Write(0x21);
  UART3_Write(0x25);
  UART3_Write(0x30);
  UART3_Write(0x40);
  UART3_Write(0xC0);
  UART3_Write((char)boatDir);
  UART3_Write((char)boatGear);
  UART3_Write((char)((boatConnected | boatBattery2 | boatBattery1 | boatNavigationLight | boatInteriorLight | boatControlTaken) & 0x3F));
  UART3_Write((char)boatBatteriesLavel);
  UART3_Write(0x3B);
}

