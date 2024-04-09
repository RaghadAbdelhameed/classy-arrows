public class Character {
  PImage character1;
  PImage character2;
  float y;
  float x=150;
  boolean flag=true;// true for standard postion otherwise for shooting postion
  Character() {
    character1 = loadImage("position1.png");
    character1.resize(500, 300);
    character2 = loadImage("position2.png");
    character2.resize(500, 300);
  }
  void setflag(boolean flag)
  {
    this.flag=flag;
  }
  boolean getflag()
  {
    return flag;
  }
  void limitY() {
    if (mouseY>680) {
      y=680;
    } else {
      y=mouseY;
    }
  }
  void display()
  {
    if (flag)
      drawCharacter1();
    else
      drawCharacter2();
  }
  void drawCharacter1() {
    imageMode(CENTER);
    limitY();
    image(character1, 150, y);
  }
  void drawCharacter2() {
    limitY();
    image(character2, 150, y);
  }
}
