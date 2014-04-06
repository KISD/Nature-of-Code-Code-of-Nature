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

  
  class Card {
      int x, y, w, h, id, count;
      int suit;
      boolean show;
      boolean drawMe;
      int strokecol = 0;
      int strokecolst = 0;
      
      Card( int x, int y, int w, int h, int suit, int id) {
        this.x=x;
        this.y=y;
        this.w=w;
        this.h=h;
        this.suit=suit;
        show = false;
        drawMe = true;
        this.id = id;
      }
      void draw() {
        if ( !drawMe ) { 
          return;
        } // Bail if card is gone.
        if ( !show ) {
//          image( backing, x, y );
          noFill();
                        
             stroke(strokecol);
              if ( strokecolst <= 255) {
                strokecol++;
                strokecolst++; 
              }
                        if ( strokecolst > 255 ){
                           strokecol = strokecol - 1;
                            strokecolst++;
            
            }
            if ( strokecolst >= 512){
              strokecolst = 0;
            }
            
          

          if ( mouseOverMe() && showing < 2 ) { // Only allowed to select cards when only less than two are showing!
            stroke(255, 0, 0);
          }
          rect(x, y, w, h);
        } 
        else {
          fill(255);
          noStroke();
          rect(x, y, w, h);
          fill(0);
          String[] suitNames = loadStrings("bis256.csv");
//          String[] suitNames = { 
//            "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16",
//          };
            text( suitNames[suit], x+10, y+14 );
        
                  }
      }
      boolean mouseOverMe() {
        if ( !drawMe ) { 
          return( false );
        } // Bail if card is gone.
        return( mouseX >= x && mouseX < x+w && mouseY >= y && mouseY < y+h );
      }
      void mouseClick() {
        if ( !drawMe ) { 
          return;
        } // Bail if card is gone.
        if ( mouseOverMe() && !show && showing < 2) { // Make sure you can only pick two cards, and also cards that are not already showing!
          show = !show;
          // Remember the two cards picked.
          if ( showing == 0 ) {
            card1s = suit;
            card1i = id;
          } 
          else {
            card2s = suit;
            card2i = id;
          }
          showing++;
        }
      }
    }



