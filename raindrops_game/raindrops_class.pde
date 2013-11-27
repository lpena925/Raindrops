class raindrops {
  PVector loc;
  PVector vel;
  int d;
  float x;
  float y;
  color c;
  
  raindrops(){
    loc = new PVector(random(50, width-50), random(50, height-50));
    vel = PVector.random2D();
    d = 30;
    c = color(random(360), 100, 100);
  }
  
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
  
