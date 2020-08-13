class Fish {
  int xPos;
  int startingPos;
  float acc;
  int fishCord;

  Fish(int speed, int fish) {
    xPos = speed;
    startingPos = speed;
    acc = acceleration;
    fishCord = fish;
  }

  void swimLeft(int yPos, int sizeX, int sizeY, float acc) {
    image(fishes[fishCord], xPos, yPos, sizeX, sizeY);
    xPos -= 1 + acc;
    if (xPos < -400) {
      xPos = startingPos;
    }
  }

  void swimRight(int yPos, int sizeX, int sizeY, float acc) {
    image(fishes[fishCord], xPos, yPos, sizeX, sizeY);
    xPos += 1 + acc;
    if (xPos > 1500) {
      xPos = startingPos;
    }
  }
}
