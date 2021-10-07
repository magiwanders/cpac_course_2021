float offset = 1;
color c1;
color c2;
color c3;

MyPoint p1;
MyPoint p2;
MyPoint p3;

void setup(){
  size(800,800);
  background(255,255,255);
  frameRate(60);
  
  c1 = color(255, 204, 0);
  c2 = color(255, 10, 0);
  c3 = color(0, 10, 255);
  p1 = new MyPoint(10,10,10, c1);
  p2 = new MyPoint(150,300,20, c2);
  p3 = new MyPoint(0,0,20, c3);
  p1.plot();
  p2.plot();
  p3.plot();
}


void draw(){ 
  background(255,255,255); // Previous positions overpainted
  p1.move(mouseX,mouseY); // The first dot just follows the mouse
  p1.plot();
  p2.move(mouseY,mouseX);
  p2.plot();
  p3.resize(mouseX);
  p3.plot();
}
