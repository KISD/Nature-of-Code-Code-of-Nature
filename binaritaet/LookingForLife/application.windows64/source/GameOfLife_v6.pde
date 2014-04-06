

PImage img;
GOL gol;
float lightRadius = 3;
int bgColor;

void setup() {
  size(640, 480, P2D);
  gol = new GOL();
  img = loadImage("Light.png");
  background(bgColor);
  
}

void draw() {
  background(bgColor);
  
  //Light circle radius depending on mouse moving speed
  float speed = abs(mouseX-pmouseX) + abs(mouseY-pmouseY);
  lightRadius = map(speed, 0, width, random(30,35), width/2);
  
 //Light circle
 imageMode(CENTER);
 image(img,mouseX, mouseY,lightRadius,lightRadius);
  
 //Game of life
 gol.init();
 gol.generate();
 gol.display();
   
}


void mousePressed() {
 
}


