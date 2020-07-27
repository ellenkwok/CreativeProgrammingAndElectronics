/*
  something
*/
unsigned long previousMillis = 0;   // will store last time LED was updated
const long interval = 150;
int ledState = LOW;
int ledN;
int toneN;
int timeS = 200000;

#include "pitches.h"
#include <Servo.h>

Servo myservo;

int melody[] = {
  NOTE_C4, NOTE_G3, NOTE_G3, NOTE_A3, NOTE_G3, 0, NOTE_B3, NOTE_C4
};

// note durations: 4 = quarter note, 8 = eighth note, etc.:
int noteDurations[] = {
  4, 8, 8, 4, 4, 4, 4, 4
};

// constants won't change. They're used here to set pin numbers:
const int buttonPin1 = A2;     // the number of the pushbutton pin
const int buttonPin2 = A3;     // the number of the pushbutton pin
const int buttonPin3 = A4;     // the number of the pushbutton pin
const int buttonPin4 = A5;     // the number of the pushbutton pin
const int ledPin1 =  11;      // the number of the LED pin
const int ledPin2 =  10;      // the number of the LED pin
const int ledPin3 =  9;      // the number of the LED pin
int pos = 0;

// variables will change:
int buttonState1 = 0;         // variable for reading the pushbutton
int buttonState2 = 0;         // variable for reading the pushbutton
int buttonState3 = 0;         // variable for reading the pushbutton
int buttonState4 = 0;         // variable for reading the pushbuttonstatus

void setup() {
  myservo.attach(12);
  // initialize the LED pin as an output:
  pinMode(ledPin1, OUTPUT);
  pinMode(ledPin2, OUTPUT);
  pinMode(ledPin3, OUTPUT);
  // initialize the pushbutton pin as an input:
  pinMode(buttonPin1, INPUT);
  pinMode(buttonPin2, INPUT);
  pinMode(buttonPin3, INPUT);
  pinMode(buttonPin4, INPUT);
}

void serv() {
  if (timeS >= 0) {
    timeS -= 1;
    for (pos = 0; pos <= 180; pos += 1) { // goes from 0 degrees to 180 degrees
      // in steps of 1 degree
      myservo.write(pos);              // tell servo to go to position in variable 'pos'
    }
    for (pos = 180; pos >= 0; pos -= 1) { // goes from 180 degrees to 0 degrees
      myservo.write(pos);              // tell servo to go to position in variable 'pos'                       // waits 15ms for the servo to reach the position
    }
  } else {
    timeS = 200000;
  }
}

void loop() {
  unsigned long currentMillis = millis();

  // read the state of the pushbutton value:
  buttonState1 = digitalRead(buttonPin1);
  buttonState2 = digitalRead(buttonPin2);
  buttonState3 = digitalRead(buttonPin3);
  buttonState4 = digitalRead(buttonPin4);

  serv();
  // check if the pushbutton is pressed. If it is, the buttonState is HIGH:
  if (buttonState1 == HIGH) {
    // turn LED and tune on:
    digitalWrite(ledPin1, HIGH);
    tone(8, melody[0], 100);
  } else {
    // turn LED off:
    digitalWrite(ledPin1, LOW);
  }

  if (buttonState2 == HIGH) {
    // turn LED and tune on:
    digitalWrite(ledPin2, HIGH);
    tone(8, melody[3], 100);
  } else {
    // turn LED off:
    digitalWrite(ledPin2, LOW);
  }

  if (buttonState3 == HIGH) {
    // turn LED and tune on:
    digitalWrite(ledPin3, HIGH);
    tone(8, melody[6], 100);
  } else {
    // turn LED off:
    digitalWrite(ledPin3, LOW);
  }
  if (buttonState4 == HIGH) {
    // turn LED on randomly:
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

      //play random tune
      ledN = random(9, 12);
      digitalWrite(ledN, ledState);
      toneN = random(0, 7);
      tone(8, melody[toneN], 100);

    }

  } else {
    // turn LED off:
    digitalWrite(ledPin1, LOW);
    digitalWrite(ledPin2, LOW);
    digitalWrite(ledPin3, LOW);
  }
}
