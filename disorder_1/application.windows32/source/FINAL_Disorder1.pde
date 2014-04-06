import controlP5.*;
ControlP5 cp5;

public int myColor = color(200,255,10);
public int Farbe = 30;
float Laenge=0;
PVector actual;

void setup() {
  size (1170,800);
  noStroke();
  smooth();
  background(255);
  
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
     
     cp5.addSlider("Laenge")    //regler name
     .setBroadcast(false)    // ?
     .setRange(0, 60)       // Ausschlag Größe
     .setPosition(480, 620)   // Position
     .setSize(10, 50)       // Größe
     .setBroadcast(true)     //?
     .setValue(0)          // start Ausschlag bei 100 hälfte weil größe 200 gesamt
     .setColorForeground(color(0, 0, 0))
     .setColorBackground(color(150, 150, 150))
     .setColorActive(color(255, 0, 0))     
     ;
}

void draw() {
  hg();
  d();
  i();
  s();
  o();
  r();
  d2();
  e();
  r2();
  s2();
  kontur();
  linie();
  
  s_2();
  t_2();
  r_2();
  u_2();
  c_2();
  t2_2();
  u2_2();
  r2_2();
  e_2();
  s2_2();
  colorMode(HSB,360,100,100);
  stroke(360-Farbe,100,100); 
}  

void hg(){
  if (mousePressed){
  background(360);
  loop();}
}

void kontur(){
  float k1 = cp5.getController("Stroke").getValue();
  strokeWeight(k1);
}

void linie(){
  line(120,30,305,30);
  line(120,195,305,195);
}

void d(){
pushMatrix();
 scale(2.5);
 
pushMatrix();
  translate(77.5,70);
  rotate(radians(80));
  actual=new PVector(cos(map(mouseX,0,width,0,2*PI))*100,sin(map(mouseX,0,width,0,2*PI))*100);
  actual.normalize();
  actual.mult(16+Laenge);
  line(0,0,actual.x,actual.y);
  line(0,0,-actual.x, -actual.y);
popMatrix();
  
pushMatrix();
  translate(65,80);
  rotate(radians(130));
  actual=new PVector(cos(map(mouseX,0,width,0,2*PI))*100,sin(map(mouseX,0,width,0,2*PI))*100);
  actual.normalize();
  actual.mult(20+Laenge);
  line(0,0,actual.x,actual.y);
  line(0,0,-actual.x, -actual.y);
popMatrix();

pushMatrix();
  translate(77.5,90);
  rotate(radians(180));
  actual=new PVector(cos(map(mouseX,0,width,0,2*PI))*100,sin(map(mouseX,0,width,0,2*PI))*100);
  actual.normalize();
  actual.mult(16+Laenge);
  line(0,0,actual.x,actual.y);
  line(0,0,-actual.x, -actual.y);
popMatrix();

 //actual=new PVector(cos(map(mouseX,0,width,0,2*PI))*100,sin(map(mouseX,0,width,0,2*PI))*100);
 //line(20,80,actual.x,actual.y);
 
 /**PVector mouse = new PVector(mouseX,mouseY);
  PVector center = new PVector(width/2,height/2);
  mouse.sub(center);
  mouse.normalize();
  mouse.mult(50);
  translate(width/2,height/2);**/
}

void i(){
  /*PVector b1= new PVector(96.25,100);
  PVector b2= new PVector(96.25,60);
  line(b1.x,b1.y,b2.x,b2.y);*/
  
pushMatrix();
  translate(105,80);
  rotate(radians(130));
  actual=new PVector(cos(map(mouseX,0,width,0,2*PI))*100,sin(map(mouseX,0,width,0,2*PI))*100);
  actual.normalize();
  actual.mult(20+Laenge);
  line(0,0,actual.x,actual.y);
  line(0,0,-actual.x, -actual.y);
popMatrix();
}  

