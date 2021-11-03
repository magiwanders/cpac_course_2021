class ParticleSystem{
  
  // The particle system handles a bunch of particles.
  
  ArrayList<Particle> particles; // Array of particles
  
  // Just initializes an empty array for later use
  ParticleSystem(){
    this.particles = new ArrayList<Particle>();
  }
  
  // Adds a particle to the system at given position and with given force and color
  void addParticle(PVector pos, PVector force, float r, float g, float b){
    Particle p = new Particle(pos, force, r, g, b, 3, 100); // Actually creates the particle
    this.particles.add(p); // Adds it to the array of particles
  }
  
  // Draws the entire system
  void draw(PImage img){
    Particle p;
    opencv.loadImage(img);  // Load the current image 
    opencv.calculateOpticalFlow(); // Compute Optical Flow
    
    // Image will be divided into a grid
    int half_grid= 4; // This is half of the previous size, why does this exist? Better to use just the halfsize so that you don't fall into parity problems (half size not integer)
  
    PVector aveFlow;  // optical flow for a single cell stored here during cycling
    float treshold = 3.0; // Threshold for deciding whether the optical flow is strong enough for a particle to be created. Also threshold is spelled wrong

    // Cycle through all the grid cells
    for (int c_x=half_grid; c_x<img.width; c_x+=2*half_grid) {
      for (int c_y=half_grid; c_y<img.height; c_y+=2*half_grid) {
        
        // Compute the average Flow over the region from w, h to w+grid_size, h+grid_size
        aveFlow = opencv.getAverageFlowInRegion(c_x-half_grid, c_y-half_grid, 2*half_grid, 2*half_grid);
  
        int loc = int(c_x+c_y*img.width); // Linearization of the coordinates of the center of the current cell into the corresponding index of the pixels[] array, which has the pixels in a 1D vector
        PVector position = new PVector(c_x,c_y); // Pvector of the coordinates of the current cell

        // If the optical flow is bigger than given threshold a new particle is added
        if(aveFlow.mag() > treshold) {
          this.addParticle(position, aveFlow, red(img.pixels[loc]), green(img.pixels[loc]), blue(img.pixels[loc])); // The particle is positioned at the center of the cell and has force applied to it equal to the optical flow of the cell. The color is the same of the pixel at the center of the cell.
        }
      }
    }
     
    // cycles all the particles created so far in order to draw them
    for(int i=this.particles.size()-1; i>=0; i--){
      p=this.particles.get(i); // Gets the reference to the ith particle
      p.update(); // Updates its parameters (position, speed, transparency et cetera)
      p.draw(); // Draws the particle
      p.lifespan-=3.5; // Removes a little bit of life from its soul
      if(p.isDead()){
         particles.remove(i); // If the particle has no more lifespan it gets destroyed to oblivion of doom
      }
    
    }
  }
}
