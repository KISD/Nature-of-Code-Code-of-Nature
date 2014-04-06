class Grid{

//evolution of the grid
  void run(){
    sumTrues = 0;
    cellMod = cellCount/maxCells;
    cellMod = cellMod*cellMod;
    sumCultures = new int[numCulture];
    
    for (int x=0;x<numX;x++) {        // calculate next state
      for (int y=0;y<numY;y++) {
        CELLS[x][y].calcNextState();
        
        sumCultures[CELLS[x][y].culture]=sumCultures[CELLS[x][y].culture]+1;   //let white cells not die
        if (CELLS[x][y].nextState == true) {
          sumTrues++;
         }
       }
     }
  
  cellCount = sumTrues;                // total number of cells

  for (int x=0;x<numX;x++) {           // draw all cells
      for (int y=0;y<numY;y++) {
        CELLS[x][y].drawMe();
      
}
    }  
  }  
}
