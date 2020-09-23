_interruptUart2:
;interruptUart2.c,4 :: 		void interruptUart2() iv IVT_INT_USART2 ics ICS_AUTO {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;interruptUart2.c,5 :: 		receive2 = UART2_Read();
BL	_UART2_Read+0
MOVW	R1, #lo_addr(_receive2+0)
MOVT	R1, #hi_addr(_receive2+0)
STRB	R0, [R1, #0]
;interruptUart2.c,7 :: 		if((receive2 == 0x21)&&(!startReceivingData2)){
UXTB	R0, R0
CMP	R0, #33
IT	NE
BNE	L__interruptUart229
MOVW	R1, #lo_addr(_startReceivingData2+0)
MOVT	R1, #hi_addr(_startReceivingData2+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L__interruptUart228
L__interruptUart227:
;interruptUart2.c,8 :: 		uart_count2=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_uart_count2+0)
MOVT	R0, #hi_addr(_uart_count2+0)
STRH	R1, [R0, #0]
;interruptUart2.c,9 :: 		startReceivingData2 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(_startReceivingData2+0)
MOVT	R0, #hi_addr(_startReceivingData2+0)
STR	R1, [R0, #0]
;interruptUart2.c,10 :: 		uartLength2 = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_uartLength2+0)
MOVT	R0, #hi_addr(_uartLength2+0)
STRH	R1, [R0, #0]
;interruptUart2.c,11 :: 		for(i=0; i<12; i++){
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
L_interruptUart23:
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRSH	R0, [R0, #0]
CMP	R0, #12
IT	GE
BGE	L_interruptUart24
;interruptUart2.c,12 :: 		uart_receive2[i] = 0;
MOVW	R2, #lo_addr(_i+0)
MOVT	R2, #hi_addr(_i+0)
LDRSH	R1, [R2, #0]
MOVW	R0, #lo_addr(_uart_receive2+0)
MOVT	R0, #hi_addr(_uart_receive2+0)
ADDS	R1, R0, R1
MOVS	R0, #0
STRB	R0, [R1, #0]
;interruptUart2.c,11 :: 		for(i=0; i<12; i++){
MOV	R0, R2
LDRSH	R0, [R0, #0]
ADDS	R0, R0, #1
STRH	R0, [R2, #0]
;interruptUart2.c,13 :: 		}
IT	AL
BAL	L_interruptUart23
L_interruptUart24:
;interruptUart2.c,14 :: 		}
IT	AL
BAL	L_interruptUart26
;interruptUart2.c,7 :: 		if((receive2 == 0x21)&&(!startReceivingData2)){
L__interruptUart229:
L__interruptUart228:
;interruptUart2.c,18 :: 		else if((receive2 == 0x3B)&&(startReceivingData2)&&(uart_count2 + 1 == uartLength2)){
MOVW	R0, #lo_addr(_receive2+0)
MOVT	R0, #hi_addr(_receive2+0)
LDRB	R0, [R0, #0]
CMP	R0, #59
IT	NE
BNE	L__interruptUart235
MOVW	R1, #lo_addr(_startReceivingData2+0)
MOVT	R1, #hi_addr(_startReceivingData2+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L__interruptUart234
MOVW	R0, #lo_addr(_uart_count2+0)
MOVT	R0, #hi_addr(_uart_count2+0)
LDRH	R0, [R0, #0]
ADDS	R1, R0, #1
UXTH	R1, R1
MOVW	R0, #lo_addr(_uartLength2+0)
MOVT	R0, #hi_addr(_uartLength2+0)
LDRH	R0, [R0, #0]
CMP	R1, R0
IT	NE
BNE	L__interruptUart233
L__interruptUart226:
;interruptUart2.c,19 :: 		uart_receive2[uart_count2] = receive2;
MOVW	R2, #lo_addr(_uart_count2+0)
MOVT	R2, #hi_addr(_uart_count2+0)
LDRH	R1, [R2, #0]
MOVW	R0, #lo_addr(_uart_receive2+0)
MOVT	R0, #hi_addr(_uart_receive2+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_receive2+0)
MOVT	R0, #hi_addr(_receive2+0)
LDRB	R0, [R0, #0]
STRB	R0, [R1, #0]
;interruptUart2.c,20 :: 		uart_count2 = 0;
MOVS	R0, #0
STRH	R0, [R2, #0]
;interruptUart2.c,21 :: 		startReceivingData2 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(_startReceivingData2+0)
MOVT	R0, #hi_addr(_startReceivingData2+0)
STR	R1, [R0, #0]
;interruptUart2.c,22 :: 		uartLength2 = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_uartLength2+0)
MOVT	R0, #hi_addr(_uartLength2+0)
STRH	R1, [R0, #0]
;interruptUart2.c,28 :: 		if((uart_receive2[0]==0x21)&&(uart_receive2[1]==0xC0)&&(uart_receive2[6] = 0x3B)){
MOVW	R0, #lo_addr(_uart_receive2+0)
MOVT	R0, #hi_addr(_uart_receive2+0)
LDRB	R0, [R0, #0]
CMP	R0, #33
IT	NE
BNE	L__interruptUart232
MOVW	R0, #lo_addr(_uart_receive2+1)
MOVT	R0, #hi_addr(_uart_receive2+1)
LDRB	R0, [R0, #0]
CMP	R0, #192
IT	NE
BNE	L__interruptUart231
MOVS	R1, #59
MOVW	R0, #lo_addr(_uart_receive2+6)
MOVT	R0, #hi_addr(_uart_receive2+6)
STRB	R1, [R0, #0]
L__interruptUart225:
;interruptUart2.c,30 :: 		boatDir = uart_receive2[2];
MOVW	R0, #lo_addr(_uart_receive2+2)
MOVT	R0, #hi_addr(_uart_receive2+2)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_boatDir+0)
MOVT	R0, #hi_addr(_boatDir+0)
STRB	R1, [R0, #0]
;interruptUart2.c,31 :: 		boatGear = uart_receive2[3];
MOVW	R0, #lo_addr(_uart_receive2+3)
MOVT	R0, #hi_addr(_uart_receive2+3)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_boatGear+0)
MOVT	R0, #hi_addr(_boatGear+0)
STRB	R1, [R0, #0]
;interruptUart2.c,33 :: 		boatControlTaken =  uart_receive2[4] & 0x01;
MOVW	R2, #lo_addr(_uart_receive2+4)
MOVT	R2, #hi_addr(_uart_receive2+4)
LDRB	R0, [R2, #0]
AND	R1, R0, #1
MOVW	R0, #lo_addr(_boatControlTaken+0)
MOVT	R0, #hi_addr(_boatControlTaken+0)
STRB	R1, [R0, #0]
;interruptUart2.c,34 :: 		boatInteriorLight = uart_receive2[4] & 0x02;
MOV	R0, R2
LDRB	R0, [R0, #0]
AND	R1, R0, #2
MOVW	R0, #lo_addr(_boatInteriorLight+0)
MOVT	R0, #hi_addr(_boatInteriorLight+0)
STRB	R1, [R0, #0]
;interruptUart2.c,35 :: 		boatNavigationLight = uart_receive2[4] & 0x04;
MOV	R0, R2
LDRB	R0, [R0, #0]
AND	R1, R0, #4
MOVW	R0, #lo_addr(_boatNavigationLight+0)
MOVT	R0, #hi_addr(_boatNavigationLight+0)
STRB	R1, [R0, #0]
;interruptUart2.c,37 :: 		boatBattery1 =  uart_receive2[4] & 0x08;
MOV	R0, R2
LDRB	R0, [R0, #0]
AND	R1, R0, #8
MOVW	R0, #lo_addr(_boatBattery1+0)
MOVT	R0, #hi_addr(_boatBattery1+0)
STRB	R1, [R0, #0]
;interruptUart2.c,38 :: 		boatBattery2 =  uart_receive2[4] & 0x10;
MOV	R0, R2
LDRB	R0, [R0, #0]
AND	R1, R0, #16
MOVW	R0, #lo_addr(_boatBattery2+0)
MOVT	R0, #hi_addr(_boatBattery2+0)
STRB	R1, [R0, #0]
;interruptUart2.c,40 :: 		boatBatteriesLavel = uart_receive2[5];
MOVW	R0, #lo_addr(_uart_receive2+5)
MOVT	R0, #hi_addr(_uart_receive2+5)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_boatBatteriesLavel+0)
MOVT	R0, #hi_addr(_boatBatteriesLavel+0)
STRB	R1, [R0, #0]
;interruptUart2.c,42 :: 		boatConnected = 0x20;
MOVS	R1, #32
MOVW	R0, #lo_addr(_boatConnected+0)
MOVT	R0, #hi_addr(_boatConnected+0)
STRB	R1, [R0, #0]
;interruptUart2.c,45 :: 		bitReceivedStatusOfBoat = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(_bitReceivedStatusOfBoat+0)
MOVT	R0, #hi_addr(_bitReceivedStatusOfBoat+0)
STR	R1, [R0, #0]
;interruptUart2.c,28 :: 		if((uart_receive2[0]==0x21)&&(uart_receive2[1]==0xC0)&&(uart_receive2[6] = 0x3B)){
L__interruptUart232:
L__interruptUart231:
;interruptUart2.c,52 :: 		for(i=0; i<12; i++){
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
L_interruptUart213:
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRSH	R0, [R0, #0]
CMP	R0, #12
IT	GE
BGE	L_interruptUart214
;interruptUart2.c,53 :: 		uart_receive2[i] = 0;
MOVW	R2, #lo_addr(_i+0)
MOVT	R2, #hi_addr(_i+0)
LDRSH	R1, [R2, #0]
MOVW	R0, #lo_addr(_uart_receive2+0)
MOVT	R0, #hi_addr(_uart_receive2+0)
ADDS	R1, R0, R1
MOVS	R0, #0
STRB	R0, [R1, #0]
;interruptUart2.c,52 :: 		for(i=0; i<12; i++){
MOV	R0, R2
LDRSH	R0, [R0, #0]
ADDS	R0, R0, #1
STRH	R0, [R2, #0]
;interruptUart2.c,54 :: 		}
IT	AL
BAL	L_interruptUart213
L_interruptUart214:
;interruptUart2.c,18 :: 		else if((receive2 == 0x3B)&&(startReceivingData2)&&(uart_count2 + 1 == uartLength2)){
L__interruptUart235:
L__interruptUart234:
L__interruptUart233:
;interruptUart2.c,59 :: 		}
L_interruptUart26:
;interruptUart2.c,62 :: 		if(startReceivingData2 == 1){
MOVW	R1, #lo_addr(_startReceivingData2+0)
MOVT	R1, #hi_addr(_startReceivingData2+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_interruptUart216
;interruptUart2.c,63 :: 		uart_receive2[uart_count2] = receive2;
MOVW	R2, #lo_addr(_uart_count2+0)
MOVT	R2, #hi_addr(_uart_count2+0)
LDRH	R1, [R2, #0]
MOVW	R0, #lo_addr(_uart_receive2+0)
MOVT	R0, #hi_addr(_uart_receive2+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_receive2+0)
MOVT	R0, #hi_addr(_receive2+0)
LDRB	R0, [R0, #0]
STRB	R0, [R1, #0]
;interruptUart2.c,64 :: 		uart_count2++;
MOV	R0, R2
LDRH	R0, [R0, #0]
ADDS	R0, R0, #1
UXTH	R0, R0
STRH	R0, [R2, #0]
;interruptUart2.c,66 :: 		if(uart_count2 == 2)
CMP	R0, #2
IT	NE
BNE	L_interruptUart217
;interruptUart2.c,68 :: 		switch (uart_receive2[1])
IT	AL
BAL	L_interruptUart218
;interruptUart2.c,70 :: 		case 0xC0:
L_interruptUart220:
;interruptUart2.c,71 :: 		uartLength2 = 7;
MOVS	R1, #7
MOVW	R0, #lo_addr(_uartLength2+0)
MOVT	R0, #hi_addr(_uartLength2+0)
STRH	R1, [R0, #0]
;interruptUart2.c,72 :: 		break;
IT	AL
BAL	L_interruptUart219
;interruptUart2.c,73 :: 		}
L_interruptUart218:
MOVW	R0, #lo_addr(_uart_receive2+1)
MOVT	R0, #hi_addr(_uart_receive2+1)
LDRB	R0, [R0, #0]
CMP	R0, #192
IT	EQ
BEQ	L_interruptUart220
L_interruptUart219:
;interruptUart2.c,74 :: 		}
L_interruptUart217:
;interruptUart2.c,76 :: 		if(uart_count2 > 11){
MOVW	R0, #lo_addr(_uart_count2+0)
MOVT	R0, #hi_addr(_uart_count2+0)
LDRH	R0, [R0, #0]
CMP	R0, #11
IT	LS
BLS	L_interruptUart221
;interruptUart2.c,77 :: 		uart_count2 = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_uart_count2+0)
MOVT	R0, #hi_addr(_uart_count2+0)
STRH	R1, [R0, #0]
;interruptUart2.c,78 :: 		uartLength2 = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_uartLength2+0)
MOVT	R0, #hi_addr(_uartLength2+0)
STRH	R1, [R0, #0]
;interruptUart2.c,79 :: 		startReceivingData2 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(_startReceivingData2+0)
MOVT	R0, #hi_addr(_startReceivingData2+0)
STR	R1, [R0, #0]
;interruptUart2.c,80 :: 		for(i=0; i<12; i++){
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
L_interruptUart222:
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRSH	R0, [R0, #0]
CMP	R0, #12
IT	GE
BGE	L_interruptUart223
;interruptUart2.c,81 :: 		uart_receive2[i] = 0;
MOVW	R2, #lo_addr(_i+0)
MOVT	R2, #hi_addr(_i+0)
LDRSH	R1, [R2, #0]
MOVW	R0, #lo_addr(_uart_receive2+0)
MOVT	R0, #hi_addr(_uart_receive2+0)
ADDS	R1, R0, R1
MOVS	R0, #0
STRB	R0, [R1, #0]
;interruptUart2.c,80 :: 		for(i=0; i<12; i++){
MOV	R0, R2
LDRSH	R0, [R0, #0]
ADDS	R0, R0, #1
STRH	R0, [R2, #0]
;interruptUart2.c,82 :: 		}
IT	AL
BAL	L_interruptUart222
L_interruptUart223:
;interruptUart2.c,83 :: 		}
L_interruptUart221:
;interruptUart2.c,84 :: 		}
L_interruptUart216:
;interruptUart2.c,87 :: 		}
L_end_interruptUart2:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _interruptUart2
