 PImage background2;
Button start;
Button pause;
Button NextLevel;
Level1 level1;
//Level2 level2;
void setup() {
  fullScreen();
  start = new Button("BlueButton.png", "Start game", 70, width/2, height/2, 500, 250);
  level1=new Level1();
 // level1.backgroundMusic = new SoundFile(this, "X2Download.app - Game of Thrones S8 Official Soundtrack _ The Night King - Ramin Djawadi _ WaterTower (128 kbps)-[AudioTrimmer.com].mp3");
  //level1.balloonSound = new SoundFile(this, "X2Download.app - Balloon Pop Sound Effect Royalty Free (128 kbps).mp3");
  //level2=new Level2();
   background2=loadImage("level2.jpg");
    background2.resize(width, height);
  NextLevel=new Button("NextLevel.png");
}
void draw() {
  level1.initialize();
  start.drawButton();

  //NextLevel.displayNextLevel();
  if (start.IsButtonClicked())
    level1.begin();
  if (NextLevel.IsNextClicked() )
    background(background2);
}
void mousePressed() {
  if (!start.IsButtonClicked())
    start.buttonCheck(mouseX, mouseY);
  else
    level1.action();
  NextLevel.checkClickNext();
}
