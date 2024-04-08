public class Arrow {
  float x;
  float y;
  PImage arrow;
  boolean flag=false;// decides arrow shoot or not
  Arrow(){
    arrow = loadImage("arrow2.png");
    arrow.resize(100,100);
  }
  void drawArrow(){
    imageMode(CENTER);
    image(arrow,x,y);
    x+=4;
    
  }
  void set(float x, float y)
  {
    this.x=x;
    this.y=y;
  }

}
