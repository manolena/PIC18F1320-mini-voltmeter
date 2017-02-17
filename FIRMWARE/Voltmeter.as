opt subtitle "HI-TECH Software Omniscient Code Generator (PRO mode) build 5239"

opt pagewidth 120

	opt pm

	processor	16F84A
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
# 18 "C:\MICROCHIP\16F84 VOLTMETER\main.c"
	psect config,class=CONFIG,delta=2 ;#
# 18 "C:\MICROCHIP\16F84 VOLTMETER\main.c"
	dw 0x3FFF & 0x3FFB & 0x3FFF & 0x3FF7 ;#
	FNROOT	_main
	global	_EEADR
psect	maintext,local,class=CODE,delta=2
global __pmaintext
__pmaintext:
_EEADR  equ     9
	global	_EEDATA
_EEDATA  equ     8
	global	_FSR
_FSR  equ     4
	global	_INDF
_INDF  equ     0
	global	_INTCON
_INTCON  equ     11
	global	_PCL
_PCL  equ     2
	global	_PCLATH
_PCLATH  equ     10
	global	_PORTA
_PORTA  equ     5
	global	_PORTB
_PORTB  equ     6
	global	_RTCC
_RTCC  equ     1
	global	_STATUS
_STATUS  equ     3
	global	_TMR0
_TMR0  equ     1
	global	_CARRY
_CARRY  equ     24
	global	_DC
_DC  equ     25
	global	_EEIE
_EEIE  equ     94
	global	_ENTER
_ENTER  equ     49
	global	_GIE
_GIE  equ     95
	global	_INT
_INT  equ     48
	global	_INTE
_INTE  equ     92
	global	_INTF
_INTF  equ     89
	global	_NEXT
_NEXT  equ     50
	global	_PD
_PD  equ     27
	global	_PREV
_PREV  equ     48
	global	_RA0
_RA0  equ     40
	global	_RA1
_RA1  equ     41
	global	_RA2
_RA2  equ     42
	global	_RA3
_RA3  equ     43
	global	_RA4
_RA4  equ     44
	global	_RB0
_RB0  equ     48
	global	_RB1
_RB1  equ     49
	global	_RB2
_RB2  equ     50
	global	_RB3
_RB3  equ     51
	global	_RB4
_RB4  equ     52
	global	_RB5
_RB5  equ     53
	global	_RB6
_RB6  equ     54
	global	_RB7
_RB7  equ     55
	global	_RBIE
_RBIE  equ     91
	global	_RBIF
_RBIF  equ     88
	global	_RP0
_RP0  equ     29
	global	_T0IE
_T0IE  equ     93
	global	_T0IF
_T0IF  equ     90
	global	_TO
_TO  equ     28
	global	_ZERO
_ZERO  equ     26
	global	_EECON1
_EECON1  equ     136
	global	_EECON2
_EECON2  equ     137
	global	_OPTION
_OPTION  equ     129
	global	_TRISA
_TRISA  equ     133
	global	_TRISB
_TRISB  equ     134
	global	_EEIF
_EEIF  equ     1092
	global	_INTEDG
_INTEDG  equ     1038
	global	_PS0
_PS0  equ     1032
	global	_PS1
_PS1  equ     1033
	global	_PS2
_PS2  equ     1034
	global	_PSA
_PSA  equ     1035
	global	_RBPU
_RBPU  equ     1039
	global	_RD
_RD  equ     1088
	global	_T0CS
_T0CS  equ     1037
	global	_T0SE
_T0SE  equ     1036
	global	_TRISA0
_TRISA0  equ     1064
	global	_TRISA1
_TRISA1  equ     1065
	global	_TRISA2
_TRISA2  equ     1066
	global	_TRISA3
_TRISA3  equ     1067
	global	_TRISA4
_TRISA4  equ     1068
	global	_TRISB0
_TRISB0  equ     1072
	global	_TRISB1
_TRISB1  equ     1073
	global	_TRISB2
_TRISB2  equ     1074
	global	_TRISB3
_TRISB3  equ     1075
	global	_TRISB4
_TRISB4  equ     1076
	global	_TRISB5
_TRISB5  equ     1077
	global	_TRISB6
_TRISB6  equ     1078
	global	_TRISB7
_TRISB7  equ     1079
	global	_WR
_WR  equ     1089
	global	_WREN
_WREN  equ     1090
	global	_WRERR
_WRERR  equ     1091
	file	"Voltmeter.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initationation code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	??_main
??_main: ;@ 0x0
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	?_main
?_main: ;@ 0x0
;Data sizes: Strings 0, constant 0, data 0, bss 0, persistent 0 stack 0
;Auto spaces:   Size  Autos    Used
; COMMON           0      0       0
; BANK0           66      0       0


;Pointer list with targets:



;Main: autosize = 0, tempsize = 0, incstack = 0, save=0


;Call graph:                      Base Space Used Autos Args Refs Density
;_main                                                0    0    0   0.00
; Estimated maximum call depth 0
; Address spaces:

;Name               Size   Autos  Total    Cost      Usage
;BITCOMMON            0      0       0       0        0.0%
;NULL                 0      0       0       0        0.0%
;CODE                 0      0       0       0        0.0%
;COMMON               0      0       0       1        0.0%
;SFR0                 0      0       0       1        0.0%
;BITSFR0              0      0       0       1        0.0%
;SFR1                 0      0       0       2        0.0%
;BITSFR1              0      0       0       2        0.0%
;STACK                0      0       0       2        0.0%
;BITBANK0            42      0       0       3        0.0%
;BANK0               42      0       0       4        0.0%
;ABS                  0      0       0       5        0.0%
;DATA                 0      0       0       6        0.0%
;EEDATA              40      0       0    1000        0.0%

	global	_main
psect	maintext

; *************** function _main *****************
; Defined at:
;		line 41 in file "C:\MICROCHIP\16F84 VOLTMETER\main.c"
; Parameters:    Size  Location     Type
;		None
; Auto vars:     Size  Location     Type
;		None
; Return value:  Size  Location     Type
;		None               void
; Registers used:
;		None
; Tracked objects:
;		On entry : 17F/0
;		On exit  : 17F/0
;		Unchanged: FFFFFE80/0
; Data sizes:     COMMON   BANK0
;      Locals:         0       0
;      Temp:     0
;      Total:    0
; This function calls:
;		Nothing
; This function is called by:
;		Startup code after reset
; This function uses a non-reentrant model
; 
psect	maintext
	file	"C:\MICROCHIP\16F84 VOLTMETER\main.c"
	line	41
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
;pic1684.h: 17: volatile unsigned char INDF @ 0x00;
;pic1684.h: 18: volatile unsigned char RTCC @ 0x01;
;pic1684.h: 19: volatile unsigned char TMR0 @ 0x01;
;pic1684.h: 20: volatile unsigned char PCL @ 0x02;
;pic1684.h: 21: volatile unsigned char STATUS @ 0x03;
;pic1684.h: 22: unsigned char FSR @ 0x04;
;pic1684.h: 23: volatile unsigned char PORTA @ 0x05;
;pic1684.h: 24: volatile unsigned char PORTB @ 0x06;
;pic1684.h: 25: volatile unsigned char EEDATA @ 0x08;
;pic1684.h: 26: volatile unsigned char EEADR @ 0x09;
	
_main:	
	opt stack 8
; Regs used in _main: []
	
l16:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
; =============== function _main ends ============

psect	maintext
	line	45
	signat	_main,88
	end
