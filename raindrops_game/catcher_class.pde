class catcher{
  PVector mouse;
  PVector loc;
  PVector vel;
  PImage frog;
  int d;
  float x;
  float y;
  color c;
  
  catcher(){
    mouse = new PVector(mouseX, mouseY);
    loc = new PVector(random(50, width-50), random(50, height-50));
    vel = PVector.random2D();
    d = 30;
    //c = color(random(360), 100, 100);
    imageMode(CENTER);
    frog = loadImage("frog.png");
  }
  
  
  void display(){
    fill(c);
    image(frog, loc.x, loc.y, d, d);
  }
  
  void reset(){
    loc.y = 0;
    score++;
  }
  
  void touch(raindrops p){
    if(mouse.dist(p.loc) <90){
    p.reset();
  }
  }
}
    
    
    
    
