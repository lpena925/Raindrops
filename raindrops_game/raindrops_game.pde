/*Here we initialize the variables for the array, index,
and introduce a boolean so that the game is click controlled.
We also have the time variables and initialize them here
and mention the catcher frog.*/
int l = 900;
raindrops [] rain = new raindrops [l];
catcher frog;
boolean run;
PVector mouse;
int score = 0;
int oldTime = 0;
int index = 1;
float threshold = 1500;

void setup() {
  /*This establishes the basic size background isn't listed here
  because is will constantly be redrawn in the draw loop.
  I initiate the frog catcher here because it doesn't 
  need an array.
  Color functions are edited here.*/
  size(1000, 1000);
  colorMode(HSB, 360, 100, 100);
  noStroke();
  frameRate(500);
  frog = new catcher();
  for (int i = 0; i < l;  i++) {
    rain [i] = new raindrops();
  }
  run = false;
}

void draw() {
  /*The below is a PVector for the catcher because it makes
  it easier than typing mouseX and mouseY all the time.
  Here we edit the size and color of the score using the 
  text function.
    We need the for loops so that it calls
    on all of the items in the array simultaneously.
    The first for loop tells the raindrops to disappear
    when caught. The second for loop tells the objects t in 
    the array to display and drop. They do not drop
    simultaneously because I have an if statement below
    regulating time. It takes the current time and subtracts the old time
    to make sure that things are happening regardless of the 
    frameCount.
    To keep my program from crashing, I included an if statement
    that resents the value of the variable l (number of 
    things in the array) to 0. 
    Finally, to make the raindops loop, I added an if statement
    resets loc.y to 0 (aka the top of the screen) */
  mouse = new PVector(mouseX, mouseY);
  background (0);
  fill(255);
  textSize(50);
  text(score, width/2, height/2);

  for (int i = 0; i < index; i++) {
    if (mouse.dist(rain [i].loc) <90) {
      rain [i].reset();
    }
  }
  for (int i = 0; i < index; i++) {
    if (run) {
      rain [i].drop();
      rain [i].display();
 
    }
  }
  if (millis() - oldTime >= threshold) {
    index++;
    threshold-=10;
    oldTime = millis();
  }
  if(l>=900){
    l=0;
  }
  for (int i = 0; i < index; i++) {
  if(rain [i].loc.y>=height){
    rain [i].reset();
  }
  }
    
}

void mousePressed() {
  /*This is what controls the start and stop functions of the game
 I reset the score to 0 with every click because I don't want
 my players cheating  lol*/ 
  run = !run;
  score = 0;
}

