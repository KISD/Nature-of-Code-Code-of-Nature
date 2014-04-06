import controlP5.*;
ControlP5 cp5;
import geomerative.*;

public int myColor = color(200,255,10);
public int Farbe = 30;

String BspText = "»Man funktioniert letzten Endes";
String BspText2 = "für das Programm«";
String BspText3 = "»Das Kernproblem der Programmierung";
String BspText4 = "ist die Quantität«";

RShape shp;
RShape shp2;
RShape shp3;
RShape shp4;
RShape polyshp;
RShape polyshp2;
RShape polyshp3;
RShape polyshp4;
float Poly = 0;

void setup() {
  size (1170,800);
  noStroke();
  smooth();
  background(360);
  
  //Regler  
  cp5 = new ControlP5(this);
  
      cp5.addSlider("Stroke")    //regler name
     .setBroadcast(false)    // ?
     .setRange(0, 80)       // Ausschlag Größe
     .setPosition(580, 620)   // Position
     .setSize(10,50)       // Größe
     .setBroadcast(true)     //?
     .setValue(1)          // start Ausschlag bei 100 hälfte weil größe 200 gesamt
     .setColorForeground(color(0, 0, 0))
     .setColorBackground(color(150, 150, 150))
     .setColorActive(color(255, 0, 0))
     ;
     
      cp5.addSlider("Farbe")    //regler name
     .setBroadcast(false)    // ?
     .setRange(0, 200)       // Ausschlag Größe
     .setPosition(530, 620)   // Position
     .setSize(10,50)       // Größe
     .setBroadcast(true)     //?
     .setValue(100)          // start Ausschlag bei 100 hälfte weil größe 200 gesamt
     .setColorForeground(color(0, 0, 0))
     .setColorBackground(color(150, 150, 150))
     .setColorActive(color(255, 0, 0))
     ;
     
     cp5.addSlider("Poly")    //regler name
     .setBroadcast(false)    // ?
     .setRange(0, 60)       // Ausschlag Größe
     .setPosition(480, 620)   // Position
     .setSize(10, 50)       // Größe
     .setBroadcast(true)     //?
     .setValue(60)          // start Ausschlag bei 100 hälfte weil größe 200 gesamt
     .setColorForeground(color(0, 0, 0))
     .setColorBackground(color(150, 150, 150))
     .setColorActive(color(255, 0, 0))     
     ;
     
  RG.init(this);
  shp = RG.getText(BspText, "aleo-light-webfont.ttf", width*8/70, LEFT); //width*2/200
  shp2 = RG.getText(BspText2, "aleo-light-webfont.ttf", width*8/70, LEFT);
  shp3 = RG.getText(BspText3, "aleo-light-webfont.ttf", width*8/70, LEFT);
  shp4 = RG.getText(BspText4, "aleo-light-webfont.ttf", width*8/70, LEFT);

  shp = RG.centerIn(shp, g, 60);
  shp2 = RG.centerIn(shp2, g, 60);
  shp3 = RG.centerIn(shp3, g, 60);
  shp4 = RG.centerIn(shp4, g, 60);
  shp.scale(0.75);
  shp2.scale(0.75);
  shp3.scale(0.75);
  shp4.scale(0.75);
}

void draw() {
  background(360);
  poly_();
  poly2_();
  poly3_();
  poly4_();
  kontur();
  linie();
  colorMode(HSB,360,100,100);
  stroke(360-Farbe,100,100); 
}  

void poly_(){
pushMatrix();
  RG.setPolygonizer(RG.UNIFORMLENGTH);
  //float s2 = cp5.getController("Farbe").getValue();
  //textSize(s2);
  RG.setPolygonizerLength(Poly);
  polyshp = RG.polygonize(shp);
  translate(531.25,150); //punkt an den er den text setzt
  //textSize(14);
  RG.shape(polyshp);
popMatrix();
}

void poly2_(){
pushMatrix();
  RG.setPolygonizer(RG.UNIFORMLENGTH);
  RG.setPolygonizerLength(Poly);
  polyshp2 = RG.polygonize(shp2);
  translate(531.25,220); //Mittelpunkt, an den Text gesetzt wird
  RG.shape(polyshp2);
  fill(360-Farbe,100,100);
popMatrix();
}

void poly3_(){
pushMatrix();
  RG.setPolygonizer(RG.UNIFORMLENGTH);
  RG.setPolygonizerLength(Poly);
  polyshp3 = RG.polygonize(shp3);
  translate(531.25,310); //Mittelpunkt, an den Text gesetzt wird
  RG.shape(polyshp3);
  fill(360-Farbe,100,100);
popMatrix();
}

void poly4_(){
pushMatrix();
  RG.setPolygonizer(RG.UNIFORMLENGTH);
  RG.setPolygonizerLength(Poly);
  polyshp4 = RG.polygonize(shp4);
  translate(531.25,380); //Mittelpunkt, an den Text gesetzt wird
  RG.shape(polyshp4);
  fill(360-Farbe,100,100);
popMatrix();
}

void kontur(){
  float k1 = cp5.getController("Stroke").getValue();
  strokeWeight(k1);
}

void linie(){
pushMatrix();
  scale(2.5);
  line(120,30,305,30);
  line(120,195,305,195);
popMatrix();
}
