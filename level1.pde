//import processing.sound.*;
class Level1
{
  protected Button easy, medium, hard, nextLevel, restart;
  protected PImage background1, background0, options;
  protected PImage lvl2;
  protected Character character;
  protected int score;
  protected int shootArrows;
  protected int shootRedBalloons;
  protected int shootYellowBalloons;
  protected Arrow[] arrows=new Arrow[20];
  protected red[] redBallons=new red[15];
  protected  yellow[] yellowBallons=new yellow[0];
  protected PFont customFont;
  //protected SoundFile backgroundMusic;
  //protected SoundFile balloonSound;
  protected boolean startedGame;// indicates the game is started or not?
  protected boolean win;
  protected boolean setDificulty;
  protected int widthHappy;
  protected int heightHappy;
  protected int xHappy;
  protected int yHappy;
  protected int widthDead;
  protected int heightDead;
  protected int xDead;
  protected int yDead;
  protected boolean gameEnded;
  public  Level1()
  {

    restart=new Button("Retry.png", 1700, 950, 423, 123);
    nextLevel=new Button("Next level.png", 1700, 950, 423, 123);
    easy = new Button("Easy.png", width/2, height/2-100, 380, 130);
    medium = new Button("Medium.png", width/2, height/2+70, 380, 130);
    hard = new Button("Hard.png", width/2, height/2+240, 380, 130);
    character = new Character("position1.png", "position2.png", "chrcDead.png", 600, 400);
    background1 = loadImage("backg01.jpg");
    background0 = loadImage("backg012.jpg");
    options = loadImage("Options.png");
    lvl2=loadImage("bg022.png");
    background1.resize(width, height);
    background0.resize(width, height);
    options.resize(800, 400);
    lvl2.resize(width, height);
    for (int i=0; i<20; i++)
      arrows[i]=new Arrow("arrow2.png");
    for (int i=0; i<redBallons.length+yellowBallons.length; i++)
      redBallons[i]=new red("redballoon.png", i*100+480, height);
    customFont = createFont("Speed Rush", 32);
    gameEnded=false;
    startedGame=false;
    win=false;
    setDificulty=false;
    shootArrows=0;
    shootRedBalloons=0;
    shootYellowBalloons=0;
    score=0;
    widthHappy=800;
    heightHappy=600;
    xHappy=150;
    yHappy=760;
    widthDead=600;
    heightDead=300;
    xDead=230;
    yDead=950;
  }

  public void Restart()
  {
    setDificulty=false;
    gameEnded=false;
    startedGame=false;
    win=false;
    shootArrows=0;
    shootYellowBalloons=0;
    shootRedBalloons=0;
    score=0;
    for (int i=0; i<20; i++)
      arrows[i]=new Arrow("arrow2.png");
    for (int i=0; i<15; i++)
      redBallons[i]=new red("redballoon.png", i*100+480, height);
    easy.restart();
    medium.restart();
    hard.restart();
  }

  public void ShowBallons()
  {
    for (int i = 0; i < redBallons.length; i++)  // Display existing balloons
      if (redBallons[i].getExist()) {
        redBallons[i].display();
        redBallons[i].update();
      }
    for (int i = 0; i < yellowBallons.length; i++) {
      if (yellowBallons[i].getExist()) {
        yellowBallons[i].display();
        yellowBallons[i].update();
      }
    }
  }

  public void begin(int difficulty)
  {
    if (!setDificulty)
    {
      for (Arrow it : arrows)
        it.setDifficulty(difficulty);
      setDificulty=true;
    }

    startedGame=true;
    background(background1);
    character.display();
    DrawArrows();
    ShowBallons();
    showScore();
    if (shootArrows<=20 && shootRedBalloons+shootYellowBalloons==15) {
      background(lvl2);
      character.drawCharacterHappy(widthHappy, heightHappy, xHappy, yHappy);
      showWin();
    }
    if (shootArrows==20 && shootRedBalloons+shootYellowBalloons<15 && checkArrows()) {
      background(background0);
      character.drawCharacterDead(widthDead, heightDead, xDead, yDead);
      showFail();
    }
    textFont(customFont);
  }

