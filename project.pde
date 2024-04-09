PImage background1, background0;
Character character;
Buttons button1;
Buttons won;
int shootarrows=0;
Ballon redballoon;
Arrow[] arrows=new Arrow[20];
Ballon[] ballons=new Ballon[15];

void setup() {
  fullScreen();
  character = new Character();
  button1 = new Buttons();
  won = new Buttons();
  background1 = loadImage("bg1.jpg");
  background0 = loadImage("bg0.jpg");
  background1.resize(width, height);
  background0.resize(width, height);
  for (int i=0; i<20; i++)
    arrows[i]=new Arrow();
  for (int i=0; i<15; i++)
    ballons[i]=new Ballon(i*100+480, height);
}
void draw() {
  background(background0);
  button1.drawButtons();

  if (button1.IsButtonClicked()) {
    background(background1);

    character.display();
    // Iterate through arrows
    for (int i = 0; i < 20; i++) {
      if (arrows[i].flag) {
        arrows[i].drawArrow();

        // Check for collision with balloons
        for (int j = 0; j < 15; j++) {
          if (arrows[i].collidesWith(ballons[j])) {
            // Collision detected
            ballons[j].setExist(false); // Set the balloon as not existing
            // Perform any other actions you want after collision
          }
        }
      }
    }
    // Display existing balloons
    for (int i = 0; i < 15; i++) {
      if (ballons[i].isExist())
        ballons[i].display();
    }
  }
}
void mousePressed() {
  button1.buttonCheck(mouseX, mouseY);
  if (mouseButton==RIGHT)
  {
    boolean current=character.getflag();
    character.setflag(!current);
  }
  if (mouseButton==LEFT)
  {
    if (!character.getflag()&&shootarrows<=19)
    {
      character.setflag(true);
      arrows[shootarrows].flag=true;
      arrows[shootarrows].set(150, mouseY+40);
      shootarrows++;
    }
  }
}
