class Path{
    Vec2[] pointsP, pointsW;
    int num_points;
    float alpha=0.4;
    Vec2 center;
    Path(int num_points, float min_fact, float max_fact){
      this.num_points=num_points;
      this.pointsW = new Vec2[this.num_points];
      this.pointsP = new Vec2[this.num_points];
      float angle;
      this.center = new Vec2(0, 0);
      float fact=0.5*(min_fact+max_fact);
      for(int i=0; i<this.num_points; i++){
        angle=map(i, 0, this.num_points, 0, 2*PI);
        fact=this.alpha*random(min_fact, max_fact)+(1-alpha)*fact;
        this.pointsP[i]=new Vec2(width*(0.5+fact*cos(angle)), height*(0.5-fact*sin(angle)));
        this.pointsW[i]=P2W(this.pointsP[i]);        
      } 
    }
    
    void draw(){
      stroke(255);
      for(int i=1; i<this.num_points; i++){        
        line(this.pointsP[i-1].x, this.pointsP[i-1].y, this.pointsP[i].x, this.pointsP[i].y);
      }
      line(this.pointsP[this.num_points-1].x, this.pointsP[this.num_points-1].y, 
           this.pointsP[0].x, this.pointsP[0].y);
    }
    void draw(int i){
      fill(128+(128.0 * i)/this.num_points);
      
      ellipse(this.pointsP[i].x, this.pointsP[i].y, 2*DIST_TO_NEXT,2*DIST_TO_NEXT);
    }
    int closestTarget(Vec2 posW){
      float angle;
      if (posW.x>0){ angle = (float) Math.atan(posW.y/posW.x);}
      else if (posW.x<0){ angle = PI+(float) Math.atan(posW.y/posW.x);}
      else if (posW.y>0){angle=PI/2;}
      else {angle = -PI/2;}
      angle=(2*PI+angle)%(2*PI);
      
      float angle_fraction=2*PI/this.num_points;
      
      return nextPoint(floor(angle/angle_fraction));  
      
      /*int argmin=-1;      
       float min_dist=P2W(width+height);

       float dist;

       for(int i=0; i<this.num_points; i++){
         dist=posW.sub(this.pointsW[i]).length();
         if(dist<min_dist){min_dist=dist; argmin=i;}
       }
       return argmin;*/       
    }
    int nextPoint(int i){
      return (i+1)%this.num_points;
    }
    Vec2 getPoint(int i){
      return this.pointsW[i];
    }
    Vec2 getDirection(Vec2 posW, int i){
       return this.pointsW[i].sub(posW);               
    }
}
