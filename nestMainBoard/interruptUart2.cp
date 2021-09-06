#line 1 "E:/ComoBoats/NNEESSTT/nestMainBoard/interruptUart2.c"


char receiveUart2;
void interruptGps() iv IVT_INT_USART2 ics ICS_AUTO {

 receiveUart2 = UART2_Read();
}