void s(){
  /*PVector c1= new PVector(111.25,100);
  PVector c2= new PVector(111.25,80);
  PVector c3= new PVector(111.25,60);
  PVector c4= new PVector(136.25,60);
  PVector c5= new PVector(136.25,80);
  PVector c6= new PVector(136.25,100);
  line(c1.x,c1.y,c6.x,c6.y);
  line(c6.x,c6.y,c5.x,c5.y);
  line(c5.x,c5.y,c2.x,c2.y);
  line(c2.x,c2.y,c3.x,c3.y);
  line(c4.x,c4.y,c3.x,c3.y);*/
  
pushMatrix();
  translate(132.5,100);
  rotate(radians(40));
  actual=new PVector(cos(map(mouseX,0,width,0,2*PI))*100,sin(map(mouseX,0,width,0,2*PI))*100);
  actual.normalize();
  actual.mult(12+Laenge);
  line(0,0,actual.x,actual.y);
  line(0,0,-actual.x, -actual.y);
popMatrix();

pushMatrix();
  translate(145,90);
  rotate(radians(130));
  actual=new PVector(cos(map(mouseX,0,width,0,2*PI))*100,sin(map(mouseX,0,width,0,2*PI))*100);
  actual.normalize();
  actual.mult(10+Laenge);
  line(0,0,actual.x,actual.y);
  line(0,0,-actual.x, -actual.y);
popMatrix();

pushMatrix();
  translate(132.5,80);
  rotate(radians(40));
  actual=new PVector(cos(map(mouseX,0,width,0,2*PI))*100,sin(map(mouseX,0,width,0,2*PI))*100);
  actual.normalize();
  actual.mult(12+Laenge);
  line(0,0,actual.x,actual.y);
  line(0,0,-actual.x, -actual.y);
popMatrix();

pushMatrix();
  translate(120,70);
  rotate(radians(130));
  actual=new PVector(cos(map(mouseX,0,width,0,2*PI))*100,sin(map(mouseX,0,width,0,2*PI))*100);
  actual.normalize();
  actual.mult(10+Laenge);
  line(0,0,actual.x,actual.y);
  line(0,0,-actual.x, -actual.y);
popMatrix();

pushMatrix();
  translate(132.5,60);
  rotate(radians(40));
  actual=new PVector(cos(map(mouseX,0,width,0,2*PI))*100,sin(map(mouseX,0,width,0,2*PI))*100);
  actual.normalize();
  actual.mult(12+Laenge);
  line(0,0,actual.x,actual.y);
  line(0,0,-actual.x, -actual.y);
popMatrix();
}

void o(){
  /*PVector c1= new PVector(151.25,100);
  PVector c2= new PVector(151.25,60);
  PVector c3= new PVector(176.25,60);
  PVector c4= new PVector(176.25,100);
  line(c1.x,c1.y,c2.x,c2.y);
  line(c2.x,c2.y,c3.x,c3.y);
  line(c3.x,c3.y,c4.x,c4.y);
  line(c4.x,c4.y,c1.x,c1.y);*/
  
pushMatrix();
  translate(160,80);
  rotate(radians(130));
  actual=new PVector(cos(map(mouseX,0,width,0,2*PI))*100,sin(map(mouseX,0,width,0,2*PI))*100);
  actual.normalize();
  actual.mult(20+Laenge);
  line(0,0,actual.x,actual.y);
  line(0,0,-actual.x, -actual.y);
popMatrix();

pushMatrix();
  translate(185,80);
  rotate(radians(130));
  actual=new PVector(cos(map(mouseX,0,width,0,2*PI))*100,sin(map(mouseX,0,width,0,2*PI))*100);
  actual.normalize();
  actual.mult(20+Laenge);
  line(0,0,actual.x,actual.y);
  line(0,0,-actual.x, -actual.y);
popMatrix();
  
pushMatrix();
  translate(172.5,60);
  rotate(radians(40));
  actual=new PVector(cos(map(mouseX,0,width,0,2*PI))*100,sin(map(mouseX,0,width,0,2*PI))*100);
  actual.normalize();
  actual.mult(12+Laenge);
  line(0,0,actual.x,actual.y);
  line(0,0,-actual.x, -actual.y);
popMatrix();

pushMatrix();
  translate(172.5,100);
  rotate(radians(40));
  actual=new PVector(cos(map(mouseX,0,width,0,2*PI))*100,sin(map(mouseX,0,width,0,2*PI))*100);
  actual.normalize();
  actual.mult(12+Laenge);
  line(0,0,actual.x,actual.y);
  line(0,0,-actual.x, -actual.y);
popMatrix();
}

void r(){
  /*PVector c1= new PVector(191.25,100);
  PVector c2= new PVector(191.25,80);
  PVector c3= new PVector(191.25,60);
  PVector c4= new PVector(216.25,60);
  PVector c5= new PVector(216.25,80);
  PVector c6= new PVector(216.25,100);
  line(c1.x,c1.y,c3.x,c3.y);
  line(c3.x,c3.y,c4.x,c4.y);
  line(c4.x,c4.y,c5.x,c5.y);
  line(c2.x,c2.y,c5.x,c5.y);
  line(c2.x,c2.y,c6.x,c6.y);*/
  
pushMatrix();
  translate(200,80);
  rotate(radians(130));
  actual=new PVector(cos(map(mouseX,0,width,0,2*PI))*100,sin(map(mouseX,0,width,0,2*PI))*100);
  actual.normalize();
  actual.mult(20+Laenge);
  line(0,0,actual.x,actual.y);
  line(0,0,-actual.x, -actual.y);
popMatrix();
  
pushMatrix();
  translate(212.5,60);
  rotate(radians(40));
  actual=new PVector(cos(map(mouseX,0,width,0,2*PI))*100,sin(map(mouseX,0,width,0,2*PI))*100);
  actual.normalize();
  actual.mult(12+Laenge);
  line(0,0,actual.x,actual.y);
  line(0,0,-actual.x, -actual.y);
popMatrix();

pushMatrix();
  translate(225,70);
  rotate(radians(130));
  actual=new PVector(cos(map(mouseX,0,width,0,2*PI))*100,sin(map(mouseX,0,width,0,2*PI))*100);
  actual.normalize();
  actual.mult(10+Laenge);
  line(0,0,actual.x,actual.y);
  line(0,0,-actual.x, -actual.y);
popMatrix();

pushMatrix();
  translate(212.5,80);
  rotate(radians(40));
  actual=new PVector(cos(map(mouseX,0,width,0,2*PI))*100,sin(map(mouseX,0,width,0,2*PI))*100);
  actual.normalize();
  actual.mult(12+Laenge);
  line(0,0,actual.x,actual.y);
  line(0,0,-actual.x, -actual.y);
popMatrix();

pushMatrix();
  translate(212.5,90);
  rotate(radians(80));
  actual=new PVector(cos(map(mouseX,0,width,0,2*PI))*100,sin(map(mouseX,0,width,0,2*PI))*100);
  actual.normalize();
  actual.mult(16+Laenge);
  line(0,0,actual.x,actual.y);
  line(0,0,-actual.x, -actual.y);
popMatrix();
}

