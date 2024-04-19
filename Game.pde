Level1 level1;
Level2 level2;
void setup() {
  fullScreen();
  level1=new Level1();
  level1.backgroundMusic = new SoundFile(this, "1_deliverables/data/GameMusic.mp3");
  level1.balloonSound = new SoundFile(this, "1_deliverables/data/BalloonPopSound.mp3");
  level2=new Level2();
  level2.backgroundMusic = new SoundFile(this, "1_deliverables/data/GameMusic.mp3");
  level2.balloonSound = new SoundFile(this, "1_deliverables/data/BalloonPopSound.mp3");
}
void draw() {
  if (!level1.getGameEnded())
    level1.startGame();
  else
  {
    level1.backgroundMusic.stop();
    level2.startGame();
  }
}
void mousePressed() {
  if (!level1.getGameEnded())
    level1.checkButtons();
  else
    level2.checkButtons();
}
