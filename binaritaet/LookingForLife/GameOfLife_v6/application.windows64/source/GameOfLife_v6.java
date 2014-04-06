import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class GameOfLife_v6 extends PApplet {



PImage img;
GOL gol;
float lightRadius = 3;
int bgColor;

public void setup() {
  size(640, 480, P2D);
  gol = new GOL();
  img = loadImage("Light.png");
  background(bgColor);
  
}

public void draw() {
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


public void mousePressed() {
 
}


// based on:
// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class GOL {

  int w = 4;
  int columns, rows;

  // Game of life board
  int[][] board;
  int[][] next;
  int m = millis();
  
  //easing
  float x;
  float y;
  

  GOL() {
    // Initialize rows, columns and set-up arrays
    columns = width/w;
    rows = height/w;
    board = new int[columns][rows];
    //next = new int[columns][rows];
    // Call function to fill array with random values 0 or 1
    init();
  }

  //function to fill array with random values 0 or 1
  public void init() {


    for (int i =1;i < columns-1;i++) {
      for (int j =1;j < rows-1;j++) {
//        board[i][j] = int(random(2));
         // Map and avoid out of bound errors
         //Mouse and 4 neighbours make new cells
          int xCellOver = PApplet.parseInt(map(mouseX, 0, width, 0, width/w));
          //constrain inside the raster
          xCellOver = constrain(xCellOver, 0, width/w-5);
          int yCellOver = PApplet.parseInt(map(mouseY, 0, height, 0, height/w));
          //constrain inside the raster
          yCellOver = constrain(yCellOver, 0, height/w-5);
          board[xCellOver+PApplet.parseInt(random(4))][yCellOver+PApplet.parseInt(random(4))] = 1;

      }
    }
  }

  // The process of creating the new generation
  public void generate() {

    int[][] next = new int[columns][rows];

    // Loop through every spot in our 2D array and check spots neighbors
    for (int x = 0; x < columns; x++) {
      for (int y = 0; y < rows; y++) {

        // Add up all the states in a 3x3 surrounding grid
        int neighbors = 0;
        for (int i = -1; i <= 1; i++) {
          for (int j = -1; j <= 1; j++) {
            
            neighbors += board[(x+i+columns)%columns][(y+j+rows)%rows];
            
           
          }
        }
        
        // A little trick to subtract the current cell's state since
        // we added it in the above loop
        neighbors -= board[x][y];

        // Rules of Life
        if ((board[x][y] == 1) && (neighbors < 2)) next[x][y] = 0; // Loneliness
        else if ((board[x][y] == 1) && (neighbors > 3)) next[x][y] = 0; // Overpopulation
        else if ((board[x][y] == 0) && (neighbors == 3)) next[x][y] = 1; // Reproduction
        else next[x][y] = board[x][y]; // Stasis
      }
    }

    // Next is now our board
    board = next;
  }

  // This is the easy part, just draw the cells, fill 255 for '1', fill 0 for '0'
  public void display() {
    int MyLightX = mouseX-50;
    int MyLightY = mouseY-50;
    for ( int i = 0; i < columns;i++) {
      for ( int j = 0; j < rows;j++) {
        if (board[i][j] == 1) {
          fill(0,100);
          noStroke();
          ellipse(i*w, j*w, w, w);
         // stroke(140,220,180);
          //line(width/2, height/2, j*w, i*w);
        }

        //Text 
        textSize(10);
        fill(200,10);
        textAlign(LEFT);
        text("LOOKING FOR LIFE",10,25);
        
        if(millis()<10000){
          textAlign(CENTER);
          text("MOVE AROUND TO FIND LIFE",width/2,height/2);}

      }
    }
  }
}


  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "GameOfLife_v6" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