void d2(){
  /*PVector a1= new PVector (231.25,100);
  PVector a2= new PVector (231.25,60);
  PVector a3= new PVector (256.25,80);
  line(a1.x,a1.y,a2.x,a2.y);
  line(a2.x,a2.y,a3.x,a3.y);
  line(a1.x,a1.y,a3.x,a3.y);*/
  
pushMatrix();
  translate(252.5,70);
  rotate(radians(80));
  actual=new PVector(cos(map(mouseX,0,width,0,2*PI))*100,sin(map(mouseX,0,width,0,2*PI))*100);
  actual.normalize();
  actual.mult(16+Laenge);
  line(0,0,actual.x,actual.y);
  line(0,0,-actual.x, -actual.y);
popMatrix();
  
pushMatrix();
  translate(240,80);
  rotate(radians(130));
  actual=new PVector(cos(map(mouseX,0,width,0,2*PI))*100,sin(map(mouseX,0,width,0,2*PI))*100);
  actual.normalize();
  actual.mult(20+Laenge);
  line(0,0,actual.x,actual.y);
  line(0,0,-actual.x, -actual.y);
popMatrix();

pushMatrix();
  translate(252.5,90);
  rotate(radians(180));
  actual=new PVector(cos(map(mouseX,0,width,0,2*PI))*100,sin(map(mouseX,0,width,0,2*PI))*100);
  actual.normalize();
  actual.mult(16+Laenge);
  line(0,0,actual.x,actual.y);
  line(0,0,-actual.x, -actual.y);
popMatrix();
}

void e(){
  /*PVector c1= new PVector(271.25,100);
  PVector c2= new PVector(271.25,80);
  PVector c3= new PVector(271.25,60);
  PVector c4= new PVector(296.25,60);
  PVector c5= new PVector(296.25,80);
  PVector c6= new PVector(296.25,100);
  line(c1.x,c1.y,c3.x,c3.y);
  line(c3.x,c3.y,c4.x,c4.y);
  line(c2.x,c2.y,c5.x,c5.y);
  line(c1.x,c1.y,c6.x,c6.y);*/
  
pushMatrix();
  translate(280,80);
  rotate(radians(130));
  actual=new PVector(cos(map(mouseX,0,width,0,2*PI))*100,sin(map(mouseX,0,width,0,2*PI))*100);
  actual.normalize();
  actual.mult(20+Laenge);
  line(0,0,actual.x,actual.y);
  line(0,0,-actual.x, -actual.y);
popMatrix();
  
pushMatrix();
  translate(292.5,60);
  rotate(radians(40));
  actual=new PVector(cos(map(mouseX,0,width,0,2*PI))*100,sin(map(mouseX,0,width,0,2*PI))*100);
  actual.normalize();
  actual.mult(12+Laenge);
  line(0,0,actual.x,actual.y);
  line(0,0,-actual.x, -actual.y);
popMatrix();
  
pushMatrix();
  translate(292.5,80);
  rotate(radians(40));
  actual=new PVector(cos(map(mouseX,0,width,0,2*PI))*100,sin(map(mouseX,0,width,0,2*PI))*100);
  actual.normalize();
  actual.mult(12+Laenge);
  line(0,0,actual.x,actual.y);
  line(0,0,-actual.x, -actual.y);
popMatrix();
  
pushMatrix();
  translate(292.5,100);
  rotate(radians(40));
  actual=new PVector(cos(map(mouseX,0,width,0,2*PI))*100,sin(map(mouseX,0,width,0,2*PI))*100);
  actual.normalize();
  actual.mult(12+Laenge);
  line(0,0,actual.x,actual.y);
  line(0,0,-actual.x, -actual.y);
popMatrix();
}

