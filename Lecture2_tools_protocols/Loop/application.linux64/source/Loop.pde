
// Global variables -> Encouraged because it's the only way to have global information 
boolean blocked = false; // Status of draw
float x=0;
float y=0;

void setup(){
  size(400,400);
  println(width);
  background(255,255,255);
  frameRate(10);
}


void draw(){  
  fill(255,20,0, 200);
  circle(x,y,10);
  fill(0,255,0,100);
  rect(x+10,y+10,30,50);
  
  // Change coordinates of the new point and rectangle
  x=randomVal(); // Function call
  y=random(0,height);
}

float randomVal()
{
  float val = random(0,width);
  return val;
}

// Called any time the mouse is pressed
void mousePressed(){
  
  if (blocked==true){
    blocked = false;
    loop(); // Start again to loop
  }
  else if (blocked==false){
    blocked = true;
    noLoop(); // Suspend the loop
  }
}
