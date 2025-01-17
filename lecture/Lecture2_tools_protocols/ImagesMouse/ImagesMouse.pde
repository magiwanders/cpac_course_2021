PImage img;
color c;

MyPoint p;

void setup() {
  size(1024, 576);
  frameRate(60);
  
  img = loadImage("40704.jpg");
  imageMode(CENTER);
  noStroke();
  background(255);
  
  c = color(255, 204, 0);
  p = new MyPoint(10,10,40, c);
  image(img,width/2,height/2);
}

void draw() { 
  //image(img,width/2,height/2);
  p.move(mouseX,mouseY);
  color pix = img.get(mouseX, mouseY); // Retrieves the color at the mouse position (pointed by the mouse)
  int r = (int)red(pix);
  int g = (int)green(pix);
  int b = (int)blue(pix);
  color c = color(r, g, b, 10); // All this is needed in order to add transparency to the detected color
  p.plot(40,c); // Pixel painted using that color.
}
