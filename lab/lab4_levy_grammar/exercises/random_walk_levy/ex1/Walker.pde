float STEPSCALE=10;

class Walker {
  PVector position;
  PVector prevPosition;
  
  Walker() {
    this.position=CENTER_SCREEN.copy();
    this.prevPosition=this.position.copy();    
  }
  void draw() {    
    stroke(255);
    strokeWeight(3);
    line(this.prevPosition.x, this.prevPosition.y,
         this.position.x, this.position.y);
    this.prevPosition=this.position.copy();
  }

  void update() {
    float stepsize = montecarlo()*STEPSCALE;
    PVector step=new PVector(stepsize*random(-1, 1), stepsize*random(-1, 1), stepsize*random(-1, 1));
    /* your code yeah I actually put it upwards */
    
    // PVector step = new PVector (random(-1, 1), random(-1, 1), random(-1, 1));
    // step.normalize();
    // step.mul(montecarlo()*STEPSCALE);
    
    this.position.add(step);
    this.position.x=constrain(this.position.x, 0, width);    
    this.position.y=constrain(this.position.y, 0, height);
    
        println(this.prevPosition.x - this.position.x);
    
  }
}

float montecarlo() {
  /* your code */
  float R1=0, R2=0, p=0;
  
  while (R2>=p) {
    R1 = random(1); 
    R2 = random(1); 
    p = random(1);
    if (R2<p) return R1;
  }
  
  return -1;
}
