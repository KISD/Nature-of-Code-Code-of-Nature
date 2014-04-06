import processing.core.*; 
import processing.xml.*; 

import netscape.javascript.*; 
import processing.video.*; 
import jp.nyatla.nyar4psg.*; 
import processing.opengl.*; 

import java.applet.*; 
import java.awt.Dimension; 
import java.awt.Frame; 
import java.awt.event.MouseEvent; 
import java.awt.event.KeyEvent; 
import java.awt.event.FocusEvent; 
import java.awt.Image; 
import java.io.*; 
import java.net.*; 
import java.text.*; 
import java.util.*; 
import java.util.zip.*; 
import java.util.regex.*; 

public class HandyMIENAI extends PApplet {



/*
  MultiMarker class function test program
 
 */




PFont font=createFont("FFScala", 32);
Capture cam;
MultiMarker nya;


int bewegung = 10;
int zuwachs = 5;
boolean zudick = false;
int fort = 12;
int senoranzahl =6;

boolean marker = false;

/// Elemente erzeugen //////////

schweif myschweif;
kugel mykugel;
theoktu myoktu;


senor[] mysenor = new senor[senoranzahl];

senor2 startsenor1;
senor2 startsenor2;

radio myradio;

public void setup() {
  size(640, 480, P3D);



  colorMode(RGB, 100);
  cam=new Capture(this, width, height);
  nya=new MultiMarker(this, width, height, "camera_para.dat", new NyAR4PsgConfig(NyAR4PsgConfig.CS_RIGHT_HAND, NyAR4PsgConfig.TM_NYARTK));
  // nya.setARClipping(100, 1000);
  nya.setConfidenceThreshold(0.6f);
  nya.addARMarker("patt.hiro", 80);
  nya.addARMarker("patt.kanji", 80);
  nya.addNyIdMarker(31, 80);

  myschweif = new schweif();
  myoktu = new theoktu();

  for (int i = 0; i <senoranzahl; i++) {
    mysenor[i] = new senor();
  }

  startsenor1 = new senor2();
  startsenor2 = new senor2();



  mykugel = new kugel();
  myradio = new radio();


  println(nya.VERSION);


}

public void draw() {

  int c=0;
  c++;
  if (cam.available() !=true) {
    return;
  }
  background(255);
  cam.read();

  nya.drawBackground(cam);
  nya.detect(cam);
  if (nya.isExistMarker(0)) {
    marker = true;
    nya.beginTransform(0);
    {
      drawBox(255, 0, 0);
      drawMarkerXYPos(0);
    }
    nya.endTransform();  
    drawMarkerPatt(0);
    drawVertex(0);

    PVector p=nya.marker2ScreenCoordSystem(0, 0, 0, 0);
    noFill();


    ///////// ALLE WESEN ERZEUGEN ////////////////////////////////////////

    if (marker==true) {     
      mykugel.drawkugel(p.x, p.y );


      for (int i = 0; i <senoranzahl; i++) {

        mysenor[i].drawsenor(p.x, p.y, marker);
      }

      startsenor1.drawsenor2(p.x, p.y, marker);
      startsenor2.drawsenor2(p.x, p.y, marker);
      myoktu.drawtheoktu(p.x, p.y);
//      myradio.moveradio();
//      myradio.drawradio(p.x, p.y);
    }
    myschweif.dragSegment(0, p.x, p.y);
    for (int i=0; i<myschweif.x.length-1; i++) {
      myschweif.dragSegment(i+1, myschweif.x[i], myschweif.y[i]);
    }

    bewegung = PApplet.parseInt(bewegung +random(-5, 5));
  }
}


////// FUNKTION 3D BOX /////////////////////////

public void drawBox(int ir, int ig, int ib)
{
  pushMatrix();
  drawgrid();


  fill(ir, ig, ib);
  stroke(255, 200, 0, 11);
  translate(0, 0, 5+fort);
  //box(40);
  noStroke();
  lights();

  sphere(10);
  noFill();
  translate(40, 40, 40);
  rect(-40, -40, 80, 80); 
  fort = fort + 10;
  popMatrix();
}


public void drawMarkerPatt(int id)
{

  /// VORSCHAU BILD BAUEN ////

//  rect(20, 20, 120, 120);
//  pushMatrix();
//
//  fill(255, 225, 225 );
//  noStroke();
//
//
//  translate(20, 20, 0);
//  PImage p=nya.pickupMarkerImage(id, 
//  40, 40, 
//  -40, 40, 
//  -40, -40, 
//  40, -40, 
//  100, 100);

//  image(p, id*100, 0); //Anzeigebild zum pr\u00fcfen
 // popMatrix();
}

//\u3053\u306e\u95a2\u6570\u306f\u3001\u30de\u30fc\u30ab\u5e73\u9762\u4e0a\u306e\u70b9\u3092\u63cf\u753b\u3057\u307e\u3059\u3002
public void drawMarkerXYPos(int id)
{
  pushMatrix();
  PVector pos=nya.screen2MarkerCoordSystem(id, mouseX, mouseY);
  translate(pos.x, pos.y, 0);
  noFill();
  stroke(0, 0, 100);
  //  ellipse(0, 0, 20-c%20, 20-c%20);
  popMatrix();
}


public void drawVertex(int id)
{
  PVector[] i_v=nya.getMarkerVertex2D(id);
  textFont(font, 10.0f);
  stroke(100, 0, 0);
  for (int i=0;i<4;i++) {
    fill(100, 0, 0);
    //    ellipse(i_v[i].x, i_v[i].y, 6, 6);
    //    fill(0, 0, 0);
    //    text("("+i_v[i].x+","+i_v[i].y+")", i_v[i].x, i_v[i].y);
  }
}


public void drawgrid()
{
}

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
  float richtung; // bestimmt,ob die Kugel vorw\u00e4rts oder r\u00fcckwerts fliegt


