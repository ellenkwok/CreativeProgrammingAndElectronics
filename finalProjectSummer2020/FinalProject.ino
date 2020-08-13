#include <NewPing.h>

#define TRIGGER_PIN  4  
#define ECHO_PIN     3  
#define MAX_DISTANCE 300 

int sensorValue;
float duration, distance;

NewPing sonar(TRIGGER_PIN, ECHO_PIN, MAX_DISTANCE); 

void setup() {
  Serial.begin(9600);
  pinMode(4, OUTPUT);
  pinMode(3, INPUT);
  pinMode(2, INPUT);
}

void loop() {
  for (int thisSensor = 0; thisSensor < 3; thisSensor++) {
    int sensorValue = analogRead(thisSensor) / 4;
    Serial.print(sensorValue);
    if (thisSensor == 2) {
      Serial.print(",");
      Serial.print(sonar.ping_cm());
      Serial.println();
    }
    else {
      Serial.print(",");
    }
  }

}
