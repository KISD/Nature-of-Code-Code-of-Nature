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

  void run() {
    display();
  }

/////* CREATING THE STRUCTURE */////

  void spawn() {

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

  void updateDir() {
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

  void updateLoc() {
    loc.addSelf(vel);
  }


/////* VISUAL APPROACH */////

  void display() {
    stroke(0, 200, 255, 60);
    strokeWeight(Case); //the stroke weight of the points will be controlled by a slider
    point(loc.x, loc.y);

    stroke(0);
    strokeWeight(Connection); //the stroke weight of the lines will be controlled by a slider
    line(loc.x, loc.y, oriLoc.x, oriLoc.y);
  }
}

