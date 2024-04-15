class red extends Ballon {
  float speed =3;
  red(String imagepath, float x, float y)
  {
    super(imagepath, x, y);
  }
  @Override
    public void update() {
    posY -= speed; // Move upwards at constant speed

    // If the balloon goes off-screen, reset its position
    if (posY < 0) {
      posY = height;
    }
  }
  @Override
    public void display() {
    imageMode(CENTER);
    image(balloon, posX, posY);
  }
}
