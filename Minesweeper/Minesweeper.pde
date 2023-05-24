private static final int DIFFICULTY = 1; // 1 = easy, 2 = medium
private static final int SIZE = 50;
private int timePassed;
private int numMines;
private int numFlags;
private int rows;
private int cols;
private boolean gameEnd;

void setup(){
  size(1000,1000);
  gameEnd = false;
  if (DIFFICULTY == 1){
    numMines = 10;
    numFlags = 0;
    rows = 8;
    cols = 10;
  }
}
void draw(){
  if (gameEnd == false){
   printGrid(rows, cols);
  }
  else{
  }
}


void printGrid(int r, int c){
  boolean x = true;
  stroke(255);
  for(int i = 0; i<=SIZE*(r+2); i+=SIZE){
    for(int o = 0; o<=SIZE*c; o+=SIZE){
      if (i == 0 || i == SIZE){
        stroke(#4C9A2A);
        fill(#4C9A2A);
      }
      else{
        stroke(255);
        if(x){
          fill(#85E357);
          x = false;
        }
        else{
          fill(#71C14A);
          x = true;
        }
      }
      square(o,i,SIZE);
    }
  }
}
void makeBoard(int){
  
}
