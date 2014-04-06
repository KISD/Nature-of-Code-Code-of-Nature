class kugel {
  float changeSca;
  int count;
  PVector rot = new PVector(0, 0, 0);
  PVector freqMulRot= new PVector(0, 0, 0);
  PVector freqMulSca= new PVector(0, 0, 0);
  PVector freqMulPos= new PVector(0, 0, 0);
  PVector pos = new PVector(0, 0, 0);

  float changeWH;
  float changeAL;

  int zaehler;

  float yPos;
  float richtung; // bestimmt,ob die Kugel vorwärts oder rückwerts fliegt


  kugel() {

    while (richtung ==0) {   
      richtung = round(random(-1, 1));
    }
    //  richtung = 1;       // zufall,ob sie nach vorne oder hinten wegschwebt (round(random(-1, 1)))
    zaehler = 1;                                     // stellt sicher, dass die Kugel erst losfliegt, wenn sie entstanden ist und nicht vorher
  }

  void drawkugel(float xPos, float yPos) {
    zaehler = zaehler +1;                       // zaehler steigt an, damit sich Kugel vom Marker entfernt
    if (xPos + zaehler >width+130) { 
      zaehler =1;    
      richtung=richtung*1;       // zufall,ob sie nach vorne oder hinten wegschwebt
    }
    if (yPos + zaehler >height+100) {
      zaehler =1;    
      richtung = richtung*1;       // zufall,ob sie nach vorne oder hinten wegschwebt
    }

    yPos = yPos;

    /// UNSICHTBAR MACHEN ////////

    pushMatrix();

    /// KUGEL Zeichnen /////////////////////////////////////

    translate(xPos + zaehler*richtung, yPos-zaehler-0.5*richtung, 0+zaehler*richtung);                      //// Kugel schwebt von Markerkarte weg (10*zaehler/2.5*richtung)
    changeSca = map(sin(count*0.015), -1, 1, 1, 1.5);

    //    rot.x = sin(frameCount*freqMulRot.x*2) * TWO_PI;
    //    rot.y = sin(frameCount*freqMulRot.y*2) * TWO_PI;
    //    rot.z = sin(frameCount*freqMulRot.z*2) * TWO_PI;
    //
    pos.x += sin(frameCount*freqMulPos.x );
    pos.y += sin(frameCount*freqMulPos.y);
    pos.z += cos(frameCount*freqMulPos.z);

    rotateX(count*0.011);
    rotateX(count*0.012);
    rotateZ(count*0.013); 

    /// KUGELN ZEICHEN //////////////////////////////////////

    //stroke (155, 0, 0, 200);  
    fill(random(119), 30, 55, 47);
    stroke(255, 0, 0, 20);
    sphereDetail(6);
    sphere(30);    
    //scale(changeSca, changeSca, changeSca);
    stroke (200, 200, 200, 40 );
    //  fill(random(100), random(30), 55);
    sphereDetail(1);
    sphere(10);

    popMatrix();

    //translate(0,0,0);
  }
}

