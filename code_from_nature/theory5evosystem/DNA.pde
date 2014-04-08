class DNA {

  PVector[] genes;
  float maxforce = 0.1;

  DNA() {                                           //constructor #1 (makes a DNA of random PVectors)
    genes = new PVector[lifetime];
    for (int i = 0; i < genes.length; i++) {
      float angle = random(TWO_PI);
      genes[i] = new PVector(cos(angle), sin(angle));
      genes[i].mult(random(0, maxforce));
    }
  }

  DNA(PVector[] newgenes) {                        //constructor #2 (creates the instance based on an existing array)
    genes = newgenes;
  }

  DNA crossover(DNA partner) {                     //create new DNA sequence from two (this & and a partner)
    PVector[] child = new PVector[genes.length];
    int crossover = int(random(genes.length));     //pick a midpoint
    for (int i = 0; i < genes.length; i++) {       //take "half" from one and "half" from the other
      if (i > crossover) child[i] = genes[i];
      else               child[i] = partner.genes[i];
    }    
    DNA newgenes = new DNA(child);
    return newgenes;
  }

  void mutate(float m) {                           //based on a mutation probability, pick a new random Vector
    for (int i = 0; i < genes.length; i++) {
      if (random(1) < m) {
        float angle = random(TWO_PI);
        genes[i] = new PVector(cos(angle), sin(angle));
        genes[i].mult(random(0, maxforce));
      }
    }
  }
  
}

