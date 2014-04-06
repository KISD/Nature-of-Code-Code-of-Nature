import controlP5.*;

import ddf.minim.*;
import ddf.minim.analysis.*;

import processing.video.*;

import geomerative.*;


Sensor cameraSensor;
Countdown lightCountdown;
Button useButton;

Capture video;
Minim minim;
FFT fft;
AudioPlayer spur1;
AudioPlayer spur2;
AudioPlayer spur3;
AudioPlayer spur4;
ControlP5 cp5;

RFont f;
RShape grp;
RPoint[] points;

int mode = 0;
int br = 200;
float brightestValue;
int time;
int s1;
int s2;
int s3;
int s4;
float timeSet;
float size = 6.0;
int i;
float beat;



void setup() {
  
  size(displayWidth, displayHeight);
  
  cameraSensor = new Sensor();
  lightCountdown = new Countdown();
  useButton = new Button();
  video = new Capture(this, 64, 48);
  minim = new Minim(this);
  RG.init(this);
  cp5 = new ControlP5(this);


  s1 = int (random(0, 9));
  spur1 = minim.loadFile("drumSpur/"+s1+".wav");
  fft = new FFT( spur1.bufferSize(), spur1.sampleRate() );
  
  s2 = int (random(0, 8));
  spur2 = minim.loadFile("voiceSpur/"+s2+".wav");
  
  s3 = int (random(0, 7));
  spur3 = minim.loadFile("trompetSpur/"+s3+".wav");
  
  s4 = int (random(0, 6));
  spur4 = minim.loadFile("clapSpur/"+s4+".wav");
  
  video.start();

  lightCountdown.save();

  useButton.slider();

  smooth();



}


void draw() { 
  
  fft.forward( spur1.mix );
  
  for(i = 0; i < fft.specSize(); i++)
  {
    // draw the line for frequency band i, scaling it up a bit so we can see it
//    line( i, height, i, height - fft.getBand(i)*8 );
    beat = (fft.getBand(i)*60);
  }
    
  println();
  
  lightCountdown.resetSketch();

  cameraSensor.update();
   
  lightCountdown.check(); 

  lightCountdown.count();
  

}
