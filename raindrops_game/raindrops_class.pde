/* This is the beginning of my main class for the game. It will
be used to make the array later on. Below I start the class
off my naming variables and PVectors and intializing them */

class raindrops {
  PVector loc;
  PVector vel;
  int d;
  float x;
  float y;
  color c;
  
/*This is my constructor, it contains the meat of my code and
defines the variables and PVectors. Here I give the PVectors
the data they need to store. Because I want the colors to be 
random, I assign random valuess to the color variable c. */
  raindrops(){
    loc = new PVector(random(50, width-50), random(50, height-50));
    vel = PVector.random2D();
    d = 30;
    c = color(random(360), 100, 100);
  }
 
/*Display allows the function to show up. Drop allows it
to travel down the screen. Reset is what tells the raindrop
to go back to the top of the screen when it hits the bottom.
each time it loops, the score goes up*/
  void display(){
    fill(c);
    ellipse(loc.x, loc.y, d, d);
  }
  
  void drop(){
    loc.y = loc.y + abs(vel.y);
  }
  void reset(){
    loc.y = 0;
    score++;
  }
}
  
