public class Character {
 private PImage character1;
    private PImage character2;
    private PImage characterdead;
    private float y;
    private float x = 100;  // constant; the character just moves 1D
    private boolean position = true;  // true for standard position, otherwise for shooting position

    // Constructor with image paths as parameters
 Character(String path1, String path2, String pathDead) {
  this.character1 = loadImage(path1);
  this.character2 = loadImage(path2);
  this.characterdead = loadImage(pathDead);

        // Resize images
  character1.resize(500, 300);
  character2.resize(500, 300);
 characterdead.resize(500, 300);

        y = mouseY;
    }
  public void setPostion(boolean position)
  {
    this.position=position;
  }
  public boolean getpostion()
  {
    return position;
  }
  public void limitY() {// restrict to hit the ground
    if (mouseY>680)
      y=680;
    else
      y=mouseY;
  }
  public void display()
  {
    if (position)
      drawCharacter1();
    else
      drawCharacter2();
  }
  public  void drawcharacterdead() {
    imageMode(CENTER);
    limitY();
    image(characterdead, 200, 950);
  }
  public  void drawcharacterhappy() {
    imageMode(CENTER);
    limitY();
    character2.resize(800, 600);
    image(character2, 150, 850);
  }
  public void drawCharacter2() {
    imageMode(CENTER);
    limitY();
    image(character2, x, y);
  }
  public  void drawCharacter1() {
    imageMode(CENTER);
    limitY();
    image(character1, x, y);
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
