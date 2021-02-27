_uartRequestStatusFromBoat:
;uartSendToBoat.c,3 :: 		void uartRequestStatusFromBoat(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;uartSendToBoat.c,4 :: 		UART2_Write((char)addressBoat[0]);
MOVW	R0, #lo_addr(_addressBoat+0)
MOVT	R0, #hi_addr(_addressBoat+0)
LDRB	R0, [R0, #0]
BL	_UART2_Write+0
;uartSendToBoat.c,5 :: 		UART2_Write((char)addressBoat[1]);
MOVW	R0, #lo_addr(_addressBoat+1)
MOVT	R0, #hi_addr(_addressBoat+1)
LDRB	R0, [R0, #0]
BL	_UART2_Write+0
;uartSendToBoat.c,6 :: 		UART2_Write((char)FREQUENCY);
MOVS	R0, #0
BL	_UART2_Write+0
;uartSendToBoat.c,8 :: 		UART2_Write(0x21);
MOVS	R0, #33
BL	_UART2_Write+0
;uartSendToBoat.c,9 :: 		UART2_Write(0xC0);
MOVS	R0, #192
BL	_UART2_Write+0
;uartSendToBoat.c,10 :: 		UART2_Write((char)boatStatusWheel);
MOVW	R0, #lo_addr(_boatStatusWheel+0)
MOVT	R0, #hi_addr(_boatStatusWheel+0)
LDRB	R0, [R0, #0]
BL	_UART2_Write+0
;uartSendToBoat.c,11 :: 		UART2_Write((char)boatStatusGear);
MOVW	R0, #lo_addr(_boatStatusGear+0)
MOVT	R0, #hi_addr(_boatStatusGear+0)
LDRB	R0, [R0, #0]
BL	_UART2_Write+0
;uartSendToBoat.c,12 :: 		UART2_Write((char)boatStatus);
MOVW	R0, #lo_addr(_boatStatus+0)
MOVT	R0, #hi_addr(_boatStatus+0)
LDRB	R0, [R0, #0]
BL	_UART2_Write+0
;uartSendToBoat.c,13 :: 		UART2_Write(0x00);
MOVS	R0, #0
BL	_UART2_Write+0
;uartSendToBoat.c,14 :: 		UART2_Write(0x3B);
MOVS	R0, #59
BL	_UART2_Write+0
;uartSendToBoat.c,15 :: 		}
L_end_uartRequestStatusFromBoat:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _uartRequestStatusFromBoat
