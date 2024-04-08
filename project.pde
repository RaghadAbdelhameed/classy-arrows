PImage background1;
Character character;
int shootarrows=0;
Ballon redballoon;
Arrow[] arrows=new Arrow[20];

void setup() {
  fullScreen();
  character = new Character();
  background1 = loadImage("bg1.jpg");
  background1.resize(width, height);
  redballoon=new Ballon();
  redballoon.balloon();
  for(int i=0;i<20;i++)
  arrows[i]=new Arrow();
}
void draw() {
  background(background1);
  character.display();
  redballoon.display();
  for(int i=0;i<20;i++)
    if(arrows[i].flag)
       arrows[i].drawArrow();
  
  
  
  

}
void mousePressed() {
  if(mouseButton==RIGHT)
       {
         boolean current=character.getflag();
         character.setflag(!current);
       }
       if(mouseButton==LEFT)
       {
         if(!character.getflag()&&shootarrows<=19)
         {
            character.setflag(true);
            arrows[shootarrows].flag=true;
            arrows[shootarrows].set(150,mouseY+40);
            shootarrows++;
            
         }
       }
       
  
}
