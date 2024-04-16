public class Arrow {
  private float x;
  private float y;
  private  PImage arrow;
  private boolean exists = false; // decides arrow shoot or not
  private  float difficulty;
  public Arrow(String imagePath) {
    arrow = loadImage(imagePath);
    arrow.resize(100, 100);
  }

  public void setExsist(boolean exists) {
    this.exists = exists;
  }

  public float getX() {
    return x;
  }

  public float getY() {
    return y;
  }

  public boolean getexsist() {
    return exists;
  }

  public void set(float x, float y) {
    this.x = x;
    this.y = y;
  }
  public void setDifficulty(float difficulty)
  {
    this.difficulty=difficulty;
  }

  public void update() {
    x += 8;
  }



  public void drawArrow() {
    imageMode(CENTER);
    image(arrow, x, y);
    update();
  }

  public boolean collidesWith(Ballon balloon ) {
    return dist(x, y, balloon.getPosX(), balloon.getPosY()) < difficulty;
  }
}
