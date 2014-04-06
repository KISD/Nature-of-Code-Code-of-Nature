class Sensor{
  
  void update(){
    
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
