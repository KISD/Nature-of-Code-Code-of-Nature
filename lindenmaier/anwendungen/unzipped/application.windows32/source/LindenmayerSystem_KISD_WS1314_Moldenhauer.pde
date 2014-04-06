import toxi.geom.*;
import peasy.*;
import controlP5.*;

PeasyCam cam;

Stick bob;

ArrayList <Stick> allBobs;

ControlP5 controlP5;
ControlWindow controlWindow;

void setup() {
  size(800, 350, P3D);
  smooth();
  ui();
  allBobs = new ArrayList <Stick> ();
  cam = new PeasyCam(this, 100);

}


void draw() {
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

void keyReleased() {
  if (key == 's' || key == 'S') saveFrame(timestamp()+"_##.jpg");
}

// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}

