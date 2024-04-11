public class Arrow {
  private float x;
  private float y;
  private final PImage arrow = loadImage("arrow2.png");
  private boolean exsist = false; // decides arrow shoot or not
  private boolean[] collidedWithBalloon = new boolean[15];// to track collisions with each balloon

  Arrow() {
   
    arrow.resize(100, 100);
  }
  public void setExsist(boolean exsist)
  {
    this.exsist=exsist;
  }
  public float getX()
  {
    return x;
  }
  public float getY()
  {
    return y;
  }
  public boolean getexsist()
  {
    return exsist;
  }
   public void set(float x, float y) {
    this.x = x;
    this.y = y;
  }
  public void update()
  {
    x+=4;
  }
  public void drawArrow() { 
    imageMode(CENTER);
    image(arrow, x, y);
    update();
    
  }
  public boolean collisionWith(Ballon balloon, int balloonIndex) {
     if( dist(x,y,balloon.getPosX(),balloon.getPosY())<60){
     collidedWithBalloon[balloonIndex] = true;
     return true ;
     }
    else
    return false;
  }
}
