PImage background1;
Character character;
int shootarrows=0;
Ballon redballoon;
Arrow[] arrows=new Arrow[20];
Ballon[] ballons=new Ballon[15];

void setup() {
  fullScreen();
  character = new Character();
  background1 = loadImage("bg1.jpg");
  background1.resize(width, height);
  for(int i=0;i<20;i++)
  arrows[i]=new Arrow();
  for(int i=0;i<15;i++)
  ballons[i]=new Ballon(i*100+480,height);
}
void draw() {
  background(background1);
  character.display();
  for(int i=0;i<20;i++)
    if(arrows[i].flag)
       arrows[i].drawArrow();
       
       for(int i=0;i<15;i++)
       {
       ballons[i].display();
       }
   
  
  
  
  

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
