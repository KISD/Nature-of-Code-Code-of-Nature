/**
 * An attempt of a radiolaria-like creature.
 * Uses vertex colors for gradients.
 */
class radio {
  PVector pos, rot, sca;
  PVector projectedPos;
  float energy, power;
  PVector pVel, rVel;
  int num, spikes;
  float freq;
  float rad, rFact;







  void moveradio() {
    pVel = new PVector( random(-1, 1), random(-1, 1), random(-1, 1) );
    rVel = new PVector( random(-0.01, 0.01), random(-0.01, 0.01), random(-0.01, 0.01) );
    num = round(random(20, 100));
    spikes = ceil(random(3, 12));
    freq = random(0.02, 0.06);
    rad = random(30, 60);
    rFact = random(0.2, 0.4);
    energy = 100.0;
    power = 0.02;
    pos = new PVector();
    projectedPos = new PVector();
    rot = new PVector();
    sca = new PVector(1, 1, 1);
    pos= new PVector (0, 0, 0);
    pos.add(pVel);  
    rot.add(rVel);  
    //applyTransforms();
  }

  void drawradio(float xPos, float yPos) {  
    stroke(41, 113, 13, 10);
    // noFill();
    //noStroke();
    fill(random(100), 22, 33, 15);
    pushMatrix();
    translate(xPos, yPos, 0);
    hint(DISABLE_DEPTH_TEST); 
    float arc = TWO_PI / num;    
    float f = frameCount * freq/1000;
    float a = arc * spikes;
    beginShape(QUAD_STRIP);
    for (int i=0; i<num+1; i++) { 
      int j = i % num;
      float len = (sin(f + a * j)) * 0.02;
      float c = cos(arc * j); 
      float s = sin(arc * j);
      float x = c * (rad + len * rad);
      float y = s * (rad + len * rad);
      float z = len * rad;
      //   fill(255, i % 2 * 255  ); 
      vertex(x*rFact/2, y*rFact/2, z);
      //fill(255, 0); 
      vertex(x, y, 0);
    }
    endShape();
    hint(ENABLE_DEPTH_TEST);
    popMatrix();
  }
}

