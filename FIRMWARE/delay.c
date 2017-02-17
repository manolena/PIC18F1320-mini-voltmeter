//===================================================================
//                        DELAY.C
//                     17 OCTOBER 2014
//
// Author: Manos Mar
//
// Started: 10 OCTOBER 2014
//===================================================================
// *	Delay functions
// *	See delay.h for details
// *
// *	Make sure this code is compiled with full optimization!!!
//===================================================================

#include	"delay.h"
//===================================================================
void DelayMs(unsigned int cnt)
{
#if	XTAL_FREQ <= 2MHZ
	do {
		DelayUs(996);
	} while(--cnt);
#endif

#if XTAL_FREQ >16MHZ
	unsigned char	i;
	do {
		i = 100;
		do {
			DelayUs(10);
		} while(--i);
	} while(--cnt);
#else
 #if    XTAL_FREQ > 2MHZ
 	unsigned char	i;
 	do {
 		i = 3;
 		do {
 			DelayUs(220);//250
 		} while(--i);
 	} while(--cnt);
 #endif
#endif
}
