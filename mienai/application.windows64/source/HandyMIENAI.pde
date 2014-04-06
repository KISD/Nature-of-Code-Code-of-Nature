import netscape.javascript.*;

/*
  MultiMarker class function test program
 
 */
import processing.video.*;
import jp.nyatla.nyar4psg.*;
import processing.opengl.*;

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

void setup() {
  size(640, 480, P3D);



  colorMode(RGB, 100);
  cam=new Capture(this, width, height);
  nya=new MultiMarker(this, width, height, "camera_para.dat", new NyAR4PsgConfig(NyAR4PsgConfig.CS_RIGHT_HAND, NyAR4PsgConfig.TM_NYARTK));
  // nya.setARClipping(100, 1000);
  nya.setConfidenceThreshold(0.6);
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

void draw() {

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

    bewegung = int(bewegung +random(-5, 5));
  }
}


////// FUNKTION 3D BOX /////////////////////////

void drawBox(int ir, int ig, int ib)
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


void drawMarkerPatt(int id)
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

//  image(p, id*100, 0); //Anzeigebild zum prüfen
 // popMatrix();
}

//この関数は、マーカ平面上の点を描画します。
void drawMarkerXYPos(int id)
{
  pushMatrix();
  PVector pos=nya.screen2MarkerCoordSystem(id, mouseX, mouseY);
  translate(pos.x, pos.y, 0);
  noFill();
  stroke(0, 0, 100);
  //  ellipse(0, 0, 20-c%20, 20-c%20);
  popMatrix();
}


void drawVertex(int id)
{
  PVector[] i_v=nya.getMarkerVertex2D(id);
  textFont(font, 10.0);
  stroke(100, 0, 0);
  for (int i=0;i<4;i++) {
    fill(100, 0, 0);
    //    ellipse(i_v[i].x, i_v[i].y, 6, 6);
    //    fill(0, 0, 0);
    //    text("("+i_v[i].x+","+i_v[i].y+")", i_v[i].x, i_v[i].y);
  }
}


void drawgrid()
{
}

