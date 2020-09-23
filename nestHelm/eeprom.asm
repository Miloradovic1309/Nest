_EEPROM_24C02_Init:
;eeprom.c,8 :: 		void EEPROM_24C02_Init() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;eeprom.c,10 :: 		I2C1_Init_Advanced(100000, &_GPIO_MODULE_I2C1_PB67);
MOVW	R1, #lo_addr(__GPIO_MODULE_I2C1_PB67+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_I2C1_PB67+0)
MOVW	R0, #34464
MOVT	R0, #1
BL	_I2C1_Init_Advanced+0
;eeprom.c,11 :: 		}//~
L_end_EEPROM_24C02_Init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _EEPROM_24C02_Init
_EEPROM_24C02_WrSingle:
;eeprom.c,12 :: 		void EEPROM_24C02_WrSingle(unsigned short wAddr, unsigned short wData) {
; wData start address is: 4 (R1)
; wAddr start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; wData end address is: 4 (R1)
; wAddr end address is: 0 (R0)
; wAddr start address is: 0 (R0)
; wData start address is: 4 (R1)
;eeprom.c,13 :: 		data_[0] = wAddr;
MOVW	R2, #lo_addr(_data_+0)
MOVT	R2, #hi_addr(_data_+0)
STRB	R0, [R2, #0]
; wAddr end address is: 0 (R0)
;eeprom.c,14 :: 		data_[1] = wData;
MOVW	R2, #lo_addr(_data_+1)
MOVT	R2, #hi_addr(_data_+1)
STRB	R1, [R2, #0]
; wData end address is: 4 (R1)
;eeprom.c,15 :: 		I2C1_Start();
BL	_I2C1_Start+0
;eeprom.c,17 :: 		I2C1_Write(0x50,data_,2,END_MODE_STOP);
MOVW	R3, #1
MOVS	R2, #2
MOVW	R1, #lo_addr(_data_+0)
MOVT	R1, #hi_addr(_data_+0)
MOVS	R0, #80
BL	_I2C1_Write+0
;eeprom.c,18 :: 		}//~
L_end_EEPROM_24C02_WrSingle:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _EEPROM_24C02_WrSingle
_EEPROM_24C02_RdSingle:
;eeprom.c,22 :: 		unsigned short EEPROM_24C02_RdSingle(unsigned int rAddr) {
; rAddr start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; rAddr end address is: 0 (R0)
; rAddr start address is: 0 (R0)
;eeprom.c,23 :: 		data_[0] = rAddr;
MOVW	R1, #lo_addr(_data_+0)
MOVT	R1, #hi_addr(_data_+0)
STRB	R0, [R1, #0]
; rAddr end address is: 0 (R0)
;eeprom.c,24 :: 		I2C1_Start();              // issue I2C start signal
BL	_I2C1_Start+0
;eeprom.c,25 :: 		I2C1_Write(0x50,data_,1,END_MODE_RESTART);
MOVW	R3, #0
MOVS	R2, #1
MOVW	R1, #lo_addr(_data_+0)
MOVT	R1, #hi_addr(_data_+0)
MOVS	R0, #80
BL	_I2C1_Write+0
;eeprom.c,26 :: 		I2C1_Read(0x50,data_,1,END_MODE_STOP);
MOVW	R3, #1
MOVS	R2, #1
MOVW	R1, #lo_addr(_data_+0)
MOVT	R1, #hi_addr(_data_+0)
MOVS	R0, #80
BL	_I2C1_Read+0
;eeprom.c,28 :: 		return data_[0];
MOVW	R1, #lo_addr(_data_+0)
MOVT	R1, #hi_addr(_data_+0)
LDRB	R0, [R1, #0]
;eeprom.c,29 :: 		}
L_end_EEPROM_24C02_RdSingle:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _EEPROM_24C02_RdSingle
_citajeprom:
;eeprom.c,31 :: 		void citajeprom(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;eeprom.c,32 :: 		leftLimit = EEPROM_24C02_RdSingle(2);
MOVS	R0, #2
BL	_EEPROM_24C02_RdSingle+0
MOVW	R1, #lo_addr(_leftLimit+0)
MOVT	R1, #hi_addr(_leftLimit+0)
STRH	R0, [R1, #0]
;eeprom.c,33 :: 		leftLimit = leftLimit << 8;
MOV	R0, R1
LDRH	R0, [R0, #0]
LSLS	R0, R0, #8
STRH	R0, [R1, #0]
;eeprom.c,34 :: 		leftLimit = leftLimit + EEPROM_24C02_RdSingle(1);
MOVS	R0, #1
BL	_EEPROM_24C02_RdSingle+0
MOVW	R2, #lo_addr(_leftLimit+0)
MOVT	R2, #hi_addr(_leftLimit+0)
LDRH	R1, [R2, #0]
ADDS	R0, R1, R0
STRH	R0, [R2, #0]
;eeprom.c,36 :: 		rightLimit= EEPROM_24C02_RdSingle(4);
MOVS	R0, #4
BL	_EEPROM_24C02_RdSingle+0
MOVW	R1, #lo_addr(_rightLimit+0)
MOVT	R1, #hi_addr(_rightLimit+0)
STRH	R0, [R1, #0]
;eeprom.c,37 :: 		rightLimit = rightLimit << 8;
MOV	R0, R1
LDRH	R0, [R0, #0]
LSLS	R0, R0, #8
STRH	R0, [R1, #0]
;eeprom.c,38 :: 		rightLimit = rightLimit + EEPROM_24C02_RdSingle(3);
MOVS	R0, #3
BL	_EEPROM_24C02_RdSingle+0
MOVW	R2, #lo_addr(_rightLimit+0)
MOVT	R2, #hi_addr(_rightLimit+0)
LDRH	R1, [R2, #0]
ADDS	R0, R1, R0
STRH	R0, [R2, #0]
;eeprom.c,40 :: 		dir = EEPROM_24C02_RdSingle(5);
MOVS	R0, #5
BL	_EEPROM_24C02_RdSingle+0
MOVW	R1, #lo_addr(_dir+0)
MOVT	R1, #hi_addr(_dir+0)
STRB	R0, [R1, #0]
;eeprom.c,42 :: 		}
L_end_citajeprom:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _citajeprom
_eprompisi:
;eeprom.c,44 :: 		void eprompisi()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;eeprom.c,46 :: 		EEPROM_24C02_WrSingle(1, Lo(leftLimit));
MOVW	R0, #lo_addr(_leftLimit+0)
MOVT	R0, #hi_addr(_leftLimit+0)
LDRH	R0, [R0, #0]
AND	R0, R0, #255
UXTB	R1, R0
MOVS	R0, #1
BL	_EEPROM_24C02_WrSingle+0
;eeprom.c,47 :: 		Delay_ms(15);
MOVW	R7, #48927
MOVT	R7, #2
NOP
NOP
L_eprompisi0:
SUBS	R7, R7, #1
BNE	L_eprompisi0
NOP
NOP
NOP
;eeprom.c,48 :: 		EEPROM_24C02_WrSingle(2, Hi(leftLimit));
MOVW	R0, #lo_addr(_leftLimit+0)
MOVT	R0, #hi_addr(_leftLimit+0)
LDRH	R0, [R0, #0]
LSRS	R0, R0, #8
UXTB	R1, R0
MOVS	R0, #2
BL	_EEPROM_24C02_WrSingle+0
;eeprom.c,49 :: 		Delay_ms(15);
MOVW	R7, #48927
MOVT	R7, #2
NOP
NOP
L_eprompisi2:
SUBS	R7, R7, #1
BNE	L_eprompisi2
NOP
NOP
NOP
;eeprom.c,50 :: 		EEPROM_24C02_WrSingle(3, Lo(rightLimit));
MOVW	R0, #lo_addr(_rightLimit+0)
MOVT	R0, #hi_addr(_rightLimit+0)
LDRH	R0, [R0, #0]
AND	R0, R0, #255
UXTB	R1, R0
MOVS	R0, #3
BL	_EEPROM_24C02_WrSingle+0
;eeprom.c,51 :: 		Delay_ms(15);
MOVW	R7, #48927
MOVT	R7, #2
NOP
NOP
L_eprompisi4:
SUBS	R7, R7, #1
BNE	L_eprompisi4
NOP
NOP
NOP
;eeprom.c,52 :: 		EEPROM_24C02_WrSingle(4, Hi(rightLimit));
MOVW	R0, #lo_addr(_rightLimit+0)
MOVT	R0, #hi_addr(_rightLimit+0)
LDRH	R0, [R0, #0]
LSRS	R0, R0, #8
UXTB	R1, R0
MOVS	R0, #4
BL	_EEPROM_24C02_WrSingle+0
;eeprom.c,53 :: 		Delay_ms(15);
MOVW	R7, #48927
MOVT	R7, #2
NOP
NOP
L_eprompisi6:
SUBS	R7, R7, #1
BNE	L_eprompisi6
NOP
NOP
NOP
;eeprom.c,54 :: 		EEPROM_24C02_WrSingle(5, Lo(dir));
MOVW	R0, #lo_addr(_dir+0)
MOVT	R0, #hi_addr(_dir+0)
LDRB	R0, [R0, #0]
AND	R0, R0, #255
UXTB	R1, R0
MOVS	R0, #5
BL	_EEPROM_24C02_WrSingle+0
;eeprom.c,55 :: 		Delay_ms(15);
MOVW	R7, #48927
MOVT	R7, #2
NOP
NOP
L_eprompisi8:
SUBS	R7, R7, #1
BNE	L_eprompisi8
NOP
NOP
NOP
;eeprom.c,57 :: 		}
L_end_eprompisi:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _eprompisi
_eepromSaveLeft:
;eeprom.c,59 :: 		void eepromSaveLeft(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;eeprom.c,60 :: 		EEPROM_24C02_WrSingle(1, Lo(leftLimit));
MOVW	R0, #lo_addr(_leftLimit+0)
MOVT	R0, #hi_addr(_leftLimit+0)
LDRH	R0, [R0, #0]
AND	R0, R0, #255
UXTB	R1, R0
MOVS	R0, #1
BL	_EEPROM_24C02_WrSingle+0
;eeprom.c,61 :: 		Delay_ms(15);
MOVW	R7, #48927
MOVT	R7, #2
NOP
NOP
L_eepromSaveLeft10:
SUBS	R7, R7, #1
BNE	L_eepromSaveLeft10
NOP
NOP
NOP
;eeprom.c,62 :: 		EEPROM_24C02_WrSingle(2, Hi(leftLimit));
MOVW	R0, #lo_addr(_leftLimit+0)
MOVT	R0, #hi_addr(_leftLimit+0)
LDRH	R0, [R0, #0]
LSRS	R0, R0, #8
UXTB	R1, R0
MOVS	R0, #2
BL	_EEPROM_24C02_WrSingle+0
;eeprom.c,63 :: 		Delay_ms(15);
MOVW	R7, #48927
MOVT	R7, #2
NOP
NOP
L_eepromSaveLeft12:
SUBS	R7, R7, #1
BNE	L_eepromSaveLeft12
NOP
NOP
NOP
;eeprom.c,64 :: 		}
L_end_eepromSaveLeft:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _eepromSaveLeft
_eepromSaveRight:
;eeprom.c,66 :: 		void eepromSaveRight(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;eeprom.c,67 :: 		EEPROM_24C02_WrSingle(3, Lo(rightLimit));
MOVW	R0, #lo_addr(_rightLimit+0)
MOVT	R0, #hi_addr(_rightLimit+0)
LDRH	R0, [R0, #0]
AND	R0, R0, #255
UXTB	R1, R0
MOVS	R0, #3
BL	_EEPROM_24C02_WrSingle+0
;eeprom.c,68 :: 		Delay_ms(15);
MOVW	R7, #48927
MOVT	R7, #2
NOP
NOP
L_eepromSaveRight14:
SUBS	R7, R7, #1
BNE	L_eepromSaveRight14
NOP
NOP
NOP
;eeprom.c,69 :: 		EEPROM_24C02_WrSingle(4, Hi(rightLimit));
MOVW	R0, #lo_addr(_rightLimit+0)
MOVT	R0, #hi_addr(_rightLimit+0)
LDRH	R0, [R0, #0]
LSRS	R0, R0, #8
UXTB	R1, R0
MOVS	R0, #4
BL	_EEPROM_24C02_WrSingle+0
;eeprom.c,70 :: 		Delay_ms(15);
MOVW	R7, #48927
MOVT	R7, #2
NOP
NOP
L_eepromSaveRight16:
SUBS	R7, R7, #1
BNE	L_eepromSaveRight16
NOP
NOP
NOP
;eeprom.c,71 :: 		}
L_end_eepromSaveRight:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _eepromSaveRight
_eepromDir:
;eeprom.c,73 :: 		void eepromDir(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;eeprom.c,74 :: 		EEPROM_24C02_WrSingle(5, Lo(dir));
MOVW	R0, #lo_addr(_dir+0)
MOVT	R0, #hi_addr(_dir+0)
LDRB	R0, [R0, #0]
AND	R0, R0, #255
UXTB	R1, R0
MOVS	R0, #5
BL	_EEPROM_24C02_WrSingle+0
;eeprom.c,75 :: 		Delay_ms(15);
MOVW	R7, #48927
MOVT	R7, #2
NOP
NOP
L_eepromDir18:
SUBS	R7, R7, #1
BNE	L_eepromDir18
NOP
NOP
NOP
;eeprom.c,76 :: 		}
L_end_eepromDir:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _eepromDir
