import processing.core.*; 
import processing.data.*; 
import processing.opengl.*; 

import toxi.geom.*; 
import peasy.*; 
import controlP5.*; 

import java.applet.*; 
import java.awt.Dimension; 
import java.awt.Frame; 
import java.awt.event.MouseEvent; 
import java.awt.event.KeyEvent; 
import java.awt.event.FocusEvent; 
import java.awt.Image; 
import java.io.*; 
import java.net.*; 
import java.text.*; 
import java.util.*; 
import java.util.zip.*; 
import java.util.regex.*; 

public class LindenmayerSystem_KISD_WS1314_Moldenhauer extends PApplet {





PeasyCam cam;

Stick bob;

ArrayList <Stick> allBobs;

ControlP5 controlP5;
ControlWindow controlWindow;

public void setup() {
  size(800, 350, P3D);
  smooth();
  ui();
  allBobs = new ArrayList <Stick> ();
  cam = new PeasyCam(this, 100);

}


public void draw() {
  background(255);

  allBobs.clear();

  Vec3D v = new Vec3D (0, 0, 0);
  Vec3D iniVel = new Vec3D (100, 0, 0);
  bob = new Stick(v, iniVel, GROWTH, "A");
  allBobs.add(bob);

  stroke(0);
  noFill();
  strokeWeight(1);
  // box(600);
  //short way:

  for (Stick b : allBobs) {
    b.run();
  }

}

public void keyReleased() {
  if (key == 's' || key == 'S') saveFrame(timestamp()+"_##.jpg");
}

// timestamp
public String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}




float TWISTING = -70;
float WIGGLING = -3.60f;
float TURNING = 70;

float SPINING = 32.39f;
float MOVING = 0;
float SHAKING = 0;

int GROWTH= 0;

public void ui() {
  controlP5 = new ControlP5(this);
  controlWindow = controlP5.addControlWindow("controlP5window", 100, 100, 445, 165);

  Slider s01 = controlP5.addSlider("TWISTING", -90, 90, 20, 20, 100, 10);
  s01.setWindow(controlWindow);

  Slider s02 = controlP5.addSlider("WIGGLING", -90, 90, 20, 40, 100, 10);
  s02.setWindow(controlWindow);

  Slider s03 = controlP5.addSlider("TURNING", -90, 90, 20, 60, 100, 10);
  s03.setWindow(controlWindow);

  Slider s05 = controlP5.addSlider("SPINING", -90, 90, 20, 90, 100, 10);
  s05.setWindow(controlWindow);

  Slider s06 = controlP5.addSlider("MOVING", -90, 90, 20, 110, 100, 10);
  s06.setWindow(controlWindow);

  Slider s07 = controlP5.addSlider("SHAKING", -90, 90, 20, 130, 100, 10);
  s07.setWindow(controlWindow);

  Slider s04 = controlP5.addSlider("GROWTH", 0, 19, 170, 20, 100, 10);
  s04.setWindow(controlWindow);

  Textlabel t01 = controlP5.addTextlabel("yeah", "Please use the Sliders to control the six different", 170, 62);
  t01.setWindow(controlWindow);
  Textlabel t02 = controlP5.addTextlabel("yeah", "ANGLES and the ITERATION process.  ", 170, 82);
  t02.setWindow(controlWindow);
  Textlabel t03 = controlP5.addTextlabel("yeah", "Use the Buttons on your Mouse to change the view ", 170, 102);
  t03.setWindow(controlWindow);
  Textlabel t04 = controlP5.addTextlabel("yeah", "and perspective of the Lindenmayer-System in 3D space. ", 170, 122);
  t04.setWindow(controlWindow);
   Textlabel t05 = controlP5.addTextlabel("yeah", "Use the key \"S\" to take a screenshot.", 170, 142);
  t05.setWindow(controlWindow);
}


class Stick {

  Vec3D loc;
  Vec3D oriLoc;
  Vec3D vel;

  int generations;
  String type;
  Stick(Vec3D _loc, Vec3D _vel, int _generations, String _type) {
    loc = _loc;
    oriLoc = loc.copy();
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

  public void spawn() {

    if (generations > 0) {

      if (type == "A") {
        Vec3D v = loc.copy();
        Vec3D iniVel = vel.copy();
        Stick newBob = new Stick(v, iniVel, generations-1, "A");

        allBobs.add(newBob);

        Vec3D v2 = loc.copy();
        Vec3D iniVel2 = vel.copy();
        Stick newBob2 = new Stick(v2, iniVel2, generations-1, "B");

        allBobs.add(newBob2);
      }
      if (type == "B") {
        Vec3D v = loc.copy();
        Vec3D iniVel = vel.copy();
        Stick newBob = new Stick(v, iniVel, generations-1, "C");

        allBobs.add(newBob);
      }
      if (type == "C") {
        Vec3D v = loc.copy();
        Vec3D iniVel = vel.copy();
        Stick newBob = new Stick(v, iniVel, generations-1, "A");

        allBobs.add(newBob);
      }
    }
  }

  public void updateDir() {  // this class will create another one of itself and so on...

    if (type == "A") {
      float angle1 = radians(SPINING);  
      float angle2 = radians(TWISTING);  
      float angle3 = radians(0);  
      vel.rotateX(angle1);
      vel.rotateY(angle2);
      vel.rotateZ(angle3);

      vel.normalize();
      vel.scaleSelf(100);
    }

    if (type == "B") {
      float angle1 = radians(0);  
      float angle2 = radians(MOVING);  
      float angle3 = radians(WIGGLING);  
      vel.rotateX(angle1);
      vel.rotateY(angle2);
      vel.rotateZ(angle3);

      vel.normalize();
      vel.scaleSelf(20);
    }

    if (type == "C") {
      float angle1 = radians(TURNING);  
      float angle2 = radians(0);  
      float angle3 = radians(SHAKING);  
      vel.rotateX(angle1);
      vel.rotateY(angle2);
      vel.rotateZ(angle3);

      vel.normalize();
      vel.scaleSelf(40);
    }
  }


  public void updateLoc() {
    loc.addSelf(vel);
  }


  public void display() {
    stroke(0, 0, 0, 90);
    strokeWeight(6);
    point(loc.x, loc.y, loc.z);
    stroke(0, 90);
    strokeWeight(1);
    line(loc.x, loc.y, loc.z, oriLoc.x, oriLoc.y, oriLoc.z);
  }
}

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "LindenmayerSystem_KISD_WS1314_Moldenhauer" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
