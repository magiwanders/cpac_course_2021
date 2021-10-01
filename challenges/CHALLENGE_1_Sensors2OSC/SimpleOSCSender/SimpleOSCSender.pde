import netP5.*;
import oscP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

void setup(){
  oscP5 = new OscP5(this, 57120);
  myRemoteLocation = new NetAddress("127.0.0.1",57120);
  frameRate(1);
}

void draw() {
  OscMessage myMessage = new OscMessage("/position");
  myMessage.add(342);
  
  oscP5.send(myMessage, myRemoteLocation); 
  myMessage.print();
}
