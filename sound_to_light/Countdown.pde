class Countdown{

String text;
float gameTime;
float  startTime;
  
  void check(){
    
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
  
  void count(){

  background(0);
    
  fill(0,158,226);
  arc((displayWidth/2), (displayHeight/2),(displayHeight/1.5)+beat,(displayHeight/1.5)+beat,0,(time-gameTime)/time*2*PI);
    
  fill(255);
  ellipse((displayWidth/2), (displayHeight/2),(displayHeight/1.5)-120,(displayHeight/1.5)-120);

    
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
        text = String.valueOf(int(time-gameTime));
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
      if (time-gameTime == 5.5){
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
  
  void resetSketch() {
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
  
  void save(){
    
    String TimeLoad[] = loadStrings("Time.txt");
    timeSet = Float.parseFloat(TimeLoad[0]);
    
  }
 
}
