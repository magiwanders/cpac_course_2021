float awt = 5.0;
float cwt = 10.0;
float maxspeed = 1;
float maxforce = 0.025;

class Particle{
  PVector pos, vel, acc;
  float radius, lifespan, maxLifespan;
  color c;
  // float h,s,b;
  Particle(PVector pos, PVector force, float r,float g, float b, float radius, float lifespan){
    this.pos= pos.copy();
    this.vel = new PVector();
    this.acc = force.copy();
    this.radius=radius;
    this.lifespan=lifespan;
    this.maxLifespan=lifespan;
    this.c=color(r,g,b);
    //this.h = random(55, 80);
    //this.s = random(130, 230);
    //this.b = random(50, 255);
  }
  void 
  applyForce(PVector force) {
    // We could add mass here if we want A = F / M
    acc.add(force);
  }
  
  // We accumulate a new acceleration each time based on two rules
  void flock(ArrayList<Particle> particles) {
    PVector ali = align(particles);      // Alignment
    PVector coh = cohesion(particles);   // Cohesion
    // Arbitrarily weight these forces
    ali.mult(awt);
    coh.mult(cwt);
    // Add the force vectors to acceleration
    applyForce(ali);
    applyForce(coh);
  }

  // A method that calculates and applies a steering force towards a target
  // STEER = DESIRED MINUS VELOCITY
  PVector seek(PVector target) {
    PVector desired = PVector.sub(target,pos);  // A vector pointing from the location to the target

    // Normalize desired and scale to maximum speed
    desired.normalize();
    desired.mult(maxspeed);
    // Steering = Desired minus Velocity
    PVector steer = PVector.sub(desired,vel);
    steer.limit(maxforce);  // Limit to maximum steering force

    return steer;
  }


  // Alignment
  // For every nearby particle in the system, calculate the average velocity
  PVector align (ArrayList<Particle> particles) {
    float neighbordist = 50.0;
    PVector steer = new PVector();
    int count = 0;
    for (Particle other : particles) {
      float d = PVector.dist(pos,other.pos);
      if ((d > 0) && (d < neighbordist)) {
        steer.add(other.vel);
        count++;
      }
    }
    if (count > 0) {
      steer.div((float)count);
      // Implement Reynolds: Steering = Desired - Velocity
      steer.normalize();
      steer.mult(maxspeed);
      steer.sub(vel);
      steer.limit(maxforce);
    }
    return steer;
  }

  // Cohesion
  // For the average location (i.e. center) of all nearby particles, calculate steering vector towards that location
  PVector cohesion (ArrayList<Particle> particles) {
    float neighbordist = 50.0;
    PVector sum = new PVector(0,0);   // Start with empty vector to accumulate all locations
    int count = 0;
    for (Particle other : particles) {
      float d = PVector.dist(pos,other.pos);
      if ((d > 0) && (d < neighbordist)) {
        sum.add(other.pos); // Add location
        count++;
      }
    }
    if (count > 0) {
      sum.div((float)count);
      return seek(sum);  // Steer towards the location
    }
    return sum;
  }
  
  void update(ArrayList<Particle> particles){
    flock(particles);
    this.vel.add(this.acc);
    float damping = map(this.lifespan, 0, this.maxLifespan, 0.9, 1);
    this.vel.mult(damping);
    this.pos.add(this.vel);
    this.acc.mult(0);
  }
    
  void draw(){
    colorMode(RGB, 255);
    //colorMode(HSB, 255);
    float alpha = map(this.lifespan, 0, this.maxLifespan, 0, 255);
    fill(c, alpha);
    //fill(this.h, this.s, this.b, alpha);
    noStroke();
    ellipse(this.pos.x, this.pos.y, this.radius, this.radius);    
  }
  boolean isDead(){
    return this.lifespan<=0;
  }
}
