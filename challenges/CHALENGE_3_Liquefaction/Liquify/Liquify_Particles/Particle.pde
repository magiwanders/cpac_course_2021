class Particle{
  PVector pos, vel, acc;
  float radius, lifespan, maxLifespan;
  color c;
  Particle(PVector pos, PVector force, float r,float g, float b, float radius, float lifespan){
    this.pos= pos.copy();
    this.vel = new PVector();
    this.acc = force.copy();
    this.radius=radius;
    this.lifespan=lifespan;
    this.maxLifespan=lifespan;
    this.c=color(r,g,b);
  }
  void update(){    
    this.vel.add(this.acc);
    float damping = map(this.lifespan, 0, this.maxLifespan, 0.9, 1);
    this.vel.mult(damping);
    this.pos.add(this.vel);
    this.acc.mult(0);
  }
    
  void draw(){
    colorMode(RGB, 255);
    float alpha = map(this.lifespan, 0, this.maxLifespan, 0, 255);
    fill(c, alpha);
    noStroke();
    ellipse(this.pos.x, this.pos.y, this.radius, this.radius);    
  }
  boolean isDead(){
    return this.lifespan<=0;
  }
}
