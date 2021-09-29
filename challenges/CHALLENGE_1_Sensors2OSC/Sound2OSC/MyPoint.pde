
class MyPoint{
  
  float x,y;
  float size; 
  //Constructor
  public MyPoint(float x, float y, float size){
    this.x = x;
    this.y = y;
    this.size = size;
  }
  
  // ---- Methods
  public void plot(){
    noStroke(); // No outlines 
    fill(153);
    rect(x,y,size,size);
  }
  
  public void move(float newX, float newY){
    x = newX; 
    y = newY;
  }
  
  public void resize(float newSize) {
    size = newSize;
  }
  
}
