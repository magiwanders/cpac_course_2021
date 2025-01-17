// This is a normal java class, 1 file for each class with the same name
// Needed when modifying realtime the arguments of an object
class MyPoint{
  
  // Normal arguments
  float x,y;
  float size; 
  color c;
  
  // Constructor 
  public MyPoint(float x, float y, float size, color c){
    this.x = x;
    this.y = y;
    this.size = size;
    this.c = c;
  }
  
  // ---- Methods
  public void plot(float size, color c){
    noStroke();
    fill(c,128);
    ellipse(x,y,size,size);
  }
  
  public void move(float newX, float newY){
    x = newX; 
    y = newY;
  }
}