  public boolean checkArrows()
  {
    for (int i=0; i<20; i++)
      if (arrows[i].getExist() && arrows[i].getX()<=width)
        return false;
    return true;
  }

  public void DrawArrows()
  {
    for (int i = 0; i < 20; i++) {
      if (arrows[i].getExist())
      {
        arrows[i].drawArrow();
        for (int j = 0; j <redBallons.length; j++)
          if (arrows[i].collidesWith(redBallons[j]) && redBallons[j].getExist()) {   // Collision detected
            redBallons[j].setExist(false); // Set the balloon as not existing
            shootRedBalloons++;
            // balloonSound.play();
          }
      }
      for (int j = 0; j < yellowBallons.length; j++) {
        if (arrows[i].collidesWith(yellowBallons[j]) && yellowBallons[j].getExist()) {
          yellowBallons[j].setExist(false);
          shootYellowBalloons++;
          //    balloonSound.play();
        }
      }
    }
  }


  public  void showScore() {
    if (shootArrows < 20 && shootRedBalloons+shootYellowBalloons <= 15) { // Only update score if the game is still ongoing
      score = (20 - shootArrows + 1) * shootRedBalloons+shootYellowBalloons*10;
      fill(250);
      textSize(65);
      textAlign(LEFT, CENTER);
      text(" Score : " + score, 0, 950);
      text(" Remaining arrows : " + (20 - shootArrows), 0, 1000);
    }
  }
  public boolean getGameEnded()
  {
    return gameEnded;
  }


  public void showWin() {
    win = true;
    fill(247, 250, 227);
    textSize(100);
    textAlign(CENTER, CENTER);
    text("Congrats, YOU WIN!!", width / 2, height / 2 - 50);
    text("Your Score: " + score, width / 2, height / 2 + 50);

    if (this.getClass().getSimpleName().equals("Level1")) {
      nextLevel.drawButton();
      nextLevel.buttonCheck(mouseX, mouseY);

      if (nextLevel.IsButtonClicked() && mousePressed) {
        gameEnded = true;
      }
    }
  }



  public void showFail() {
    fill(153, 26, 0);
    textSize(100);
    textAlign(CENTER, CENTER);
    text("Sorry, You Failed.", width / 2, height / 2-50);
    text("Your Score: " + score, width / 2, height / 2+50);
    restart.drawButton();
    restart.buttonCheck(mouseX, mouseY);
    if (restart.IsButtonClicked()&&mousePressed)
      Restart();
  }


  public void startGame()
  {
    background(background0);
    easy.drawButton();
    medium.drawButton();
    hard.drawButton();
    image(options, width/2, height/2-300);
    //if (!backgroundMusic.isPlaying()) {
    // backgroundMusic.play();
    // }
    setDifficulty();
  }

  public  void setDifficulty()
  {
    if (easy.IsButtonClicked())
      begin(100);
    else if (medium.IsButtonClicked())
      begin(60);
    else if (hard.IsButtonClicked())
      begin(20);
  }
  public void checkButtons()
  {
    if (!easy.IsButtonClicked())
      easy.buttonCheck(mouseX, mouseY);
    if (!medium.IsButtonClicked())
      medium.buttonCheck(mouseX, mouseY);
    if (!hard.IsButtonClicked())
      hard.buttonCheck(mouseX, mouseY);
    if (startedGame)
      action();
  }
  public void action()
  {
    if (win) // If the game has been won, don't allow shooting arrows
      return;
    if (mouseButton==RIGHT)
      character.setPostion(!character.getPostion());
    if (mouseButton==LEFT)
    {
      if (!character.getPostion()&&shootArrows<20)
      {
        character.setPostion(true);
        arrows[shootArrows].setExist(true);
        arrows[shootArrows].set(150, character.getY()+40);
        shootArrows++;
      }
    }
  }
}
