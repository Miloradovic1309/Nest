_Timer2_interrupt:
;timer2.c,4 :: 		void Timer2_interrupt() iv IVT_INT_TIM2 {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;timer2.c,5 :: 		TIM2_SR.UIF = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_SR+0)
MOVT	R0, #hi_addr(TIM2_SR+0)
_SX	[R0, ByteOffset(TIM2_SR+0)]
;timer2.c,10 :: 		if(bitExpectAnswer){
MOVW	R1, #lo_addr(_bitExpectAnswer+0)
MOVT	R1, #hi_addr(_bitExpectAnswer+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_Timer2_interrupt0
;timer2.c,11 :: 		sendRequestStatusToAndroid();
BL	_sendRequestStatusToAndroid+0
;timer2.c,12 :: 		bitExpectAnswer = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(_bitExpectAnswer+0)
MOVT	R0, #hi_addr(_bitExpectAnswer+0)
STR	R1, [R0, #0]
;timer2.c,13 :: 		boatConnected = 0x00;
MOVS	R1, #0
MOVW	R0, #lo_addr(_boatConnected+0)
MOVT	R0, #hi_addr(_boatConnected+0)
STRB	R1, [R0, #0]
;timer2.c,15 :: 		}
L_Timer2_interrupt0:
;timer2.c,17 :: 		}
L_end_Timer2_interrupt:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Timer2_interrupt
