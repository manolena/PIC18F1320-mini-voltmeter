//******************************************************************
//                        main.C
//                     17 OCTOBER 2014
//
// Author: Manos Mar
//
// Started: 10 OCTOBER 2014
//*****************************************************************/*

#include    <pic18.h>                                   //ΗΤ-PICC include file
#include    <stdio.h>                               //ΗΤ-PICC include file
#include    <string.h>                              //ΗΤ-PICC include file
#include    <stddef.h>                              //ΗΤ-PICC include file
#include    <htc.h>                                 //ΗΤ-PICC include file
#include    "defs.h"                                //Local include file
#include    "delay.h"                               //HT-PICC modified local file
#include    "adc.h"                             //HT-PICC modified local file

#define _XTAL_FREQ 8000000  

const char SegCode[11] = {0x40,0x79,0x24,0x30,0x19,0x12,0x02,0x78,0x00,0x10,0xFF};
    //                       0    1    2    3    4    5    6    7    8    9
const char Column[3]   = {0x06,0x0A,0x0C};
static char Segment[3] = {0x06,0x0A,0x0C};
static char ColCount=0x00;
int hundrends = 0;
int tenths = 0;
int units = 0;
int decUnits = 0;
float result;
unsigned int i;

__CONFIG(1, XT ); 
__CONFIG(2, BOREN & WDTDIS & PWRTEN); //BORDIS=brown out reset disabled, WDTDIS=watch dog timer disabled 
__CONFIG(3, MCLREN);
__CONFIG(4, DEBUGEN & LVPDIS & STVRDIS); //DEBUGEN=debug enabled, LVPDIS=low voltage programmin disabled 
__CONFIG(5, UNPROTECT); //unprotected 
__CONFIG(6, WRTEN); //flash write enabled 

//******************************************************************
void main(void)                                     //Έναρξη κύριας ρουτίνας προγράμματος
{   
    Init();
    Adc_Init();
    Init_TMR0();
    
   while(1)
   {
       result=0;
        for (i=0;i<250;i++)
        {
	        TRISA=0b00000001;
            result=result+Adc_Read();                        
            DelayMs(1);
        } 
        TRISA = 0b00000000;
        PORTA=0b01111110;
        PORTB=0b11111111; 
        result= ((result/1023)*11.4*10)/250;
        
result = 10.2;
        disassemblyFloat(result);
        DelayMs(200);
   }
}   
//*******************************************************************
//Initialize Registers
//*******************************************************************
void Init()
{
    OSCTUNE=0x1F;
    OSCCON=0x72;    
    TRISA=0b00000001;       
    TRISB=0b00000000;
}
//*******************************************************************
//Timer1
//*******************************************************************
void Init_TMR0()
{   
    T0PS0=0; //Prescaler is divide by 16
    T0PS1=1;
    T0PS2=1;    
    PSA=0;      //Timer Clock Source is from Prescaler
    T0CS=0;     //Prescaler gets clock from FCPU (5MHz)
    T08BIT=1;   //8 BIT MODE
    TMR0IE=1;   //Enable TIMER0 Interrupt
    PEIE=1;     //Enable Peripheral Interrupt
    GIE=1;      //Enable INTs globally
    TMR0ON=1;      //Now start the timer!
}
//*******************************************************************
//
//*******************************************************************   
void interrupt ISR()
{   
    if(TMR0IE && TMR0IF)
    {
        Display();
        TMR0IF=0;
        TMR0H=0;
        TMR0L=250;
    }
}
//*******************************************************************
void Display()
{
    PORTB=0B11111111;
    if (ColCount>=3) 
    ColCount=0;    
    PORTA = Column[ColCount];
    DelayUs(900);
    PORTB=0B11111111;
    DelayUs(600);
    PORTB = 0b11111111;   // off segment a-f
    Segment[0]=SegCode[tenths];
    Segment[1]=SegCode[units];
    Segment[2]=SegCode[decUnits];
    PORTB = Segment[ColCount];
    DelayUs(600);
    PORTB = 0b01111111;
    ColCount++;             
}
//*******************************************************************
void disassemblyFloat(float value) 
{  
  int digit;
  int places = 1;
  float tens = 0.1;
  int tenscount = 0;
  int i;
  float tempfloat = value;
  float d = 0.5;
  if (value < 0) d *= -1.0;
  for (i = 0; i < places; i++) d/= 10.0;    
  tempfloat +=  d;
  if (value < 0) tempfloat *= -1.0;
  while ((tens * 10.0) <= tempfloat) 
  {
    tens *= 10.0;
    tenscount += 1;
  }
  PORTB = 0b01111111;
  for (i=0; i< tenscount; i++) 
  {
    digit = (int) (tempfloat/tens);
    units = digit;
    tempfloat = tempfloat - ((float)digit * tens);
    tens /= 10.0;
  }
  tenths = (int)value/10;
  if (places <= 0) return;
  for (i = 0; i < places; i++) 
  {
    tempfloat *= 10.0;
    digit = (int) tempfloat;
    decUnits = digit;
    tempfloat = tempfloat - (float) digit;
  }
  PORTB = 0b01111111;
}
