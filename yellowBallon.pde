class yellow extends Ballon
{
  private float speed =random(2);
  private float acceleration =random(0.05);
  public yellow(String imagepath, float x, float y)
  {
    super(imagepath, x, y);
  }

    public void update()
  {
    speed+=acceleration;
    posY-=speed;  //moves upward with irregular speed
    if (posY<0)    // If the balloon goes off-screen, reset its position and parameters
    {
      posY=height;
      speed =random(2);  //reset speed
      acceleration =random(0.05); //reset acceleration
    }
  }
 
}
