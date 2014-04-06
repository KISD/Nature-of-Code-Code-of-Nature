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

public class in_and_out_beta2 extends PApplet {


int d = 2;
float xo;
float yo;
float zoom = 1;
float angle = 0;
float factor = 0.1f;
float fill1 = 240;
float background = 0;
float spin = 0.0f;
public boolean sketchFullScreen() {
  return true;
}
public void setup() {
 size(800, 800);
 //   size(displayHeight, displayHeight);
  frameRate(30);
  xo = width/2;
  yo = height/2;
  smooth();
  // noStroke();
  fill(fill1);
}

public void draw() {
  background(background);
  rectMode(CENTER);
  translate(xo, yo);
  stroke(fill1);
  rotate(angle);
  line(0, 0, width, height);
  line(0, 0, -1*width, -1*height);
  line(0, 0, -1*width, height);
  line(0, 0, width, -1*height);
  line(width, height, width, -1*height);
  line(width, height, -1*width, height);
  line(-1*width, -1*height, width, -1*height);
  line(-1*width, -1*height, -1*width, height);
  line(width/2, height/2, width/2, -1*height/2);
  line(width/2, height/2, -1*width/2, height/2);
  line(-1*width/2, -1*height/2, width/2, -1*height/2);
  line(-1*width/2, -1*height/2, -1*width/2, height/2);
  line(width/3*factor, height/3*factor, width/3*factor, -1*height/3*factor);
  line(width/3*factor, height/3*factor, -1*width/3*factor, height/3*factor);
  line(-1*width/3*factor, -1*height/3*factor, width/3*factor, -1*height/3*factor);
  line(-1*width/3*factor, -1*height/3*factor, -1*width/3*factor, height/3*factor);
  line(width/5*factor*angle, height/5*factor*angle, width/5*factor*angle, -1*height/5*factor*angle);
  line(width/5*factor*angle, height/5*factor*angle, -1*width/5*factor*angle, height/5*factor*angle);
  line(-1*width/5*factor*angle, -1*height/5*factor*angle, width/5*factor*angle, -1*height/5*factor*angle);
  line(-1*width/5*factor*angle, -1*height/5*factor*angle, -1*width/5*factor*angle, height/5*factor*angle);



  /* 
   fill(fill1);
   triangle(0, factor*100, angle*10, 0, 0, zoom);
   fill(fill1);
   */


  scale(zoom);
  noStroke();
  //ellipse( 0, 0, d, d);
  rect(0, 0, d, d);
  zoom += factor;
      angle += .05f;
      factor = factor*1.08f;
    if (zoom >= 380) {
    // angle = 0;
    zoom = 1;
    xo = width/2;
    yo = height/2;
    factor = 0.1f;
    background = fill1;
    fill1 = random(254);
    fill(fill1);
  }
  if (zoom < 1) {
    //angle = 0;
    zoom = 252;
    xo = width/2;
    yo = height/2;
    factor = 21;
    background = fill1;
    fill1 = random(254);
    fill(fill1);
  }
  
  
  
}

public void mouseWheel(MouseEvent event) {
  float e = event.getAmount();
  if (e < 0) {
    zoom += factor;
    angle += .05f;
    factor = factor*1.08f;
  }
  else if (e > 0) {
    zoom -= factor;
    angle -= .05f;

    factor = factor/1.08f;
  }
  if (zoom >= 380) {
    // angle = 0;
    zoom = 1;
    xo = width/2;
    yo = height/2;
    factor = 0.1f;
    background = fill1;
    fill1 = random(254);
    fill(fill1);
  }
  if (zoom < 1) {
    //angle = 0;
    zoom = 252;
    xo = width/2;
    yo = height/2;
    factor = 21;
    background = fill1;
    fill1 = random(254);
    fill(fill1);
  }
}

public void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      zoom += factor;
      angle += .05f;
      factor = factor*1.08f;
    }
    else if (keyCode == DOWN) {
      zoom -= factor;
      angle -= .05f;

      factor = factor/1.08f;
    }
    else if (keyCode == RIGHT) {
      angle += .09f;
    }
    else if (keyCode == LEFT) {
      angle -= .09f;
    }
  }

  if (key == ' ') {
    angle = 0;
    zoom = 1;
    xo = width/2;
    yo = height/2;
  }

  if (zoom >= 380) {
    // angle = 0;
    zoom = 1;
    xo = width/2;
    yo = height/2;
    factor = 0.1f;
    background = fill1;
    fill1 = random(254);
    fill(fill1);
  }
  if (zoom < 1) {
    //angle = 0;
    zoom = 252;
    xo = width/2;
    yo = height/2;
    factor = 21;
    background = fill1;
    fill1 = random(254);
    fill(fill1);
  }

  println("zoom "+zoom);
  println("factor  "+factor);
  println("angle  "+angle);
}

public void mouseDragged() {
  xo = xo + (mouseX - pmouseX);
  yo = yo + (mouseY - pmouseY);
}

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--full-screen", "--bgcolor=#666666", "--stop-color=#cccccc", "in_and_out_beta2" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
