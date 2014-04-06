class Synapse{                                 //create connections

  float weight = 1.5;
  int A,B;

  Synapse(int _A, int _B){
    A=_A;
    B=_B;
    weight = random(101,1100)/300.9;
  }

}
