Mover m;

void setup() {
  size(800,200);
  smooth();
  m = new Mover(); 
}

void draw() {
  background(255);

  PVector wind = new PVector(0,-0.5);
  PVector gravity = new PVector(0,1.8);
  m.applyForce(wind);
  m.applyForce(gravity);


  m.update();
  m.display();
  m.checkEdges();

}
