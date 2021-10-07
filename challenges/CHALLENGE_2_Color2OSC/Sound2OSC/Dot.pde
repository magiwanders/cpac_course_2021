
class Dot{
  
  float x,y,z; 
  //Constructor
  public Dot(float x, float y, float z){
    this.x = x; // x position
    this.y = y; // y position
    this.z = z; // z position (naively simulated)
  }
  
  // ---- Methods
  public void plot(){
    noStroke(); // No outlines 
    fill(153);
    circle(x, y, z);
  }
  
  public void move(float newX, float newY, float newZ){
    x = newX; 
    y = newY;
    z = newZ;
  }
  
}
