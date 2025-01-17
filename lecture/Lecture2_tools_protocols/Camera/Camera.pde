import processing.video.*;

Capture cam;

void setup() {
  size(640, 480);
  frameRate(60);

  String[] cameras = Capture.list();
  
  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }
    
    // The camera can be initialized directly using an 
    // element from the array returned by list():
    cam = new Capture(this, cameras[0]);
    cam.start();     
  }      
}

void draw() {
  if (cam.available() == true) { // Good practice to check if the device is ready
    cam.read(); // For each frame get the matrix of colors of the captured image
  }
  image(cam, 0, 0, 640, 480); // first two coordinates are the top left corner, the others the bottom right
  // The following does the same, and is faster when just drawing the image
  // without any additional resizing, transformations, or tint.
  //set(0, 0, cam);
}
