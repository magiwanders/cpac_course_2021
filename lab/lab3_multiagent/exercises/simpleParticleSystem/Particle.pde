
class Particle{
  PVector pos, vel, acc;
  float radius, lifespan;
  Particle(PVector pos, float radius, float lifespan){
    this.pos= pos.copy();
    this.vel = new PVector();
    this.acc = new PVector();
    this.radius=radius;
    this.lifespan=lifespan;
  }
  void update(){    
    this.vel.add(this.acc);
    this.pos.add(this.vel);
    this.acc.mult(0);
  }
  
  void applyForce(PVector force){    
    this.acc.add(force);    
  }
  
  void draw(){
    /* your code here*/
    colorMode(HSB, 255);
    fill(random(0, 255), random(0, 255), random(0, 255), lifespan);
    noStroke();
    ellipse(this.pos.x, this.pos.y, this.radius*5, this.radius*2);    
  }
  boolean isDead(){
    if (this.lifespan<=0) return true;
    return false;
  }
}
