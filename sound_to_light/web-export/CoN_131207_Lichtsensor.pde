
import processing.video.*;

Sensor cameraSensor;
Countdown lightCountdown;
Capture video;

int mode = 0;
int br = 200;
int wid = 1440;
int hei = 880;
float brightestValue;
float time = 25.0;

void setup() {
  
  size(wid, hei, P2D);
  textSize(800);
  
  cameraSensor = new Sensor();
  lightCountdown = new Countdown();
  video = new Capture(this, width/10, height/10);
  
  video.start();
  
}



void draw() { 
  
  println((brightestValue) / ((wid/10) * (hei/10)));  

  cameraSensor.update();

  lightCountdown.check(); 
  
  lightCountdown.count(); 
  
    
}


void keyPressed(){
  mode=0;
  setup();
}



class Countdown{
  
  float gameTime, startTime;


  void check(){
    
    if((brightestValue) / ((wid/10) * (hei/10)) > br) {
      video.stop();
      mode = 1;
    }
    
    if(mode == 0) {
      startTime = millis();
    }
      
  }
  
  void count(){

    background(0);
    fill(random(0,255),random(0,255),random(0,255));
   
    if(gameTime >= time){
        textSize(100);
        text("PICTURE READY",350,540);
//      image(blast,6,64);
    }
    else{
        text(int (time-gameTime), 190,740);
    }
     
    if(mode == 1){
      gameTime = (millis()-startTime)/1000;
    }
    
    if(gameTime >= time+5){
      mode=0;
      setup();
    }
    
  }
 
}
class Sensor{
  
  
  void update(){
    
    brightestValue = 0;
    
    if (video.available()) {
      video.read();
      image(video, 0, 0, width, height); // Draw the webcam video onto the screen
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

