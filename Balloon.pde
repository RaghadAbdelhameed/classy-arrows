public class Ballon {
  
  private PImage balloon;
  private float posX;
  private float posY;
  boolean exsist = true;
  
  Ballon(float x,float y) {
    balloon = loadImage("redballoon.png");
    this.posX=x;
    this.posY=y;
  }
  
  public void setPosX(float posX) {
    this.posX = posX;
  }
  
  
  public float getPosX() {
    return posX;
  }
  
 
  public void setPosY(float posY) {
    this.posY = posY;
  }
  
 
  public float getPosY() {
    return posY;
  }
  
  
  public void setExsist(boolean exsist) {
    this.exsist = exsist;
  }
  
  public boolean isExsist() {
    return exsist;
  }
  public void display()
  {
    image(balloon,posX,posY,80,100);
    posY-=3;
    if(posY<0)
    posY=height;
  }
}
