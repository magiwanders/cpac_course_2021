/* ReThink the Net - O3Lab
*  Creative Programming and Computing - Assignment
*  Federico Maver
*  Create points and connect them:
*  - new points are created according to x and y acceleration values of a mobile phone's gyroscope;
*  - number of connections between a given point and its neighbours is controlled by the light sensor;
*/

import oscP5.*;
  
OscP5 oscP5;

final int W = 1000; // width
final int H = 600; // height
final int N = 100; // num points
final int Q = 20; // min connection distance
// phone controlled parameters
float xVar;
float yVar;
float lVar;

int[] pointsX = new int[N];
int[] pointsY = new int[N];

int[] pointsX_old = new int[N];
int[] pointsY_old = new int[N];

void setup(){
  frameRate(5);
  size(1000,600);
  background(0);
  
  oscP5 = new OscP5(this,1998);
  
  // initialize some random points
  for(int i=0; i<N; i++){
    pointsX[i] = int(random(0, W));
    pointsY[i] = int(random(0, H));
  }
  
}

void draw(){

  clear();
  
  for(int i=0; i<N; i++){  
  // draw lines connecting points
  stroke(100); 
    for(int j=0; j<N; j++){
      if(dist(pointsX[i],pointsY[i], pointsX[j],pointsY[j])<(Q+lVar*10) && j!=i){
        line(pointsX[i],pointsY[i], pointsX[j],pointsY[j]);
      }
    }
    // draw points
    stroke(255);
    circle(pointsX[i],pointsY[i], 8);
  }
  
  // update position of points (add last, delete first)
  pointsX[N-1] = W/2 - int(xVar*W/2); //mouseX; 
  pointsY[N-1] = H/2 - int(yVar*H/2); //mouseY;
  for(int i=0; i<N-1; i++){
    pointsX[i] = pointsX[i+1];
    pointsY[i] = pointsY[i+1];
  }
  
}

void oscEvent(OscMessage theOscMessage) {
  if (theOscMessage.checkAddrPattern("/accelerometer/x")) xVar = theOscMessage.get(0).floatValue(); // x accel controls x position of new points
  if (theOscMessage.checkAddrPattern("/accelerometer/y")) yVar = theOscMessage.get(0).floatValue(); // y accel controls y position of new points
  if (theOscMessage.checkAddrPattern("/light")) lVar = theOscMessage.get(0).floatValue(); // light controls number of connections
}
