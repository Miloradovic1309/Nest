_Timer2_interrupt:
;timer2.c,4 :: 		void Timer2_interrupt() iv IVT_INT_TIM2 {
;timer2.c,5 :: 		TIM2_SR.UIF = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_SR+0)
MOVT	R0, #hi_addr(TIM2_SR+0)
_SX	[R0, ByteOffset(TIM2_SR+0)]
;timer2.c,8 :: 		countedTimer = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(_countedTimer+0)
MOVT	R0, #hi_addr(_countedTimer+0)
STR	R1, [R0, #0]
;timer2.c,10 :: 		if(bitStart3SecondsCount){
MOVW	R1, #lo_addr(_bitStart3SecondsCount+0)
MOVT	R1, #hi_addr(_bitStart3SecondsCount+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_Timer2_interrupt0
;timer2.c,11 :: 		delay3secndsCount++;
MOVW	R1, #lo_addr(_delay3secndsCount+0)
MOVT	R1, #hi_addr(_delay3secndsCount+0)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;timer2.c,12 :: 		if(delay3secndsCount >= 60){
CMP	R0, #60
IT	LT
BLT	L_Timer2_interrupt1
;timer2.c,13 :: 		bitDelay3Seconds = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(_bitDelay3Seconds+0)
MOVT	R0, #hi_addr(_bitDelay3Seconds+0)
STR	R1, [R0, #0]
;timer2.c,14 :: 		bitStart3SecondsCount = 0;
MOVW	R0, #lo_addr(_bitStart3SecondsCount+0)
MOVT	R0, #hi_addr(_bitStart3SecondsCount+0)
STR	R1, [R0, #0]
;timer2.c,15 :: 		delay3secndsCount = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_delay3secndsCount+0)
MOVT	R0, #hi_addr(_delay3secndsCount+0)
STRH	R1, [R0, #0]
;timer2.c,16 :: 		}
L_Timer2_interrupt1:
;timer2.c,17 :: 		}
L_Timer2_interrupt0:
;timer2.c,20 :: 		}
L_end_Timer2_interrupt:
BX	LR
; end of _Timer2_interrupt
