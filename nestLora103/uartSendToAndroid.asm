_sendRequestStatusToAndroid:
;uartSendToAndroid.c,3 :: 		void sendRequestStatusToAndroid(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;uartSendToAndroid.c,4 :: 		UART3_Write(0x21);
MOVS	R0, #33
BL	_UART3_Write+0
;uartSendToAndroid.c,5 :: 		UART3_Write(0x25);
MOVS	R0, #37
BL	_UART3_Write+0
;uartSendToAndroid.c,6 :: 		UART3_Write(0x30);
MOVS	R0, #48
BL	_UART3_Write+0
;uartSendToAndroid.c,7 :: 		UART3_Write(0x40);
MOVS	R0, #64
BL	_UART3_Write+0
;uartSendToAndroid.c,8 :: 		UART3_Write(0xC0);
MOVS	R0, #192
BL	_UART3_Write+0
;uartSendToAndroid.c,9 :: 		UART3_Write((char)boatDir);
MOVW	R0, #lo_addr(_boatDir+0)
MOVT	R0, #hi_addr(_boatDir+0)
LDRB	R0, [R0, #0]
BL	_UART3_Write+0
;uartSendToAndroid.c,10 :: 		UART3_Write((char)boatGear);
MOVW	R0, #lo_addr(_boatGear+0)
MOVT	R0, #hi_addr(_boatGear+0)
LDRB	R0, [R0, #0]
BL	_UART3_Write+0
;uartSendToAndroid.c,11 :: 		UART3_Write((char)((boatConnected | boatBattery2 | boatBattery1 | boatNavigationLight | boatInteriorLight | boatControlTaken) & 0x3F));
MOVW	R0, #lo_addr(_boatBattery2+0)
MOVT	R0, #hi_addr(_boatBattery2+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_boatConnected+0)
MOVT	R0, #hi_addr(_boatConnected+0)
LDRB	R0, [R0, #0]
ORR	R1, R0, R1, LSL #0
UXTB	R1, R1
MOVW	R0, #lo_addr(_boatBattery1+0)
MOVT	R0, #hi_addr(_boatBattery1+0)
LDRB	R0, [R0, #0]
ORRS	R1, R0
UXTB	R1, R1
MOVW	R0, #lo_addr(_boatNavigationLight+0)
MOVT	R0, #hi_addr(_boatNavigationLight+0)
LDRB	R0, [R0, #0]
ORRS	R1, R0
UXTB	R1, R1
MOVW	R0, #lo_addr(_boatInteriorLight+0)
MOVT	R0, #hi_addr(_boatInteriorLight+0)
LDRB	R0, [R0, #0]
ORRS	R1, R0
UXTB	R1, R1
MOVW	R0, #lo_addr(_boatControlTaken+0)
MOVT	R0, #hi_addr(_boatControlTaken+0)
LDRB	R0, [R0, #0]
ORR	R0, R1, R0, LSL #0
UXTB	R0, R0
AND	R0, R0, #63
UXTB	R0, R0
BL	_UART3_Write+0
;uartSendToAndroid.c,12 :: 		UART3_Write((char)boatBatteriesLavel);
MOVW	R0, #lo_addr(_boatBatteriesLavel+0)
MOVT	R0, #hi_addr(_boatBatteriesLavel+0)
LDRB	R0, [R0, #0]
BL	_UART3_Write+0
;uartSendToAndroid.c,13 :: 		UART3_Write(0x3B);
MOVS	R0, #59
BL	_UART3_Write+0
;uartSendToAndroid.c,14 :: 		}
L_end_sendRequestStatusToAndroid:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _sendRequestStatusToAndroid
