void setup() {
  size(500, 500);
  background(210, 204, 219);
  smooth();
  noStroke();
}

void draw(){
  //background
  fill(210, 204, 219);
  square(0,0,500);
  //background
  
  //eyes in the background 
  int width = 0;
  int height = 0;
  while (height < 500){
    while (width < 500) {
      pushMatrix();
      translate(width, height);
      fill(145, 130, 161);
      circle(56, 25, 55);
      fill(210, 204, 219);
      circle(56, 18, 63);
      fill(145, 130, 161);
      triangle(32 ,58, 39, 45, 43, 47);
      triangle(78 ,58, 67, 47, 74, 49);
      triangle(54 ,50, 56, 64, 58, 49);
      popMatrix();
      width += 100;
    }
    width = 0;
    height += 80;
  }
  //eyes in the background
  
  //shadow on the ground
  int shadowW = 320;
  int shadowH = 125;
  int heights = 378;
  while (shadowW > 10 && shadowH > 5) {
    fill(15, 15, 15, 20);
    ellipse(250, heights, shadowW, shadowH);
    shadowW -= 8;
    shadowH -= 4;
    heights -=1;
  }
  //shadown on the ground
  
  //eyeball
  int eyeballW = 236;
  int eyeballH = 245;
  int eyeballSize = 280;
  int colorE = 79;
  while (eyeballSize > 5) {
    fill(colorE,colorE,colorE);
    circle(eyeballW,eyeballH,eyeballSize);
    eyeballW -= 1.000005;
    eyeballH -= 1.00005;
    colorE += 3;
    if (eyeballSize > 275) {
      colorE += 2;
    }
    if (eyeballSize > 260) {
      colorE += 3;
    }
    if (eyeballSize > 240) {
      colorE += 3;
    }
    if (eyeballSize > 200) {
      colorE += 2.5;
    }
    if (eyeballSize > 150) {
      colorE += 1.5;
    }
    eyeballSize -= 5;
  }
  //eyeball
  
  //eye
  int sizeP = 130;
  int colorChangeR = 1;
  int colorChangeB = 1;
  int colorChangeG = 1;
  while (sizeP > 5) {
    fill(43 + colorChangeR, 25 + colorChangeG, 13 + colorChangeB);
    circle(210,210,sizeP);
    sizeP -= 3;
    if (sizeP > 115) {
      colorChangeR += 7;
    }
    colorChangeR += 1.8;
    colorChangeB += 0.9;
    colorChangeG += 1.9;
  }
  //eye
  
  //pupil
  fill(20, 17, 15);
  circle(206,208,57);
  fill(38, 34, 29);
  circle(206,208,55);
  //pupil
  
  //pupil details
  int rad = 0; 
  while (rad < 360) {
  pushMatrix();
  translate(206,208);
  rotate(radians(rad));
  fill(43,25,13,170);
  ellipse(1,-45,1,18);
  popMatrix();
  rad += 5;
  }
 //pupil details
 
  //highlight
  fill(240, 237, 242,180);
  ellipse(229,203,36,19);
 //highlight
}
