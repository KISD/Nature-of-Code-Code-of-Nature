
class theoktu {


  int numSegmenti;
  int numTentacoli;
  int numPinne;
  float distPinne;
  float l;

  //TRIGO
  float sm1, sm2;
  float rx, ry;
  PVector pVel, rVel, noiseVel;

  float d; // Abstand vom Okut zum Marker
  boolean stillstand = false;
  PVector markerPos;
  PVector oktPos;

  float count;
  float shrink; // lässt den Oktu langsam schrumpfen
  long lastTime = 0;

  void okktu() {
  }

  void draw() {
    lastTime = millis();
  }

  void drawtheoktu(float xPos, float yPos) {

    PVector markerPos = new PVector(xPos, yPos);
    count = frameCount;
    pushMatrix();


    /// Handy Anfallen == Der Oktu schwimmt langsam ins Bild und bleibt dann beim Handy kleben /////


    PVector oktuPos = new PVector(xPos +300 - count, yPos +300 -count);


    /////////////////////////////////////////////////////////////////////
    // Sicher Stelle, dass er bei Stillstand = true wirklich stehen bleibt /////
    // Leider ist die doppelte Definition von d nötig, weil er sonst irgendwie
    // nicht stehenbleiben will
    /////////////////////////////////////////////////////////////////////

    if (stillstand == false) {
      d = PVector.dist(oktuPos, markerPos);
    }

    if (d>10 & stillstand==false) {
      translate(xPos +300 - count, yPos +300 -count, 0.0);
      d = PVector.dist(oktuPos, markerPos); 
      //    println("d=___"+d);
    }
    if (d<10) {
      stillstand = true;
      d=2;                                         // Sicherheitshalber wird d immer auf 2 gesetzt
      translate(xPos, yPos, 0.0);
    }

    /////////////////////////////////////////////////////////////////////
    // The Oktu ZEICHEN UND ANIMIEREN                                         /////
    //                                                                                             /////
    // CREDITS TO:     The Abby                                                       /////
    //    OTFather() {                                                                       /////
    //    creatureName = "Father";                                                   /////
    //    creatureAuthor = "Oliviero Tavaglione";                               /////
    //   creatureVersion = "Beta";                                                    /////
    //  setDate(2011, 5, 7); //Y,M,D                                               /////
    //                                                                                           /////  
    ///////////////////////////////////////////////////////////////////

    count = frameCount;
    sphereDetail(8);
    scale(0.15);
    //TESTA
    fill(100, 33);
    stroke(100, 90);
    sphere(30);


    //ANTENNE
    stroke(100, 90);

    //float ly = sin(frameCount * 0.01) * 30;
    //float lz = -sin(frameCount * 0.01) * 30;
    float ly = random(l/2, sin(count * 0.01) * l);
    float lz = random(l, l + (l/1.5));


    line(0, 0, 0, -l*2, 10, 30);
    line(0, 0, 0, -l*2, 10, -30);

    //PINNE  
    rotateY(-(numPinne-1) * distPinne / 2);
    //rotateY(-(numPinne-1) * distPinne / (distPinne - TWO_PI));
    for (int k=0; k<numPinne; k++) {

      float s = (cos(TWO_PI / (numPinne-1) * k));
      s = map(s, 1, -1, 0.9, 1);
      // println(k + "   " + s);
      pushMatrix();
      scale(s);


      for (int j=0; j<numTentacoli; j++) {
        pushMatrix();

        float a = (noise(count*noiseVel.x + j+k+1)-0.4)*0.782; 
        float b = (noise(count*noiseVel.y + j+k+1)-0.5)*0.582; 
        float c = (noise(count*noiseVel.z + j+k+1)-0.6)*0.682;


        // Zappeln der Tentakel

        for (int i=0; i<numSegmenti; i++) {
          rotateZ(a);
          rotateY(b);
          rotateX(c);
          translate(l*0.9, 0, 0);
          scale(0.85, 0.85, 0.85);
          box(l, l/2, l);
        }


        popMatrix();

        rotateY(TWO_PI/numTentacoli);
      }
      popMatrix();
      rotateY(distPinne);
    }


    l = random(20, 40); 
    numSegmenti = floor(random(10, 20));
    numTentacoli = 2;
    numPinne = floor(random(2, 6));
    distPinne = random(0.2, 0.5);
    l = random(20, 40);
    sm1 = random(-0.005, 0.005);
    sm2 = random(-0.005, 0.005);    


    pVel = new PVector(1, -1, -1);
    rVel = new PVector(1, -1, -1);
    rVel.mult(random(0.01, 0.03));
    noiseVel = new PVector(1, -1, -1);
    noiseVel.mult(random(0.005, 0.03));
    float s = random(0.5, 1);
    // sca.set(s, s, s);

    popMatrix();
  } 


  void staytheoktu() {

    //   this.drawtheoktu(100,100);
  }

  //  }
}

