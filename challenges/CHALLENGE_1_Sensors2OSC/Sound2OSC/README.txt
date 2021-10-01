Very simple rethinking of "Re-think the Net" by O3LAB. Supercollider oscillator, the parameters of which are controlled by a phone's accelerometer through Processing, which also handles an animation. 

Controls:
Vertical Axis -> Frequency
Horizontal Axis -> Pan
Distance from centre -> Volume 

How to make it work, hopefully.

1. Download and launch oschook v2 (Android) (Sensors2OSC did NOT work on my phone (Android 10) )
2. The OSC message to send is /accelerometer with 10 smoothing steps and output range 0->1
3. Launch Processing file
4. Execute Supercollider cells in order of how they are written
5. Enjoy! 

~Simone Shawn Cazzaniga
