
	; HI-TECH C PRO for the PIC18 MCU Family V9.63PL3
	; Copyright (C) 1984-2009 HI-TECH Software
	;Serial no. HCPIC18P-36668
	;This licence will expire on Tue, 11 Dec 2029

	; Auto-generated runtime startup code for final link stage.

	;
	; Compiler options:
	;
	; -oVoltmeter.cof -mVoltmeter.map --summary=default --output=default \
	; adc.p1 delay.p1 main.p1 --chip=18F1320 -P --runtime=default \
	; --opt=default -D__DEBUG=1 -g --asmlist \
	; --errformat=Error   [%n] %f; %l.%c %s --msgformat=Advisory[%n] %s \
	; --warnformat=Warning [%n] %f; %l.%c %s
	;


	GLOBAL	_main,start,_exit
	FNROOT	_main

	pic18cxx	equ	1

	psect	config,class=CONFIG,delta=1
	psect	idloc,class=IDLOC,delta=1
	psect	eeprom_data,class=EEDATA,delta=1
	psect	const,class=CODE,delta=1,reloc=2
	psect	smallconst,class=SMALLCONST,delta=1,reloc=2
	psect	mediumconst,class=MEDIUMCONST,delta=1,reloc=2
	psect	rbss,class=COMRAM,space=1
	psect	bss,class=RAM,space=1
	psect	rdata,class=COMRAM,space=1
	psect	irdata,class=CODE,space=0,reloc=2
	psect	bss,class=RAM,space=1
	psect	data,class=RAM,space=1
	psect	idata,class=CODE,space=0,reloc=2
	psect	nvram,class=NVRAM,space=1
	psect	nvrram,class=COMRAM,space=1
	psect	nvbit,class=COMRAM,bit,space=1
	psect	temp,ovrld,class=COMRAM,space=1
	psect	struct,ovrld,class=COMRAM,space=1
	psect	rbit,class=COMRAM,bit,space=1
	psect	bigbss,class=BIGRAM,space=1
	psect	bigdata,class=BIGRAM,space=1
	psect	ibigdata,class=CODE,space=0,reloc=2
	psect	farbss,class=FARRAM,space=0,reloc=2,delta=1
	psect	fardata,class=FARRAM,space=0,reloc=2,delta=1
	psect	ifardata,class=CODE,space=0,reloc=2,delta=1

	psect	reset_vec,class=CODE,delta=1,reloc=2
	psect	powerup,class=CODE,delta=1,reloc=2
	psect	intcode,class=CODE,delta=1,reloc=2
	psect	intcodelo,class=CODE,delta=1,reloc=2
	psect	intret,class=CODE,delta=1,reloc=2
	psect	intentry,class=CODE,delta=1,reloc=2

	psect	intsave_regs,class=BIGRAM,space=1
	psect	init,class=CODE,delta=1,reloc=2
	psect	text,class=CODE,delta=1,reloc=2
GLOBAL	intlevel0,intlevel1,intlevel2
intlevel0:
intlevel1:
intlevel2:
GLOBAL	intlevel3
intlevel3:
	psect	end_init,class=CODE,delta=1,reloc=2
	psect	clrtext,class=CODE,delta=1,reloc=2


; User config settings for word 1
;
	psect config
	org 0
	dw 0x39FF

; User config settings for word 2
;
	psect config
	org 2
	dw 0xFEFE

; User config settings for word 3
;
	psect config
	org 4
	dw 0xFBFF

; User config settings for word 4
;
	psect config
	org 6
	dw 0xFF3A

; User config settings for word 5
;
	psect config
	org 8
	dw 0xFFFF

; User config settings for word 6
;
	psect config
	org 10
	dw 0xFFFF
	psect	rparam,class=COMRAM,space=1
	psect	param0,class=BANK0,space=1
wreg	EQU	0FE8h
fsr0l	EQU	0FE9h
fsr0h	EQU	0FEAh
fsr1l	EQU	0FE1h
fsr1h	EQU	0FE2h
fsr2l	EQU	0FD9h
fsr2h	EQU	0FDAh
postinc0	EQU	0FEEh
postdec0	EQU	0FEDh
postinc1	EQU	0FE6h
postdec1	EQU	0FE5h
postinc2	EQU	0FDEh
postdec2	EQU	0FDDh
tblptrl	EQU	0FF6h
tblptrh	EQU	0FF7h
tblptru	EQU	0FF8h
tablat		EQU	0FF5h

	GLOBAL __accesstop
__accesstop EQU 128
	PSECT	ramtop,class=RAM
	GLOBAL	__S1			; top of RAM usage
	GLOBAL	__ramtop
	GLOBAL	__LRAM,__HRAM
__ramtop:

	PSECT	reset_vec
reset_pos:
	nop	; NOP for reset vector (precedes GOTO instruction)
	goto	start

	PSECT	init
start:
_exit:
; fardata psect  - 0 bytes to load

; farbss psect  - 0 bytes to clear

; bigdata psect - 0 bytes to load

; data0 psect - 3 bytes to load
GLOBAL	__Ldata0,__Lidata
	lfsr	0,__Ldata0
	; load TBLPTR registers with __Lidata
	movlw	low (__Lidata)
	movwf	tblptrl
	movlw	high(__Lidata)
	movwf	tblptrh
	lfsr	1,3	; loop variable
	call	copy_data

	lfsr	0,78
	movlw	12	; loop counter
clear_1:
	clrf	postinc0,c	; clear, increment FSR0
	decf	wreg,c	; decrement loop counter
	bnz	clear_1
	PSECT	end_init
	GLOBAL	__Lmediumconst
	movlw	low highword(__Lmediumconst)
	movwf	tblptru
	goto	_main		;go do the main stuff
; Copy the ROM data image to destination in RAM
copy_data:
	tblrd	*+
	movff	tablat,postinc0
	decf	fsr1l,f	;decrement loop variable
	bnz	copy_data
	return

	END	reset_pos
