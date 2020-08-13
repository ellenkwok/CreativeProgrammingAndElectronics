import processing.serial.*;
import processing.sound.*;
SoundFile piano;
SoundFile pop;
PImage bubble1;
PImage bubble2;
PImage bubble3;
PImage bubble4;
PImage fishA;
PImage fishB;
PImage flowerB;
PImage flowerC;
public PImage[] fishes = new PImage[5];
public PImage[] bubbles = new PImage[6];
Serial myPort; 
int val;  
float acceleration;
float inByte;
boolean wait;
PImage pondB;
PImage pond;
static float potenReading, lightReading, buttonReading, distanceReading;
boolean notPop = true;

void setup() {
  size(1200, 800);
  wait = true;
  //load up images
  bubbles[0] = loadImage("bubble1.png");
  bubbles[1] = loadImage("bubble2.png");
  bubbles[2] = loadImage("bubble3.png");
  bubbles[3] = loadImage("bubble4.png");
  fishes[0] = loadImage("koiA.png");
  fishes[1] = loadImage("koiB.png");
  fishes[2] = loadImage("koiC.png");
  fishes[3] = loadImage("koiD.png");
  fishes[4] = loadImage("koiE.png");
  pond = loadImage("pond.png");
  pondB = loadImage("pondB.png");
  fishA = loadImage("fishA.png");
  fishB = loadImage("fishB.png");
  bubbles[4] = loadImage("flowerB.png");
  bubbles[5] = loadImage("flowerC.png");
  //setup cursor image
  cursor(fishA);
  //background music
  piano = new SoundFile(this, "piano.wav");
  pop = new SoundFile(this, "pop.wav");
  piano.play();
  piano.amp(0.3);
  piano.loop();
  //connect Arduino
  String portName = Serial.list()[2]; 
  myPort = new Serial(this, portName, 9600);
  myPort.bufferUntil('\n');
}

boolean bubbleA, bubbleB, bubbleC, bubbleD, bubbleE, bubbleF, bubbleG, bubbleH = false;
int bubbleCount = 0;

//fish to the left
Fish koi1 = new Fish(1200, 0);
Fish koi2 = new Fish(1300, 1);
Fish koi3 = new Fish(1600, 1);
Fish koi4 = new Fish(1320, 0);
Fish koi5 = new Fish(2430, 4);
Fish koi6 = new Fish(1730, 4);
Fish koi7 = new Fish(1540, 1);
Fish koi8 = new Fish(1430, 4);
//fish to the right
Fish koi9 = new Fish(-500, 2);
Fish koi10 = new Fish(-1300, 2);
Fish koi11 = new Fish(-1000, 2);
Fish koi12 = new Fish(-900, 3);
Fish koi13 = new Fish(-520, 3);
Fish koi14 = new Fish(-1030, 3);
//bubbles
Bubble bubble01 = new Bubble(int(random(600)), 0, int(random(650)));
Bubble bubble02 = new Bubble(int(random(600)), 1, int(random(650)));
Bubble bubble03 = new Bubble(int(random(600)), 2, int(random(650)));
Bubble bubble04 = new Bubble(int(random(600)), 3, int(random(650)));
Bubble bubble05 = new Bubble(int(random(600)), 2, int(random(650)));
Bubble bubble06 = new Bubble(int(random(600)), 0, int(random(650)));
Bubble bubble07 = new Bubble(int(random(600)), 1, int(random(650)));
Bubble bubble08 = new Bubble(int(random(600)), 3, int(random(650)));

void draw() {
  if (wait) {
    return;
  }
  image(pondB, 0, 0);
  tint(255, lightReading);
  image(pond, 0, 0);
  tint( 255, 255 );
  koi1.swimLeft(540, 195, 80, acceleration);
  koi2.swimLeft(420, 180, 80, acceleration);
  koi3.swimLeft(250, 240, 120, acceleration);
  koi4.swimLeft(250, 230, 115, acceleration);
  koi5.swimLeft(520, 220, 110, acceleration);
  koi6.swimLeft(620, 200, 100, acceleration);
  koi7.swimLeft(130, 250, 120, acceleration);
  koi8.swimLeft(380, 150, 60, acceleration);

  koi9.swimRight(540, 230, 120, acceleration);
  koi10.swimRight(340, 195, 80, acceleration);
  koi11.swimRight(420, 180, 80, acceleration);
  koi12.swimRight(320, 240, 125, acceleration);
  koi13.swimRight(250, 200, 100, acceleration);
  koi14.swimRight(520, 220, 110, acceleration);
  if (distanceReading > 8 || distanceReading <3) {
    if (bubbleCount > 1 && bubbleA == false) {
      bubbleA = true;
    }
    if (bubbleCount > 10 && bubbleB == false) {
      bubbleB = true;
      notPop = true;
    }
    if (bubbleCount > 20 && bubbleC == false) {
      bubbleC = true;
      notPop = true;
    }
    if (bubbleCount > 30 && bubbleD == false) {
      bubbleD = true;
      notPop = true;
    }
    if (bubbleCount > 40 && bubbleE == false) {
      bubbleE = true;
      notPop = true;
    }
    if (bubbleCount > 50 && bubbleF == false) {
      bubbleF = true;
      notPop = true;
    }
    if (bubbleCount > 60 && bubbleG == false) {
      bubbleG = true;
      notPop = true;
    }
    if (bubbleCount > 70 && bubbleH == false) {
      bubbleH = true;
      notPop = true;
    }
  } else if (bubbleCount >5) {
    if (notPop) {
      pop.play();
    }
    if (bubbleA) {
      bubble01.bubbleCord = 4;
    }
    if (bubbleB) {
      bubble02.bubbleCord = 5;
    }
    if (bubbleC) {
      bubble03.bubbleCord = 5;
    }
    if (bubbleD) {
      bubble04.bubbleCord = 4;
    }
    if (bubbleE) {
      bubble05.bubbleCord = 5;
    }
    if (bubbleF) {
      bubble06.bubbleCord = 4;
    }
    if (bubbleG) {
      bubble07.bubbleCord = 5;
    } 
    if (bubbleH) {
      bubble08.bubbleCord = 4;
    }
    notPop = false;
  }
  if (bubbleA) {
    bubble01.goLeft(150, 150);
  }
  if (bubbleB) {
    bubble02.goLeft(130, 130);
  }
  if (bubbleC) {
    bubble03.goRight(100, 100);
  }
  if (bubbleD) {
    bubble04.goLeft(170, 170);
  }
  if (bubbleE) {
    bubble05.goRight(160, 160);
  }
  if (bubbleF) {
    bubble06.goRight(145, 145);
  }
  if (bubbleG) {
    bubble07.goLeft(120, 120);
  }
  if (bubbleH) {
    bubble08.goRight(120, 120);
  }
  if (buttonReading <10) {
    bubbleCount += 1;
  }
}

void serialEvent(Serial myPort) {
  String myString = myPort.readStringUntil('\n');
  if (myString != null) {
    myString = trim(myString);
    int sensors[] = int(split(myString, ','));

    for (int sensorNum = 0; sensorNum < sensors.length; sensorNum++) {
    }
    if (sensors.length > 3) {
      lightReading= sensors[0];
      potenReading = sensors[1];
      buttonReading = sensors[2];
      distanceReading = sensors[3];
      println(sensors);
      acceleration = potenReading/50;
    }
  }
}

void keyPressed(){
  if (key == ' ') {
    wait = false;
  }
}
