//******************************************************************
//                        ADC.C
//                     17 OCTOBER 2014
//
// Author: Manos Mar
//
// Started: 10 OCTOBER 2014
//******************************************************************

#include	<pic18.h>
#include	"adc.h"


void Adc_Init()
{
	ADCON0=0b00000000;
	ADCON1=0b01111110;
	ADCON2=0b10100001;
	ADON=1;  //switch on the adc module
	GODONE=1;  //Start conversion
}

unsigned int Adc_Read()
{	
	GODONE=1;
	while(GODONE)
	{
		return ADRES;
	}
}

