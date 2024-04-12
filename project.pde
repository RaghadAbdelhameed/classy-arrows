import processing.sound.*;
SoundFile music;
PImage background1, background0;
PImage lvl2;
Character character;
String won, fail;
Buttons button1;
int score=0;
int shootarrows=0;
int shootballoons=0;
Ballon redballoon;
Arrow[] arrows=new Arrow[20];
Ballon[] ballons=new Ballon[15];

void setup() {
  fullScreen();
  music = new SoundFile(this, "C:/Users/al/Downloads/X2Download.app - Game of Thrones S8 Official Soundtrack _ The Night King - Ramin Djawadi _ WaterTower (128 kbps)-[AudioTrimmer.com].mp3");

  character = new Character();
  button1 = new Buttons();
  background1 = loadImage("bg1.jpg");
  background0 = loadImage("bg0.jpg");
  lvl2=loadImage("level22.jpg");
  background1.resize(width, height);
  background0.resize(width, height);
  lvl2.resize(width, height);
  for (int i=0; i<20; i++)
    arrows[i]=new Arrow();
  for (int i=0; i<15; i++)
    ballons[i]=new Ballon(i*100+480, height);
}
void draw() {
  background(background0);
 if (!music.isPlaying()) {
    music.play();
}

  button1.drawButtons();
  if (button1.IsButtonClicked()) {
    background(background1);
    character.display();
    DrawArrows();
    ShowBallons();
    ShowScore();
  }
  if (shootarrows<20&&shootballoons==15) {
    background(lvl2);
    character.drawcharacterhappy();
    ShowWon();
  }
  if (shootarrows==20&&shootballoons<15) {
    background(background0);
    character.drawcharacterdead();
    ShowFail();
  }
}
void mousePressed() {
  button1.buttonCheck(mouseX, mouseY);
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
void ShowBallons()
{
  for (int i = 0; i < 15; i++)  // Display existing balloons
    if (ballons[i].getExist())
      ballons[i].display();
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
          // add song
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
 
}
void ShowWon() {
  won="Congrats, YOU WIN!!";
  fill (102, 0, 102);
  textSize(100);
  textAlign(CENTER, CENTER);
  text(won, width / 2, height / 2-50);
  text("Your Score: " + score, width / 2, height / 2+50);
}
void ShowFail() {
  fail="Sorry, You Failed.";
  fill(153, 26, 0);
  textSize(100);
  textAlign(CENTER, CENTER);
  text(fail, width / 2, height / 2-50);
  text("Your Score: " + score, width / 2, height / 2+50);
}
