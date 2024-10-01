// Class skraldebil that are controlling the placement of the cars, display, and movement. 
class Skraldebil {
  color cSkraldebil;
  float xpos;
  float ypos;
  float h;
  float w;
  float xspeed;
  float oprindeligSpeed;
  float wheelSize;

  boolean stopForGarbage = false; // True or false if the car stops?
  boolean isPaused = false; // do the car have a break?
  int stopTime = 2000; // time for break - 2000= 2 sek.
  int stopStartTime; // to start the  car again

  // constructor
  Skraldebil ( color tempC, float tempXpos, float tempYpos, float tempH, float tempW, float tempSpeed) {
    cSkraldebil = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    h = tempH;
    w = tempW;
    xspeed = tempSpeed;
    oprindeligSpeed = tempSpeed;
    wheelSize = tempH / 3;
  }

  void display() {
    // draws cars
    rectMode (CENTER);
    fill(cSkraldebil);
    stroke (0);
    rect(xpos, ypos, w, h);

    // draws whell
    fill (50);
    ellipse(xpos - w / 2 + wheelSize, ypos + h / 2, wheelSize, wheelSize);
    ellipse(xpos + w / 2 - wheelSize, ypos + h / 2, wheelSize, wheelSize);
  }
  // metoded for moving the cars, with a holdup in the middle of screen
  void move() {
    if (stopForGarbage) {
      if (millis() - stopStartTime >= stopTime) {
        stopForGarbage = false;
        xspeed = oprindeligSpeed;
        isPaused = false;
        println(" Skraldebilen stopper i to sekunder"); // tells that the car stops for a moment
      }
    } else {
      xpos += xspeed;
      if (!isPaused && xpos > width / 2 && xpos < width / 2+ 10) {
        stopForGarbage = true;
        stopStartTime = millis(); // tells the time for stopping 
        xspeed = 0;
        isPaused =true;
        println(" Bilen stopper for at afhente skrald"); 
      }
    }

    if (xpos > width) {
      xpos = 100;
      xspeed = oprindeligSpeed; // helps to start the car again after stopping
      isPaused = false;
    }
  }
}
