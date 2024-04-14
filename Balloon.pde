public class Ballon {
   PImage balloon;
   float posX;
   float posY;
   boolean exist = true;// indicates the ballon still exsist or not
  Ballon(String imagepath,float x, float y) {
    balloon=loadImage(imagepath);
    this.posX=x;
    this.posY=y;
    balloon.resize(80, 100);
    exist = true;
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
