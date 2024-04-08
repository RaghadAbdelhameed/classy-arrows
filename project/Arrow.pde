public class Arrow {
  PImage arrow1;
  float ArrowSpeed=100;
  boolean flag=false;
  Arrow(){
    arrow1 = loadImage("arrow2.png");
    arrow1.resize(100,100);
  }
  void drawArrow(){
    imageMode(CENTER);
    image(arrow1,ArrowSpeed,100);
    ArrowSpeed+=5;
  }
  void speed(){
    
  }
}
