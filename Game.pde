PImage background2;
Button easy, medium, hard;
Button pause;
Button NextLevel;
Level1 level1;
//Level2 level2;
void setup() {
  fullScreen();
  easy = new Button("Easy.png", "", 70, width/2, height/2-100, 500, 250);
  medium = new Button("Medium.png", "", 70, width/2, height/2+50, 500, 250);
  hard = new Button("Hard.png", "", 70, width/2, height/2+200, 500, 250);
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
  easy.drawButton();
  medium.drawButton();
  hard.drawButton();
  //NextLevel.displayNextLevel();
  if (easy.IsButtonClicked())
    level1.begin();
  if (NextLevel.IsNextClicked() )
    background(background2);
}
void mousePressed() {
  if (!easy.IsButtonClicked())
    easy.buttonCheck(mouseX, mouseY);
  else
    level1.action();
  NextLevel.checkClickNext();
}
