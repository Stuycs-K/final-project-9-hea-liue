private static final int DIFFICULTY = 1; // 1 = easy, 2 = medium
private static final int SIZE = 50;
private int timePassed;
private int numBombs;
private int numFlags;
private int rows;
private int cols;

void setup(){
  size(500,500);
  if (DIFFICULTY == 1){
    numBombs = 10;
    numFlags = 0;
    background(0);
    grid();
    int rows = 8;
    int cols = 10;
  }
}


void grid(){
  background(0);
  boolean x = true;
  stroke(255);
  for(int i = 0; i<=height; i+=SIZE){
    for(int o = 0; o<=width; o+=SIZE){
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