  kugel() {

    while (richtung ==0) {   
      richtung = round(random(-1, 1));
    }
    //  richtung = 1;       // zufall,ob sie nach vorne oder hinten wegschwebt (round(random(-1, 1)))
    zaehler = 1;                                     // stellt sicher, dass die Kugel erst losfliegt, wenn sie entstanden ist und nicht vorher
  }

  public void drawkugel(float xPos, float yPos) {
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

    translate(xPos + zaehler*richtung, yPos-zaehler-0.5f*richtung, 0+zaehler*richtung);                      //// Kugel schwebt von Markerkarte weg (10*zaehler/2.5*richtung)
    changeSca = map(sin(count*0.015f), -1, 1, 1, 1.5f);

    //    rot.x = sin(frameCount*freqMulRot.x*2) * TWO_PI;
    //    rot.y = sin(frameCount*freqMulRot.y*2) * TWO_PI;
    //    rot.z = sin(frameCount*freqMulRot.z*2) * TWO_PI;
    //
    pos.x += sin(frameCount*freqMulPos.x );
    pos.y += sin(frameCount*freqMulPos.y);
    pos.z += cos(frameCount*freqMulPos.z);

    rotateX(count*0.011f);
    rotateX(count*0.012f);
    rotateZ(count*0.013f); 

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







  public void moveradio() {
    pVel = new PVector( random(-1, 1), random(-1, 1), random(-1, 1) );
    rVel = new PVector( random(-0.01f, 0.01f), random(-0.01f, 0.01f), random(-0.01f, 0.01f) );
    num = round(random(20, 100));
    spikes = ceil(random(3, 12));
    freq = random(0.02f, 0.06f);
    rad = random(30, 60);
    rFact = random(0.2f, 0.4f);
    energy = 100.0f;
    power = 0.02f;
    pos = new PVector();
    projectedPos = new PVector();
    rot = new PVector();
    sca = new PVector(1, 1, 1);
    pos= new PVector (0, 0, 0);
    pos.add(pVel);  
    rot.add(rVel);  
    //applyTransforms();
  }

  public void drawradio(float xPos, float yPos) {  
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
      float len = (sin(f + a * j)) * 0.02f;
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

class schweif {

  float xPos;
  float yPos;
  float[] x = new float[20];
  float[] y = new float[20];
  float segLength = 8;
  schweif() {
  }

  public void dragSegment(int i, float xin, float yin) {
    float dx = xin - x[i];
    float dy = yin - y[i];
    float angle = atan2(dy, dx);  
    x[i] = xin - cos(angle) * segLength;
    y[i] = yin - sin(angle) * segLength;
    segment(x[i], y[i], angle);
  }

  public void segment(float x, float y, float a) {
    pushMatrix();

    xPos =x;
    yPos = y;

    translate(xPos, yPos, 0);
    rotate(a);
    stroke(255, 225, 225, 22);

    strokeWeight(3);

    line(0, 0, segLength, 0);
    strokeWeight(1);
    popMatrix();
  }
}

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
  float richtung = 0; // bstimmt,ob die Kugel vorw\u00e4rts oder r\u00fcckwerts fliegt
  int verschiebung;

  int x; // stellt sicher, dass die Kugel erst erscheint und wegfliegt, wenn auc hein Marker in die Cam gehalten wird
  int trans;
  senor() {

    faktor = random(0.3f, 0.8f);
    verschiebung = round(random(-width/2, width/2)); // sorgt f\u00fcr eeine Verteilung der Senore 
    x=1;  
    trans = 150;

    // While Schleife stellt sicher, dass richtung entweder -1 oder +1 ist

    while (richtung ==0) {   
      richtung = round(random(-1, 1));
    }
  }

  public void drawsenor(float xPos, float yPos, boolean markerda) {

    yPos = yPos;
    xPos = xPos;


    // nur wenn ein Marker da ist, soll der Senor losfliegen
    if (markerda==true) {
      x++;

      pushMatrix();

      freqMulRot = new PVector();
      freqMulRot.x = random(-0.005f, 1.005f);
      freqMulRot.y = random(-0.01f, 1.01f);
      freqMulRot.z = random(-0.015f, 1.015f);


      /// KUGEL Bewegung festlegen /////////////////////////////////////

      count = frameCount;

      //  translate(xPos + count/2.5+verschiebung, yPos+count  +0.5, 0+richtung*count);                      //// Kugel schwebt von Markerkarte weg
      translate(xPos+count *faktor* richtung, yPos+verschiebung+count*richtung, 0);
      changeSca = map(sin(count*0.015f), -1, 1, 1, 1.5f);


      rotateX(count*0.011f);
      rotateX(count*0.012f);
      rotateZ(count*0.013f); 

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
        trans = 100-x*1;         // stellt scher, dass die Transparents einen weichen \u00dcbergang hat
      } 
      else { 
        trans=10;
      }

      stroke(255, 0, 255, trans);
      ellipse (0, 0, changeWH, changeWH);
      ellipse (0, 0, changeWH/2, changeWH/2);

      changeWH = exp(sqrt(count*0.25f));
      popMatrix();
    }
  }
}

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
  int richtung; // bstimmt,ob die Kugel vorw\u00e4rts oder r\u00fcckwerts fliegt
  int x; // stellt sicher, dass die Kugel erst erscheint und wegfliegt, wenn auc hein Marker in die Cam gehalten wird
  int trans;
  senor2() {
    x=1;  
    trans = 150;
    richtung = round(random(-1, 1));
  }

