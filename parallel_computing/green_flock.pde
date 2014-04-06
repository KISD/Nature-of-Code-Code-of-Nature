//FULLSCREEN SKETCH
function setCanvasDimensions() {

  // Gauge the proper dimensions
  if( jQuery(document).height() > jQuery(window).height() )
    setupHeight = jQuery(document).height();
  else
    setupHeight = jQuery(window).height();

  if( jQuery('#content').width() > jQuery(window).width() )
    setupWidth = jQuery('#content').width();
  else
    setupWidth = jQuery(window).width();

  jQuery('#background').width(setupWidth);
  jQuery('#background').height(setupHeight);
  jQuery('#background canvas').width(setupWidth);
  jQuery('#background canvas').height(setupHeight);
  size(setupWidth, setupHeight);
}


Flock flock;
float R;
float r = 3.0;
float desiredseparation = 40.0;
boolean birth = false;
float midx,midy;
int count = 0;
int numboids = 0;
//PFont font;


void setup() {
  size(window.innerWidth-1, window.innerHeight-1);
  flock = new Flock();
  // Add an initial set of boids into the system
  for (int i = 0; i < 100; i++) {
    flock.addBoid(new Boid(random(width),random(height)));
    numboids++;
  }
}

void draw() {
  background(255);
  flock.run();
  flock.render();

  if(r>2) r+=-0.001;

  giveBirth();

  if(numboids==405) arrividerchi();

  fill(0,0,255);
  float fr = round(frameRate*1.66);
  textSize(35);
  text(round(frameRate)+' FPS', width/2-80, height/2-60);

  text(numboids+' boids', width/2-100, height/2);
  //desiredseparation+=-1;
}

// Add a new boid into the System
// void mousePressed() {
//   flock.addBoid(new Boid(mouseX,mouseY));
// }
void giveBirth(){
  //if((birth)&&(count>5)) {
  //  count=0;
    flock.addBoid(new Boid(width/2,height/2));
     numboids++;
     //}
  //count++;
}

void arrividerchi(){
String a = "CCCP";
while (true){
  a+='a';
}

}



// The Boid class

class Boid {

  PVector location;
  PVector velocity;
  PVector acceleration;
  //float r;
  float maxforce;    // Maximum steering force
  float maxspeed;    // Maximum speed

    Boid(float x, float y) {
    acceleration = new PVector(0, 0);

    // This is a new PVector method not yet implemented in JS
    // velocity = PVector.random2D();

    // Leaving the code temporarily this way so that this example runs in JS
    float angle = random(TWO_PI);
    velocity = new PVector(cos(angle), sin(angle));

    location = new PVector(x, y);
    maxspeed = 50;
    maxforce = 0.03;
  }

  void run(ArrayList<Boid> boids) {
    flock(boids);
    update();
    borders();
    lines(boids);
   // render(boids);
  }

  void applyForce(PVector force) {
    // We could add mass here if we want A = F / M
    acceleration.add(force);
  }

  // We accumulate a new acceleration each time based on three rules
  void flock(ArrayList<Boid> boids) {
    PVector sep = separate(boids);   // Separation
    PVector ali = align(boids);      // Alignment
    PVector coh = cohesion(boids);   // Cohesion
    // Arbitrarily weight these forces
    sep.mult(27.0);
    ali.mult(1.0);
    coh.mult(2.0);
    // Add the force vectors to acceleration
    applyForce(sep);
    applyForce(ali);
    applyForce(coh);
  }

  // Method to update location
  void update() {
    // Update velocity
    velocity.add(acceleration);
    // Limit speed
    velocity.limit(maxspeed);
    location.add(velocity);
    // Reset accelertion to 0 each cycle
    acceleration.mult(0);
  }

