import netP5.*;
import oscP5.*;

OscP5 osc;
Dot d;
float x=0, y=0, z=0;

void setup(){
  osc = new OscP5(this, 1998);
  d = new Dot(x, y, z, 1000, 1000);
  osc.plug(this, "x_handler", "/accelerometer/x");
  osc.plug(this, "y_handler", "/accelerometer/y");
  osc.plug(this, "z_handler", "/accelerometer/z");
  size(1000,1000);
}

void draw() {
  clear();
  d.move(x, y, z);
  d.plot();
  println("( " + x + " , " + y + " , " + z + " )");
}

void x_handler(float value) {
  //println(value + " : "+ x);
  x = -value;
}


void y_handler(float value) {
  y = -value;
}


void z_handler(float value) {
  z = value;
}
