#include "externDef.h"

void uartRequestStatusFromBoat(){
  UART2_Write((char)addressBoat[0]);
  UART2_Write((char)addressBoat[1]);
  UART2_Write((char)FREQUENCY);

  UART2_Write(0x21);
  UART2_Write(0xC0);
  UART2_Write((char)boatStatusWheel);
  UART2_Write((char)boatStatusGear);
  UART2_Write((char)boatStatus);
  UART2_Write(0x00);
  UART2_Write(0x3B);
}