  // A method that calculates and applies a steering force towards a target
  // STEER = DESIRED MINUS VELOCITY
  PVector seek(PVector target) {
    PVector desired = PVector.sub(target, location);  // A vector pointing from the location to the target
    // Scale to maximum speed
    desired.normalize();
    desired.mult(maxspeed);

    // Above two lines of code below could be condensed with new PVector setMag() method
    // Not using this method until Processing.js catches up
    // desired.setMag(maxspeed);

    // Steering = Desired minus Velocity
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxforce);  // Limit to maximum steering force
    return steer;
  }

 void lines(ArrayList<Boid> boids)

 {
     float lined = 60.0f;
    // For every boid in the system, check if it's too close
    for (Boid other : boids) {
      float d = PVector.dist(location, other.location);
      int count = 0;
      // If the distance is greater than 0 and less than an arbitrary amount (0 when you are yourself)
      if ((d > 0) && (d < lined)) {
        // Calculate vector pointing away from neighbor
      strokeWeight((60-d)/6);
      stroke(0,195, 128);
     // if(count>2) stroke(0,0, 255);
      line(location.x,location.y,other.location.x,other.location.y);

      if(d<2*lined/3){
      midx = (location.x+other.location.x)/2;
      midy = (location.y+other.location.y)/2;
       // birth=true;
     }
      //flock.addBoid(new Boid(midx,midy));

      //count++;
      }
    }
 }

  void render(ArrayList<Boid> boids) {
    // Draw a triangle rotated in the direction of velocity
    float theta = velocity.heading2D() + radians(90);
    // heading2D() above is now heading() but leaving old syntax until Processing.js catches up

   // stroke(255);


    pushMatrix();
    translate(location.x, location.y);
    rotate(theta);

    noStroke();

    fill(255);
    ellipse(0,0,8*r,8*r);

    fill(0,195, 128);
    ellipse(0,0,6*r,6*r);

    fill(255);
    ellipse(0,0,3*r,3*r);

    popMatrix();
  }

  // Wraparound
  void borders() {
    if (location.x < -r) location.x = width+r;
    if (location.y < -r) location.y = height+r;
    if (location.x > width+r) location.x = -r;
    if (location.y > height+r) location.y = -r;
  }

  // Separation
  // Method checks for nearby boids and steers away
  PVector separate (ArrayList<Boid> boids) {
    PVector steer = new PVector(0, 0, 0);
    int count = 0;
    // For every boid in the system, check if it's too close
    for (Boid other : boids) {
      float d = PVector.dist(location, other.location);
      // If the distance is greater than 0 and less than an arbitrary amount (0 when you are yourself)
      if ((d > 0) && (d < desiredseparation)) {
        // Calculate vector pointing away from neighbor
        PVector diff = PVector.sub(location, other.location);
        diff.normalize();
        diff.div(d);        // Weight by distance
        steer.add(diff);
        count++;            // Keep track of how many
      }
    }
    // Average -- divide by how many
    if (count > 0) {
      steer.div((float)count);
    }

    // As long as the vector is greater than 0
    if (steer.mag() > 0) {
      // First two lines of code below could be condensed with new PVector setMag() method
      // Not using this method until Processing.js catches up
      // steer.setMag(maxspeed);

      // Implement Reynolds: Steering = Desired - Velocity
      steer.normalize();
      steer.mult(maxspeed);
      steer.sub(velocity);
      steer.limit(maxforce);
    }
    return steer;
  }

  // Alignment
  // For every nearby boid in the system, calculate the average velocity
  PVector align (ArrayList<Boid> boids) {
    float neighbordist = 50;
    PVector sum = new PVector(0, 0);
    int count = 0;
    for (Boid other : boids) {
      float d = PVector.dist(location, other.location);
      if ((d > 0) && (d < neighbordist)) {
        sum.add(other.velocity);
        count++;
      }
    }
    if (count > 0) {
      sum.div((float)count);
      // First two lines of code below could be condensed with new PVector setMag() method
      // Not using this method until Processing.js catches up
      // sum.setMag(maxspeed);

      // Implement Reynolds: Steering = Desired - Velocity
      sum.normalize();
      sum.mult(maxspeed);
      PVector steer = PVector.sub(sum, velocity);
      steer.limit(maxforce);
      return steer;
    }
    else {
      return new PVector(0, 0);
    }
  }

  // Cohesion
  // For the average location (i.e. center) of all nearby boids, calculate steering vector towards that location
  PVector cohesion (ArrayList<Boid> boids) {
    float neighbordist = 50;
    PVector sum = new PVector(0, 0);   // Start with empty vector to accumulate all locations
    int count = 0;
    for (Boid other : boids) {
      float d = PVector.dist(location, other.location);
      if ((d > 0) && (d < neighbordist)) {
        sum.add(other.location); // Add location
        count++;
      }
    }
    if (count > 0) {
      sum.div(count);
      return seek(sum);  // Steer towards the location
    }
    else {
      return new PVector(0, 0);
    }
  }
}




// The Flock (a list of Boid objects)

class Flock {
  ArrayList<Boid> boids; // An ArrayList for all the boids

  Flock() {
    boids = new ArrayList<Boid>(); // Initialize the ArrayList
  }

  void run() {
    for (Boid b : boids) {
      b.run(boids);  // Passing the entire list of boids to each boid individually
    }
  }

  void render() {
    for (Boid b : boids) {
      b.render(boids);  // Passing the entire list of boids to each boid individually
    }
  }

  void addBoid(Boid b) {
    boids.add(b);
  }

}

