
#include "EmonLib.h"             // Include Emon Library
EnergyMonitor emon1;             // Create an instance
int incomingByte = 0;
void setup()
{
  Serial.begin(9600);

  emon1.current(1, 111.1);             // Current: input pin, calibration.
  
}

void loop()
{
    if (Serial.available() > 0) {
    // lê do buffer o dado recebido:
    incomingByte = Serial.read();

    if(incomingByte == 49){ // 49 corresponde ao numero 1
      double Irms = emon1.calcIrms(1480);
      Serial.println(Irms);             // Irms
    }
  }
  
  
  
}
