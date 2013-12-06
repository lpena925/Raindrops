int l = 900;
raindrops [] rain = new raindrops [l];
boolean run;
PVector mouse;
int score = 0;
int oldTime = 0;
int index = 1;
float threshold = 1000;

void setup() {
  background (0);
  size(1000, 1000);
  colorMode(HSB, 360, 100, 100);
  noStroke();
  frameRate(500);
  for (int i = 0; i < l;  i++) {
    rain [i] = new raindrops();
  }
  run = false;
}

void draw() {
  mouse = new PVector(mouseX, mouseY);
  background (0);
  fill(255);
  textSize(50);
  text(score, width/2, height/2);

  for (int i = 0; i < index; i++) {
    if (mouse.dist(rain [i].loc) <50) {
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
  run = !run;
  score = 0;
}

