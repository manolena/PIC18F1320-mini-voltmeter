//******************************************************************
//                        DEFS.H
//                     17 OCTOBER 2014
//
// Author: Manos Mar
//
// Started: 10 OCTOBER 2014
//******************************************************************
#include	<pic18.h>
#include 	<htc.h>
#define PortBit(port,bit)	((unsigned)&(port)*8+(bit))

extern void adc_read_volts();
extern void Init();
extern void Init_TMR0();
extern void Display();
extern void disassemblyFloat(float value);

