import processing.sound.*;
class Level1
{
  boolean finished=false;// indicated the level completed or not
  boolean win=false;// indicated the level the player won or not
  PImage background1, background0,options;
  PImage lvl2;
  Character character;
  int score=0;
  int shootarrows=0;
  int shootballoons=0;
  Arrow[] arrows=new Arrow[20];
  Ballon[] ballons=new Ballon[15];
   SoundFile backgroundMusic;
   SoundFile balloonSound;
   Difficulty difficulty;
  Level1()
  {
    character = new Character();
    background1 = loadImage("bg1.jpg");
    background0 = loadImage("bg0.jpg");
    options = loadImage("Options.png");
    lvl2=loadImage("level22.jpg");
    setDifficulty("medium");
    background1.resize(width, height);
    background0.resize(width, height);
    options.resize(800,400);
    lvl2.resize(width, height);
    for (int i=0; i<20; i++)
      arrows[i]=new Arrow();
    for (int i=0; i<15; i++)
      ballons[i]=new Ballon(i*100+480, height);
  }

void setDifficulty(String difficultyLevel) {
    switch (difficultyLevel) {
        case "easy":
            difficulty = new Difficulty(100);
            break;
        case "medium":
            difficulty = new Difficulty(60);
            break;
        case "hard":
            difficulty = new Difficulty(20);
            break;
    }
}
  void ShowBallons()
  {
    for (int i = 0; i < 15; i++)  // Display existing balloons
      if (ballons[i].getExist())
        ballons[i].display();
  }


  void begin()
  {
    background(background1);
    character.display();
    DrawArrows();
    ShowBallons();
    ShowScore();
    if (shootarrows<20&&shootballoons==15) {
      background(lvl2);
      character.drawcharacterhappy();
      ShowWon();
      NextLevel.displayNextLevel();
    }
    if (shootarrows==20&&shootballoons<15) {
      background(background0);
      character.drawcharacterdead();
      ShowFail();
    }
  }



  void DrawArrows()
  {
    for (int i = 0; i < 20; i++) {
      if (arrows[i].getexsist()) {
        arrows[i].drawArrow();
        for (int j = 0; j < 15; j++)
          if (arrows[i].collidesWith(ballons[j])&&ballons[j].getExist()) {// Collision detected
            ballons[j].setExist(false); // Set the balloon as not existing
            shootballoons++;
             //balloonSound.play();
          }
      }
    }
  }



  void ShowScore() {

    score = (20 - shootarrows + 1) * shootballoons;
    fill(250);
    textSize(65);
    textAlign(LEFT, CENTER);
    text(" Score : " + score, 0, 950);
    text(" Remaining arrows : " + (20-shootarrows), 0, 1000);
    println(score);
  }
  boolean getwin()
  {
    return win;
  }

  void ShowWon() {

    win=true;
    fill (102, 0, 102);
    textSize(100);
    textAlign(CENTER, CENTER);
    text("Congrats, YOU WIN!!", width / 2, height / 2-50);
    text("Your Score: " + score, width / 2, height / 2+50);
  }


  void ShowFail() {
    fill(153, 26, 0);
    textSize(100);
    textAlign(CENTER, CENTER);
    text("Sorry, You Failed.", width / 2, height / 2-50);
    text("Your Score: " + score, width / 2, height / 2+50);
  }


  void initialize()
  {
    background(background0);
    image(options,width/2,height/2-300);
    //if (!backgroundMusic.isPlaying()) {
    // backgroundMusic.play();
  // }
  }


  void action()
  {
    if (mouseButton==RIGHT)
      character.setPostion(!character.getpostion());
    if (mouseButton==LEFT)
    {
      if (!character.getpostion()&&shootarrows<20)
      {
        character.setPostion(true);
        arrows[shootarrows].setExsist(true);
        arrows[shootarrows].set(150, character.getY()+40);
        shootarrows++;
      }
    }
  }
}
