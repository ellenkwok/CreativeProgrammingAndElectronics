/* 
Useful functions for the main program
*/

//overlay the textbox and 'change' the dialogue shown
void changeText(String text) {
  fill(55, 63, 64);
  rect(70, 400, 360, 50);
  PFont f = createFont("Arial", 25);
  textFont(f, 25);
  color myFavoriteColor =color(255, 255, 255);
  fill(myFavoriteColor);
  text(text, 100, 430);
}

//draw the canvas with the girl 
void canvasSetup() {
  //big background square
  fill(248, 245, 255);
  square(25, 25, 450);

  //face
  fill(237, 213, 198);
  rect(150, 176, 200, 188);

  //eyes
  for (int n=0; n<2; n++) {
    pushMatrix();
    fill(31, 16, 9);
    ellipse(200, 280, 17, 35);
    fill(248, 245, 255, 180);
    ellipse(203.5, 273, 5, 8);
    popMatrix();
    translate(100, 0);
  }
  translate(-200, 0);

  //neck + body
  fill(237, 213, 198);
  triangle(250, 300, 230, 475, 280, 475);

  //mouth - pink piece
  fill(227, 93, 111, 190);
  ellipse(250, 300, 40, 20);

  //mouth - skin piece
  fill(237, 213, 198);
  ellipse(250, 298, 45, 17);

  int width = 55;
  int height = 45;
  for (color i : rainbow) { 
    fill(i);
    square(width, height, 35);
    width+= 50;
    if (width >=420) {
      width = 55;
      height += 50;
    }
  }

  //speech bubble
  fill(55, 63, 64);
  rect(70, 400, 360, 50);
  PFont f = createFont("Arial", 25);
  textFont(f, 25);
  fill(color(255, 255, 255));
  text("Draw my hair!", 200, 430);

  //restart key
  fill(0, 0, 0, 150);
  rect(360, 450, 110, 25);
  fill(color(255, 255, 255));
  textFont(f, 20);
  text("Restart", 380, 470);

  //done key
  fill(0, 0, 0, 150);
  rect(25, 450, 120, 25);
  fill(color(255, 255, 255));
  textFont(f, 20);
  text("Done!", 40, 470);
}
