class yellow extends Ballon
{
  yellow(String imagepath,float x, float y)
    {
        super(imagepath,x,y);
        
     }
     @Override
      public void display()
  {
    imageMode(CENTER);
    image(balloon, posX, posY);
    posY-=random(4,7);
    if (posY<0)
      posY=height;
  }
 

}
