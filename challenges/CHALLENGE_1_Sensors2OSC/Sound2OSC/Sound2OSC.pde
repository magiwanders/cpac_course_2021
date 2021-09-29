import netP5.*;
import oscP5.*;

OscP5 osc;
MyPoint p;
int x, y;

void setup(){
  osc = new OscP5(this, 23456);
  osc.plug(this, "shake", "/accelerometer");
  x=0;y=0;
  p = new MyPoint(0, 0, 10);
}

void draw() {
  p.move(x, y);
  p.plot();
}

void shake(float x, float y, float z) {
  println(z);
}

void oscEvent(OscMessage m) {
  println(m.addrPattern() + " , " + m.typetag());
}
