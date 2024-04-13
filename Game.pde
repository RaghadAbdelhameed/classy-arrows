PImage background2;

Button pause;
Button NextLevel;
Level1 level1;
//Level2 level2;
void setup() {
  fullScreen();

  level1=new Level1();
  // level1.backgroundMusic = new SoundFile(this, "X2Download.app - Game of Thrones S8 Official Soundtrack _ The Night King - Ramin Djawadi _ WaterTower (128 kbps)-[AudioTrimmer.com].mp3");
  //level1.balloonSound = new SoundFile(this, "X2Download.app - Balloon Pop Sound Effect Royalty Free (128 kbps).mp3");
  //level2=new Level2();
  background2=loadImage("level2.jpg");
  background2.resize(width, height);
}
void draw() {
  level1.start();
}
void mousePressed() {
  level1.checkButtons();
  level1.action();
}
