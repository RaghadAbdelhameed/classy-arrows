public class Arrow {
  private float x;
  private float y;
  private PImage arrow;
  private boolean flag = false; // decides arrow shoot or not
  
  Arrow(){
    arrow = loadImage("arrow2.png");
    arrow.resize(100,100);
  }
  
  public void drawArrow(){
    imageMode(CENTER);
    image(arrow, x, y);
    x += 4;
  }
  
  public void setX(float x) {
    this.x = x;
  }
  
  public float getX() {
    return x;
  }
  
  public void setY(float y) {
    this.y = y;
  }
  
  public float getY() {
    return y;
  }
  
  public void set(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  public void setFlag(boolean flag) {
    this.flag = flag;
  }
  
  public boolean getFlag() {
    return flag;
  }
}