void r2(){
  /*PVector c1= new PVector(311.25,100);
  PVector c2= new PVector(311.25,80);
  PVector c3= new PVector(311.25,60);
  PVector c4= new PVector(336.25,60);
  PVector c5= new PVector(336.25,80);
  PVector c6= new PVector(336.25,100);
  line(c1.x,c1.y,c3.x,c3.y);
  line(c3.x,c3.y,c4.x,c4.y);
  line(c4.x,c4.y,c5.x,c5.y);
  line(c2.x,c2.y,c5.x,c5.y);
  line(c2.x,c2.y,c6.x,c6.y);*/
  
pushMatrix();
  translate(320,80);
  rotate(radians(130));
  actual=new PVector(cos(map(mouseX,0,width,0,2*PI))*100,sin(map(mouseX,0,width,0,2*PI))*100);
  actual.normalize();
  actual.mult(20+Laenge);
  line(0,0,actual.x,actual.y);
  line(0,0,-actual.x, -actual.y);
popMatrix();
  
pushMatrix();
  translate(332.5,60);
  rotate(radians(40));
  actual=new PVector(cos(map(mouseX,0,width,0,2*PI))*100,sin(map(mouseX,0,width,0,2*PI))*100);
  actual.normalize();
  actual.mult(12+Laenge);
  line(0,0,actual.x,actual.y);
  line(0,0,-actual.x, -actual.y);
popMatrix();

pushMatrix();
  translate(345,70);
  rotate(radians(130));
  actual=new PVector(cos(map(mouseX,0,width,0,2*PI))*100,sin(map(mouseX,0,width,0,2*PI))*100);
  actual.normalize();
  actual.mult(10+Laenge);
  line(0,0,actual.x,actual.y);
  line(0,0,-actual.x, -actual.y);
popMatrix();

pushMatrix();
  translate(332.5,80);
  rotate(radians(40));
  actual=new PVector(cos(map(mouseX,0,width,0,2*PI))*100,sin(map(mouseX,0,width,0,2*PI))*100);
  actual.normalize();
  actual.mult(12);
  line(0,0,actual.x,actual.y);
  line(0,0,-actual.x, -actual.y);
popMatrix();

pushMatrix();
  translate(332.5,90);
  rotate(radians(80));
  actual=new PVector(cos(map(mouseX,0,width,0,2*PI))*100,sin(map(mouseX,0,width,0,2*PI))*100);
  actual.normalize();
  actual.mult(16+Laenge);
  line(0,0,actual.x,actual.y);
  line(0,0,-actual.x, -actual.y);
popMatrix();
}

void s2(){
  /*PVector c1= new PVector(351.25,60);
  PVector c2= new PVector(351.25,70);
  PVector c3= new PVector(351.25,80);
  PVector c4= new PVector(351.25,100);
  PVector c5= new PVector(376.25,60);
  PVector c6= new PVector(376.25,70);
  PVector c7= new PVector(376.25,80);
  PVector c8= new PVector(376.25,100);
  line(c1.x,c1.y,c5.x,c5.y);
  line(c5.x,c5.y,c6.x,c6.y);
  line(c6.x,c6.y,c2.x,c2.y);
  line(c2.x,c2.y,c3.x,c3.y);
  line(c3.x,c3.y,c7.x,c7.y);
  line(c8.x,c8.y,c4.x,c4.y);*/
  
pushMatrix();
  translate(372.5,70);
  rotate(radians(40));
  actual=new PVector(cos(map(mouseX,0,width,0,2*PI))*100,sin(map(mouseX,0,width,0,2*PI))*100);
  actual.normalize();
  actual.mult(12+Laenge);
  line(0,0,actual.x,actual.y);
  line(0,0,-actual.x, -actual.y);
popMatrix();
  
pushMatrix();
  translate(372.5,100);
  rotate(radians(40));
  actual=new PVector(cos(map(mouseX,0,width,0,2*PI))*100,sin(map(mouseX,0,width,0,2*PI))*100);
  actual.normalize();
  actual.mult(12+Laenge);
  line(0,0,actual.x,actual.y);
  line(0,0,-actual.x, -actual.y);
popMatrix();

pushMatrix();
  translate(385,65);
  rotate(radians(130));
  actual=new PVector(cos(map(mouseX,0,width,0,2*PI))*100,sin(map(mouseX,0,width,0,2*PI))*100);
  actual.normalize();
  actual.mult(5+Laenge);
  line(0,0,actual.x,actual.y);
  line(0,0,-actual.x, -actual.y);
popMatrix();

pushMatrix();
  translate(372.5,80);
  rotate(radians(40));
  actual=new PVector(cos(map(mouseX,0,width,0,2*PI))*100,sin(map(mouseX,0,width,0,2*PI))*100);
  actual.normalize();
  actual.mult(12+Laenge);
  line(0,0,actual.x,actual.y);
  line(0,0,-actual.x, -actual.y);
popMatrix();

pushMatrix();
  translate(360,75);
  rotate(radians(130));
  actual=new PVector(cos(map(mouseX,0,width,0,2*PI))*100,sin(map(mouseX,0,width,0,2*PI))*100);
  actual.normalize();
  actual.mult(5+Laenge);
  line(0,0,actual.x,actual.y);
  line(0,0,-actual.x, -actual.y);
popMatrix();

pushMatrix();
  translate(372.5,60);
  rotate(radians(40));
  actual=new PVector(cos(map(mouseX,0,width,0,2*PI))*100,sin(map(mouseX,0,width,0,2*PI))*100);
  actual.normalize();
  actual.mult(12+Laenge);
  line(0,0,actual.x,actual.y);
  line(0,0,-actual.x, -actual.y);
popMatrix();
}

