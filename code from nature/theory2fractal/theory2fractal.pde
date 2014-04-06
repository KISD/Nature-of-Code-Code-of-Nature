// Diffusion-Limited Aggregation http://classes.yale.edu/fractals/Panorama/Physics/DLA/DLA2.html

DLA[]dla = new DLA[1000];

int W = 450;
int H = 450;

 
void setup() {
  background(255);
  size (W, H); 
  for (int i = 0; i< dla.length; i++) {                          //creates the loop 
    dla[i]= new DLA();
    if ( i < 4 ){                                                 //number = number of starters
    dla[i].starter = true;
    }
  }
}
 
void draw() {
  
  int col;  
    color[] colarray = new color[4];
    colarray[0] = color(53, 72, 82);
    colarray[1] = color(234, 193, 153);
    colarray[2] = color(242, 238, 175);
    colarray[3] = color(155, 231, 196);
    col = color(colarray[(int)random(0,3)]); 
    
    fill(col);
    noStroke();
    
  for (int i=0; i< dla.length; i++) {                            //declare for loop
    dla[i].update();
  }
  for(int i = 0; i<dla.length; i++){
    if (dla[i].starter == false){                                //ignore if dla[i] is true
      for(int j=0; j<dla.length; j++){
        if (dla[j].starter == true){                             //look through the myDLAdla array again for seeds.
          float d;
          d= PVector.dist(dla[i].location, dla[j].location);    //distance function 
          if (d<8){
            dla[i].starter = true;   
            rect(dla[j].location.x,dla[j].location.y, 3,3);     //draws a square from the center of the dla        
          }
        }
      }
    }
   }  
  
}


 



