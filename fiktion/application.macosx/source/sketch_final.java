import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import controlP5.*; 
import toxi.geom.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class sketch_final extends PApplet {




Stick bob;
ControlP5 cp5;

ArrayList <Stick> allBobs;

public int Background = 80;
public int Case = 50;
public int Connection = 5;
public int Coherence = 100;
public int Complexity = 5;

public void setup() {
  size(1000, 700, P3D);
  smooth();
  
  allBobs = new ArrayList <Stick>();

/////* Sliders */////

  cp5 = new ControlP5(this);

  cp5.addSlider("Background")    //Reglername
    .setBroadcast(false)    
      .setRange(0, 255)       // Ausschlag Winkel
        .setPosition(850, 680)   // Position des Reglers
          .setSize(60, 10)       // Gr\u00f6\u00dfe des Reglers
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

public void draw() {
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

class Stick {

  Vec3D loc;
  Vec3D oriLoc;
  Vec3D vel;


  int generations;
  String type;
  
  /////* CONSTRUCTOR */////

  Stick(Vec3D _loc, Vec3D _vel, int _generations, String _type) {
    loc = _loc;
    oriLoc = _loc.copy();
    vel = _vel;
    generations = _generations;

    type = _type;

    //stack of functions that get executed only once
    updateDir();
    updateLoc();
    spawn();
  }

  public void run() {
    display();
  }

/////* CREATING THE STRUCTURE */////

  public void spawn() {

    if (generations > 0) {

      Vec3D v = loc.copy();
      Vec3D intVel = vel.copy();
      Stick newBob = new Stick(v, intVel, generations-1, "B");

      allBobs.add(newBob);

      Vec3D v2 = loc.copy();
      Vec3D intVel2 = vel.copy();
      Stick newBob2 = new Stick(v2, intVel2, generations-1, "A");

      allBobs.add(newBob2);
    }
    
    if (type =="B") {
        Vec3D v = loc.copy();
        Vec3D intVel = vel.copy();
        Stick newBob = new Stick(v, intVel, generations-1, "C");

        allBobs.add(newBob);
      }

      if (type =="C") {
        Vec3D v = loc.copy();
        Vec3D intVel = vel.copy();
        Stick newBob = new Stick(v, intVel, generations-1, "A");

        allBobs.add(newBob);
      }
  }

/////* UPDATE OF DIRECTION */////

  public void updateDir() {
    if (type == "A") {
      float angle1 = radians(20);
      float angle2 = radians(Coherence); //this angle will be controlled by a slider
      float angle3 = radians(0);
      vel.rotateX(angle1);
      vel.rotateY(angle2);
      vel.rotateZ(angle3);
    }

    if (type == "B") {
      float angle1 = radians(-30);
      float angle2 = radians(-30);
      float angle3 = radians(50);
      vel.rotateX(angle1);
      vel.rotateY(angle1);
      vel.rotateZ(angle3);
    }
    
     if (type == "C") {
      float angle1 = radians(80);
      float angle2 = radians(0);
      float angle3 = radians(10);
      vel.rotateX(angle1);
      vel.rotateY(angle2);
      vel.rotateZ(angle3);
    }
  }

/////* UPDATE OF LOCATION */////

  public void updateLoc() {
    loc.addSelf(vel);
  }


/////* VISUAL APPROACH */////

  public void display() {
    stroke(0, 200, 255, 60);
    strokeWeight(Case); //the stroke weight of the points will be controlled by a slider
    point(loc.x, loc.y);

    stroke(0);
    strokeWeight(Connection); //the stroke weight of the lines will be controlled by a slider
    line(loc.x, loc.y, oriLoc.x, oriLoc.y);
  }
}

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_final" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
