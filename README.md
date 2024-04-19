# Bow and Arrow Game

<img src="./1_deliverables/images/game.png">

Welcome to the Bow and Arrow Game, where your aim determines your success! Get ready for the ultimate test of accuracy and nerve as you aim carefully and pop balloons with your bow – every shot counts!

# Table of Contents
- [Introduction](#introduction)
- [Controls](#controls)
- [Gameplay](#gameplay)
- [Code Structure](#code-structure)
- [UML](#uml)
- [Features](#features)
- [Licenses](#licenses)

## Introduction
Welcome to our Bow and Arrows game! This game offers an exciting archery experience where players try to hit targets using a bow and arrow. There are different difficulty levels to choose from, exciting gameplay features, and a limited supply of arrows, making each shot require skill and planning. In this guide, you will discover all the information you need to begin playing the game, such as controls, how the game works, and strategies to make the most of your arrows. So, grab your bow, aim carefully, and challenge yourself in this immersive and challenging game!

## Controls

- To control your character's vertical movement, simply move the mouse up or down.
- To shoot arrows at balloons:
 Reload the arrow *(Character position 1)* by right-clicking the mouse, to shoot the arrow *(Character position 2)* by left-clicking the mouse.
- Repeat these steps for each arrow.

 **Position 1**

<div style="display:flex">
<img src="./1_deliverables/data/position1.png" width="350" height="auto" />
<img src="./1_deliverables/data/position21.png"width="200" height="auto" />
</div>

 **Position 2**

<div style="display:flex">
<img src="./1_deliverables/data/position2.png" width="350" height="auto" />
<img src="./1_deliverables/data/position22.png" width="200" height="auto" />
</div>

## Gameplay

### Level 1

- Game starts with Options (you choose the difficulty of the level you want: easy, medium, or hard by left-clicking the mouse), then level 1 starts.
- **Balloons:** Red balloons move regularly and at the same speed.
- You have 20 arrows and 15 red balloons. Whenever you shoot an arrow or an arrow collides with a balloon,The score is calculated by: ```Score = (Remaining Arrows + 1) * Number of Shot Balloons```
- If you use all the arrows and the arrows do not collide with all the balloons, then you have lost and get **"Sorry, you failed"** along with your score. You can retry the level by left-clicking the mouse on the **"Retry"** button, then you can choose the difficulty you want.
- If all the balloons collide with the arrows, then you have succeeded and  get **"Congrats, you win!"** along with your score. You can move to level 2 by left-clicking the mouse on the **"Next level"** button, then you can choose the difficulty for the new level.

<div style="display:flex">
<img src="./1_deliverables/images/lose1.png" width="350" height="auto" />
<img src="./1_deliverables/images/win1.png" width="350" height="auto" />
</div>

### Level 2

- In level 2, you can move the character, load arrows, and fire them in the same ways as in level 1.
- **Balloons:** There are two types of balloons, red and yellow **(3 yellow balloons + 12 red balloons)** , and they all move randomly. The yellow balloons move with acceleration, while the red ones move with a constant speed.
- When an arrow collides with a yellow balloon, the score is increased by 10 points.
- ```Score = (Remaining Arrows + 1) * Number of Shot Red Balloons + Number of Shot Yellow Balloons * 10 ```
- If you use all the arrows and the arrows do not collide with all the balloons, then you have lost and get **"Sorry, you failed"** along with your score. You can retry the level by left-clicking on the mouse on the **"Retry"** button, then you can choose the difficulty you want as level 1.
- If all the balloons (Red and Yellow) collide with the arrows, then you have succeeded, get **"Congrats, you win!"** along with your score.

<div style="display:flex">
<img src="./1_deliverables/images/lose.png" width="350" height="auto" />
<img src="./1_deliverables/images/win2.png" width="350" height="auto" />
</div>

## Code Structure

### Balloon Class

#### Overview
The “Balloon” class represents a balloon object in the game. Each balloon has an image, position coordinates (x, y), and existence status. 

#### Constructor
 ```
 Balloon(String imagepath, float x, float y)
 ```

Creates a new ‘Balloon’ object with the specified image path, initial X-coordinate position (‘x’), and initial Y-coordinate position (‘y’).

#### Methods
- We used Setter and Getter to set and get the coordinate positions for each balloon.
- ```setExist(boolean exist):``` Sets the existence status of the balloon.
- ```getExist():``` boolean Returns true if the balloon exists, false otherwise.
- ```display():``` Displays the balloon on the screen and updates its position. The balloon moves upwards and reappears at the bottom when it reaches the top of the screen.
#### Usage:

```
// Create a balloon object
Balloon balloon = new Balloon("balloon.png", 200, 300);

// Display the balloon
balloon.display();
  ```

### RedBalloon Class

#### Overview
The Red class **extends** the functionality of the Balloon class to represent a red balloon in the game. This class inherits attributes and methods from the Ballon class while providing custom behavior specific to red balloons.

#### Constructor
```
red(String imagepath, float x, float y)
```
Creates a new Red object with the specified image path and initial position, utilizing the constructor of the parent Balloon class.

#### Methods
- ```update():``` **Overrides** the ```update()``` method of the parent class to provide custom behavior for red balloons. The red balloon moves upwards at a constant speed of 3 units per frame. If the balloon goes off-screen, its position is reset to the bottom.

#### Usage
```
// Create red balloons
Red[] redBalloons = new Red[15];
for (int i = 0; i < redBalloons.length; i++) {
    redBalloons[i] = new Red("redBalloon.png", i * 100 + 480, height);
}

// Display red balloons
for (Red redBalloon : redBalloons) {
    redBalloon.update();
    redBalloon.display();
}
```

This class extends the functionality of the Balloon class by introducing specific behavior for red balloons in the game.

### YellowBalloon Class

#### Overview
The ‘YellowBalloon’ class **is an extension of** the ‘Balloon’ class, representing a yellow balloon in the game. It inherits attributes and methods from the ‘Balloon’ class and provides custom behavior for displaying the yellow balloon.

#### Constructor
```
YellowBalloon(String imagepath, float x, float y)
```

Creates a new ‘YellowBalloon’ object with the specified image path and initial position, utilizing the constructor of the parent Balloon class.
#### Methods
- ```display()``` **Overrides** the ```display()``` method of the parent class to provide custom behavior for displaying the yellow balloon. The yellow balloon moves upwards at a random speed between 4 and 7 units per frame and reappears at the bottom when reaching the top of the screen.

#### Usage
```
// Create yellow balloons
yellow[] danger = new yellow[3];
for (int i = 0; i <= 14; i++) {
      if (i % 5 == 2) {
        danger[yellowIndex] = new yellow("yellowBalloon.png", i * 100 + 480, random(0, height));
        yellowIndex++;
// Display the yellow balloons
for (int i = 0; i < danger.length; i++) {
      if (danger[i].getExist()) {
        danger[i].display();
      }
    }
  }
}
```    

### Arrow Class

#### Overview
The ‘Arrow’ class represents an arrow object in the game, which can be shot towards targets. It manages the arrow's position, existence, and collision detection with balloons.

#### Constructor
```
Arrow(String imagePath)
```

Creates a new ‘Arrow’ object with the specified image path.
#### Methods
- We used Setter and Getter to set and get the coordinate positions for each arrow.
- ```setExist(boolean exists):``` Sets the existence status of the arrow.
- ```getExist():``` boolean Returns the existence status of the arrow.
- ```setDifficulty(float difficulty):``` Sets the difficulty level for collision detection.
- ```update():``` Updates the position of the arrow.
- ```drawArrow():``` Draws the arrow on the screen and updates its position.
- ```collidesWith(Ballon balloon):``` boolean Checks if the arrow collides with a balloon.

#### Usage
```
//Create Arrows
Arrow[] arrows=new Arrow[20];
for (int i=0; i<20; i++)
      arrows[i]=new Arrow("arrow2.png");
//Display the Arrows and within colliding make the balloon disappear 
void DrawArrows()
  {
    for (int i = 0; i < 20; i++) {
      if (arrows[i].getexsist()) {
        arrows[i].drawArrow();
        for (int j = 0; j < ballons.length; j++)
          if (arrows[i].collidesWith(ballons[j])&&ballons[j].getExist()) {// Collision detected
            ballons[j].setExist(false); // Set the balloon as not existing
            shootballoons++;
          }
      }
    }
  }
```

 ### Button Class

#### Overview
The ‘Button’ class represents a clickable button in the game interface. It manages the button's image, position, size, and click status.

#### Constructor

```
Button(String imagePath, int textX, int textY, int textWidth, int textHeight)
```

Creates a new ‘Button’ object with the specified image path, position, and dimensions.

#### Methods
- ```drawButton():``` Draws the button on the screen if it's not clicked.
- ```IsButtonClicked():```: boolean Returns true if the button is clicked, false otherwise.
- ```restart():``` Resets the button click status to false.
- ```buttonCheck(int x, int y):``` Checks if the button is clicked based on the provided mouse coordinates (x, y).

#### Usage
```
Button button = new Button("path_image.png", 100, 200, 50, 50);
button.drawButton();
if (!button.IsButtonClicked()) {
button.buttonCheck(mouseX, mouseY); // Check if mouse is over the button
}
```

### Character Class

#### Overview
The ‘Character’ class represents a character in the game, managing its appearance, position, and state. This character can have different images for various actions, such as standing, shooting, and losing.

#### Constructor
```
Character(String path1, String path2, String pathDead, int width, int height)
```

Creates a new ‘Character’ object with the specified image paths for different states. The ‘width’ and ‘height’ parameters determine the dimensions of the character's images.

#### Methods
- ```setPostion(boolean position):``` Sets the character's position (true for the standard position, false for the shooting position).
- ```getpostion():``` boolean Returns the current position of the character.
- ```limitY():``` Limits the character's Y-coordinate position to prevent it from going below the ground.
- ```display():``` Displays the character on the screen according to its current position and state.
- ```drawCharacterDead(int width, int height, int x, int y):``` Draw the character's dead state (losing) at the specified position with the given dimensions.
- ```drawCharacterHappy(int width, int height, int x, int y):``` Draws the character in a happy state (winning) at the specified position with the given dimensions.
- ```drawCharacter2():``` Draws the character in its second state (e.g., shooting) at the specified position.
- ```drawCharacter1():``` Draw the character's first state (e.g., standing) at the specified position.
- ```getX()``` and  ```getY():``` Returns the X and Y coordinate positions of the character.

#### Usage
```
// Create a character object
Character character = new Character("path_character1.png", path_character2.png", "path_character_dead.png", 600, 400);

// Display the character
character.display();

// Draw character in dead state
character.drawCharacterDead(50, 50, 100, 100);

// Draw character in happy state
character.drawCharacterHappy(50, 50, 100, 100);
```

### Level1 Class

#### Overview
The ‘Level1’ class represents the first level of the game, managing game elements such as buttons, characters, arrows, and balloons. It controls the game flow, scoring, difficulty levels, and win/lose conditions.

#### Constructor
```
Level1()
```

Creates a new ‘Level1’ object, initializing game elements such as buttons, character, background images, arrows, and balloons.

#### Methods
- ```Restart():``` Resets the game state, allowing the player to retry.
- ```ShowBallons():``` Displays existing balloons on the screen.
- ```begin(int difficulty):``` Initiates the game with the specified difficulty level,displaying game elements and managing gameplay.
- ```cheeckarrows():``` boolean Checks if all arrows have reached the end of the screen.
- ```DrawArrows():``` Draws arrows on the screen and checks for collisions with balloons.
- ```showScore():``` Displays the player's score and remaining arrows during gameplay.
- ```getGameEnded():``` boolean Returns true if the game has ended.
- ```showWin():``` Displays the winning message and shows a button for the next level.
- ```showFail():``` Displays the failure message and shows a button for retry.
- ```startGame():``` Displays the start screen with difficulty options.
- ```setdifficulty():``` Sets the game difficulty based on player selection.
- ```checkButtons():``` Checks for mouse interactions with buttons.
- ```action():``` Handles player actions such as shooting arrows and changing character position.

#### Usage
```
// Create a new Level1 object
Level1 level1 = new Level1();

// Restart the game
level1.Restart();

// Start the game
level1.startGame();
```

This class serves as the foundation for the first level of the game, managing game elements and interactions to provide an engaging gaming experience.

### Level2 Class
#### Overview
The ‘Level2’ class **extends** the ‘Level1’ class, representing the second level of the game with additional game elements and features. It introduces yellow balloons as a new challenge alongside the existing red balloons.

#### Constructor
```
Level2()
```

Creates a new Level2 object, initializing game elements specific to the second level, including background images, balloons, arrows, and character settings.

#### Methods
- ```Restart():``` Resets the game state for the second level, allowing the player to retry. It reinitializes all game elements such as arrows, balloons, and difficulty settings.

#### Usage
```
// Create a new Level2 object
Level2 level2 = new Level2();

// Restart the game
level2.Restart();
```
This class **extends** the game functionality to provide an enhanced gaming experience with new challenges and elements in the second level.

### Game Class

#### Overview
The ‘Game’ class serves as the main control hub for the game, managing the setup, drawing, and user interaction functionalities. It controls the flow between different levels and handles mouse input events.

#### Class Structure
- Level1: Represents the first level of the game.
- Level2: Represents the second level of the game.

#### Constructor
```
setup()
```

 Initializes the game environment by setting up the screen size and creating instances of Level1 and Level2 classes.

#### Methods
- ```draw():``` Continuously called by Processing, check if the first level has ended, and if not, start the first level. If the first level has ended, start the second level.
- ```mousePressed():``` Handles mouse click events. Check for button clicks in the first level. If the first level has ended, check for button clicks in the second level.

#### Usage
1. Instantiate the Game object.
2. Call the ```setup()``` function to initialize the game environment.
3. Call the ```draw()``` function continuously to render the game elements.
4. Handle mouse click events by implementing the ```mousePressed()```function.

### Dependencies
- Processing Library: Required for graphics manipulation and user interaction.

## UML

<img src="./1_deliverables/UML.svg" alt="UML"/>


## Features

### Difficulty Levels and Collision Radius

Adjust the challenge to your skill level with three difficulty settings: easy, medium, and hard. Each difficulty level modifies the collision radius, affecting how close your arrow needs to be to a balloon to pop it. Test your precision and reflexes as you progress from beginner to expert!

<p align="center">
<img src="./1_deliverables/images/option1.png" width="400" height="auto" />
</p>

### Immersive Audio Experience

Immerse yourself in an audio-rich environment that enhances every aspect of the gameplay:

- **Engaging Background Music:** Elevate your gaming experience with captivating background music that sets the mood and entertains players as they navigate through the game. It keeps you engaged and focused throughout the experience.

- **Realistic Sound Effects:** Experience the satisfaction of popping balloons with immersive sound effects that bring the game to life. Hear the satisfying "pop" as your arrow hits its target, adding another layer of excitement to each shot. Each sound effect contributes to making your gameplay more enjoyable and memorable.

### Retry Game and Set Difficulty Again
Don't give up if you lose! With the option to retry the game, you can reset and try again. Choose a new difficulty level and challenge yourself to improve your skills. Whether you're a beginner or an expert archer, there's always room for improvement and another chance at victory!

<p align="center">
  <img src="./1_deliverables/images/lose.png" width="400" height="auto" />
</p>

## Licenses

-Classy Arrows is open-source software licensed under the [MIT License](LICENSE). Feel free to use, modify, and distribute this project for both personal and commercial purposes, as long as the original license terms are retained.

-The background music used in this project is sourced from the Game of Thrones series. All rights to the music belong to its respective copyright holder. The use of this music in this project is permitted under the terms of the license agreement obtained from the copyright holder.


