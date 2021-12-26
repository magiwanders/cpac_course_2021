import netP5.*;
import oscP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

void setup(){
  oscP5 = new OscP5(this, 1234);
  myRemoteLocation = new NetAddress("192.168.130.213",5520);
  //myRemoteLocation = new NetAddress("127.0.0.1",1255);
  frameRate(1);
}

void draw() {
  OscMessage myMessage = new OscMessage("/sds");
  myMessage.add(0);
  println("Sending");
  oscP5.send(myMessage, myRemoteLocation); 
  //myMessage.print();
}
