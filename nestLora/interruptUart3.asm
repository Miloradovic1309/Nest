_interruptUart3:
;interruptUart3.c,5 :: 		void interruptUart3() iv IVT_INT_USART3 ics ICS_AUTO {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;interruptUart3.c,6 :: 		receive3 = UART3_Read();
BL	_UART3_Read+0
MOVW	R1, #lo_addr(_receive3+0)
MOVT	R1, #hi_addr(_receive3+0)
STRB	R0, [R1, #0]
;interruptUart3.c,8 :: 		if((receive3 == 0x21)&&(!startReceivingData3)){
UXTB	R0, R0
CMP	R0, #33
IT	NE
BNE	L__interruptUart336
MOVW	R1, #lo_addr(_startReceivingData3+0)
MOVT	R1, #hi_addr(_startReceivingData3+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L__interruptUart335
L__interruptUart334:
;interruptUart3.c,9 :: 		uart_count3=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_uart_count3+0)
MOVT	R0, #hi_addr(_uart_count3+0)
STRH	R1, [R0, #0]
;interruptUart3.c,10 :: 		startReceivingData3 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(_startReceivingData3+0)
MOVT	R0, #hi_addr(_startReceivingData3+0)
STR	R1, [R0, #0]
;interruptUart3.c,11 :: 		uartLength3 = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_uartLength3+0)
MOVT	R0, #hi_addr(_uartLength3+0)
STRH	R1, [R0, #0]
;interruptUart3.c,12 :: 		for(i=0; i<13; i++){
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
L_interruptUart33:
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRSH	R0, [R0, #0]
CMP	R0, #13
IT	GE
BGE	L_interruptUart34
;interruptUart3.c,13 :: 		uart_receive3[i] = 0;
MOVW	R2, #lo_addr(_i+0)
MOVT	R2, #hi_addr(_i+0)
LDRSH	R1, [R2, #0]
MOVW	R0, #lo_addr(_uart_receive3+0)
MOVT	R0, #hi_addr(_uart_receive3+0)
ADDS	R1, R0, R1
MOVS	R0, #0
STRB	R0, [R1, #0]
;interruptUart3.c,12 :: 		for(i=0; i<13; i++){
MOV	R0, R2
LDRSH	R0, [R0, #0]
ADDS	R0, R0, #1
STRH	R0, [R2, #0]
;interruptUart3.c,14 :: 		}
IT	AL
BAL	L_interruptUart33
L_interruptUart34:
;interruptUart3.c,15 :: 		}
IT	AL
BAL	L_interruptUart36
;interruptUart3.c,8 :: 		if((receive3 == 0x21)&&(!startReceivingData3)){
L__interruptUart336:
L__interruptUart335:
;interruptUart3.c,19 :: 		else if((receive3 == 0x3B)&&(startReceivingData3)&&(uart_count3 + 1 == uartLength3)){
MOVW	R0, #lo_addr(_receive3+0)
MOVT	R0, #hi_addr(_receive3+0)
LDRB	R0, [R0, #0]
CMP	R0, #59
IT	NE
BNE	L__interruptUart344
MOVW	R1, #lo_addr(_startReceivingData3+0)
MOVT	R1, #hi_addr(_startReceivingData3+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L__interruptUart343
MOVW	R0, #lo_addr(_uart_count3+0)
MOVT	R0, #hi_addr(_uart_count3+0)
LDRH	R0, [R0, #0]
ADDS	R1, R0, #1
UXTH	R1, R1
MOVW	R0, #lo_addr(_uartLength3+0)
MOVT	R0, #hi_addr(_uartLength3+0)
LDRH	R0, [R0, #0]
CMP	R1, R0
IT	NE
BNE	L__interruptUart342
L__interruptUart333:
;interruptUart3.c,20 :: 		uart_receive3[uart_count3] = receive3;
MOVW	R2, #lo_addr(_uart_count3+0)
MOVT	R2, #hi_addr(_uart_count3+0)
LDRH	R1, [R2, #0]
MOVW	R0, #lo_addr(_uart_receive3+0)
MOVT	R0, #hi_addr(_uart_receive3+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_receive3+0)
MOVT	R0, #hi_addr(_receive3+0)
LDRB	R0, [R0, #0]
STRB	R0, [R1, #0]
;interruptUart3.c,21 :: 		uart_count3 = 0;
MOVS	R0, #0
STRH	R0, [R2, #0]
;interruptUart3.c,22 :: 		startReceivingData3 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(_startReceivingData3+0)
MOVT	R0, #hi_addr(_startReceivingData3+0)
STR	R1, [R0, #0]
;interruptUart3.c,23 :: 		uartLength3 = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_uartLength3+0)
MOVT	R0, #hi_addr(_uartLength3+0)
STRH	R1, [R0, #0]
;interruptUart3.c,29 :: 		if((uart_receive3[0]==0x21)&&(uart_receive3[1]==ADDRESS_STATION)&&(uart_receive3[2]==ADDRESS_PHONE)
MOVW	R0, #lo_addr(_uart_receive3+0)
MOVT	R0, #hi_addr(_uart_receive3+0)
LDRB	R0, [R0, #0]
CMP	R0, #33
IT	NE
BNE	L__interruptUart341
MOVW	R0, #lo_addr(_uart_receive3+1)
MOVT	R0, #hi_addr(_uart_receive3+1)
LDRB	R0, [R0, #0]
CMP	R0, #48
IT	NE
BNE	L__interruptUart340
MOVW	R0, #lo_addr(_uart_receive3+2)
MOVT	R0, #hi_addr(_uart_receive3+2)
LDRB	R0, [R0, #0]
CMP	R0, #37
IT	NE
BNE	L__interruptUart339
;interruptUart3.c,30 :: 		&& (uart_receive3[5]==0xC0)&&(uart_receive3[9] = 0x3B)){
MOVW	R0, #lo_addr(_uart_receive3+5)
MOVT	R0, #hi_addr(_uart_receive3+5)
LDRB	R0, [R0, #0]
CMP	R0, #192
IT	NE
BNE	L__interruptUart338
MOVS	R1, #59
MOVW	R0, #lo_addr(_uart_receive3+9)
MOVT	R0, #hi_addr(_uart_receive3+9)
STRB	R1, [R0, #0]
L__interruptUart332:
;interruptUart3.c,34 :: 		bitReceivedCheckStatusOfBoat = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(_bitReceivedCheckStatusOfBoat+0)
MOVT	R0, #hi_addr(_bitReceivedCheckStatusOfBoat+0)
STR	R1, [R0, #0]
;interruptUart3.c,35 :: 		addressBoat[0] = uart_receive3[3];
MOVW	R0, #lo_addr(_uart_receive3+3)
MOVT	R0, #hi_addr(_uart_receive3+3)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_addressBoat+0)
MOVT	R0, #hi_addr(_addressBoat+0)
STRB	R1, [R0, #0]
;interruptUart3.c,36 :: 		addressBoat[1] = uart_receive3[4];
MOVW	R0, #lo_addr(_uart_receive3+4)
MOVT	R0, #hi_addr(_uart_receive3+4)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_addressBoat+1)
MOVT	R0, #hi_addr(_addressBoat+1)
STRB	R1, [R0, #0]
;interruptUart3.c,37 :: 		boatStatus = uart_receive3[8];
MOVW	R0, #lo_addr(_uart_receive3+8)
MOVT	R0, #hi_addr(_uart_receive3+8)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_boatStatus+0)
MOVT	R0, #hi_addr(_boatStatus+0)
STRB	R1, [R0, #0]
;interruptUart3.c,38 :: 		boatStatusGear = uart_receive3[7];
MOVW	R0, #lo_addr(_uart_receive3+7)
MOVT	R0, #hi_addr(_uart_receive3+7)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_boatStatusGear+0)
MOVT	R0, #hi_addr(_boatStatusGear+0)
STRB	R1, [R0, #0]
;interruptUart3.c,39 :: 		boatStatusWheel = uart_receive3[6];
MOVW	R0, #lo_addr(_uart_receive3+6)
MOVT	R0, #hi_addr(_uart_receive3+6)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_boatStatusWheel+0)
MOVT	R0, #hi_addr(_boatStatusWheel+0)
STRB	R1, [R0, #0]
;interruptUart3.c,41 :: 		if(!bitExpectAnswer){
MOVW	R1, #lo_addr(_bitExpectAnswer+0)
MOVT	R1, #hi_addr(_bitExpectAnswer+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_interruptUart313
;interruptUart3.c,42 :: 		TIM2_CNT = 0x00;
MOVS	R1, #0
MOVW	R0, #lo_addr(TIM2_CNT+0)
MOVT	R0, #hi_addr(TIM2_CNT+0)
STR	R1, [R0, #0]
;interruptUart3.c,43 :: 		bitExpectAnswer = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(_bitExpectAnswer+0)
MOVT	R0, #hi_addr(_bitExpectAnswer+0)
STR	R1, [R0, #0]
;interruptUart3.c,44 :: 		}
L_interruptUart313:
;interruptUart3.c,29 :: 		if((uart_receive3[0]==0x21)&&(uart_receive3[1]==ADDRESS_STATION)&&(uart_receive3[2]==ADDRESS_PHONE)
L__interruptUart341:
L__interruptUart340:
L__interruptUart339:
;interruptUart3.c,30 :: 		&& (uart_receive3[5]==0xC0)&&(uart_receive3[9] = 0x3B)){
L__interruptUart338:
;interruptUart3.c,54 :: 		for(i=0; i<13; i++){
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
L_interruptUart314:
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRSH	R0, [R0, #0]
CMP	R0, #13
IT	GE
BGE	L_interruptUart315
;interruptUart3.c,55 :: 		uart_receive3[i] = 0;
MOVW	R2, #lo_addr(_i+0)
MOVT	R2, #hi_addr(_i+0)
LDRSH	R1, [R2, #0]
MOVW	R0, #lo_addr(_uart_receive3+0)
MOVT	R0, #hi_addr(_uart_receive3+0)
ADDS	R1, R0, R1
MOVS	R0, #0
STRB	R0, [R1, #0]
;interruptUart3.c,54 :: 		for(i=0; i<13; i++){
MOV	R0, R2
LDRSH	R0, [R0, #0]
ADDS	R0, R0, #1
STRH	R0, [R2, #0]
;interruptUart3.c,56 :: 		}
IT	AL
BAL	L_interruptUart314
L_interruptUart315:
;interruptUart3.c,19 :: 		else if((receive3 == 0x3B)&&(startReceivingData3)&&(uart_count3 + 1 == uartLength3)){
L__interruptUart344:
L__interruptUart343:
L__interruptUart342:
;interruptUart3.c,61 :: 		}
L_interruptUart36:
;interruptUart3.c,64 :: 		if(startReceivingData3 == 1){
MOVW	R1, #lo_addr(_startReceivingData3+0)
MOVT	R1, #hi_addr(_startReceivingData3+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_interruptUart317
;interruptUart3.c,65 :: 		uart_receive3[uart_count3] = receive3;
MOVW	R2, #lo_addr(_uart_count3+0)
MOVT	R2, #hi_addr(_uart_count3+0)
LDRH	R1, [R2, #0]
MOVW	R0, #lo_addr(_uart_receive3+0)
MOVT	R0, #hi_addr(_uart_receive3+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_receive3+0)
MOVT	R0, #hi_addr(_receive3+0)
LDRB	R0, [R0, #0]
STRB	R0, [R1, #0]
;interruptUart3.c,66 :: 		uart_count3++;
MOV	R0, R2
LDRH	R0, [R0, #0]
ADDS	R0, R0, #1
UXTH	R0, R0
STRH	R0, [R2, #0]
;interruptUart3.c,68 :: 		if(uart_count3 == 2){
CMP	R0, #2
IT	NE
BNE	L_interruptUart318
;interruptUart3.c,69 :: 		if(uart_receive3[1] != ADDRESS_STATION){
MOVW	R0, #lo_addr(_uart_receive3+1)
MOVT	R0, #hi_addr(_uart_receive3+1)
LDRB	R0, [R0, #0]
CMP	R0, #48
IT	EQ
BEQ	L_interruptUart319
;interruptUart3.c,70 :: 		uart_count3 = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_uart_count3+0)
MOVT	R0, #hi_addr(_uart_count3+0)
STRH	R1, [R0, #0]
;interruptUart3.c,71 :: 		uartLength3 = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_uartLength3+0)
MOVT	R0, #hi_addr(_uartLength3+0)
STRH	R1, [R0, #0]
;interruptUart3.c,72 :: 		startReceivingData3 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(_startReceivingData3+0)
MOVT	R0, #hi_addr(_startReceivingData3+0)
STR	R1, [R0, #0]
;interruptUart3.c,73 :: 		for(i=0; i<12; i++){
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
L_interruptUart320:
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRSH	R0, [R0, #0]
CMP	R0, #12
IT	GE
BGE	L_interruptUart321
;interruptUart3.c,74 :: 		uart_receive3[i] = 0;
MOVW	R2, #lo_addr(_i+0)
MOVT	R2, #hi_addr(_i+0)
LDRSH	R1, [R2, #0]
MOVW	R0, #lo_addr(_uart_receive3+0)
MOVT	R0, #hi_addr(_uart_receive3+0)
ADDS	R1, R0, R1
MOVS	R0, #0
STRB	R0, [R1, #0]
;interruptUart3.c,73 :: 		for(i=0; i<12; i++){
MOV	R0, R2
LDRSH	R0, [R0, #0]
ADDS	R0, R0, #1
STRH	R0, [R2, #0]
;interruptUart3.c,75 :: 		}
IT	AL
BAL	L_interruptUart320
L_interruptUart321:
;interruptUart3.c,76 :: 		}
L_interruptUart319:
;interruptUart3.c,77 :: 		}
IT	AL
BAL	L_interruptUart323
L_interruptUart318:
;interruptUart3.c,78 :: 		else if(uart_count3 == 6)
MOVW	R0, #lo_addr(_uart_count3+0)
MOVT	R0, #hi_addr(_uart_count3+0)
LDRH	R0, [R0, #0]
CMP	R0, #6
IT	NE
BNE	L_interruptUart324
;interruptUart3.c,80 :: 		switch (uart_receive3[5])
IT	AL
BAL	L_interruptUart325
;interruptUart3.c,82 :: 		case 0xC0:
L_interruptUart327:
;interruptUart3.c,83 :: 		uartLength3 = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_uartLength3+0)
MOVT	R0, #hi_addr(_uartLength3+0)
STRH	R1, [R0, #0]
;interruptUart3.c,84 :: 		break;
IT	AL
BAL	L_interruptUart326
;interruptUart3.c,85 :: 		}
L_interruptUart325:
MOVW	R0, #lo_addr(_uart_receive3+5)
MOVT	R0, #hi_addr(_uart_receive3+5)
LDRB	R0, [R0, #0]
CMP	R0, #192
IT	EQ
BEQ	L_interruptUart327
L_interruptUart326:
;interruptUart3.c,86 :: 		}
L_interruptUart324:
L_interruptUart323:
;interruptUart3.c,88 :: 		if(uart_count3 > 12){
MOVW	R0, #lo_addr(_uart_count3+0)
MOVT	R0, #hi_addr(_uart_count3+0)
LDRH	R0, [R0, #0]
CMP	R0, #12
IT	LS
BLS	L_interruptUart328
;interruptUart3.c,89 :: 		uart_count3 = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_uart_count3+0)
MOVT	R0, #hi_addr(_uart_count3+0)
STRH	R1, [R0, #0]
;interruptUart3.c,90 :: 		uartLength3 = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_uartLength3+0)
MOVT	R0, #hi_addr(_uartLength3+0)
STRH	R1, [R0, #0]
;interruptUart3.c,91 :: 		startReceivingData3 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(_startReceivingData3+0)
MOVT	R0, #hi_addr(_startReceivingData3+0)
STR	R1, [R0, #0]
;interruptUart3.c,92 :: 		for(i=0; i<13; i++){
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
L_interruptUart329:
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRSH	R0, [R0, #0]
CMP	R0, #13
IT	GE
BGE	L_interruptUart330
;interruptUart3.c,93 :: 		uart_receive3[i] = 0;
MOVW	R2, #lo_addr(_i+0)
MOVT	R2, #hi_addr(_i+0)
LDRSH	R1, [R2, #0]
MOVW	R0, #lo_addr(_uart_receive3+0)
MOVT	R0, #hi_addr(_uart_receive3+0)
ADDS	R1, R0, R1
MOVS	R0, #0
STRB	R0, [R1, #0]
;interruptUart3.c,92 :: 		for(i=0; i<13; i++){
MOV	R0, R2
LDRSH	R0, [R0, #0]
ADDS	R0, R0, #1
STRH	R0, [R2, #0]
;interruptUart3.c,94 :: 		}
IT	AL
BAL	L_interruptUart329
L_interruptUart330:
;interruptUart3.c,95 :: 		}
L_interruptUart328:
;interruptUart3.c,96 :: 		}
L_interruptUart317:
;interruptUart3.c,98 :: 		}
L_end_interruptUart3:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _interruptUart3
