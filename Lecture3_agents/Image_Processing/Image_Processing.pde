
PImage img;


void setup(){
  size(500,418); 
  img = loadImage("lamp.jpg");
}



void draw(){
    background(0);
    //tint(255,mouseX,mouseY); // Like fill for shapes. It changes the color
    image(img,0,0,width,height);    
 
    // This works on the original image
    //get(x, y, w, h)
    for (int y=0;y<height/2;y++){
      for (int x=0;x<width;x++){
        color c = get(x, y); // Modifies with get and set the original image WITH COORDINATES x,y instead of 
        set(x,y,0);
      }
    }
    
    //Loads the pixel data of the current display window into the pixels[] array
    //From Matrix to 1D-arrayù
    // This works on the displayed screeen
    
    //img.loadPixels(); // Stores the image as a 2D vector, well it is just a 1D to reflect the memory representation
    ////The way to access to pixels[] is pixels[y*width+x];
    //for (int i = 0; i < ((height/2)*width); i++) {
    //  color c = img.pixels[i]; 
    //  img.pixels[i] = c+10; // This means adding 100 to each of the components 
    //}
    //img.updatePixels(); // This is just a layer
}
