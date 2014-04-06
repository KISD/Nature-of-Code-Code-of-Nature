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


