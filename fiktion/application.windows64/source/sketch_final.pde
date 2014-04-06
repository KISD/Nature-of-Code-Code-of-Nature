import controlP5.*;
import toxi.geom.*;

Stick bob;
ControlP5 cp5;

ArrayList <Stick> allBobs;

public int Background = 80;
public int Case = 50;
public int Connection = 5;
public int Coherence = 100;
public int Complexity = 5;

void setup() {
  size(1000, 700, P3D);
  smooth();
  
  allBobs = new ArrayList <Stick>();

/////* Sliders */////

  cp5 = new ControlP5(this);

  cp5.addSlider("Background")    //Reglername
    .setBroadcast(false)    
      .setRange(0, 255)       // Ausschlag Winkel
        .setPosition(850, 680)   // Position des Reglers
          .setSize(60, 10)       // Größe des Reglers
            .setBroadcast(true)     
              .setValue(60)          // start Ausschlag
                ;

  cp5.addSlider("Case")   
    .setBroadcast(false)    
      .setRange(10, 100)       
        .setPosition(850, 660)   
          .setSize(60, 10)       
            .setBroadcast(true)     
              .setValue(50)          
                ;

  cp5.addSlider("Connection")    
    .setBroadcast(false)    
      .setRange(0, 5)       
        .setPosition(850, 640)   
          .setSize(60, 10)       
            .setBroadcast(true)     
              .setValue(2)          
                ;

  cp5.addSlider("Coherence")    
    .setBroadcast(false)    
      .setRange(0, 200)       
        .setPosition(850, 620)   
          .setSize(60, 10)       
            .setBroadcast(true)     
              .setValue(100)          
                ;

  cp5.addSlider("Complexity")    
    .setBroadcast(false)    
      .setRange(1, 10)       
        .setPosition(850, 600)   
          .setSize(60, 10)       
            .setBroadcast(true)     
              .setValue(3)          
                ;

  float Background = cp5.getController("Background").getValue();
  float Points = cp5.getController("Case").getValue();
  float Lines = cp5.getController("Connection").getValue();
  float Angle1 = cp5.getController("Coherence").getValue();
  float ITE = cp5.getController("Complexity").getValue();
}

void draw() {
  background(Background); //the background colour will be controlled by a slider

  allBobs.clear(); //necessary to see the updated angle and iteration

  Vec3D v = new Vec3D(100, 0, 0);
  Vec3D intVel = new Vec3D(100, 0, 0);
  bob = new Stick(v, intVel, Complexity, "A"); //the iteration "ITE" will be controlled by a slider

  allBobs.add(bob);

  stroke(255);
  noFill();
  strokeWeight(1);

  for (Stick b : allBobs) {
    b.run();
  }
}

