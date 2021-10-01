import netP5.*;
import oscP5.*;

OscP5 osc;
NetAddress super_collider;
Dot d;
float x=0, y=0, z=0;

float stop=150, stopx=500, stopy=500;

void setup(){
  osc = new OscP5(this, 1998);
  super_collider = new NetAddress("127.0.0.1",57120);
  d = new Dot(x, y, z);
  osc.plug(this, "x_handler", "/accelerometer/x");
  osc.plug(this, "y_handler", "/accelerometer/y");
  osc.plug(this, "z_handler", "/accelerometer/z");
  size(1000,1000);
}

void draw() {
  
  // Each pixel is progressively dimmed to oblivion
  loadPixels();
  for(int i=0; i<pixels.length; i++) {
    float r = red(pixels[i]);
    float g = green(pixels[i]);
    float b = blue(pixels[i]);
    color c = color(r-1, g-1, b-1);
    pixels[i] = c;
  }
  updatePixels();
  
  float pos_x = x*1000/2+500;
  float pos_y = y*1000/2+500;
  
  // Each time a line is drawn between current position and the place the dot was in 100 frames ago
  stroke(153);
  line(stopx, stopy, pos_x,pos_y);
  
  // Dot is moved and replotted
  d.move(pos_x,pos_y, z*20);
  d.plot();
  
  // Debug console print
  //println("( " + x + " , " + y + " , " + z + " )");
  
  // The stop parameter counts 100 frames after which it sets a new starting point for the lines
  stop--;
  if (stop==0) {
    stop=100;
    stopx=pos_x;
    stopy=pos_y;
    println("( " + stop + " , " + stopx + " , " + stopy + " )");
  }
}


// Each handler sends its OSC message to Supercollider
void x_handler(float value) {
  x = -value;
  sendOSC("/effect", x);
}


void y_handler(float value) {
  y = value;
  sendOSC("/frequency", 440+(-y)*200);
}


void z_handler(float value) {
  z = -value;
  sendOSC("/volume", 1-Math.abs(z));
}

void sendOSC(String addr, float value) {
  OscMessage m = new OscMessage(addr);
  m.add(value);
  osc.send(m, super_collider); 
}

// This function filters the supported messages out of all messages.
void oscEvent(OscMessage m) {
  if(m.isPlugged()==true) {
    // be happy
  } else {
    println("I don't know what to do with this: ");
    println(m.addrPattern() + " , " 
          + m.typetag() + " , " 
          + m.get(0).floatValue() + " ...");
    println("\n");
  }
}
