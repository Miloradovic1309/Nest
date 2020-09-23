_uart1SendStatus:
;uart1Send.c,4 :: 		void uart1SendStatus(unsigned int gear_status, unsigned int dutyyy){
; dutyyy start address is: 4 (R1)
; gear_status start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
UXTH	R4, R0
UXTH	R5, R1
; dutyyy end address is: 4 (R1)
; gear_status end address is: 0 (R0)
; gear_status start address is: 16 (R4)
; dutyyy start address is: 20 (R5)
;uart1Send.c,6 :: 		UART1_Write((char)0x21);
MOVS	R0, #33
BL	_UART1_Write+0
;uart1Send.c,7 :: 		UART1_Write((char)0x50);
MOVS	R0, #80
BL	_UART1_Write+0
;uart1Send.c,8 :: 		UART1_Write((char)gear_status);
UXTB	R0, R4
; gear_status end address is: 16 (R4)
BL	_UART1_Write+0
;uart1Send.c,9 :: 		UART1_Write((char)dutyyy);
UXTB	R0, R5
; dutyyy end address is: 20 (R5)
BL	_UART1_Write+0
;uart1Send.c,10 :: 		UART1_Write((char)0x30);
MOVS	R0, #48
BL	_UART1_Write+0
;uart1Send.c,11 :: 		UART1_Write((char)0x3B);
MOVS	R0, #59
BL	_UART1_Write+0
;uart1Send.c,12 :: 		}
L_end_uart1SendStatus:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _uart1SendStatus
_uart1SendCallibration:
;uart1Send.c,15 :: 		void uart1SendCallibration(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;uart1Send.c,16 :: 		UART1_Write((char)0x21);
MOVS	R0, #33
BL	_UART1_Write+0
;uart1Send.c,17 :: 		UART1_Write((char)0x51);
MOVS	R0, #81
BL	_UART1_Write+0
;uart1Send.c,18 :: 		UART1_Write((char)(calAdcAvg >> 16));
MOVW	R0, #lo_addr(_calAdcAvg+0)
MOVT	R0, #hi_addr(_calAdcAvg+0)
LDR	R0, [R0, #0]
ASRS	R0, R0, #16
UXTB	R0, R0
BL	_UART1_Write+0
;uart1Send.c,19 :: 		UART1_Write((char)(calAdcAvg >> 8));
MOVW	R0, #lo_addr(_calAdcAvg+0)
MOVT	R0, #hi_addr(_calAdcAvg+0)
LDR	R0, [R0, #0]
ASRS	R0, R0, #8
UXTB	R0, R0
BL	_UART1_Write+0
;uart1Send.c,20 :: 		UART1_Write((char)(calAdcAvg));
MOVW	R0, #lo_addr(_calAdcAvg+0)
MOVT	R0, #hi_addr(_calAdcAvg+0)
LDR	R0, [R0, #0]
BL	_UART1_Write+0
;uart1Send.c,21 :: 		UART1_Write((char)(calDutyF >> 16));
MOVW	R0, #lo_addr(_calDutyF+0)
MOVT	R0, #hi_addr(_calDutyF+0)
LDR	R0, [R0, #0]
ASRS	R0, R0, #16
UXTB	R0, R0
BL	_UART1_Write+0
;uart1Send.c,22 :: 		UART1_Write((char)(calDutyF >> 8));
MOVW	R0, #lo_addr(_calDutyF+0)
MOVT	R0, #hi_addr(_calDutyF+0)
LDR	R0, [R0, #0]
ASRS	R0, R0, #8
UXTB	R0, R0
BL	_UART1_Write+0
;uart1Send.c,23 :: 		UART1_Write((char)(calDutyF));
MOVW	R0, #lo_addr(_calDutyF+0)
MOVT	R0, #hi_addr(_calDutyF+0)
LDR	R0, [R0, #0]
BL	_UART1_Write+0
;uart1Send.c,24 :: 		UART1_Write((char)calDuty);
MOVW	R0, #lo_addr(_calDuty+0)
MOVT	R0, #hi_addr(_calDuty+0)
LDRSH	R0, [R0, #0]
BL	_UART1_Write+0
;uart1Send.c,26 :: 		UART1_Write((char)(leftLimit >> 8));
MOVW	R0, #lo_addr(_leftLimit+0)
MOVT	R0, #hi_addr(_leftLimit+0)
LDRH	R0, [R0, #0]
LSRS	R0, R0, #8
UXTB	R0, R0
BL	_UART1_Write+0
;uart1Send.c,27 :: 		UART1_Write((char)leftLimit);
MOVW	R0, #lo_addr(_leftLimit+0)
MOVT	R0, #hi_addr(_leftLimit+0)
LDRH	R0, [R0, #0]
BL	_UART1_Write+0
;uart1Send.c,29 :: 		UART1_Write((char)(rightLimit >> 8));
MOVW	R0, #lo_addr(_rightLimit+0)
MOVT	R0, #hi_addr(_rightLimit+0)
LDRH	R0, [R0, #0]
LSRS	R0, R0, #8
UXTB	R0, R0
BL	_UART1_Write+0
;uart1Send.c,30 :: 		UART1_Write((char)rightLimit);
MOVW	R0, #lo_addr(_rightLimit+0)
MOVT	R0, #hi_addr(_rightLimit+0)
LDRH	R0, [R0, #0]
BL	_UART1_Write+0
;uart1Send.c,32 :: 		UART1_Write((char)dir);
MOVW	R0, #lo_addr(_dir+0)
MOVT	R0, #hi_addr(_dir+0)
LDRB	R0, [R0, #0]
BL	_UART1_Write+0
;uart1Send.c,34 :: 		UART1_Write((char)(sideDifference >> 8));
MOVW	R0, #lo_addr(_sideDifference+0)
MOVT	R0, #hi_addr(_sideDifference+0)
LDRH	R0, [R0, #0]
LSRS	R0, R0, #8
UXTB	R0, R0
BL	_UART1_Write+0
;uart1Send.c,35 :: 		UART1_Write((char)sideDifference);
MOVW	R0, #lo_addr(_sideDifference+0)
MOVT	R0, #hi_addr(_sideDifference+0)
LDRH	R0, [R0, #0]
BL	_UART1_Write+0
;uart1Send.c,37 :: 		UART1_Write((char)0x3B);
MOVS	R0, #59
BL	_UART1_Write+0
;uart1Send.c,38 :: 		}
L_end_uart1SendCallibration:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _uart1SendCallibration
