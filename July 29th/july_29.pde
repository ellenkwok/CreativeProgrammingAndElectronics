import processing.serial.*;
Serial myPort;  // Create object from Serial class

/* Draw my hair game.
 Created by Ellen Kwok - Summer 2020 - Des Inv 23
 */

import processing.sound.*;
SoundFile backgroundMusic;
SoundFile ouch;
SoundFile won;
float brushSize;

//*set up canvas size and sound files. *//
void setup() {
  size(500, 500); 
  noStroke();
  backgroundMusic = new SoundFile(this, "music.wav");
  ouch = new SoundFile(this, "ouch.wav");
  won = new SoundFile(this, "congratz.wav");
  backgroundMusic.amp(0.5);
  won.amp(0.5);
  backgroundMusic.play();
  String portName = Serial.list()[2]; //change the 0 to a 1 or 2 etc. to match your port
  myPort = new Serial(this, portName, 9600);
  myPort.bufferUntil('\n');
}



//*variables needed*//
color[] rainbow = {color(232, 75, 44), color(232, 144, 44), color(232, 201, 44), 
  color(201, 232, 44), color(141, 232, 44), color(33, 209, 92), color(33, 209, 186), 
  color(33, 109, 209), color(59, 33, 209), color(159, 33, 209), 
  color(209, 33, 180), color(209, 33, 89), color(94, 56, 21), color(255, 255, 255), color(128, 128, 128), 
  color(0, 0, 0)};
color currentColor = rainbow[1];
boolean drawingProgram = false;
boolean instructions = false;
color[] thisCanvas = new color[500*500];
boolean text = false;
boolean textB = false;
int ouchCount = 0;
int wonCount = 0;
int circleStart = 700;
int len; 

void serialEvent(Serial myPort) {
  brushSize = float(myPort.readStringUntil('\n'));
}

//*main program*//
void draw() {

  //if the drawing program variable is true, run the drawng program
  if (drawingProgram) {
    //update pixels constantly to update new pen stroke on existing pattern.
    for (int i = 0; i < width * height; i++) {
      pixels[i] = thisCanvas[i];
    }
    updatePixels();
    //if text variables are true, change dialogue accordingly
    if (text) {
      changeText("Ouch! Don't hit my face!");
    } else if (textB) {
      changeText("Where are you going?");
    } else {
      changeText("Draw my hair!");
      ouchCount = 0;
    }
    //if "restart" is pressed, reset the canvas
    if (mousePressed && mouseY >450 && mouseY <480 && mouseX > 360 && mouseX <480) {
      canvasSetup();
      wonCount = 0;
    }
    //if "done" is pressed, generate congratulation message and sound effect
    if (mousePressed && mouseY >450 && mouseY <480 && mouseX > 25 && mouseX <50) {
      fill(198, 177, 227);
      rect(40, 200, 420, 100);
      fill(color(255, 255, 255));
      PFont f = createFont("Arial", 20);
      textFont(f, 25);
      text("Thank you! I look so pretty now:D", 60, 250);
      if (wonCount == 0) {
        won.play();
        wonCount += 1;
      }
    }
  } 
  //if instructions variable is true, display the instructions page
  else if (instructions) {
    instructions();
    //if "start" is pressed, set the drawing program variable to true(which will trigger it running during the next loop
    if (mousePressed && mouseY >430 && mouseY <470 && mouseX > 300 && mouseX <450) {
      drawingProgram = true;
      instructions = false;
      canvasSetup();
      //draw!
      if (mousePressed) {
        fill(currentColor);
        ellipse(mouseX, mouseY, brushSize, brushSize);
      }
    }
    noLoop();
  } else {
    //show intro page
    introPage();
    //if "instructions" is pressed, set instructions variable to true and display instructions page
    if (mousePressed && mouseY >355 && mouseY <405 && mouseX > 190 && mouseX <340) {
      instructions = true;
      instructions();
    }
    //if "start" is pressed, set the drawing program variable to true(which will trigger it running during the next loop
    else if (mousePressed && mouseY >355 && mouseY <405 && mouseX > 340 && mouseX <480) {
      drawingProgram = true;
      instructions = false;
      canvasSetup();
      //draw!
      if (mousePressed) {
        fill(currentColor);
        ellipse(mouseX, mouseY, brushSize, brushSize);
      }
    }
    noLoop();
  }
} 


//controlls what happens when user drags cursor across canvas
void mouseDragged() {
  loadPixels();
  //ensures that this only runs when drawing program is active
  if (drawingProgram) { 
    //if the cursor touches the character's face, set the first text variable to true and play the 'ouch' sound effect
    if (mouseY >200 && mouseY <330 && mouseX > 170 && mouseX <320) {
      text = true;
      if (ouchCount == 0) {
        ouch.play();
        ouchCount += 1;
      }
    } //if the cursor is too far away from the character's face, set the first text variable to true and play the 'ouch' sound effect
    else if (mouseY >430 || mouseY <50 || mouseX > 430 || mouseX <70) {
      textB = true;
      if (ouchCount == 0) {
        ouch.play();
        ouchCount += 1;
      }
    } else {
      text = false;
      textB = false;
    }
    //set the current brush color to the color touched by the cursor
    color clicked = pixels[mouseY*500 + mouseX];
    for (color i : rainbow) {
      if (i == clicked && mouseY <=150) {
        currentColor = clicked;
      } else {
        fill(currentColor);
        ellipse(mouseX, mouseY, brushSize, brushSize);
      }
    }
    //if "restart" is pressed, reset the canvas and reset the wonCount for sound effect
    if (mousePressed && mouseY >450 && mouseY <480 && mouseX > 360 && mouseX <480) {
      canvasSetup();
      wonCount = 0;
    }
    //if "done" is pressed, generate congratulation message and sound effect
    if (mousePressed && mouseY >450 && mouseY <480 && mouseX > 25 && mouseX <50) {
      fill(198, 177, 227);
      rect(40, 200, 420, 100);
      fill(color(255, 255, 255));
      PFont f = createFont("Arial", 25);
      textFont(f, 25);
      text("Thank you! I look so pretty now:D", 60, 250);
      if (wonCount == 0) {
        won.play();
        wonCount += 1;
      }
    }
    //load pixel and store pixel information in an array, update the canvas accordingly in the draw() function when draw program is true
    loadPixels();
    for (int n = 0; n < width * height; n++) {
      thisCanvas[n] = pixels[n];
    }
  }
  loop();
} 
