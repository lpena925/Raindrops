/*Here we initialize the variables for the array, index,
and introduce a boolean so that the game is click controlled.
We also have the time variables and initialize them here
and mention the catcher frog.*/
int l = 900;
raindrops [] rain = new raindrops [l];
catcher frog;
boolean run;
//boolean pause;
int die = 0;
PVector mouse;
PImage forest;
PImage hang;
int score = 0;
int oldTime = 0;
int index = 1;
float threshold = 2000;

void setup() {
  /*This establishes the basic size background isn't listed here
  because is will constantly be redrawn in the draw loop.
  I initiate the frog catcher here because it doesn't 
  need an array.
  Color functions are edited here. 
  Added the background by using the picture dimensions as
  the size*/
   forest = loadImage("forest.png");
   hang = loadImage("hang.png");
  size(forest.width, forest.height);
  colorMode(HSB, 360, 100, 100);
  noStroke();
  frameRate(500);
  frog = new catcher();
  for (int i = 0; i < l;  i++) {
    rain [i] = new raindrops();
  }
  run = false;
  //pause = false;
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
  if(!run){
  background(hang);
  fill(255);
  textAlign(CENTER);
  textSize(50);
  text("Click anywhere to start!", width/2, height/4);
  }
  else{
  background(forest);
  mouse = new PVector(mouseX, mouseY);
  frog.display();
  fill(255);
  textSize(50);
  text(score, width/2, height/2);

  for (int i = 0; i < index; i++) {
    if (mouse.dist(rain [i].loc) <70) {
      rain [i].reset();
    }
}
  for (int i = 0; i < index; i++) {
    if (run=true) {
      rain [i].drop();
      rain [i].display();
      //frog.touch();
 
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
    die++;
  }
  /* Lose function that allows ten raindrops to fall, and then
  game over. The die variable increases with each fallen raindrop
  and when 10 drop, that's it, game over:) */
  if(die > 10){
    background(0);
    fill(width, 100, 100);
    textAlign(CENTER);
    textSize(50);
    text("Game Over!", width/2, height/2);
  }
    
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