//////////////////////////////////////////////
void s_2(){
  /*PVector c1= new PVector(40,165);
  PVector c2= new PVector(40,145);
  PVector c3= new PVector(40,125);
  PVector c4= new PVector(65,125);
  PVector c5= new PVector(65,145);
  PVector c6= new PVector(65,165);
  line(c1.x,c1.y,c6.x,c6.y);
  line(c6.x,c6.y,c5.x,c5.y);
  line(c5.x,c5.y,c2.x,c2.y);
  line(c2.x,c2.y,c3.x,c3.y);
  line(c4.x,c4.y,c3.x,c3.y);*/
  
pushMatrix();
  translate(52.25,165);
  rotate(radians(0));
  actual=new PVector(cos(map(mouseX,0,width,0,2*PI))*100,sin(map(mouseX,0,width,0,2*PI))*100);
  actual.normalize();
  actual.mult(12+Laenge);
  line(0,0,actual.x,actual.y);
  line(0,0,-actual.x, -actual.y);
popMatrix();

pushMatrix();
  translate(65,155);
  rotate(radians(90));
  actual=new PVector(cos(map(mouseX,0,width,0,2*PI))*100,sin(map(mouseX,0,width,0,2*PI))*100);
  actual.normalize();
  actual.mult(10+Laenge);
  line(0,0,actual.x,actual.y);
  line(0,0,-actual.x, -actual.y);
popMatrix();

pushMatrix();
  translate(52.25,145);
  rotate(radians(0));
  actual=new PVector(cos(map(mouseX,0,width,0,2*PI))*100,sin(map(mouseX,0,width,0,2*PI))*100);
  actual.normalize();
  actual.mult(12+Laenge);
  line(0,0,actual.x,actual.y);
  line(0,0,-actual.x, -actual.y);
popMatrix();

pushMatrix();
  translate(40,135);
  rotate(radians(90));
  actual=new PVector(cos(map(mouseX,0,width,0,2*PI))*100,sin(map(mouseX,0,width,0,2*PI))*100);
  actual.normalize();
  actual.mult(10+Laenge);
  line(0,0,actual.x,actual.y);
  line(0,0,-actual.x, -actual.y);
popMatrix();

pushMatrix();
  translate(52.5,125);
  rotate(radians(0));
  actual=new PVector(cos(map(mouseX,0,width,0,2*PI))*100,sin(map(mouseX,0,width,0,2*PI))*100);
  actual.normalize();
  actual.mult(12+Laenge);
  line(0,0,actual.x,actual.y);
  line(0,0,-actual.x, -actual.y);
popMatrix();
}

void t_2(){
  /*PVector c1= new PVector(92.5,165);
  PVector c2= new PVector(92.5,125);
  PVector c3= new PVector(80,125);
  PVector c4= new PVector(105,125);
  line(c1.x,c1.y,c2.x,c2.y);
  line(c3.x,c3.y,c4.x,c4.y);*/
  
pushMatrix();
  translate(92.5,145);
  rotate(radians(90));
  actual=new PVector(cos(map(mouseX,0,width,0,2*PI))*100,sin(map(mouseX,0,width,0,2*PI))*100);
  actual.normalize();
  actual.mult(20+Laenge);
  line(0,0,actual.x,actual.y);
  line(0,0,-actual.x, -actual.y);
popMatrix();
  
pushMatrix();
  translate(92.5,125);
  rotate(radians(0));
  actual=new PVector(cos(map(mouseX,0,width,0,2*PI))*100,sin(map(mouseX,0,width,0,2*PI))*100);
  actual.normalize();
  actual.mult(10+Laenge);
  line(0,0,actual.x,actual.y);
  line(0,0,-actual.x, -actual.y);
popMatrix();
}

