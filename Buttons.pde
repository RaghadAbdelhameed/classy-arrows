public class Buttons {
  PImage buttonClick;
  String buttonText="Start Game";
  //String won="YOU WON!";
  int textSize = 70;
  int textX=width/2;
  int textY=height/2;
  int textWidth=500;
  int textHeight=250;
  int textLeft=textX-textWidth/2;
  int textRight=textX+textWidth/2;
  int textTop=textY-textHeight/2;
  int textBottom=textY+textHeight/2;
  PFont fontButton, message;
  boolean buttonClicked=false;
  Buttons() {
    buttonClick = loadImage("BlueButton.png");
    fontButton = createFont("Speed Rush", textSize);
    message = createFont("Speed Rush", textSize);
    textFont(fontButton);
    textFont(message);
    buttonClick.resize(textWidth, textHeight);
  }

  void drawButtons() {
    if (!buttonClicked) {
      imageMode(CENTER);
      image(buttonClick, textX, textY );
      fill(255);
      textSize(textSize);
      textAlign(CENTER, CENTER);
      text(buttonText, textX, textY);
    }
  }
  void buttonCheck(int mouseX, int mouseY) {        //to check if the button is clicked within it's borders
    if (mouseX>textLeft && mouseX<textRight && mouseY>textTop && mouseY<textBottom) {
      buttonClicked=true;
    }
  }
  boolean IsButtonClicked() {
    return buttonClicked;
  }
  //void wonMessage() {
  //  fill(255);
  //  textSize(textSize);
  //  textAlign(CENTER, CENTER);
  //  text(won, textX, textY);
  //}
}
