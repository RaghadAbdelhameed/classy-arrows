public class Ballon {
  private PImage balloon=loadImage("redballoon.png");
  private float posX;
  private float posY;
  private boolean exist = true;// indicates the ballon still exsist or not
  Ballon(float x, float y) {
    this.posX=x;
    this.posY=y;
    balloon.resize(80, 100);
  }

  public void setPosX(float posX) {
    this.posX = posX;
  }

  public void setPosY(float posY) {
    this.posY = posY;
  }
  public float getPosX() {
    return posX;
  }
  public float getPosY() {
    return posY;
  }


  public void setExist(boolean exist) {
    this.exist = exist;
  }

  public boolean getExist() {
    return exist;
  }
  public void display()
  {
    imageMode(CENTER);
    image(balloon, posX, posY);
    posY-=3;
    if (posY<0)
      posY=height;
  }
}
