Neuron n[];
Signal s[];

void setup(){
	size(450,450,P2D);
	n = new Neuron[225];                                            //number of nodes
	for(int i = 0;i<n.length;i++)                                   //create invisible nodes
		n[i] = new Neuron(i,random(width),random(height));
	for(int i = 0;i<n.length;i++)                                   //create invisible relations between near nodes
		n[i].makeSynapse();
        for(int i = 0;i<n[0].s.length;i++)
	n[0].makeSignal(i);
	background(255);
}

void draw(){
	fill(255,50);                                                   //make net disappear 
        noStroke();
        rectMode(CENTER);
	rect(width/2,height/2,width,height);
	for(int i = 0;i<n.length;i++)                                   //create net
		n[i].draw();
}

void mousePressed(){                                                    //restart
  for(int i = 0;i<n.length;i++){
    n[i].x = random(width);
            n[i].y = random(height);
  } 
  for(int i = 0;i<n.length;i++)
    n[i].makeSynapse();
        for(int i = 0;i<n[0].s.length;i++)
  n[0].makeSignal(i); 
}



