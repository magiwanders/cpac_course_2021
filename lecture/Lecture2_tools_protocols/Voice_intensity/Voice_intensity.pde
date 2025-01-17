
import processing.sound.*;
Amplitude amp;
AudioIn in;

float intensity; // value in range 0 to 1

void setup()
{
  size(800,600);
  //fullScreen();
  
  // Create an Input stream which is routed into the Amplitude analyzer
  amp = new Amplitude(this); // For the rms of the amplitude of the current signal
  in = new AudioIn(this, 0); // Should have checked if there are devices 
  in.start(); // Start inflow of audio
  amp.input(in); 
  
  intensity=0;
}



void draw()
{
  background(255);
  
  intensity = amp.analyze();
  println(intensity);
  
  fill(intensity*255);
  rect(0, 0, 100, intensity*1000);
}
