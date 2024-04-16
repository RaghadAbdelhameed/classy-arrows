//import processing.sound.*;
class Level1
{
  protected Button easy, medium, hard, nextLevel, restart;
  protected PImage background1, background0, options;
  protected PImage lvl2;
  protected Character character;
  protected int score;
  protected int shootarrows;
  protected int shooredtballoons;
  protected int shootyellowtballoons;
  protected Arrow[] arrows=new Arrow[20];
  protected red[] redballons=new red[15];
  protected  yellow[] yellowballons=new yellow[0];
  protected PFont customFont;
  //protected SoundFile backgroundMusic;
  //protected SoundFile balloonSound;
  protected boolean startedgame;// indicates the game is started or not?
  protected boolean win;
  protected boolean setdificulty;
  protected int widthHappy;
  protected int heightHappy;
  protected int xHappy;
  protected int yHappy;
  protected int widthDead;
  protected int heightDead;
  protected int xDead;
  protected int yDead;
  protected boolean gameended;
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
    for (int i=0; i<redballons.length+yellowballons.length; i++)
      redballons[i]=new red("redballoon.png", i*100+480, height);
    customFont = createFont("Speed Rush", 32);
    gameended=false;
    startedgame=false;
    win=false;
    setdificulty=false;
    shootarrows=0;
    shooredtballoons=0;
    shootyellowtballoons=0;
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
    setdificulty=false;
    gameended=false;
    startedgame=false;
    win=false;
    shootarrows=0;
    shootyellowtballoons=0;
    shooredtballoons=0;
    score=0;
    for (int i=0; i<20; i++)
      arrows[i]=new Arrow("arrow2.png");
    for (int i=0; i<15; i++)
      redballons[i]=new red("redballoon.png", i*100+480, height);
    easy.restart();
    medium.restart();
    hard.restart();
  }

  public void ShowBallons()
  {
    for (int i = 0; i < redballons.length; i++)  // Display existing balloons
      if (redballons[i].getExist()) {
        redballons[i].display();
        redballons[i].update();
      }
    for (int i = 0; i < yellowballons.length; i++) {
      if (yellowballons[i].getExist()) {
        yellowballons[i].display();
        yellowballons[i].update();
      }
    }
  }

  public void begin(int difficulty)
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
  }

  public boolean cheeckarrows()
  {
    for (int i=0; i<20; i++)
      if (arrows[i].getexsist()&&arrows[i].getX()<=width)
        return false;
    return true;
  }

  public void DrawArrows()
  {
    for (int i = 0; i < 20; i++) {
      if (arrows[i].getexsist())
      {
        arrows[i].drawArrow();
        for (int j = 0; j <redballons.length; j++)
          if (arrows[i].collidesWith(redballons[j])&&redballons[j].getExist()) {// Collision detected
            redballons[j].setExist(false); // Set the balloon as not existing
            shooredtballoons++;
            // balloonSound.play();
          }
      }
      for (int j = 0; j < yellowballons.length; j++) {
        if (arrows[i].collidesWith(yellowballons[j]) && yellowballons[j].getExist()) {
          yellowballons[j].setExist(false);
          shootyellowtballoons++;
          //    balloonSound.play();
        }
      }
    }
  }


  public  void showScore() {
    if (shootarrows < 20 && shooredtballoons+shootyellowtballoons <= 15) { // Only update score if the game is still ongoing
      score = (20 - shootarrows + 1) * shooredtballoons+shootyellowtballoons*10;
      fill(250);
      textSize(65);
      textAlign(LEFT, CENTER);
      text(" Score : " + score, 0, 950);
      text(" Remaining arrows : " + (20 - shootarrows), 0, 1000);
    }
  }
  public boolean getGameEnded()
  {
    return gameended;
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
        gameended = true;
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
    setdifficulty();
  }

  public  void setdifficulty()
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
    if (startedgame)
      action();
  }
  public void action()
  {
    if (win) // If the game has been won, don't allow shooting arrows
      return;
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
