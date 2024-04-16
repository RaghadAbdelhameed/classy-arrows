class red extends Ballon {
  private float speed =3;
  public red(String imagepath, float x, float y)
  {
    super(imagepath, x, y);
  }
    public void update() {
    posY -= speed; // Move upwards at constant speed

    // If the balloon goes off-screen, reset its position
    if (posY < 0) {
      posY = height;
    }
  }

}
