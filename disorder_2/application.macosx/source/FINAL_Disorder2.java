import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import controlP5.*; 
import geomerative.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class FINAL_Disorder2 extends PApplet {


ControlP5 cp5;


public int myColor = color(200,255,10);
public int Farbe = 30;

String BspText = "\u00bbMan funktioniert letzten Endes";
String BspText2 = "f\u00fcr das Programm\u00ab";
String BspText3 = "\u00bbDas Kernproblem der Programmierung";
String BspText4 = "ist die Quantit\u00e4t\u00ab";

RShape shp;
RShape shp2;
RShape shp3;
RShape shp4;
RShape polyshp;
RShape polyshp2;
RShape polyshp3;
RShape polyshp4;
float Poly = 0;

public void setup() {
  size (1170,800);
  noStroke();
  smooth();
  background(360);
  
  //Regler  
  cp5 = new ControlP5(this);
  
      cp5.addSlider("Stroke")    //regler name
     .setBroadcast(false)    // ?
     .setRange(0, 80)       // Ausschlag Gr\u00f6\u00dfe
     .setPosition(580, 620)   // Position
     .setSize(10,50)       // Gr\u00f6\u00dfe
     .setBroadcast(true)     //?
     .setValue(1)          // start Ausschlag bei 100 h\u00e4lfte weil gr\u00f6\u00dfe 200 gesamt
     .setColorForeground(color(0, 0, 0))
     .setColorBackground(color(150, 150, 150))
     .setColorActive(color(255, 0, 0))
     ;
     
      cp5.addSlider("Farbe")    //regler name
     .setBroadcast(false)    // ?
     .setRange(0, 200)       // Ausschlag Gr\u00f6\u00dfe
     .setPosition(530, 620)   // Position
     .setSize(10,50)       // Gr\u00f6\u00dfe
     .setBroadcast(true)     //?
     .setValue(100)          // start Ausschlag bei 100 h\u00e4lfte weil gr\u00f6\u00dfe 200 gesamt
     .setColorForeground(color(0, 0, 0))
     .setColorBackground(color(150, 150, 150))
     .setColorActive(color(255, 0, 0))
     ;
     
     cp5.addSlider("Poly")    //regler name
     .setBroadcast(false)    // ?
     .setRange(0, 60)       // Ausschlag Gr\u00f6\u00dfe
     .setPosition(480, 620)   // Position
     .setSize(10, 50)       // Gr\u00f6\u00dfe
     .setBroadcast(true)     //?
     .setValue(60)          // start Ausschlag bei 100 h\u00e4lfte weil gr\u00f6\u00dfe 200 gesamt
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
  shp.scale(0.75f);
  shp2.scale(0.75f);
  shp3.scale(0.75f);
  shp4.scale(0.75f);
}

public void draw() {
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

public void poly_(){
pushMatrix();
  RG.setPolygonizer(RG.UNIFORMLENGTH);
  //float s2 = cp5.getController("Farbe").getValue();
  //textSize(s2);
  RG.setPolygonizerLength(Poly);
  polyshp = RG.polygonize(shp);
  translate(531.25f,150); //punkt an den er den text setzt
  //textSize(14);
  RG.shape(polyshp);
popMatrix();
}

public void poly2_(){
pushMatrix();
  RG.setPolygonizer(RG.UNIFORMLENGTH);
  RG.setPolygonizerLength(Poly);
  polyshp2 = RG.polygonize(shp2);
  translate(531.25f,220); //Mittelpunkt, an den Text gesetzt wird
  RG.shape(polyshp2);
  fill(360-Farbe,100,100);
popMatrix();
}

public void poly3_(){
pushMatrix();
  RG.setPolygonizer(RG.UNIFORMLENGTH);
  RG.setPolygonizerLength(Poly);
  polyshp3 = RG.polygonize(shp3);
  translate(531.25f,310); //Mittelpunkt, an den Text gesetzt wird
  RG.shape(polyshp3);
  fill(360-Farbe,100,100);
popMatrix();
}

public void poly4_(){
pushMatrix();
  RG.setPolygonizer(RG.UNIFORMLENGTH);
  RG.setPolygonizerLength(Poly);
  polyshp4 = RG.polygonize(shp4);
  translate(531.25f,380); //Mittelpunkt, an den Text gesetzt wird
  RG.shape(polyshp4);
  fill(360-Farbe,100,100);
popMatrix();
}

public void kontur(){
  float k1 = cp5.getController("Stroke").getValue();
  strokeWeight(k1);
}

public void linie(){
pushMatrix();
  scale(2.5f);
  line(120,30,305,30);
  line(120,195,305,195);
popMatrix();
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--full-screen", "--bgcolor=#666666", "--stop-color=#cccccc", "FINAL_Disorder2" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
