_interruptMotor:
;interruptUart1.c,3 :: 		void interruptMotor() iv IVT_INT_USART1 ics ICS_AUTO {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;interruptUart1.c,5 :: 		receiveUart1 = UART1_Read();
BL	_UART1_Read+0
MOVW	R1, #lo_addr(_receiveUart1+0)
MOVT	R1, #hi_addr(_receiveUart1+0)
STRB	R0, [R1, #0]
;interruptUart1.c,7 :: 		}
L_end_interruptMotor:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _interruptMotor
