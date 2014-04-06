class Boid {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float r;
  float mass;
  float maxforce;    // maximum steering force
  float maxspeed;    // maximum speed    
    

  Boid(float x, float y) {
    acceleration = new PVector(0,0);
    velocity = new PVector(random(-1,1),random(-1,1));
    location = new PVector(x,y);
    r = random(1, 3);
    mass = r;
    maxspeed = 3;
    maxforce = 0.05;
  }

  void run(ArrayList<Boid> boids) {
    flock(boids);
    update();
    borders();
    render();
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
  }

// accumulate a new acceleration each time based on three rules
  void flock(ArrayList<Boid> boids) {
    PVector sep = separate(boids);   // separation
    PVector ali = align(boids);      // alignment
    PVector coh = cohesion(boids);   // cohesion
    sep.mult(1.5);
    ali.mult(mass/2);
    coh.mult(mass/2);
// add the force vectors to acceleration
    applyForce(sep);
    applyForce(ali);
    applyForce(coh);
  }


  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }

// method that calculates and applies a steering force towards a target
  PVector seek(PVector target) {
    PVector desired = PVector.sub(target,location);    // vector pointing from the location to the target
    desired.normalize();                               // normalize desired and scale to maximum speed
    desired.mult(maxspeed);
    PVector steer = PVector.sub(desired,velocity);     // steering = desired - velocity
    steer.limit(maxforce);                             // limit to maximum steering force
    return steer;
  }
  
  void render() {
    
    int col;  
    color[] colarray = new color[4];
    colarray[0] = color(53, 72, 82);
    colarray[1] = color(234, 193, 153);
    colarray[2] = color(242, 238, 175);
    colarray[3] = color(155, 231, 196);
    col = color(colarray[(int)random(0,3)]); 
   
    fill(col);
    noStroke();
    pushMatrix();
    //ellipse(location.x,location.y, 1, 1);
    rect(location.x,location.y, 3, 3);
    popMatrix();
  }

// wraparound
  void borders() {
    if (location.x < -r) location.x = width+r;
    if (location.y < -r) location.y = height+r;
    if (location.x > width+r) location.x = -r;
    if (location.y > height+r) location.y = -r;
  }


// separation
  PVector separate (ArrayList<Boid> boids) {
    float desiredseparation = 10.0f;
    PVector steer = new PVector(0,0,0);
    int count = 0;
    for (Boid other : boids) {                                 // check location and closeness
      float d = PVector.dist(location,other.location);
      if ((d > 0) && (d < desiredseparation)) {                // distance greater than 0 and less than desired separation
        PVector diff = PVector.sub(location,other.location);   // vector to separate near elements
        diff.normalize();
        diff.div(d);                                           // weight by distance
        steer.add(diff);
      }
    }

    if (steer.mag() > 0) {                                     // implement: steering = desired - velocity
      steer.normalize();
      steer.mult(maxspeed);
      steer.sub(velocity);
      steer.limit(maxforce);
    }
    return steer;
  }


// alignment
  PVector align (ArrayList<Boid> boids) {
    float neighbordist = 50;
    PVector sum = new PVector(0,0);
    int count = 0;
    for (Boid other : boids) {                                //calculate the average velocity
      float d = PVector.dist(location,other.location);
      if ((d > 0) && (d < neighbordist)) {
        sum.add(other.velocity);
        count++;
      }
    }
    if (count > 0) {
      sum.div((float)count);
      sum.normalize();
      sum.mult(maxspeed);
      PVector steer = PVector.sub(sum,velocity);
      steer.limit(maxforce);
      return steer;
    } else {
      return new PVector(0,0);
    }
  }


// cohesion force
  PVector cohesion (ArrayList<Boid> boids) {
    float neighbordist = 50;
    PVector sum = new PVector(0,0);                              // add together all locations
    int count = 0;
    for (Boid other : boids) {
      float d = PVector.dist(location,other.location);
      if ((d > 0) && (d < neighbordist)) {
        sum.add(other.location);                                 
        count++;
      }
    }
    if (count > 0) {
      sum.div(count);
      return seek(sum);                                          // steer using the location result
    } else {
      return new PVector(0,0);
    }
  }
}

