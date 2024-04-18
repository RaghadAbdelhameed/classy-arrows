public class Balloon {
  protected PImage balloon;
  protected float posX;
  protected float posY;
  protected boolean exist = true; // indicates if the balloon still exists or not

  public Balloon(String imagepath, float x, float y) {
    balloon = loadImage(imagepath);
    this.posX = x;
    this.posY = y;
    balloon.resize(80, 100);
    exist = true;
  }

  // Getter and Setter methods for posX
  public void setPosX(float posX) {
    this.posX = posX;
  }

  public float getPosX() {
    return posX;
  }

  // Getter and Setter methods for posY
  public void setPosY(float posY) {
    this.posY = posY;
  }

  public float getPosY() {
    return posY;
  }

  // Getter and Setter methods for exist
  public void setExist(boolean exist) {
    this.exist = exist;
  }

  public boolean getExist() {
    return exist;
  }

  // Display method
  public void display() {
    imageMode(CENTER);
    image(balloon, posX, posY);
  }
}
