Level1 level1;
Level2 level2;
Button nextLevel;
void setup() {
  fullScreen();
  level1=new Level1();
  // level1.backgroundMusic = new SoundFile(this, "X2Download.app - Game of Thrones S8 Official Soundtrack _ The Night King - Ramin Djawadi _ WaterTower (128 kbps)-[AudioTrimmer.com].mp3");
  //level1.balloonSound = new SoundFile(this, "X2Download.app - Balloon Pop Sound Effect Royalty Free (128 kbps).mp3");
  level2=new Level2();
  nextLevel=new Button("Next level.png", 1700, 950, 423, 123);
}
void draw() {
  level1.start();
  if(level1.win)
  {
   nextLevel.drawButton();
   if(nextLevel.IsButtonClicked())
      level2.start();
  }
}
void mousePressed() {
  level1.checkButtons();
  nextLevel.buttonCheck(mouseX, mouseY);
}