void r_2(){
  /*PVector c1= new PVector(120,165);
  PVector c2= new PVector(120,145);
  PVector c3= new PVector(120,125);
  PVector c4= new PVector(145,125);
  PVector c5= new PVector(145,145);
  PVector c6= new PVector(145,165);
  line(c1.x,c1.y,c3.x,c3.y);
  line(c3.x,c3.y,c4.x,c4.y);
  line(c4.x,c4.y,c5.x,c5.y);
  line(c2.x,c2.y,c5.x,c5.y);
  line(c2.x,c2.y,c6.x,c6.y);*/
  
pushMatrix();
  translate(120,145);
  rotate(radians(90));
  actual=new PVector(cos(map(mouseX,0,width,0,2*PI))*100,sin(map(mouseX,0,width,0,2*PI))*100);
  actual.normalize();
  actual.mult(20+Laenge);
  line(0,0,actual.x,actual.y);
  line(0,0,-actual.x, -actual.y);
popMatrix();
  
pushMatrix();
  translate(132.25,125);
  rotate(radians(0));
  actual=new PVector(cos(map(mouseX,0,width,0,2*PI))*100,sin(map(mouseX,0,width,0,2*PI))*100);
  actual.normalize();
  actual.mult(12+Laenge);
  line(0,0,actual.x,actual.y);
  line(0,0,-actual.x, -actual.y);
popMatrix();

pushMatrix();
  translate(145,135);
  rotate(radians(90));
  actual=new PVector(cos(map(mouseX,0,width,0,2*PI))*100,sin(map(mouseX,0,width,0,2*PI))*100);
  actual.normalize();
  actual.mult(10+Laenge);
  line(0,0,actual.x,actual.y);
  line(0,0,-actual.x, -actual.y);
popMatrix();

pushMatrix();
  translate(132.25,145);
  rotate(radians(0));
  actual=new PVector(cos(map(mouseX,0,width,0,2*PI))*100,sin(map(mouseX,0,width,0,2*PI))*100);
  actual.normalize();
  actual.mult(12+Laenge);
  line(0,0,actual.x,actual.y);
  line(0,0,-actual.x, -actual.y);
popMatrix();

pushMatrix();
  translate(132.25,155);
  rotate(radians(40));
  actual=new PVector(cos(map(mouseX,0,width,0,2*PI))*100,sin(map(mouseX,0,width,0,2*PI))*100);
  actual.normalize();
  actual.mult(16+Laenge);
  line(0,0,actual.x,actual.y);
  line(0,0,-actual.x, -actual.y);
popMatrix();
}

void u_2(){
  /*PVector c1= new PVector(160,165);
  PVector c2= new PVector(160,125);
  PVector c3= new PVector(185,125);
  PVector c4= new PVector(185,165);
  line(c1.x,c1.y,c2.x,c2.y);
  line(c1.x,c1.y,c4.x,c4.y);
  line(c4.x,c4.y,c3.x,c3.y);*/
  
pushMatrix();
  translate(160,145);
  rotate(radians(90));
  actual=new PVector(cos(map(mouseX,0,width,0,2*PI))*100,sin(map(mouseX,0,width,0,2*PI))*100);
  actual.normalize();
  actual.mult(20+Laenge);
  line(0,0,actual.x,actual.y);
  line(0,0,-actual.x, -actual.y);
popMatrix();
  
pushMatrix();
  translate(185,145);
  rotate(radians(90));
  actual=new PVector(cos(map(mouseX,0,width,0,2*PI))*100,sin(map(mouseX,0,width,0,2*PI))*100);
  actual.normalize();
  actual.mult(20+Laenge);
  line(0,0,actual.x,actual.y);
  line(0,0,-actual.x, -actual.y);
popMatrix();
  
pushMatrix();
  translate(172.25,165);
  rotate(radians(0));
  actual=new PVector(cos(map(mouseX,0,width,0,2*PI))*100,sin(map(mouseX,0,width,0,2*PI))*100);
  actual.normalize();
  actual.mult(12+Laenge);
  line(0,0,actual.x,actual.y);
  line(0,0,-actual.x, -actual.y);
popMatrix();
}

void c_2(){
  /*PVector c1= new PVector(200,145);
  PVector c2= new PVector(225,165);
  PVector c3= new PVector(225,125);
  line(c1.x,c1.y,c2.x,c2.y);
  line(c1.x,c1.y,c3.x,c3.y);*/
  
pushMatrix();
  translate(215.25,155);
  rotate(radians(40));
  actual=new PVector(cos(map(mouseX,0,width,0,2*PI))*100,sin(map(mouseX,0,width,0,2*PI))*100);
  actual.normalize();
  actual.mult(16+Laenge);
  line(0,0,actual.x,actual.y);
  line(0,0,-actual.x, -actual.y);
popMatrix();

pushMatrix();
  translate(215.25,135);
  rotate(radians(140));
  actual=new PVector(cos(map(mouseX,0,width,0,2*PI))*100,sin(map(mouseX,0,width,0,2*PI))*100);
  actual.normalize();
  actual.mult(16+Laenge);
  line(0,0,actual.x,actual.y);
  line(0,0,-actual.x, -actual.y);
popMatrix();
}

