int output;
// this constant won't change:
const int  buttonPin = 2;    // the pin that the pushbutton is attached to

int buttonState = 0;         // current state of the button
int lastButtonState = 0;     // previous state of the button

void setup()
{
  // initialize the button pin as a input:
  pinMode(buttonPin, INPUT);
  Serial.begin(9600);
}
void loop()
{
  //potentialmeter
  output = analogRead(A0);
  int new_output = map(output, 0, 1023, 0, 255);
  Serial.println(new_output);
  delay(50);
  //button
  // read the pushbutton input pin:
  buttonState = digitalRead(buttonPin);

  // compare the buttonState to its previous state
  if (buttonState != lastButtonState) {
    // if the state has changed, increment the counter
    if (buttonState == HIGH) {
      // if the current state is HIGH then the button went from off to on:
      Serial.print("HIGH\n");
    } else {
      // if the current state is LOW then the button went from on to off:
      Serial.print("LOW\n");
    }
    // Delay a little bit to avoid bouncing
    delay(50);
  }
  // save the current state as the last state, for next time through the loop
  lastButtonState = buttonState;
}
