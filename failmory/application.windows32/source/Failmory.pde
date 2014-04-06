//credits: based on script from tgfuy44 http://forum.processing.org/one/topic/memory-game.html



    // Variables to keep track of the cards.
    Card[] cards;
    int showing;

    // A start at variables to track play.
    int turn = 0;
    int card1s, card2s, card1i, card2i;
    int exp = 2;
    int red;
    int gre;
    int blu;
    int score = 0;
    
    
    void setup() {
      size(800, 600);      
      start1();
    }
      
               
    
      void start1(){
      cards = new Card[exp*exp];
      int[] suits = new int[exp*exp];
      // Set appropriate values for suits and values.
      for (int i=0; i < exp*exp; i++) {
        suits[i] = i/2;
          }
      // Scramble the deck.
      for ( int i=0; i < exp*exp; i++ ) {
        int r = int( random(exp*exp/2) );
        // Swap suits.
        int t = suits[i];
        suits[i] = suits[r];
        suits[r] = t;
               }
      showing = 0; // Keeps track of how many cards are faceup...
      int t = 0;
      for ( int j=0; j < exp; j++) {
        for ( int k=0; k < exp; k++) {
          cards[t] = new Card( 20+50*j, 65+50*k, 40, 40, suits[t], t );
          t++;
        }
      }
    }
    
    void nextround() {
       textAlign(CORNER);
        PFont mono;
        mono = loadFont("8-Bit-Madness-48.vlw");
        textFont(mono, 48);
       
     
      String turnStr = "You don't know enough! Press 'q'!";
         
      fill(0);
      stroke(0);
      fill(255);
      text( turnStr, 210, 140, 370, 250 );
      if (keyPressed) {
        if (key == 'q' )
        {
        exp = exp*2;
        start1();
        }
    }
      }
      
      

    void draw() {
      background(0, 0, 0);
      textAlign(CENTER);
      if ( score < exp*exp-2) {
      for ( int t=0; t < exp*exp; t++) {
        cards[t].draw();
      }
      }
      else {
       nextround();  
      
      }
      
      // Who's turn is it? Box.
      PFont font;

      font = loadFont("Arial-BoldMT-14.vlw");
      textFont(font);
      textAlign(CORNER);
     
      String turnStr = "Failed attempts: "+turn;
          red=255;
          gre=255;
          blu=255;
          if ( showing == 2 && cardsMatch() ) {
          red=0;
          gre=179;
          blu=0;
          turnStr = "Correct! Press 'Space'!";}
            if ( showing == 2 && !cardsMatch() ) {
              red=255;
              gre=0;
              blu=0;
              turnStr = "Failed! Press 'Space'!";
            }
      fill(0);
      stroke(255);
      rect( 20, 20, 300, 30 );
      fill(red,gre,blu);
      text( turnStr, 25, 40 );
      }

    void keyPressed() {
      if ( showing == 2 && key == ' ' ) {
        if ( cardsMatch() ) {
          cards[card1i].drawMe = false;
          cards[card2i].drawMe = false;
          score+=2;
        } 
        else {
          cards[card1i].show = false;
          cards[card2i].show = false;
          turn++;
        }
        showing = 0;
      }
    }

    boolean cardsMatch() {
      
      if (card1s == card2s)
      {
        return true;
      }
      else 
      {
        return false;
      }
    }
    void mouseClicked() {
      for ( int t=0; t < cards.length; t++) {
        cards[t].mouseClick();
      }
    }

  
