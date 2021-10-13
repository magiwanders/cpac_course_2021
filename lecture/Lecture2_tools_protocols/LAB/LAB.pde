void setup() {
  size(700, 700); // Just the size of the canvas
  //fullScreen(); // Just fullscreen
  background(0, 0, 0); // background R G B
  //background(0); // Grayscale
  
  // This only draws a circle in 0,0 because setup is called only once
  //stroke(255,0, 0);
  //fill(255, 0, 0);
  //ellipse(mouseX, mouseY, 30, 30);
}

// Draw 30 frames per second
void draw() {
  background(128); // Just resets background
  // Draws 30 circles per second at the current mouse position. 
  stroke(255,255, 255); // Borders, outline of the shape 
  fill(0, 55, 0); // Filling
  // STROKE AND FILL INFO REMAIN UNTIL THEY ARE RESET AGAIN
  ellipse(mouseX, mouseY, 30, 30);
  // also point, line, rect, ellipse, arc, curve (see the reference)
  // for custom curves use vertex (see curve)
  
  // Fixed ellipse
  stroke(255,0, 0);
  fill(255, 0, 0);
  ellipse(400, 400, 30, 30);
  
  // NB LAYERS what you display first remains in the back
  
}
