import controlP5.*;
ControlP5 cp5;
import geomerative.*;

RShape shp;
RShape polyshp;
int Farbe = 0;

void setup(){
  size(600, 600);
  smooth();
  cp5 = new ControlP5(this);
  
      cp5.addSlider("Farbe")    //regler name
     .setBroadcast(false)    // ?
     .setRange(0, 200)       // Ausschlag Größe
     .setPosition(200, 250)   // Position
     .setSize(25, 100)       // Größe
     .setBroadcast(true)     //?
     .setValue(100)          // start Ausschlag bei 100 hälfte weil größe 200 gesamt
     ;
     

  // VERY IMPORTANT: Allways initialize the library before using it
  RG.init(this);

  shp = RG.loadShape("test.svg");
  shp = RG.centerIn(shp, g, 100);
}

void draw(){
  background(255);
  pushMatrix();
  // We decided the separation between the polygon points dependent of the mouseX
//  float pointSeparation = map(constrain(mouseX, 100, width-100), 100, width-100, 5, 200);
  
  
  
  // We create the polygonized version
  RG.setPolygonizer(RG.UNIFORMLENGTH);
  
//   float s2 = cp5.getController("Farbe").getValue();
//  textSize(s2);
  RG.setPolygonizerLength(pointSeparation);

  polyshp = RG.polygonize(shp);

  // We move ourselves to the mouse position
  translate(300, 100); //punkt an den er den text setzt

  // We draw the polygonized group with the SVG styles
  RG.shape(polyshp);
  popMatrix();
}
