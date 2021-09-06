#line 1 "E:/ComoBoats/NNEESSTT/nestMainBoard/interruptUart1.c"

char receiveUart1;
void interruptMotor() iv IVT_INT_USART1 ics ICS_AUTO {

 receiveUart1 = UART1_Read();

}
