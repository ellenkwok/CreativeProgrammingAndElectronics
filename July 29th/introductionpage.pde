/* 
Introductory page of the game
*/

void introPage() {
  //background
  for (color i : rainbow) {
    fill(i);
    circle(350, 350, circleStart);
    circleStart -= 50;
    if (i == color(0, 0, 0)) {
      fill(94, 90, 99);
      circle(350, 350, circleStart);
    }
  }
  //textbox
  fill(0, 0, 0, 100);
  rect(170, 190, 350, 150);
  PFont f = createFont("Arial", 35);
  textFont(f, 35);
  fill(color(255, 255, 255));
  text("Draw my hair!", 200, 250);
  textFont(f, 20);
  text("- A drawing program", 200, 300);

  //menu bar
  fill(0, 0, 0, 100);
  rect(190, 355, 140, 50);
  rect(340, 355, 140, 50);
  textFont(f, 35);
  fill(color(255, 255, 255));
  text("Draw my hair!", 200, 250);
  textFont(f, 20);
  text("- A drawing program", 200, 300);
  text("Instructions", 210, 380);
  text("Start", 370, 380);
}
