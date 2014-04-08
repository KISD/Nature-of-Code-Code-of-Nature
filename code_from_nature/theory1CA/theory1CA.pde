// Based on Cellular Automata by Matt Pearson. Generative Art.


int cellSize = 3; 
int sizeGridX = 450; 
int sizeGridY = 450;
Cell[][] CELLS;
float cellMod;
float cellCount;
float maxCells;
float minCellsPer = 0.4;             // (%) of total cells
int numX; 
int numY; 
int sumTrues;                        // number of cells
int minCells;
int numCulture = 4;                  // types of culture
int[] sumCultures;
  

Grid grid;

void setup() {
  size(450, 450);
  numX = floor(sizeGridX/cellSize);  //gridX
  numY = floor(sizeGridY/cellSize);  //gridX
  sumCultures = new int[numCulture];
  grid = new Grid();
  restart();
  //frameRate(4);
}

void draw() {
  background(255);
  grid.run();
}

// click to restart
void mousePressed() {
  restart();
}
