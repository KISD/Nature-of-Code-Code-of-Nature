class Population {

  float mutationRate;               //mutation rate
  int generations;                  //number of generations

  Rocket[] population;              //array to hold the current population
  ArrayList<Rocket> matingPool;     //arrayList which we will use for our "mating pool"
  
   Population(float m, int num) {   //initialize the population
    mutationRate = m;
    population = new Rocket[num];
    matingPool = new ArrayList<Rocket>();
    generations = 0;
    for (int i = 0; i < population.length; i++) {                //make a new set of creatures
      PVector location = new PVector(width/2,height+20);
      population[i] = new Rocket(location, new DNA());
    }
  }

  void live () {                                                //run every creature
    for (int i = 0; i < population.length; i++) {
      population[i].run();
    }
  }

  void fitness() {                                             //calculate fitness for each creature
    for (int i = 0; i < population.length; i++) {
      population[i].fitness();
    }
  }

  void selection() {                                           //generate a mating pool
    matingPool.clear();
    float maxFitness = getMaxFitness();                        //calculate total fitness of whole population
    for (int i = 0; i < population.length; i++) {              //calculate fitness for each member of the population
      float fitnessNormal = map(population[i].getFitness(),0,maxFitness,0,1);
      int n = (int) (fitnessNormal * 100);                     //arbitrary multiplier
      for (int j = 0; j < n; j++) {
        matingPool.add(population[i]);
      }
    }
  }

  void reproduction() {                                        //making the next generation
    for (int i = 0; i < population.length; i++) {              //refill the population with children from the mating pool
      int m = int(random(matingPool.size()));                  //pick two parents
      int d = int(random(matingPool.size()));
      Rocket mom = matingPool.get(m);
      Rocket dad = matingPool.get(d);
      DNA momgenes = mom.getDNA();                            //get their genes
      DNA dadgenes = dad.getDNA();
      DNA child = momgenes.crossover(dadgenes);               //mate their genes
      child.mutate(mutationRate);                             //mutate their genes
      PVector location = new PVector(width/2,height+20);      //fill the new population with the new child
      population[i] = new Rocket(location, child);
    }
    generations++;
  }

  int getGenerations() {
    return generations;
  }

  float getMaxFitness() {                                     //find highest fintess for the population
    float record = 0;
    for (int i = 0; i < population.length; i++) {
       if(population[i].getFitness() > record) {
         record = population[i].getFitness();
       }
    }
    return record;
  }

}
