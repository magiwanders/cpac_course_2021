class Particle{
  
  // A particle is a single dot.
  
  PVector pos, vel, acc, force; // Position, velocity and acceleration
  float m = 1, t = 1, radius, lifespan, maxLifespan; // Mass and timeframe assumed unitary for completeness. Radius, current and max lifespan
  color c; // Color
  
  // The particle is initially given a position, a force it is subjected to, a color, radius and max lifespan.
  Particle(PVector pos, PVector force, float r,float g, float b, float radius, float lifespan){
    this.pos= pos.copy(); // Position
    this.vel = new PVector(); // Velocity v=0
    this.acc = new PVector(); // Acceleration a=0
    this.force = force.copy();
    this.force.div(2);
    this.radius=radius; // Radius
    this.lifespan=lifespan; // Current lifespan is the same as max lifespan
    this.maxLifespan=lifespan; // Max lifespan
    this.c=color(r,g,b); // Color from rgb channels
  }
  
  // This calculates the new position, velocity and acceleration of the particle.
  void update(){ 
    this.force.div(m);
    this.acc.add(this.force); // a = F/m
    this.vel.add(this.acc); // v = v_current + a*t where t is assumed 1 (unspecified time unit)
    float damping = map(this.lifespan, 0, this.maxLifespan, 0.1, 0.9); // Gets damping value as mapping of the proportion of current lifespan left on the total max lifespan over the 0.9-1 interval
    this.vel.mult(damping); // v = d*v = d*(v_current + a*t)
    this.pos.add(this.vel); // x = x_current + v*t just as before t is assumed 1 (unspecified time unit)
    this.force.mult(0); // The force is now set to zero so that it is like an impulse
  }
  
  // This draws the particle.
  void draw(){
    colorMode(RGB, 255); // 24 bit rgb
    float alpha = map(this.lifespan, 0, this.maxLifespan, 0, 255); // The more a particle is closer to dying (the smaller lifespan is compared to max lifespan) the more transparent it is
    fill(c, alpha); // The color with the newly computed alpha transparency parameter is selected
    noStroke(); // Border removed
    ellipse(this.pos.x, this.pos.y, this.radius, this.radius); // Circle at position x, y and with radius    
  }
  
  // Returns whether the particle is dead.
  boolean isDead(){
    return this.lifespan<=0;
  }
}
