_interruptGps:
;interruptUart2.c,4 :: 		void interruptGps() iv IVT_INT_USART2 ics ICS_AUTO {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;interruptUart2.c,6 :: 		receiveUart2 = UART2_Read();
BL	_UART2_Read+0
MOVW	R1, #lo_addr(_receiveUart2+0)
MOVT	R1, #hi_addr(_receiveUart2+0)
STRB	R0, [R1, #0]
;interruptUart2.c,7 :: 		}
L_end_interruptGps:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _interruptGps
