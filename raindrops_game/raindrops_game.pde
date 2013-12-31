/*Here we initialize the variables for the array, index,
and introduce a boolean so that the game is click controlled.
We also have the time variables and initialize them here
and mention the catcher frog.*/
int l = 900;
raindrops [] rain = new raindrops [l];
catcher frog;
boolean run;
boolean gameOver;
boolean win;
int lives = 10;
PVector mouse;
PImage forest;
PImage hang;
PImage tiny;
PImage smile;
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
   tiny = loadImage("tiny.png");
   smile = loadImage("smile.jpg");
  size(forest.width, forest.height);
  colorMode(HSB, 360, 100, 100);
  noStroke();
  frameRate(500);
  noCursor();
  frog = new catcher();
  for (int i = 0; i < l;  i++) {
    rain [i] = new raindrops();
  }
  run = false;
  gameOver = false;
  win = false;
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
  textSize(50);
  text("Score", width/2, height/2.5);
  text(score, width/2, height/2);
  textAlign(CENTER);
  textSize(50);
  text("Lives", width/8, height/9);
  text(lives, width/6, height/6);

  for (int i = 0; i < index; i++) {
    if (frog.loc.dist(rain [i].loc) <70) {
      rain [i].reset();
      score++;
    }
}
  for (int i = 0; i < index; i++) {
    if (run==true && gameOver==false ) {
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
    lives--;
  }
  /* These are my levels. Everytime the score hits a certain
  milesone, the theshold (the seconds needed before drops
  are added) decreases. In other words, it gets faster with
  each new level*/
  if(score >= 10){
    threshold = 1500;
  }
  if(score >= 50){
    threshold = 1000;
  }
  if(score >= 100){
    threshold = 500;
  }
  if(score >= 200 && score <=300){
    threshold = 250;
  }
  if(score >= 500){
    win = true;
  }
  if(win == true){
    background(forest);
    textAlign(CENTER);
    fill(255);
    textSize(50);
    text("You Won!", width/2, height/4);
    image(smile, width/2, height/2, 250, 250);
  }
    

  

  
  /* Lose function that allows ten raindrops to fall, and then
  game over. The lives variable decreases with each fallen raindrop
  and when 10 drop, that's it, game over:) */
  if(lives <= 0){
    gameOver = true;
    score = 0;
    lives = 10;
    
  }
  if(gameOver){
    background(tiny);
    fill(255);
    textAlign(CENTER);
    textSize(30);
    text("Try Again? (Press Key. To pause,  press key again)", width/2, height/4);
  }
  }
}
}



void mousePressed() {
  /*This (the mousePressed and keyPressed functions0
  are what controls the transitions of the game, start
  screen, main game, and game over screen*/
  run = !run;
}

void keyPressed(){
  gameOver = !gameOver;
  index = 1;
}

