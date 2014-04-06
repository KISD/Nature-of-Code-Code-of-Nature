class senor {
  float changeSca;
  int count;
  PVector rot = new PVector(0, 0, 0);
  PVector freqMulRot= new PVector(0, 0, 0);
  PVector freqMulSca= new PVector(0, 0, 0);
  PVector freqMulPos= new PVector(0, 0, 0);
  PVector pos = new PVector(0, 0, 0);

  float changeWH;
  float changeAL;

  float faktor; // legt Skalierungsfaktor fest
  float yPos; 
  float xPos;
  float richtung = 0; // bstimmt,ob die Kugel vorwärts oder rückwerts fliegt
  int verschiebung;

  int x; // stellt sicher, dass die Kugel erst erscheint und wegfliegt, wenn auc hein Marker in die Cam gehalten wird
  int trans;
  senor() {

    faktor = random(0.3, 0.8);
    verschiebung = round(random(-width/2, width/2)); // sorgt für eeine Verteilung der Senore 
    x=1;  
    trans = 150;

    // While Schleife stellt sicher, dass richtung entweder -1 oder +1 ist

    while (richtung ==0) {   
      richtung = round(random(-1, 1));
    }
  }

  void drawsenor(float xPos, float yPos, boolean markerda) {

    yPos = yPos;
    xPos = xPos;


    // nur wenn ein Marker da ist, soll der Senor losfliegen
    if (markerda==true) {
      x++;

      pushMatrix();

      freqMulRot = new PVector();
      freqMulRot.x = random(-0.005, 1.005);
      freqMulRot.y = random(-0.01, 1.01);
      freqMulRot.z = random(-0.015, 1.015);


      /// KUGEL Bewegung festlegen /////////////////////////////////////

      count = frameCount;

      //  translate(xPos + count/2.5+verschiebung, yPos+count  +0.5, 0+richtung*count);                      //// Kugel schwebt von Markerkarte weg
      translate(xPos+count *faktor* richtung, yPos+verschiebung+count*richtung, 0);
      changeSca = map(sin(count*0.015), -1, 1, 1, 1.5);


      rotateX(count*0.011);
      rotateX(count*0.012);
      rotateZ(count*0.013); 

      /// KUGELN ZEICHEN //////////////////////////////////////

      stroke (0, 220, 50, 90);  
      scale(faktor);
      sphereDetail(3);
      sphere(20);    
      scale(changeSca*faktor, changeSca*faktor, changeSca*faktor);
      stroke (200, 200, 90 );
      sphereDetail(1);
      sphere(8);

      noFill();


      /////////////////////////////////////////////////////////////////////
      // SENOR RINGE, die sich ausbreiten                                             /////
      // und dann langsam unsichtbar werden                                      /////
      /////////////////////////////////////////////////////////////////////



      if (x<65) {
        trans = 100-x*1;         // stellt scher, dass die Transparents einen weichen Übergang hat
      } 
      else { 
        trans=10;
      }

      stroke(255, 0, 255, trans);
      ellipse (0, 0, changeWH, changeWH);
      ellipse (0, 0, changeWH/2, changeWH/2);

      changeWH = exp(sqrt(count*0.25));
      popMatrix();
    }
  }
}

