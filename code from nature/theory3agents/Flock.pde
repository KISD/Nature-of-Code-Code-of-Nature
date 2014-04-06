class Flock {
  ArrayList<Boid> boids; 

  Flock() {
    boids = new ArrayList<Boid>();                   
  }

  void run() {
    for (Boid b : boids) {
      b.run(boids);                                        
    }
  }

  void addBoid(Boid b) {                            //add boids - beginning and on click
    boids.add(b);
  }

}
