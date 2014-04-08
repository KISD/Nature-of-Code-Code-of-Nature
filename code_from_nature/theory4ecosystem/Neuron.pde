class  Neuron{
  
  int id;
  float x,y,val,xx,yy;
  float radius = 60.0;                                       //how far the net can expand in one movement

  Synapse s[];
  Signal sig[];

  Neuron(int _id,float _x,float _y){                         //define neuron
    val = random(255);
    id=_id;
    xx = x=_x;
    yy = y=_y;
  }

  void makeSynapse(){                                       //create invisible relations between near nodes
    s = new Synapse[0];
    sig = new Signal[0];
    for(int i = 0;i<n.length;i++){
      if(i!=id && dist(x,y,n[i].x,n[i].y)<=radius&&noise(i/100.0)<0.8){
        s = (Synapse[])expand(s,s.length+1);
        s[s.length-1] = new Synapse(id,i);
        sig = (Signal[])expand(sig,sig.length+1);
        sig[sig.length-1] = new Signal(s[s.length-1]);
      }
    }
  }

  void makeSignal(int which){
    int i = which;
    sig[i].x = xx;
    sig[i].y = yy;
    sig[i].running = true;
  }

  void drawSynapse(){                                       //create net
    if(sig.length>0){
      for(int i = 0;i<sig.length;i+=1){
        if(sig[i].running){
          pushStyle();
          strokeWeight(1);
          stroke(lerpColor(#EAC199,#F2EEAF,norm(val,0,255)));
          noFill();
          line(sig[i].x,sig[i].y,sig[i].lx,sig[i].ly);
          popStyle();
          sig[i].step();
        }
      }
    }
    noStroke();
    for(int i = 0;i<s.length;i+=1){
      line(n[s[i].B].xx,n[s[i].B].yy,xx,yy);
    }
  }

  void draw(){
    drawSynapse();
    xx += (x-xx) / 10.0;
    yy += (y-yy) / 10.0;
  }

  void move(){
    x+=(noise(id+frameCount/10.0)-.5);
    y+=(noise(id*5+frameCount/10.0)-.5);
  }

}



