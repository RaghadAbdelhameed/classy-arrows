class Level2 extends Level1
{
  //Ballon[] redballons=new Ballon[12];
  yellow[] danger=new yellow[3];
  Level2()
  {
    widthHappy=600;
    heightHappy=450;
    xHappy=150;// 5 8 11
    yHappy=800;
    widthDead=750;
    heightDead=400;
    xDead=180;
    yDead=790;
    background1 = loadImage("bg02.png");
    background0 = loadImage("bg022.png");
    background1.resize(width, height);
    background0.resize(width, height);
    ballons=new Ballon[12];
    for (int i=0; i<20; i++)
      arrows[i]=new Arrow("arrow1.png");
    character = new Character("position21.png", "position22.png", "position23.png", 400, 300);
   
    ballons[0]=new Ballon("redballoon.png", 0*100+480, random(0, height));
    ballons[1]=new Ballon("redballoon.png", 1*100+480, random(0, height));
    ballons[2]=new Ballon("redballoon.png", 2*100+480, random(0, height));
    ballons[3]=new Ballon("redballoon.png", 3*100+480, random(0, height));
    ballons[4]=new Ballon("redballoon.png", 4*100+480, random(0, height));
    danger[0]=new yellow("yellowBalloon.png", 5*100+480, random(0, height));
    ballons[5]=new Ballon("redballoon.png", 6*100+480, random(0, height));
    ballons[6]=new Ballon("redballoon.png", 7*100+480, random(0, height));
    danger[1]=new yellow("yellowBalloon.png", 8*100+480, random(0, height));
    ballons[7]=new Ballon("redballoon.png", 9*100+480, random(0, height));
    ballons[8]=new Ballon("redballoon.png", 10*100+480, random(0, height));
    danger[2]=new yellow("yellowBalloon.png", 11*100+480, random(0, height));
    ballons[9]=new Ballon("redballoon.png", 12*100+480, random(0, height));
    ballons[10]=new Ballon("redballoon.png", 13*100+480, random(0, height));
    ballons[11]=new Ballon("redballoon.png", 14*100+480, random(0, height));
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
    void ShowBallons()
  {
    for (int i = 0; i < ballons.length; i++)  // Display existing balloons
      if (ballons[i].getExist())
        ballons[i].display();
         for (int i = 0; i < danger.length; i++)  // Display existing balloons
      if (danger[i].getExist())
        danger[i].display();
        
  }
    @Override
    void DrawArrows()
  {
    for (int i = 0; i < 20; i++) {
      if (arrows[i].getexsist()) {
        arrows[i].drawArrow();
        for (int j = 0; j < ballons.length; j++)
          if (arrows[i].collidesWith(ballons[j])&&ballons[j].getExist()) {// Collision detected
            ballons[j].setExist(false); // Set the balloon as not existing
            shootballoons++;
            //balloonSound.play();
          }
           for (int j = 0; j < danger.length; j++)
          if (arrows[i].collidesWith(danger[j])&&danger[j].getExist()) {// Collision detected
            danger[j].setExist(false); // Set the balloon as not existing
            shootballoons++;
            //balloonSound.play();
          }
      }
    }
  }
}
