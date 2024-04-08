public class Ballon
{

  PImage[] balloons; // Array to hold balloon images
  PImage background;
  int numBalloons = 15;
  int screenWidth = 500;
  int spaceBetweenBalloons = 1; // Set space between balloons to 1 pixel
  int y = 800;

  void balloon() {
    balloons = new PImage[numBalloons]; // Initialize the array

    for (int i = 0; i < numBalloons; i++) {
      balloons[i] = loadImage("redballoon.png"); // Load each balloon image into the array
      balloons[i].resize(80, 100); // Resize each balloon image
    }
  }

  void display() {
    // Calculate the total width occupied by balloons and spaces
    float totalWidth = numBalloons * balloons[0].width + (numBalloons - 1) * spaceBetweenBalloons;

    // Calculate the initial x-coordinate for the first balloon
    float startX = (screenWidth - totalWidth) / 2;

    // Draw each balloon with 1 pixel space between them
    for (int i = 0; i < numBalloons; i++) {
      image(balloons[i], startX + i * (balloons[i].width + spaceBetweenBalloons)+1100, y);
    }
    
    y -= 3;
    if (y <= 0) {
      y = 800;
    }
  }
}
