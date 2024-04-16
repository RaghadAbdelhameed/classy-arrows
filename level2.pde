class Level2 extends Level1 {
  

  Level2() {
    yellowballons = new yellow[3];
    widthHappy = 600;
    heightHappy = 450;
    xHappy = 150;
    yHappy = 800;
    widthDead = 750;
    heightDead = 400;
    xDead = 180;
    yDead = 790;
    background1 = loadImage("bg02.png");
    background0 = loadImage("bg022.png");
    background1.resize(width, height);
    background0.resize(width, height);
    redballons = new red[12];
    for (int i = 0; i < 20; i++)
      arrows[i] = new Arrow("arrow1.png");
    character = new Character("position21.png", "position22.png", "position23.png", 400, 300);
    int redIndex = 0;
    int yellowIndex = 0;
    for (int i = 0; i <= 14; i++) {
      if (i % 5 == 2) {
        yellowballons[yellowIndex] = new yellow("yellowBalloon.png", i * 100 + 480, random(height, height+1000));
        yellowIndex++;
      } else {
        redballons[redIndex] = new red("redballoon.png", i * 100 + 480, random(height, height+1000));
        redIndex++;
      }
    }
  }

  @Override
    public void Restart()
  {
    shootarrows=0;
    setdificulty=false;
    gameended=false;
    startedgame=false;
    win=false;
    shooredtballoons=0;
    shootyellowtballoons=0;
    score=0;
    for (int i = 0; i < 20; i++)
      arrows[i] = new Arrow("arrow1.png");
    int redIndex = 0;
    int yellowIndex = 0;
    for (int i = 0; i <= 14; i++) {
      if (i % 5 == 2) {
        yellowballons[yellowIndex] = new yellow("yellowBalloon.png", i * 100 + 480, random(height, height+1000));
        yellowIndex++;
      } else {
        redballons[redIndex] = new red("redballoon.png", i * 100 + 480, random(height, height+1000));
        redIndex++;
      }
    }
    
    easy.restart();
    medium.restart();
    hard.restart();
  }
}
