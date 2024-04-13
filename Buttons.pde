class Button {
  private PImage buttonClick; // image
  private int textX;// x postion for the image
  private int textY;// y postion for the image
  private int textWidth;// width postion for the image
  private int textHeight; // height for the image
  private boolean buttonClicked; // booelan value determine the button clicked or not
  Button(String imagePath,  int textX, int textY, int textWidth, int textHeight) {
    buttonClick = loadImage(imagePath);

    this.textX = textX;
    this. textY = textY;
    this.textWidth=textWidth;
    this.textHeight=textHeight;
    buttonClicked = false;
    buttonClick.resize(textWidth, textHeight);
  }


  void drawButton() {
    if (!buttonClicked) {
      imageMode(CENTER);
      image(buttonClick, textX, textY, textWidth, textHeight);
     
    }
  }
  boolean IsButtonClicked() {
    return buttonClicked;
  }
  void buttonCheck(int x, int y) {
    int left = textX - textWidth / 2;
    int right = textX + textWidth / 2;
    int top = textY - textHeight / 2;
    int bottom = textY + textHeight / 2;
    if (x >= left && x <= right && y >= top && y <= bottom) 
      buttonClicked = true;
    else 
      buttonClicked = false;
    
  }
}
