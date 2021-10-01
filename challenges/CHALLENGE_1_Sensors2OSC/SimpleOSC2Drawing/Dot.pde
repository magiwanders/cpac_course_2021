
class Dot{
  
  float x,y,z; 
  int w, h;
  //Constructor
  public Dot(float x, float y, float z, int w, int h){
    this.x = x; // x position
    this.y = y; // y position
    this.z = z; // z position (naively simulated)
    this.w = w; // canvas width
    this.h = h; // canvas height
  }
  
  // ---- Methods
  public void plot(){
    noStroke(); // No outlines 
    fill(153);
    circle(x*w,y*h,z*10);
  }
  
  public void move(float newX, float newY, float newZ){
    x = newX; 
    y = newY;
    z = newZ;
  }
  
}
