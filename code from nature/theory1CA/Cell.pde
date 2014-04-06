class Cell {

//cell
  float x, y;
  boolean state;
  boolean nextState;
  Cell[] neighbors;
  int liveCount;

//culture
  int nextCulture;
  int culture;
  int[] cultureCount;
  int[] convert= {};
  int[][] colors = {
  {53, 72, 82}, 
  {248, 243, 218}, 
  {234, 193, 153}, 
  {242, 238, 175}, 
  {255, 255, 255}};
 

  Cell(float wX, float wY) {                       // random initial state
    x = wX * cellSize;
    y = wY * cellSize;
    if (random(2)>1) {nextState = true;}
    else {nextState = false;}
    state = nextState;
    nextCulture = floor(random(numCulture));
    neighbors = new Cell[0];
    liveCount = 0;
  }


  void addNeighbor(Cell cell) {
    neighbors = (Cell[])append(neighbors, cell);
  }


  void drawMe() {
    cultureCount = new int[numCulture];
    liveCount = 0;
    if (state==false) {
      liveCount++;
    }
    for (int i=0;i<neighbors.length;i++) {
      cultureCount[neighbors[i].culture] = cultureCount[neighbors[i].culture]+1;
      if (neighbors[i].state==false) {liveCount++;}
    }
    
    if (liveCount<=4) {nextState=true;}                  // new state
    else if (liveCount>4) {nextState = false;}
    if ((liveCount==4)||(liveCount==5)) {nextState=!nextState;}

    if (cultureCount[culture]<=3) {                      // group cells with the same culture
      nextCulture = floor(random(numCulture));
      while (nextCulture==culture) {
        nextCulture = floor(random(numCulture));
      }
    }
    
    if (cultureCount[culture]==4&&liveCount>=4) {        // transference of culture 
      
      for (int i=0;i<neighbors.length;i++) {
        if (neighbors[i].culture!=culture) {convert = append(convert, i);}
      }
      
      int rnda = floor(random(convert.length));
      neighbors[convert[rnda]].nextCulture = culture;
      
      if (random(1.4)>cellMod) {                         // control growth
        neighbors[convert[rnda]].nextState=true;}
      else {neighbors[convert[rnda]].nextState=false;}
    }
  }


  void calcNextState() {
    
    state = nextState;
    culture = nextCulture;
    if (state==false) {                                  // analyze neighbors
      fill(colors[colors.length-1][0], colors[colors.length-1][1], colors[colors.length-1][2]);
    }
    else {
      if (culture>(colors.length-1)){
        fill(colors[0][0], colors[0][1], colors[0][2]);
      }else{
       fill(colors[culture][0], colors[culture][1], colors[culture][2]);
      }
    }
    noStroke();
    rect(x, y, cellSize, cellSize);
  }
}





void restart() {
  
  CELLS = new Cell[numX][numY];                   // create grid of cells
  cellCount = 0;
  for (int x = 0; x<numX;x++) {
    for (int y=0;y<numY;y++) {
      Cell newCell = new Cell(x, y);
      CELLS[x][y] = newCell;
      cellCount++;
    }
  }
  
 minCells = floor(minCellsPer*cellCount);         // let cultures not die
 maxCells = floor((1-minCellsPer)*cellCount);

  for (int x=0;x<numX;x++) {                      // its neighbors loop tells each object its neighbors
    for (int y=0;y<numY;y++) {
      
      int above = y-1;                            // get locations to each side
      int below =y+1;
      int left = x-1;
      int right = x+1;
   
      if (above<0) {above = numY-1;}              // wrap location at edges
      if (below==numY) {below = 0;}
      if (left<0) {left = numX-1;}
      if (right==numX) {right = 0;}
      
      CELLS[x][y].addNeighbor(CELLS[left][above]);     //reference to neighbors
      CELLS[x][y].addNeighbor(CELLS[left][y]);
      CELLS[x][y].addNeighbor(CELLS[left][below]);
      CELLS[x][y].addNeighbor(CELLS[x][below]);
      CELLS[x][y].addNeighbor(CELLS[right][below]);
      CELLS[x][y].addNeighbor(CELLS[right][y]);
      CELLS[x][y].addNeighbor(CELLS[right][above]);
      CELLS[x][y].addNeighbor(CELLS[x][above]);

    }
  }
}
