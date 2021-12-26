import netP5.*;
import oscP5.*;

OscP5 osc;

void setup(){
  osc = new OscP5(this, 1255);
}

void draw() {
}

void oscEvent(OscMessage m) {
  println("Received! " + m.addrPattern() + " , " + m.typetag());
}
