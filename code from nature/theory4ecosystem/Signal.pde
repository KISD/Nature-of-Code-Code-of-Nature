class Signal{

  int cyc = 0;
  float x,y,lx,ly;
  float speed = 10.1;
  boolean running = false;
  boolean visible = true;
  int deadnum = 200;
  int deadcount = 0;
  
  Synapse base;

  Signal(Synapse _base){
    deadnum = (int)random(2,400);
    base = _base;
    lx = x = n[base.A].x;
    ly = y = n[base.A].y;
    speed *= base.weight;
  }

  void step(){                                                   
    running = true;
    lx = x;
    ly = y;
    x += (n[base.B].xx-x) / speed;
    y += (n[base.B].yy-y) / speed;
    if(dist(x,y,n[base.B].x,n[base.B].y)<1.0){
      if(deadcount<0){
        deadcount = deadnum;
        for(int i = 0;i<10;i++){
          fill(53, 72, 82);
          rectMode(CENTER);
          rect(x,y,3,3);
        }
        running = false;
        for(int i = 0; i < n[base.B].s.length;i++){
          if(!n[base.B].sig[i].running && base.A!=n[base.B].sig[i].base.B){
            n[base.B].makeSignal(i);
            n[base.B].sig[i].base.weight += (base.weight-n[base.B].sig[i].base.weight)/((dist(x,y,n[base.A].xx,n[base.A].yy)+1.0)/200.0);
          }
        }
        n[base.A].xx+=((n[base.B].x-n[base.A].x)/1.1)*noise((frameCount+n[base.A].id)/11.0);;
        n[base.A].yy+=((n[base.B].y-n[base.A].y)/1.1)*noise((frameCount+n[base.A].id)/10.0);
        n[base.A].xx-=((n[base.B].x-n[base.A].x)/1.1)*noise((frameCount+n[base.B].id)/10.0);;
        n[base.A].yy-=((n[base.B].y-n[base.A].y)/1.1)*noise((frameCount+n[base.B].id)/11.0);
        lx = n[base.A].xx;
        ly = n[base.A].yy;
        n[base.A].val+=(n[base.B].val-n[base.A].val)/5.0;
      }else{
        deadcount--;
      }
    }
  }
  
}
