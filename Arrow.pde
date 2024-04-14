public class Arrow {
  private float x;
  private float y;
  private  PImage arrow;
  private boolean exists = false; // decides arrow shoot or not


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

  public void update() {
    x += 6;
  }



  public void drawArrow() {
    imageMode(CENTER);
    image(arrow, x, y);
    update();
  }

  public boolean collidesWith(Ballon balloon,int difficulty ) {
    return dist(x, y, balloon.getPosX(), balloon.getPosY()) < difficulty;
  }
}
