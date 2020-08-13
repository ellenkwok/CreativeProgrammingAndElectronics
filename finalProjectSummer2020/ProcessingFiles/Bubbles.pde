class Bubble {
  int xPos;
  int yPos;
  int startingPos;
  public int bubbleCord;

  Bubble(int speed, int bubble, int yPosi) {
    xPos = speed;
    yPos = yPosi;
    startingPos = speed;
    bubbleCord = bubble;
  }

  void goLeft( int sizeX, int sizeY) {
    image(bubbles[bubbleCord], xPos, yPos, sizeX, sizeY);
    xPos -= 1;
    if (xPos < -300) {
      xPos = 1200;
    }
  }

  void goRight(int sizeX, int sizeY) {
    image(bubbles[bubbleCord], xPos, yPos, sizeX, sizeY);
    xPos += 1;
    if (xPos > 1300) {
      xPos = -100;
    }
  }
}