void t2_2(){
  /*PVector c1= new PVector(252.5,165);
  PVector c2= new PVector(252.5,125);
  PVector c3= new PVector(240,125);
  PVector c4= new PVector(265,125);
  line(c1.x,c1.y,c2.x,c2.y);
  line(c3.x,c3.y,c4.x,c4.y);*/
  
pushMatrix();
  translate(252.5,145);
  rotate(radians(90));
  actual=new PVector(cos(map(mouseX,0,width,0,2*PI))*100,sin(map(mouseX,0,width,0,2*PI))*100);
  actual.normalize();
  actual.mult(20+Laenge);
  line(0,0,actual.x,actual.y);
  line(0,0,-actual.x, -actual.y);
popMatrix();
  
pushMatrix();
  translate(252.25,125);
  rotate(radians(0));
  actual=new PVector(cos(map(mouseX,0,width,0,2*PI))*100,sin(map(mouseX,0,width,0,2*PI))*100);
  actual.normalize();
  actual.mult(10+Laenge);
  line(0,0,actual.x,actual.y);
  line(0,0,-actual.x, -actual.y);
popMatrix();
}

void u2_2(){
  /*PVector c1= new PVector(280,165);
  PVector c2= new PVector(280,125);
  PVector c3= new PVector(305,125);
  PVector c4= new PVector(305,165);
  line(c1.x,c1.y,c2.x,c2.y);
  line(c1.x,c1.y,c4.x,c4.y);
  line(c4.x,c4.y,c3.x,c3.y);*/
  
pushMatrix();
  translate(280,145);
  rotate(radians(90));
  actual=new PVector(cos(map(mouseX,0,width,0,2*PI))*100,sin(map(mouseX,0,width,0,2*PI))*100);
  actual.normalize();
  actual.mult(20+Laenge);
  line(0,0,actual.x,actual.y);
  line(0,0,-actual.x, -actual.y);
popMatrix();
  
pushMatrix();
  translate(305,145);
  rotate(radians(90));
  actual=new PVector(cos(map(mouseX,0,width,0,2*PI))*100,sin(map(mouseX,0,width,0,2*PI))*100);
  actual.normalize();
  actual.mult(20+Laenge);
  line(0,0,actual.x,actual.y);
  line(0,0,-actual.x, -actual.y);
popMatrix();
  
pushMatrix();
  translate(292.25,165);
  rotate(radians(0));
  actual=new PVector(cos(map(mouseX,0,width,0,2*PI))*100,sin(map(mouseX,0,width,0,2*PI))*100);
  actual.normalize();
  actual.mult(12+Laenge);
  line(0,0,actual.x,actual.y);
  line(0,0,-actual.x, -actual.y);
popMatrix();
}

void r2_2(){
  /*PVector c1= new PVector(320,165);
  PVector c2= new PVector(320,145);
  PVector c3= new PVector(320,125);
  PVector c4= new PVector(345,125);
  PVector c5= new PVector(345,145);
  PVector c6= new PVector(345,165);
  line(c1.x,c1.y,c3.x,c3.y);
  line(c3.x,c3.y,c4.x,c4.y);
  line(c4.x,c4.y,c5.x,c5.y);
  line(c2.x,c2.y,c5.x,c5.y);
  line(c2.x,c2.y,c6.x,c6.y);*/
  
pushMatrix();
  translate(320,145);
  rotate(radians(90));
  actual=new PVector(cos(map(mouseX,0,width,0,2*PI))*100,sin(map(mouseX,0,width,0,2*PI))*100);
  actual.normalize();
  actual.mult(20+Laenge);
  line(0,0,actual.x,actual.y);
  line(0,0,-actual.x, -actual.y);
popMatrix();
  
pushMatrix();
  translate(332.25,125);
  rotate(radians(0));
  actual=new PVector(cos(map(mouseX,0,width,0,2*PI))*100,sin(map(mouseX,0,width,0,2*PI))*100);
  actual.normalize();
  actual.mult(12+Laenge);
  line(0,0,actual.x,actual.y);
  line(0,0,-actual.x, -actual.y);
popMatrix();

pushMatrix();
  translate(345,135);
  rotate(radians(90));
  actual=new PVector(cos(map(mouseX,0,width,0,2*PI))*100,sin(map(mouseX,0,width,0,2*PI))*100);
  actual.normalize();
  actual.mult(10+Laenge);
  line(0,0,actual.x,actual.y);
  line(0,0,-actual.x, -actual.y);
popMatrix();

pushMatrix();
  translate(332.25,145);
  rotate(radians(0));
  actual=new PVector(cos(map(mouseX,0,width,0,2*PI))*100,sin(map(mouseX,0,width,0,2*PI))*100);
  actual.normalize();
  actual.mult(12+Laenge);
  line(0,0,actual.x,actual.y);
  line(0,0,-actual.x, -actual.y);
popMatrix();

pushMatrix();
  translate(332.25,155);
  rotate(radians(40));
  actual=new PVector(cos(map(mouseX,0,width,0,2*PI))*100,sin(map(mouseX,0,width,0,2*PI))*100);
  actual.normalize();
  actual.mult(16+Laenge);
  line(0,0,actual.x,actual.y);
  line(0,0,-actual.x, -actual.y);
popMatrix();
}

