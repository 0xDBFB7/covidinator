/*!
   ADF4351 example program
*/

#include <Arduino.h>
#include "adf4351.h"


#define PIN_SS 3  ///< SPI slave select pin, default value

ADF4351  vfo(PIN_SS, SPI_MODE0, 1000000UL , MSBFIRST) ;


void setup()
{
  Serial.begin(9600) ;
  Wire.begin() ;
  /*!
     setup the chip (for a 10 mhz ref freq)
     most of these are defaults
  */
  vfo.pwrlevel = 0 ; ///< sets to -4 dBm output
  vfo.RD2refdouble = 0 ; ///< ref doubler off
  vfo.RD1Rdiv2 = 0 ;   ///< ref divider off
  vfo.ClkDiv = 150 ;
  vfo.BandSelClock = 80 ;
  vfo.RCounter = 1;  ///< R counter to 1 (no division)
  vfo.ChanStep = steps[2] ;  ///< set to 10 kHz steps

  /*!
     sets the reference frequency to 10 Mhz
  */
  if ( vfo.setrf(25000000UL) ==  0 )
    Serial.println("ref freq set to 10 Mhz") ;
    else
      Serial.println("ref freq set error") ;
      /*!
         initialize the chip
      */
      vfo.init() ;

  /*!
     enable frequency output
  */
  vfo.enable() ;


}



void loop()
{
  if ( vfo.setf(100000000UL) == 0 ) {
    Serial.print("setf() success freq:") ;
    Serial.println(vfo.cfreq) ;
  } else {
    Serial.println("setf() error") ;
  }
  delay(1000);
  

}
