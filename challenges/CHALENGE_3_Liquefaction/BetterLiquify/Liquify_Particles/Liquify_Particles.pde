ParticleSystem ps;

import gab.opencv.*;
import processing.video.*;

Capture cam; // Camera
boolean camera_found=false;

OpenCV opencv=null;

boolean find_camera() {
  /*
   Find a camera,
   return true if it is found (cam is initialized),
   return false otherwise
  */

  // if camera was already found, it returns true
  if (camera_found) {
    return camera_found;
  }

  // else tries to get the list of cameras
  String[] cameras = Capture.list();

  if (cameras.length == 0) { // no camera available THIS TIME
    println("There are no cameras available for capture.");
    //exit();
  } else {   // camera availables, print the list and initialize cam
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(i, cameras[i]);
    }
    cam = new Capture(this, cameras[0]); // Just take the first one
    cam.start();
    camera_found=true;
  }
  return camera_found;
}

void setup(){
  size(640,480);
  ps=new ParticleSystem();
}

// Copies current frame of the camera to an image object
void copy2img(Capture camera, PImage img) {
  img.loadPixels();
  for (int i=0; i<camera.width*camera.height; i++) {
    img.pixels[i]=camera.pixels[i];
  }
  img.updatePixels();
}

void draw(){
  if (! find_camera()) {
    return;
  }
  if (! cam.available()) {
    return;
  }
  cam.read(); // Gets new frame
  if (opencv ==null) {// if CV is not initialized it creates the reference with the same dimensions of the camera
    opencv = new OpenCV(this, cam.width, cam.height);
  }
  
  println("opencv", opencv);
  
  background(0); // Black

  PImage img=createImage(cam.width, cam.height, RGB);
  copy2img(cam, img);
  image(img,0,0);   // Plot the image
  ps.draw(img); // Draw the particles
}
