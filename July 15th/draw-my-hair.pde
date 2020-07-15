void setup() {
  size(500,500); 
  background(255,255,255);
  noStroke();
}

//palette
  color[] rainbow = {color(232, 75, 44), color(232, 144, 44), color(232, 201, 44), 
  color(201, 232, 44), color(141, 232, 44), color(33, 209, 92), color(33, 209, 186),
  color(33, 109, 209), color(59, 33, 209), color(159, 33, 209),
  color(209, 33, 180),color(209, 33, 89), color(94, 56, 21), color(255, 255, 255), color(128, 128, 128),
  color(0, 0, 0)};
  
  //actual drawing part
 color currentColor = rainbow[1];
  
  boolean updateAll = false;
 color[] thisCanvas = new color[500*500];
 boolean text = false;
 boolean textB = false;
  
void draw() {
  if (updateAll) {
    for (int i = 0; i < width * height; i++) {
    pixels[i] = thisCanvas[i];
  }
  updatePixels();
  if (text) {
      fill(55, 63, 64);
      rect(70,400,360,50);
      PFont f = createFont("Arial", 25);
      textFont(f, 25);
      color myFavoriteColor =color(255, 255, 255);
      fill(myFavoriteColor);
      text("Ouch! Don't hit my face!", 100, 430);
    }
   else if (textB) {
     fill(55, 63, 64);
      rect(70,400,360,50);
      PFont f = createFont("Arial", 25);
      textFont(f, 25);
      color myFavoriteColor =color(255, 255, 255);
      fill(myFavoriteColor);
      text("Where are you going?", 100, 430);
   }
   else {
      fill(55, 63, 64);
      rect(70,400,360,50);
      PFont f = createFont("Arial", 25);
      textFont(f, 25);
      color myFavoriteColor =color(255, 255, 255);
      fill(myFavoriteColor);
      text("Draw my hair!", 200, 430);
   }
  }
  else {
    updateAll = true;
    
  //big background square
  fill(248,245,255);
  square(25,25,450);
  
  //face
  fill(237, 213, 198);
  rect(150,176,200,188);
  
  //eyes
  for (int n=0; n<2;n++){
    pushMatrix();
    fill(31, 16, 9);
    ellipse(200, 280, 17,35);
    fill(248, 245,255,180);
    ellipse(203.5, 273, 5,8);
    popMatrix();
    translate(100,0);
  }
  translate(-200,0);

  //neck + body
  fill(237, 213, 198);
  triangle(250,300,230, 475, 280, 475);
  
  //mouth - pink piece
  fill(227, 93, 111,190);
  ellipse(250, 300, 40,20);
  
  //mouth - skin piece
  fill(237, 213, 198);
  ellipse(250, 298, 45,17);
  
  int width = 55;
  int height = 45;
  for (color i: rainbow) { 
      fill(i);
      square(width,height,35);
      width+= 50;
      if (width >=420) {
        width = 55;
        height += 50;
    }
  }
    
   //speech bubble
  fill(55, 63, 64);
  rect(70,400,360,50);
  PFont f = createFont("Arial", 25);
  textFont(f, 25);
  color myFavoriteColor =color(255, 255, 255);
  fill(myFavoriteColor);
  text("Draw my hair!", 200, 430);
   if (mousePressed) {
      fill(currentColor);
      rect(mouseX,mouseY,10,10);
  }
  noLoop();
  }
}


   //painting?
  
  void mouseDragged(){
   loadPixels();
   if (mouseY >200 && mouseY <330 && mouseX > 170 && mouseX <320){
     text = true;
   }
   else if (mouseY >430 || mouseY <50 || mouseX > 430 || mouseX <70){
     textB = true;
   }
   else {
     text = false;
     textB = false;
   }
   color clicked = pixels[mouseY*500 + mouseX];
   for (color i: rainbow){
      if (i == clicked && mouseY <=150) {
        currentColor = clicked;
     }
     else {
     fill(currentColor);
     rect(mouseX,mouseY,10,10);
   }
   loadPixels();
   for (int n = 0; n < width * height; n++) {
     thisCanvas[n] = pixels[n];
   }
   loop();
}
  
  } 

 
