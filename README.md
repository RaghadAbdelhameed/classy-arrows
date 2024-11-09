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
  - Reload the arrow *(Character position 1)* by right-clicking the mouse, to shoot the arrow *(Character position 2)* by left-clicking the mouse.
  - Repeat these steps for each arrow.

**Position 1**

<div style="display:flex">
  <img src="./1_deliverables/data/position1.png" width="350" height="auto" />
  <img src="./1_deliverables/data/position21.png" width="200" height="auto" />
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
- You have 20 arrows and 15 red balloons. Whenever you shoot an arrow or an arrow collides with a balloon, the score is calculated by:
  ```Score = (Remaining Arrows + 1) * Number of Shot Balloons```
- If you use all the arrows and the arrows do not collide with all the balloons, then you have lost and get **"Sorry, you failed"** along with your score. You can retry the level by left-clicking the mouse on the **"Retry"** button, then you can choose the difficulty you want.
- If all the balloons collide with the arrows, then you have succeeded and get **"Congrats, you win!"** along with your score. You can move to level 2 by left-clicking the mouse on the **"Next level"** button, then you can choose the difficulty for the new level.

<div style="display:flex">
  <img src="./1_deliverables/images/lose1.png" width="350" height="auto" />
  <img src="./1_deliverables/images/win1.png" width="350" height="auto" />
</div>

### Level 2

- In level 2, you can move the character, load arrows, and fire them in the same ways as in level 1.
- **Balloons:** There are two types of balloons, red and yellow **(3 yellow balloons + 12 red balloons)**, and they all move randomly. The yellow balloons move with acceleration, while the red ones move at a constant speed.
- When an arrow collides with a yellow balloon, the score is increased by 10 points.
  ```Score = (Remaining Arrows + 1) * Number of Shot Red Balloons + Number of Shot Yellow Balloons * 10```
- If you use all the arrows and the arrows do not collide with all the balloons, then you have lost and get **"Sorry, you failed"** along with your score. You can retry the level by left-clicking on the mouse on the **"Retry"** button, then you can choose the difficulty you want as level 1.
- If all the balloons (Red and Yellow) collide with the arrows, then you have succeeded, get **"Congrats, you win!"** along with your score.

<div style="display:flex">
  <img src="./1_deliverables/images/lose.png" width="350" height="auto" />
  <img src="./1_deliverables/images/win2.png" width="350" height="auto" />
</div>

## Code Structure

- **Balloon Class**: Represents a balloon object in the game, containing image, position, and existence status.
- **RedBalloon Class**: Extends Balloon to represent red balloons, adding custom movement behavior.
- **YellowBalloon Class**: Extends Balloon to represent yellow balloons, moving randomly with variable speed.
- **Arrow Class**: Represents an arrow that can be shot at balloons, with collision detection for scoring.
- **Button Class**: Creates clickable buttons for game interactions.
- **Character Class**: Manages character appearance, position, and actions.
- **Level1 & Level2 Classes**: Manages elements and rules for game levels, allowing gameplay progression.
- **Game Class**: Main game controller, managing setup, rendering, and player interactions.

## UML

<img src="./1_deliverables/UML.svg" alt="UML"/>

## Features

### Difficulty Levels and Collision Radius

Adjust the challenge to your skill level with three difficulty settings: easy, medium, and hard. Each difficulty level modifies the collision radius, affecting how close your arrow needs to be to a balloon to pop it. Test your precision and reflexes as you progress from beginner to expert!

<p align="center">
  <img src="./1_deliverables/images/option1.png" width="400" height="auto" />
</p>

### Immersive Audio Experience

- **Background Music**: Engaging music enhances gameplay, setting the mood and keeping players entertained.
- **Sound Effects**: Realistic sounds amplify the experience, adding excitement to each balloon popped.

### Retry Game and Set Difficulty Again
Challenge yourself to improve your skills by retrying with a new difficulty level whenever needed. Victory is only a few well-aimed shots away!

<p align="center">
  <img src="./1_deliverables/images/lose.png" width="400" height="auto" />
</p>

## Licenses

- Classy Arrows is open-source software licensed under the [MIT License](LICENSE). Feel free to use, modify, and distribute this project for both personal and commercial purposes, as long as the original license terms are retained.
