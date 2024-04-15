class Level2 extends Level1 {
  yellow[] danger = new yellow[3];
  int shooredtballoons=0;
  int shootyellowtballoons=0;

  Level2() {
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
    ballons = new Ballon[12];
    for (int i = 0; i < 20; i++)
      arrows[i] = new Arrow("arrow1.png");
    character = new Character("position21.png", "position22.png", "position23.png", 400, 300);

    int redIndex = 0;
    int yellowIndex = 0;
    for (int i = 0; i <= 14; i++) {
      if (i % 5 == 2) {
        danger[yellowIndex] = new yellow("yellowBalloon.png", i * 100 + 480, random(0, height));

        yellowIndex++;
      } else {
        ballons[redIndex] = new Ballon("redballoon.png", i * 100 + 480, random(0, height));

        redIndex++;
      }
    }
    
  }

  @Override
    void begin(int difficulty)
  {
    if (!setdificulty)
    {
      for (Arrow it : arrows)
        it.setDifficulty(difficulty);
      setdificulty=true;
    }


    startedgame=true;
    background(background1);
    character.display();
    DrawArrows();
    ShowBallons();
    showScore();
    if (shootarrows<=20&&shooredtballoons+shootyellowtballoons==15) {
      background(lvl2);
      character.drawCharacterHappy(widthHappy, heightHappy, xHappy, yHappy);
      showWin();
    }
    if (shootarrows==20&&shooredtballoons+shootyellowtballoons<15&&cheeckarrows()) {
      background(background0);
      character.drawCharacterDead(widthDead, heightDead, xDead, yDead);
      showFail();
    }
    textFont(customFont);
     if (!backgroundMusic.isPlaying()) {
     backgroundMusic.play();
     }
  }

  @Override
    void ShowBallons() {
    super.ShowBallons(); // Display red balloons using the parent class method

    // Display yellow balloons
    for (int i = 0; i < danger.length; i++) {
      if (danger[i].getExist()) {
        danger[i].display();
      }
    }
  }

  @Override
    void DrawArrows() {
    for (int i = 0; i < 20; i++) {
      if (arrows[i].getexsist()) {
        arrows[i].drawArrow();
        for (int j = 0; j < ballons.length; j++) {
          if (arrows[i].collidesWith(ballons[j]) && ballons[j].getExist()) {
            ballons[j].setExist(false);
            shooredtballoons++;
             balloonSound.play();
          }
        }
        for (int j = 0; j < danger.length; j++) {
          if (arrows[i].collidesWith(danger[j]) && danger[j].getExist()) {
            danger[j].setExist(false);
            shootyellowtballoons++;
             balloonSound.play();
          }
        }
      }
    }
  }
  @Override
    void showWin() {

    win=true;
    fill (247, 250, 227);
    textSize(100);
    textAlign(CENTER, CENTER);
    text("Congrats, YOU WIN!!", width / 2, height / 2-50);
    text("Your Score: " + score, width / 2, height / 2+50);
  }
  @Override
    void showScore() {
    if (shootarrows < 20 && shooredtballoons+shootyellowtballoons <= 15) { // Only update score if the game is still ongoing
      score = (20 - shootarrows + 1) * shooredtballoons+shootyellowtballoons*10;
      fill(250);
      textSize(65);
      textAlign(LEFT, CENTER);
      text(" Score : " + score, 0, 950);
      text(" Remaining arrows : " + (20 - shootarrows), 0, 1000);
    }
  }
  @Override
    void Restart()
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
        danger[yellowIndex] = new yellow("yellowBalloon.png", i * 100 + 480, random(0, height));

        yellowIndex++;
      } else {
        ballons[redIndex] = new Ballon("redballoon.png", i * 100 + 480, random(0, height));

        redIndex++;
      }
    }
    easy.restart();
    medium.restart();
    hard.restart();
   
  }
}
