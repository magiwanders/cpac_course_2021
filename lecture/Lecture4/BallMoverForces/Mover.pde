class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;

  Mover() {
    location = new PVector(30,30);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    mass = 1;
  }
  
  void applyForce(PVector force) {
    //PVector f = PVector.div(force,mass);  // Force/Mass THIS CODE IS A LITTLE BIT OF BULLSHIT
    //acceleration.add(f);
    acceleration = PVector.div(force, mass);
  }
  
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    //BULLSHITacceleration.mult(0);  // Since the acceleration corresponds to the force, need to be set up to 0 each cycle
  }

  void display() {
    stroke(0);
    strokeWeight(2);
    fill(127);
    ellipse(location.x,location.y,48,48);
  }

  void checkEdges() {

    if (location.x > width) {
      location.x = width;
      velocity.x *= -1;    // bouncing
    } else if (location.x < 0) {
      velocity.x *= -1;
      location.x = 0;
    }

    // This basically creates the bouncing effect
    if (location.y > height) {
      velocity.y *= -1;    // bouncing
      location.y = height;
    }
  }
}
