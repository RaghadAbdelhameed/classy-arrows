public class Character {
  private PImage position1;
  private PImage position2;
  private PImage characterDead;
  private float y;
  private float x = 100;  // constant; the character just moves 1D
  private boolean position = true;  // true for standard position, otherwise for shooting position

  // Constructor with image paths as parameters
  Character(String path1, String path2, String pathDead, int width, int height) {
    this.position1 = loadImage("1_deliverables/data/"+path1);
    this.position2 = loadImage("1_deliverables/data/"+path2);
    this.characterDead = loadImage("1_deliverables/data/"+pathDead);
    // Resize images
    position1.resize(width, height);
    position2.resize(width, height);
    y = mouseY;
  }
  public void setPostion(boolean position)
  {
    this.position=position;
  }
  public boolean getPostion()
  {
    return position;
  }
  public void limitY() {// restrict to hit the ground
    if (mouseY>780)
      y=780;
    else
      y=mouseY;
  }
  public void display()
  {
    if (position)
      drawPostion1();
    else
      drawPostion2();
  }
  public void drawCharacterDead(int width, int height, int x, int y) {
    imageMode(CENTER);
    limitY();
    characterDead.resize(width, height);
    image(characterDead, x, y);
  }
  public void drawCharacterHappy(int width, int height, int x, int y) {
    imageMode(CENTER);
    limitY();
    position2.resize(width, height);
    image(position2, x, y);
  }
  public void drawPostion2() {
    imageMode(CENTER);
    limitY();
    image(position2, x, y);
  }
  public  void drawPostion1() {
    imageMode(CENTER);
    limitY();
    image(position1, x, y);
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
