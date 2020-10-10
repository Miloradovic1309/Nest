_lightControlSwitches:
;lightControl.c,5 :: 		void lightControlSwitches(){
;lightControl.c,38 :: 		if(navigationLightState_old != navigationLightState){
MOVW	R0, #lo_addr(_navigationLightState+0)
MOVT	R0, #hi_addr(_navigationLightState+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_navigationLightState_old+0)
MOVT	R0, #hi_addr(_navigationLightState_old+0)
LDRH	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L_lightControlSwitches0
;lightControl.c,40 :: 		navigationLightState_old = navigationLightState;
MOVW	R2, #lo_addr(_navigationLightState+0)
MOVT	R2, #hi_addr(_navigationLightState+0)
LDRH	R1, [R2, #0]
MOVW	R0, #lo_addr(_navigationLightState_old+0)
MOVT	R0, #hi_addr(_navigationLightState_old+0)
STRH	R1, [R0, #0]
;lightControl.c,41 :: 		LIGHT_NAVIGATION = navigationLightState;
MOV	R0, R2
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(LIGHT_NAVIGATION+0)
MOVT	R0, #hi_addr(LIGHT_NAVIGATION+0)
_SX	[R0, ByteOffset(LIGHT_NAVIGATION+0)]
;lightControl.c,44 :: 		}
L_lightControlSwitches0:
;lightControl.c,47 :: 		if(interiorLightState_old != interiorLightState){
MOVW	R0, #lo_addr(_interiorLightState+0)
MOVT	R0, #hi_addr(_interiorLightState+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_interiorLightState_old+0)
MOVT	R0, #hi_addr(_interiorLightState_old+0)
LDRH	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L_lightControlSwitches1
;lightControl.c,48 :: 		interiorLightState_old = interiorLightState;
MOVW	R2, #lo_addr(_interiorLightState+0)
MOVT	R2, #hi_addr(_interiorLightState+0)
LDRH	R1, [R2, #0]
MOVW	R0, #lo_addr(_interiorLightState_old+0)
MOVT	R0, #hi_addr(_interiorLightState_old+0)
STRH	R1, [R0, #0]
;lightControl.c,49 :: 		LIGHT_INTERIOR = interiorLightState;
MOV	R0, R2
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(LIGHT_INTERIOR+0)
MOVT	R0, #hi_addr(LIGHT_INTERIOR+0)
_SX	[R0, ByteOffset(LIGHT_INTERIOR+0)]
;lightControl.c,50 :: 		}
L_lightControlSwitches1:
;lightControl.c,51 :: 		}
L_end_lightControlSwitches:
BX	LR
; end of _lightControlSwitches
