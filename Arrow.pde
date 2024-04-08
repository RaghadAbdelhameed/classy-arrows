//public class Arrow {
//  private float x;
//  private float y;
//  private PImage arrow;
//  private boolean flag = false; // decides arrow shoot or not
  
//  Arrow(){
//    arrow = loadImage("arrow2.png");
//    arrow.resize(100,100);
//  }
  
//  public void drawArrow(){
//    imageMode(CENTER);
//    image(arrow, x, y);
//    x += 4;
//  }
  
//  public void setX(float x) {
//    this.x = x;
//  }
  
//  public float getX() {
//    return x;
//  }
  
//  public void setY(float y) {
//    this.y = y;
//  }
  
//  public float getY() {
//    return y;
//  }
  
//  public void set(float x, float y) {
//    this.x = x;
//    this.y = y;
//  }
  
//  public void setFlag(boolean flag) {
//    this.flag = flag;
//  }
  
//  public boolean getFlag() {
//    return flag;
//  }
//}
public class Arrow {
  float x;
  float y;
  PImage arrow;
  boolean flag = false; // decides arrow shoot or not
  
  Arrow() {
    arrow = loadImage("arrow2.png");
    arrow.resize(100, 100);
  }
  
  void drawArrow() {
    imageMode(CENTER);
    image(arrow, x, y);
    x += 4;
  }
  
  void set(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  // Method to check collision with a balloon
  boolean collidesWith(Ballon balloon) {
    float arrowRadius = arrow.width / 2; // Assuming arrow is circular
    float balloonRadiusX = 40; // Adjust these values based on your balloon size
    float balloonRadiusY = 50;
  // Calculate distance between arrow and balloon's center
    float distanceX = abs(x - balloon.getPosX());
    float distanceY = abs(y - balloon.getPosY());
    
    // Check if distance is less than sum of radii
    if (distanceX < (arrowRadius + balloonRadiusX) && distanceY < (arrowRadius + balloonRadiusY)) {
      return true; // Collision detected
    } else {
      return false; // No collision
    }
  }
}
