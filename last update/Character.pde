public class Character  {
  private final PImage character1= loadImage("position1.png");
  private final PImage character2=loadImage("position2.png");
  private float y;
  private float x=100;// constant the character just move 1D
  private boolean postion=true;// true for standard postion otherwise for shooting postion
  Character() {
     y=mouseY;
    character1.resize(500, 300);
    character2.resize(500, 300);
  }
  public void setPostion(boolean postion)
  {
    this.postion=postion;
  }
  public boolean getpostion()
  {
    return postion;
  }
  public void limitY() {// restrict to hit the ground
    if (mouseY>680) 
      y=680;
     else 
      y=mouseY;
    
  }
  public void display()
  {
    if (postion)
      drawCharacter1();
    else
      drawCharacter2();
  }
 public  void drawCharacter1() {
    imageMode(CENTER);
    limitY();
    image(character1, x, y);
  }
  public void drawCharacter2() {
    imageMode(CENTER);
    limitY();
    image(character2, x, y);
  }
  public float getX()
  {
    return x;
  }
  public float getY()
  {
    return y;
  }
}
