#include "externDef.h"


void uart1SendStatus(unsigned int gear_status, unsigned int dutyyy){

  UART1_Write((char)0x21);
  UART1_Write((char)0x50);
  UART1_Write((char)gear_status);
  UART1_Write((char)dutyyy);
  UART1_Write((char)0x30);
  UART1_Write((char)0x3B);
}


void uart1SendCallibration(){
  UART1_Write((char)0x21);
  UART1_Write((char)0x51);
  UART1_Write((char)(calAdcAvg >> 16));
  UART1_Write((char)(calAdcAvg >> 8));
  UART1_Write((char)(calAdcAvg));
  UART1_Write((char)(calDutyF >> 16));
  UART1_Write((char)(calDutyF >> 8));
  UART1_Write((char)(calDutyF));
  UART1_Write((char)calDuty);

  UART1_Write((char)(leftLimit >> 8));
  UART1_Write((char)leftLimit);

  UART1_Write((char)(rightLimit >> 8));
  UART1_Write((char)rightLimit);

  UART1_Write((char)dir);

  UART1_Write((char)(sideDifference >> 8));
  UART1_Write((char)sideDifference);

  UART1_Write((char)0x3B);
}