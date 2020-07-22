unsigned long previousMillis = 0;   // will store last time LED was updated
const long interval = 200;
int ledState = LOW;
int ledN;

// the setup routine runs once when you press reset:
void setup() {
  // declare pin 9 to be an output:
  pinMode(9, OUTPUT);
  pinMode(10, OUTPUT);
  pinMode(11, OUTPUT);
  pinMode(8, OUTPUT);
}

// the loop routine runs over and over again forever:
void loop() {
  unsigned long currentMillis = millis();

  int switchValue;

  switchValue = digitalRead(A2);

  if (switchValue == HIGH) {
    digitalWrite(8, LOW);
    digitalWrite(9, LOW);
    digitalWrite(10, LOW);
    digitalWrite(11, LOW);
  } else {
    if (currentMillis - previousMillis >= interval) {
      // save the last time you blinked the LED
      previousMillis = currentMillis;

      // if the LED is off turn it on and vice-versa:
      if (ledState == LOW) {
        ledState = HIGH;
      } else {
        ledState = LOW;
      }
      // set the LED with the ledState of the variable:

      ledN = random(8, 12);
      digitalWrite(ledN, ledState);
    }

  }
}
