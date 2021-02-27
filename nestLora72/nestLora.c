
#include "def.h"
#include "externDef.h"
#include "timers.h"
void setup_IWDG()
{
     IWDG_KR = 0x5555;    //Disable write protection of IWDG registers
     IWDG_PR = 0x06;      //Set PR value
     IWDG_RLR = 0x2FF;     //Set RLR value
     IWDG_KR = 0xAAAA;    //Reload IWDG
     IWDG_KR = 0xCCCC;    //Start IWDG
}



void main() {

  UART2_Init_Advanced(115200, _UART_8_BIT_DATA, _UART_NOPARITY, _UART_ONE_STOPBIT, &_GPIO_MODULE_USART2_PA23);
  USART2_CR1bits.RXNEIE = 1;       // enable uart rx interrupt
  NVIC_IntEnable(IVT_INT_USART2);  // enable interrupt vector

  /*
  UART1_Init_Advanced(115200, _UART_8_BIT_DATA, _UART_NOPARITY, _UART_ONE_STOPBIT, &_GPIO_MODULE_USART1_PA9_10);
  USART1_CR1bits.RXNEIE = 1;       // enable uart rx interrupt
  NVIC_IntEnable(IVT_INT_USART1);  // enable interrupt vector
  */

  UART3_Init_Advanced(115200, _UART_8_BIT_DATA, _UART_NOPARITY, _UART_ONE_STOPBIT, &_GPIO_MODULE_USART3_PB10_11);
  USART3_CR1bits.RXNEIE = 1;       // enable uart rx interrupt
  NVIC_IntEnable(IVT_INT_USART3);  // enable interrupt vector
  
  // M0 M1
  GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_0 | _GPIO_PINMASK_1);

  // LED0
  //GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_7);
  GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_12);

  // K0 K1
  //GPIO_Config(&GPIOB_BASE, _GPIO_PINMASK_8 | _GPIO_PINMASK_9, _GPIO_CFG_MODE_INPUT | _GPIO_CFG_PULL_UP);
  
  // AUX
  GPIO_Config(&GPIOA_BASE, _GPIO_PINMASK_4, _GPIO_CFG_MODE_INPUT | _GPIO_CFG_PULL_NO);
  
  LED = 0;
  //LED1 = 0;


  M0 = 0;
  M1 = 0;
  
  
  bitReceivedCheckStatusOfBoat = 0;
  bitReceivedStatusOfBoat = 0;
  bitExpectAnswer = 0;
  
  InitTimer2();
  
  /*
  UART1_Write(0xC0);
  UART1_Write(0x00);
  UART1_Write(0x01);
  UART1_Write(0x1A);
  UART1_Write(0x17);
  UART1_Write(0xC4);
  */
  
  //Delay_ms(1000);
  //UART3_Write_Text("AT+PIN7703");
  //UART3_Write_Text("AT+BAUD4");
  
  
  setup_IWDG();

  
  Delay_ms(100);
  
  while(1){
    IWDG_KR = 0xAAAA;    //Reload IWDG
    //LED = 1;
    
    //LED0 = 1;
    

    
    
    if(bitReceivedCheckStatusOfBoat){
      bitReceivedCheckStatusOfBoat = 0;
      uartRequestStatusFromBoat();
    }
    

    
    if(bitReceivedStatusOfBoat){
      bitReceivedStatusOfBoat = 0;
      sendRequestStatusToAndroid();
      bitExpectAnswer = 0;
      boatConnected = 0x00;
      

    }
    
    
    
    

  
  }

}