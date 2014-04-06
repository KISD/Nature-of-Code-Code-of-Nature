class DLA {
 
  PVector location = new PVector();
  PVector velocity = new PVector();
  boolean starter;                                              //starter point 
  float v = 10;                                                 //controls space between dlas and velocity
 
  DLA() {
    location = new PVector(random(W), random(H));              //random intial location
    starter = false;         
      
  }
 
  void update() {
     
    if (starter == false){
      velocity = new PVector(random(-v,v), random(-v, v));     
      location.add(velocity);                                  //new location related to velocity
      v=v;
    }
  }
  
  
}
