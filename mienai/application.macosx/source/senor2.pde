class senor2 {
  float changeSca;
  int count;
  PVector rot = new PVector(0, 0, 0);
  PVector freqMulRot= new PVector(0, 0, 0);
  PVector freqMulSca= new PVector(0, 0, 0);
  PVector freqMulPos= new PVector(0, 0, 0);
  PVector pos = new PVector(0, 0, 0);

  float changeWH;
  float changeAL;

  float yPos;
  int richtung; // bstimmt,ob die Kugel vorwärts oder rückwerts fliegt
  int x; // stellt sicher, dass die Kugel erst erscheint und wegfliegt, wenn auc hein Marker in die Cam gehalten wird
  int trans;
  senor2() {
    x=1;  
    trans = 150;
    richtung = round(random(-1, 1));
  }

  void drawsenor2(float xPos, float yPos, boolean markerda) {

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

      translate(xPos - count/10, yPos+count * +0.5, 10*count/2.5*richtung);                      //// Kugel schwebt von Markerkarte weg
      changeSca = map(sin(count*0.0015), -1, 1, 1, 1.5);


      rotateX(count*0.011);
      rotateX(count*0.012);
      rotateZ(count*0.013); 

      /// KUGELN ZEICHEN //////////////////////////////////////

      stroke (0, 220, 50, 90);  
      //scale(0.5);
      sphereDetail(3);
      sphere(20);    
      scale(changeSca, changeSca, changeSca);
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
      println("x=="+x);
      popMatrix();
    }
  }
}