void e_2(){
  /*PVector c1= new PVector(360,165);
  PVector c2= new PVector(360,145);
  PVector c3= new PVector(360,125);
  PVector c4= new PVector(385,125);
  PVector c5= new PVector(385,145);
  PVector c6= new PVector(385,165);
  line(c1.x,c1.y,c3.x,c3.y);
  line(c3.x,c3.y,c4.x,c4.y);
  line(c2.x,c2.y,c5.x,c5.y);
  line(c1.x,c1.y,c6.x,c6.y);*/
  
pushMatrix();
  translate(360,145);
  rotate(radians(90));
  actual=new PVector(cos(map(mouseX,0,width,0,2*PI))*100,sin(map(mouseX,0,width,0,2*PI))*100);
  actual.normalize();
  actual.mult(20+Laenge);
  line(0,0,actual.x,actual.y);
  line(0,0,-actual.x, -actual.y);
popMatrix();
  
pushMatrix();
  translate(372.25,125);
  rotate(radians(0));
  actual=new PVector(cos(map(mouseX,0,width,0,2*PI))*100,sin(map(mouseX,0,width,0,2*PI))*100);
  actual.normalize();
  actual.mult(12+Laenge);
  line(0,0,actual.x,actual.y);
  line(0,0,-actual.x, -actual.y);
popMatrix();
  
pushMatrix();
  translate(372.25,145);
  rotate(radians(0));
  actual=new PVector(cos(map(mouseX,0,width,0,2*PI))*100,sin(map(mouseX,0,width,0,2*PI))*100);
  actual.normalize();
  actual.mult(12+Laenge);
  line(0,0,actual.x,actual.y);
  line(0,0,-actual.x, -actual.y);
popMatrix();
  
pushMatrix();
  translate(372.25,165);
  rotate(radians(0));
  actual=new PVector(cos(map(mouseX,0,width,0,2*PI))*100,sin(map(mouseX,0,width,0,2*PI))*100);
  actual.normalize();
  actual.mult(12+Laenge);
  line(0,0,actual.x,actual.y);
  line(0,0,-actual.x, -actual.y);
popMatrix();
}

void s2_2(){
  /*PVector c1= new PVector(400,125);
  PVector c2= new PVector(400,135);
  PVector c3= new PVector(400,145);
  PVector c4= new PVector(400,165);
  PVector c5= new PVector(425,125);
  PVector c6= new PVector(425,135);
  PVector c7= new PVector(425,145);
  PVector c8= new PVector(425,165);
  line(c1.x,c1.y,c5.x,c5.y);
  line(c5.x,c5.y,c6.x,c6.y);
  line(c6.x,c6.y,c2.x,c2.y);
  line(c2.x,c2.y,c3.x,c3.y);
  line(c3.x,c3.y,c7.x,c7.y);
  line(c8.x,c8.y,c4.x,c4.y);*/
  
pushMatrix();
  translate(412.25,125);
  rotate(radians(0));
  actual=new PVector(cos(map(mouseX,0,width,0,2*PI))*100,sin(map(mouseX,0,width,0,2*PI))*100);
  actual.normalize();
  actual.mult(12+Laenge);
  line(0,0,actual.x,actual.y);
  line(0,0,-actual.x, -actual.y);
popMatrix();
  
pushMatrix();
  translate(425,130);
  rotate(radians(90));
  actual=new PVector(cos(map(mouseX,0,width,0,2*PI))*100,sin(map(mouseX,0,width,0,2*PI))*100);
  actual.normalize();
  actual.mult(5+Laenge);
  line(0,0,actual.x,actual.y);
  line(0,0,-actual.x, -actual.y);
popMatrix();

pushMatrix();
  translate(412.25,135);
  rotate(radians(0));
  actual=new PVector(cos(map(mouseX,0,width,0,2*PI))*100,sin(map(mouseX,0,width,0,2*PI))*100);
  actual.normalize();
  actual.mult(12+Laenge);
  line(0,0,actual.x,actual.y);
  line(0,0,-actual.x, -actual.y);
popMatrix();

pushMatrix();
  translate(400,140);
  rotate(radians(90));
  actual=new PVector(cos(map(mouseX,0,width,0,2*PI))*100,sin(map(mouseX,0,width,0,2*PI))*100);
  actual.normalize();
  actual.mult(5+Laenge);
  line(0,0,actual.x,actual.y);
  line(0,0,-actual.x, -actual.y);
popMatrix();

pushMatrix();
  translate(412.25,145);
  rotate(radians(0));
  actual=new PVector(cos(map(mouseX,0,width,0,2*PI))*100,sin(map(mouseX,0,width,0,2*PI))*100);
  actual.normalize();
  actual.mult(12+Laenge);
  line(0,0,actual.x,actual.y);
  line(0,0,-actual.x, -actual.y);
popMatrix();

pushMatrix();
  translate(412.25,165);
  rotate(radians(0));
  actual=new PVector(cos(map(mouseX,0,width,0,2*PI))*100,sin(map(mouseX,0,width,0,2*PI))*100);
  actual.normalize();
  actual.mult(12+Laenge);
  line(0,0,actual.x,actual.y);
  line(0,0,-actual.x, -actual.y);
popMatrix();
popMatrix();
}
