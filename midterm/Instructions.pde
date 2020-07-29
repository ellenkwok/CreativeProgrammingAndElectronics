/* 
Instruction page graphics
*/

void instructions() {
  noStroke();
  //background
  int circleW = 700;
  for (int n = 0; n < rainbow.length; n++) {
    fill(rainbow[n]);
    circle(350, 350, circleW);
    circleW -= 50;
    if (rainbow[n] == color(0, 0, 0)) {
      fill(94, 90, 99);
      circle(350, 350, circleW);
    }
  }
  //textbox
  fill(0, 0, 0, 100);
  rect(60, 60, 400, 400);
  rect(340, 430, 140, 50);
  //text
  PFont f = createFont("Arial", 35);
  textFont(f, 45);
  fill(color(255, 255, 255));
  text("Instruction", 35, 70);
  textFont(f, 25);
  text("1. Click Start", 80, 120);
  text("2. Draw hair on the character!", 80, 150);
  text("3. Click 'done' when you are ", 80, 180);
  text("   finished! Replay by clicking", 80, 210);
  text("   the restart buttom.", 80, 240);
  text("Tips:", 80, 285);
  text("    1. Avoid hitting the", 80, 315);
  text("       character's face ", 80, 345);
  text("       or she will cry!", 80, 375);
  text("    2. Focus on your task. ", 80, 405);
  text("       Don't get distracted!", 80, 435);
  text("Start", 370, 460);
}
