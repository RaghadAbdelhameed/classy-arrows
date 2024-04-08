public class Character {
  PImage character1;
  PImage character2;
  float y;
  Character() {
    character1 = loadImage("position1.png");
    character1.resize(500, 300);
    character2 = loadImage("position2.png");
  }
  void limitY() {
    if (mouseY>260) {
      y=260;
    } else {
      y=mouseY;
    }
  }

  void drawCharacter1() {
    imageMode(CENTER);
    limitY();
    image(character1, 100, y);
  }
  void drawCharacter2() {
    limitY();
    image(character2, 100, y);
  }
}
