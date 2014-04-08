// Based on Flocking by Daniel Shiffman. The Nature of Code, Spring 2009.

Flock flock;

void setup() {
  size(450,450);
  flock = new Flock();
  for (int i = 0; i < 500; i++) {                           //initial set of boids
    Boid b = new Boid(random(width), random(height));
    flock.addBoid(b);
  }
  smooth();
}

void draw() {
  background(255);
  flock.run(); 
}

// click and drag mouse to add boids
void mouseDragged() {
  flock.addBoid(new Boid(mouseX,mouseY));
}


