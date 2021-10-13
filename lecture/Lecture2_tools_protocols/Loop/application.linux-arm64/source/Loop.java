import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Loop extends PApplet {


// Global variables -> Encouraged because it's the only way to have global information 
boolean blocked = false; // Status of draw
float x=0;
float y=0;

public void setup(){
  
  println(width);
  background(255,255,255);
  frameRate(10);
}


public void draw(){  
  fill(255,20,0, 200);
  circle(x,y,10);
  fill(0,255,0,100);
  rect(x+10,y+10,30,50);
  
  // Change coordinates of the new point and rectangle
  x=randomVal(); // Function call
  y=random(0,height);
}

public float randomVal()
{
  float val = random(0,width);
  return val;
}

// Called any time the mouse is pressed
public void mousePressed(){
  
  if (blocked==true){
    blocked = false;
    loop(); // Start again to loop
  }
  else if (blocked==false){
    blocked = true;
    noLoop(); // Suspend the loop
  }
}
  public void settings() {  size(400,400); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Loop" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
