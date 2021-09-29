import netP5.*;
import oscP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

void setup(){
  myRemoteLocation = new NetAddress("127.0.1.1",23456);
  frameRate(10);
}

void draw() {
  OscMessage myMessage = new OscMessage("/position");
  myMessage.add(342);
  
  oscP5.send(myMessage, myRemoteLocation); 
  myMessage.print();
}
