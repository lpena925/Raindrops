/*Here we create a class for the catcher to make our lives easier. 
 I included the necessary variables and PVectors, and they will
 ble initiallized in the construcot, which is located after 
 catcher() */

class catcher {
  PVector mouse;
  PVector loc;
  PVector vel;
  PImage croak;
  int d;
  float x;
  float y;

  /*Here is where we initialize the variables and give the PVectors
   the data they hold. I also initialize the image since I want
   my frog to be the catcher*/
  catcher() {
    mouse = new PVector(mouseX, mouseY);
    loc = new PVector(random(50, width-50), random(50, height-50));
    vel = PVector.random2D();
    d = 90;
    imageMode(CENTER);
    croak = loadImage("frog.png");
  }

  /* Here are my functions. Display just allows the catcher to
   pop up on the screen. Reset is what tells the raindrop
   to go back to the top of the screen. Touch makes sure that the
   catcher touches the raindrop to reset it*/
  void display() {
    if(mouseY>=height/4){
    loc.set(mouseX,mouseY);
    }
    else{
      loc.set(mouseX, height/4);
    }
    image(croak, loc.x, loc.y, d, d);
  }

  void reset() {
    loc.y = 0;
    score++;
  }

  void touch(raindrops p) {
    if (mouse.dist(p.loc) <70) {
      p.reset();
    }
  }
}




