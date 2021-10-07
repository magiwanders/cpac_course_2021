


void setup(){
  size(200,200);
  frameRate(20);
}

void draw(){
  background(255, 255, 255);
  fill(255,0,0);
  arc(50,50,70,70,0, PI/6);
  
  noFill();
  rectMode(CENTER);
  rect(50,50,70,70);
}
