// Based on Smart Rockets w/ Genetic Algorithms by Daniel Shiffman. The Nature of Code, Spring 2009.

int lifetime;                          //lifetime of each generation
int lifeCounter;                       //timer for cycle of generation
PVector target;                        //target location

Population population;                 

void setup() {
  size(450, 450);
  smooth();
  lifetime = 400;                      //number of cycles we will allow a generation to live
  lifeCounter = 0;                     //initialize variables
  target = new PVector(width/2, height/2);
  float mutationRate = 0.01;           //create a population with a mutation rate, and population max
  population = new Population(mutationRate, 150);

}

void draw() {
  background(255);
  fill(53, 72, 82);
  noStroke();
  rect(target.x,target.y,12,12);       //start and target locations
  if (lifeCounter < lifetime) {        //if the generation hasn't ended yet
    population.live();
    lifeCounter++;
  } 
  else {                               //otherwise a new generation
    lifeCounter = 0;
    population.fitness();
    population.selection();
    population.reproduction();
  }
}

void mousePressed() {                 //move the target if the mouse is pressed
  target.x = mouseX;
  target.y = mouseY;
}

