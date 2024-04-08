PImage background1;
Character character1;
Character character2;
Arrow arrow1;
boolean showImage1=true;
boolean flag;
void setup() {
  size(800, 500);
  character1 = new Character();
  character2 = new Character();
  arrow1 = new Arrow();
  background1 = loadImage("bg1.jpg");
  background1.resize(width, height);
}
<<<<<<< HEAD
void draw() {
  background(background1);
  if (showImage1) {
    character1.drawCharacter1();
  } else {
    character2.drawCharacter2();
  } if(flag==true){
  arrow1.drawArrow();
  }
}
void mousePressed() {
  // background(background1);
  showImage1=!showImage1;
  flag=false;
}
//void mouseReleased() {
//  showImage1=true;

//}
=======
void draw(){
  background(0,0,255);}
>>>>>>> bdd021245d7124a10acf95f4aab400260ebcae20
