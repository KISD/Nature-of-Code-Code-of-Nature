import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import controlP5.*; 
import ddf.minim.*; 
import ddf.minim.analysis.*; 
import processing.video.*; 
import geomerative.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class CoN_131207_Lichtsensor5 extends PApplet {











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
float size = 6.0f;
int i;
float beat;



public void setup() {
  
  size(displayWidth, displayHeight);
  
  cameraSensor = new Sensor();
  lightCountdown = new Countdown();
  useButton = new Button();
  video = new Capture(this, 64, 48);
  minim = new Minim(this);
  RG.init(this);
  cp5 = new ControlP5(this);


  s1 = PApplet.parseInt (random(0, 9));
  spur1 = minim.loadFile("drumSpur/"+s1+".wav");
  fft = new FFT( spur1.bufferSize(), spur1.sampleRate() );
  
  s2 = PApplet.parseInt (random(0, 8));
  spur2 = minim.loadFile("voiceSpur/"+s2+".wav");
  
  s3 = PApplet.parseInt (random(0, 7));
  spur3 = minim.loadFile("trompetSpur/"+s3+".wav");
  
  s4 = PApplet.parseInt (random(0, 6));
  spur4 = minim.loadFile("clapSpur/"+s4+".wav");
  
  video.start();

  lightCountdown.save();

  useButton.slider();

  smooth();



}


public void draw() { 
  
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
class Button {
  
  public void slider(){
  
    cp5.addSlider("time")
    .setPosition((displayWidth/2)-120, (displayHeight/10)*9)
      .setWidth(200)
        .setRange(5, 30) // values can range from big to small as well
          .setValue(timeSet)
            .setNumberOfTickMarks(6)
              .setSliderMode(Slider.FLEXIBLE)
                ;
  }
  
}
class Countdown{

String text;
float gameTime;
float  startTime;
  
  public void check(){
    
    if((brightestValue) / ((64) * (48)) > br) {
      spur1.loop();
      spur2.loop();
      spur3.loop();
      spur4.loop();
      
      video.stop();
      mode = 1;

    }
    
    if(mode == 0) {
      startTime = millis();
    }
      
  }
  
  public void count(){

  background(0);
    
  fill(0,158,226);
  arc((displayWidth/2), (displayHeight/2),(displayHeight/1.5f)+beat,(displayHeight/1.5f)+beat,0,(time-gameTime)/time*2*PI);
    
  fill(255);
  ellipse((displayWidth/2), (displayHeight/2),(displayHeight/1.5f)-120,(displayHeight/1.5f)-120);

    
    pushMatrix();

    if(mode == 1){
      gameTime = (millis()-startTime)/1000;
    }
    
    if(gameTime >= time){
        text = "Stop";

        spur1.shiftGain(spur1.getGain(), -80, 1500);
        spur2.shiftGain(spur2.getGain(), -80, 1500);
        spur3.shiftGain(spur3.getGain(), -80, 1500);
        spur4.shiftGain(spur4.getGain(), -80, 1500);
//        image(blast,6,64);
    }
    else{
        text = String.valueOf(PApplet.parseInt(time-gameTime));
    }

    translate((width/2)-30, (height/2)+106);
    fill(0);
    
    grp = RG.getText(text, "OCRAStd.ttf", 272, CENTER );
    
    // Get the points on the curve's shape
    RG.setPolygonizer(RG.UNIFORMSTEP);
    RG.setPolygonizerStep(255);
    
    points = grp.getPoints();
    
    // If there are any points
    if(points != null){
      fill(30,150,random(30,255));
      noStroke();
      if(time-gameTime < 5){
        fill(255,0,100);
      }
      if (time-gameTime == 5.5f){
        for(int i=0; i<points.length; i++){
          ellipse(points[i].x, points[i].y,1000,1000);  
        }
      }
      else {
        for(int i=0; i<points.length; i++){
          ellipse(points[i].x, points[i].y,2,2);  
        }
      }
    }
//    PFont hipster;
//    hipster = loadFont("HipsterScriptPro-250.vlw");
//    textFont(hipster, 250);

//    textAlign(CENTER, CENTER);
//    textSize(210);

    popMatrix();
    
  fill(255,0,100);
  arc(((displayWidth/6)*5), (displayHeight/2),300+beat,300+beat,0,(time-gameTime)*(PI/2));
   
    
    
  }
  
  public void resetSketch() {
    if (mode == 1 && keyPressed == true && key == 'b' || time-gameTime < -2) {
   
      String newTime = str(time);
      String[] TimeSave = split(newTime , ' ');
      saveStrings("Time.txt", TimeSave);
      
      mode=0;
      spur1.close();
      spur2.close();
      spur3.close();
      spur4.close();
      setup();  
    }
  
  }
  
  public void save(){
    
    String TimeLoad[] = loadStrings("Time.txt");
    timeSet = Float.parseFloat(TimeLoad[0]);
    
  }
 
}
class Sensor{
  
  public void update(){
    
    brightestValue = 0;
    
    if (video.available()) {
      video.read();
      image(video, 0, 0, 64, 48); // Draw the webcam video onto the screen
      // Search for the brightest pixel: For each row of pixels in the video image and
      // for each pixel in the yth row, compute each pixel's index in the video
      video.loadPixels();
      int index = 0;
      for (int y = 0; y < video.height; y++) {
        for (int x = 0; x < video.width; x++) {
          // Get the color stored in the pixel
          int pixelValue = video.pixels[index];
          // Determine the brightness of the pixel
          float pixelBrightness = brightness(pixelValue);
          // If that value is brighter than any previous, then store the
          // brightness of that pixel, as well as its (x,y) location
//          if (pixelBrightness > brightestValue) {
//            brightestValue = pixelBrightness;
//          }
          brightestValue = brightestValue + pixelBrightness;
          index++;
        }
      }

    }
    
  }
  
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--full-screen", "--bgcolor=#666666", "--stop-color=#cccccc", "CoN_131207_Lichtsensor5" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
