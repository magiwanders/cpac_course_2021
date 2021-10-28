class ParticleSystem{
  ArrayList<Particle> particles;
  ParticleSystem(){
    this.particles = new ArrayList<Particle>();
  }
  void addParticle(PVector pos, PVector force, float r, float g, float b){
    Particle p = new Particle(pos, force, r, g, b, 3, 100);
    this.particles.add(p);
  }
  void draw(PImage img){
    Particle p;
    opencv.loadImage(img);  // load the current image and compute Optical Flow
    opencv.calculateOpticalFlow();
    
    // we will divide the image in a grid of size:
    int grid_size= 8;
    int half_grid= 4;
  
    // center of each cell of the grid
    int c_x=0;
    int c_y=0;
    PVector aveFlow;  // here we will store the optical flow
    float treshold = 3.0;

    for (int w=0; w<img.width; w+=grid_size) {
      for (int h=0; h<img.height; h+=grid_size) {
        // compute the average Flow over the region from w, h to w+grid_size, h+grid_size
        aveFlow = opencv.getAverageFlowInRegion(w, h, grid_size, grid_size);
  
        // update the center position
        c_x=w+half_grid;
        c_y=h+half_grid;
        int loc = int(c_x+c_y*img.width);
        PVector position = new PVector(c_x,c_y);

        // say we want the color of the central pixel
        if(aveFlow.mag() > treshold) {
          this.addParticle(position, aveFlow, red(img.pixels[loc]), green(img.pixels[loc]), blue(img.pixels[loc]));
        }
      }
    }

    for(int i=this.particles.size()-1; i>=0; i--){
      p=this.particles.get(i);
      p.update();
      p.draw();
      p.lifespan-=3.5;
      if(p.isDead()){
         particles.remove(i);
      }
    
    }
  }
}
