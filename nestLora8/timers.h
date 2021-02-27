//Timer2 Prescaler :2879; Preload = 62499; Actual Interrupt Time = 2,5 s

//Place/Copy this part in declaration section
/*
void InitTimer2(){
  RCC_APB1ENR.TIM2EN = 1;
  TIM2_CR1.CEN = 0;
  TIM2_PSC = 2879;
  TIM2_ARR = 62499;
  NVIC_IntEnable(IVT_INT_TIM2);
  TIM2_DIER.UIE = 1;
  TIM2_CR1.CEN = 1;
}  */




//Timer2 Prescaler :319; Preload = 62499; Actual Interrupt Time = 2,5 s

//Place/Copy this part in declaration section
void InitTimer2(){
  RCC_APB1ENR.TIM2EN = 1;
  TIM2_CR1.CEN = 0;
  TIM2_PSC = 319;
  TIM2_ARR = 62499;
  NVIC_IntEnable(IVT_INT_TIM2);
  TIM2_DIER.UIE = 1;
  TIM2_CR1.CEN = 1;
}