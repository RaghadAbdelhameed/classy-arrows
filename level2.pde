class Level2 extends Level1
{
  Level2()
  {
    widthHappy=600;
    heightHappy=450;
    xHappy=150;
    yHappy=800;
    widthDead=750;
    heightDead=400;
    xDead=180;
    yDead=790;
    background1 = loadImage("bg02.png");
    background0 = loadImage("bg022.png");
    background1.resize(width, height);
    background0.resize(width, height);
    for (int i=0; i<20; i++)
      arrows[i]=new Arrow("arrow1.png");
    character = new Character("position21.png", "position22.png", "position23.png", 400, 300);

    // set new designs for buttons  if u want
    // character=new character() // if u want
    // set the background and resize them  if u want
    // set the desing for the arrows(as level1) if u want
    // take care of the variables of the class level1 if u want
  }

  void begin() {

    if (shootarrows<20&&shootballoons==15) {
      background(background0);
      character.drawCharacterHappy(150, 150, 150, 760);
      showWin();
    }
    if (shootarrows==20&&shootballoons<15) {
      background(background0);
      character.drawCharacterDead(600, 400, 200, 1000);
      showFail();
    }
  }
}
