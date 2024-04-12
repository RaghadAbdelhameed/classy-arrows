class Button {
  private PImage buttonClick; // image
  private String buttonText;//text shown in the string
  private int textSize; // font size
  private PFont buttonFont; // font of the string (size+type)
  private int textX;// x postion for the image
  private int textY;// y postion for the image
  private int textWidth;// width postion for the image
  private int textHeight; // height for the image
  private boolean buttonClicked; // booelan value determine the button clicked or not
  Button(String imagePath, String buttonText, int textSize, int textX, int textY,int textWidth,int textHeight) {
    buttonClick = loadImage(imagePath);
   this. buttonText = buttonText;
   this. textSize = textSize;
    buttonFont = createFont("Speed rush", textSize);
    this.textX = textX;
   this. textY = textY;
   this.textWidth=textWidth;
   this.textHeight=textHeight;
    buttonClicked = false;
    buttonClick.resize(textWidth,textHeight);
  }
  
  void drawButton() {
    if (!buttonClicked) {
    imageMode(CENTER);
    image(buttonClick, textX, textY, textWidth, textHeight);
    textAlign(CENTER, CENTER);
    textSize(textSize);
    textFont(buttonFont);
    fill(255); 
    text(buttonText, textX, textY);
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
  if (x >= left && x <= right && y >= top && y <= bottom) {
    buttonClicked = true;
  } else {
    buttonClicked = false;
  }
}

}