  public void drawsenor2(float xPos, float yPos, boolean markerda) {

    yPos = yPos;
    xPos = xPos;


    // nur wenn ein Marker da ist, soll der Senor losfliegen
    if (markerda==true) {
      x++;

      pushMatrix();

      freqMulRot = new PVector();
      freqMulRot.x = random(-0.005f, 1.005f);
      freqMulRot.y = random(-0.01f, 1.01f);
      freqMulRot.z = random(-0.015f, 1.015f);


      /// KUGEL Bewegung festlegen /////////////////////////////////////

      count = frameCount;

      translate(xPos - count/10, yPos+count * +0.5f, 10*count/2.5f*richtung);                      //// Kugel schwebt von Markerkarte weg
      changeSca = map(sin(count*0.0015f), -1, 1, 1, 1.5f);


      rotateX(count*0.011f);
      rotateX(count*0.012f);
      rotateZ(count*0.013f); 

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
        trans = 100-x*1;         // stellt scher, dass die Transparents einen weichen \u00dcbergang hat
      } 
      else { 
        trans=10;
      }

      stroke(255, 0, 255, trans);
      ellipse (0, 0, changeWH, changeWH);
      ellipse (0, 0, changeWH/2, changeWH/2);

      changeWH = exp(sqrt(count*0.25f));
      println("x=="+x);
      popMatrix();
    }
  }
}


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
  float shrink; // l\u00e4sst den Oktu langsam schrumpfen
  long lastTime = 0;

  public void okktu() {
  }

  public void draw() {
    lastTime = millis();
  }

  public void drawtheoktu(float xPos, float yPos) {

    PVector markerPos = new PVector(xPos, yPos);
    count = frameCount;
    pushMatrix();


    /// Handy Anfallen == Der Oktu schwimmt langsam ins Bild und bleibt dann beim Handy kleben /////


    PVector oktuPos = new PVector(xPos +300 - count, yPos +300 -count);


    /////////////////////////////////////////////////////////////////////
    // Sicher Stelle, dass er bei Stillstand = true wirklich stehen bleibt /////
    // Leider ist die doppelte Definition von d n\u00f6tig, weil er sonst irgendwie
    // nicht stehenbleiben will
    /////////////////////////////////////////////////////////////////////

    if (stillstand == false) {
      d = PVector.dist(oktuPos, markerPos);
    }

    if (d>10 & stillstand==false) {
      translate(xPos +300 - count, yPos +300 -count, 0.0f);
      d = PVector.dist(oktuPos, markerPos); 
      //    println("d=___"+d);
    }
    if (d<10) {
      stillstand = true;
      d=2;                                         // Sicherheitshalber wird d immer auf 2 gesetzt
      translate(xPos, yPos, 0.0f);
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
    scale(0.15f);
    //TESTA
    fill(100, 33);
    stroke(100, 90);
    sphere(30);


    //ANTENNE
    stroke(100, 90);

    //float ly = sin(frameCount * 0.01) * 30;
    //float lz = -sin(frameCount * 0.01) * 30;
    float ly = random(l/2, sin(count * 0.01f) * l);
    float lz = random(l, l + (l/1.5f));


    line(0, 0, 0, -l*2, 10, 30);
    line(0, 0, 0, -l*2, 10, -30);

    //PINNE  
    rotateY(-(numPinne-1) * distPinne / 2);
    //rotateY(-(numPinne-1) * distPinne / (distPinne - TWO_PI));
    for (int k=0; k<numPinne; k++) {

      float s = (cos(TWO_PI / (numPinne-1) * k));
      s = map(s, 1, -1, 0.9f, 1);
      // println(k + "   " + s);
      pushMatrix();
      scale(s);


      for (int j=0; j<numTentacoli; j++) {
        pushMatrix();

        float a = (noise(count*noiseVel.x + j+k+1)-0.4f)*0.782f; 
        float b = (noise(count*noiseVel.y + j+k+1)-0.5f)*0.582f; 
        float c = (noise(count*noiseVel.z + j+k+1)-0.6f)*0.682f;


        // Zappeln der Tentakel

        for (int i=0; i<numSegmenti; i++) {
          rotateZ(a);
          rotateY(b);
          rotateX(c);
          translate(l*0.9f, 0, 0);
          scale(0.85f, 0.85f, 0.85f);
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
    distPinne = random(0.2f, 0.5f);
    l = random(20, 40);
    sm1 = random(-0.005f, 0.005f);
    sm2 = random(-0.005f, 0.005f);    


    pVel = new PVector(1, -1, -1);
    rVel = new PVector(1, -1, -1);
    rVel.mult(random(0.01f, 0.03f));
    noiseVel = new PVector(1, -1, -1);
    noiseVel.mult(random(0.005f, 0.03f));
    float s = random(0.5f, 1);
    // sca.set(s, s, s);

    popMatrix();
  } 


  public void staytheoktu() {

    //   this.drawtheoktu(100,100);
  }

  //  }
}

  static public void main(String args[]) {
    PApplet.main(new String[] { "--bgcolor=#FFFFFF", "HandyMIENAI" });
  }
}
