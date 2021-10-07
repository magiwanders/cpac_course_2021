import netP5.*;
import oscP5.*;
import processing.video.*;

Capture cam;
color trackColor; 

OscP5 osc;
NetAddress super_collider;
float x=0, y=0, z=0;

//int distanceThreshold=170;

float stop=150, stopx=500, stopy=500;

void setup(){
  osc = new OscP5(this, 1998);
  super_collider = new NetAddress("127.0.0.1",57120);

  size(1000,1000);
  
  String[] cameras = Capture.list();
  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }
    cam = new Capture(this, cameras[0]);
    cam.start();     
  } 
  
  // Set to Postit color
  trackColor = color(255, 255, 0);
}

void draw() {
  if (cam.available() == true) { // Good practice to check if the device is ready
    cam.read(); // For each frame get the matrix of colors of the captured image
  }
  image(cam, 0, 0, 1000, 1000);
  
  loadPixels();
  // Search color
    float worldRecord = 500; 
  // XY coordinate of closest color
  int closestX = 0;
  int closestY = 0;
  
  // Estimate quantity of sufficiently close color
  int howMuch = 0;

  for (int x = 0; x < 1000; x ++ ) {
    for (int y = 0; y < 1000; y ++ ) {
      int loc = x + y*1000;

      color currentColor = pixels[loc];
      float r1 = red(currentColor);
      float g1 = green(currentColor);
      float b1 = blue(currentColor);
      float r2 = red(trackColor);
      float g2 = green(trackColor);
      float b2 = blue(trackColor);

      // Using euclidean distance to compare colors
      float d = dist(r1, g1, b1, r2, g2, b2);
      //if (d<distanceThreshold) howMuch++;

      if (d < worldRecord) {
        // Save the fact that the analyzed pixel is the closest to the looked after color
        worldRecord = d;
        closestX = x;
        closestY = y;
      }
    }
  }

  if (worldRecord < 200) { 

    fill(trackColor);
    strokeWeight(4.0);
    stroke(0);
    ellipse(closestX, closestY, 100, 100);
    //println("X: " + closestX + " , Y: " + closestY);
    //println(howMuch);
    sendOSC("/effect", (float)closestX/1000);
    sendOSC("/frequency", 440+(-(float)closestY/1000)*200);
    //sendOSC("/volume", Math.abs((float)howMuch/1000));
  }
}

void sendOSC(String addr, float value) {
  OscMessage m = new OscMessage(addr);
  m.add(value);
  //println("Sending OSC message: " + addr + " " + value);
  osc.send(m, super_collider); 
}
