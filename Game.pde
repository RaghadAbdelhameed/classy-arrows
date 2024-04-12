
Button start;
Button pause;
Button NextLevel;
Level1 level1;
Level2 level2;
void setup() {
  fullScreen();
  start = new Button("BlueButton.png","Start game",70,width/2,height/2,500,250);
  level1=new Level1();
}
void draw() {
level1.initialize();
 start.drawButton();
 if (start.IsButtonClicked()) 
      level1.begin();
}
void mousePressed() {
  if(!start.IsButtonClicked())
  start.buttonCheck(mouseX, mouseY);
  else
    level1.action();
}
