class schweif {

  float xPos;
  float yPos;
  float[] x = new float[20];
  float[] y = new float[20];
  float segLength = 8;
  schweif() {
  }

  void dragSegment(int i, float xin, float yin) {
    float dx = xin - x[i];
    float dy = yin - y[i];
    float angle = atan2(dy, dx);  
    x[i] = xin - cos(angle) * segLength;
    y[i] = yin - sin(angle) * segLength;
    segment(x[i], y[i], angle);
  }

  void segment(float x, float y, float a) {
    pushMatrix();

    xPos =x;
    yPos = y;

    translate(xPos, yPos, 0);
    rotate(a);
    stroke(255, 225, 225, 22);

    strokeWeight(3);

    line(0, 0, segLength, 0);
    strokeWeight(1);
    popMatrix();
  }
}

