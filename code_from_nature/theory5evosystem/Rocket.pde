class Rocket {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float r;
  float val = random(255);
  float fitness;                     //fitness and DNA
  int geneCounter = 0;
  boolean hitTarget = false; 

  DNA dna;

  Rocket(PVector l, DNA dna_) {
    acceleration = new PVector();
    velocity = new PVector();
    location = l.get();
    r = 3;
    dna = dna_;
  }

  void fitness() {
    float d = dist(location.x, location.y, target.x, target.y);
    fitness = pow(1/d, 2);            // fitness = one divided by distance squared
  }

  void run() {
    checkTarget();                    //check to see if we've reached the target
    if (!hitTarget) {
      applyForce(dna.genes[geneCounter]);
      geneCounter = (geneCounter + 1) % dna.genes.length;
      update();
    }
    display();
  }

  void checkTarget() {
    float d = dist(location.x, location.y, target.x, target.y);
    if (d < 6) {
      hitTarget = true;
    } 
  }

  void applyForce(PVector f) {
    acceleration.add(f);
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }

  void display() {
    float theta = velocity.heading2D() + PI/2;
    fill(200, 100);
    stroke(0);
    pushMatrix();
    translate(location.x, location.y);
    rotate(theta);
    rectMode(CENTER);
    fill(lerpColor(#EAC199,#F2EEAF, norm(val,0,255)));
    noStroke();
    rect(r, r, r, r);
    popMatrix();
  }

  float getFitness() {
    return fitness;
  }

  DNA getDNA() {
    return dna;
  }

}

