private static final int DIFFICULTY = 1; // 1 = easy, 2 = medium
private static final int SIZE = 50;
private int timePassed;
private int numMines;
private int numFlags;
private int rows;
private int cols;
private boolean gameEnd;
private Board board;
private int[][] field;

void setup(){
  size(1000,1000);
  gameEnd = false;
  if (DIFFICULTY == 1){
    numMines = 10;
    numFlags = 0;
    rows = 8;
    cols = 10;
    board = new Board(numMines, rows, cols);
    field = board.getField();
/*    for (int i = 0; i < field.length; i ++){
      for (int j = 0; j < field[0].length; j++)
        print(field[i][j]);
    } */
    printGrid();
  }
}
void draw(){
  if (gameEnd == false){

  }
}
void keyPressed(){
  if (keyCode == 'R'){
   revealMines(field);
  }
}
void keyReleased(){
  if (keyCode == 'R')
    printGrid();
}


void printGrid(){
  stroke(255);
  for(int i = 0; i<SIZE*(rows+2); i+=SIZE){
    for(int o = 0; o<SIZE*cols; o+=SIZE){
      if (i == 0 || i == SIZE){
        stroke(#4C9A2A);
        fill(#4C9A2A);
      }
      else{
        stroke(255);
        print(i+o + " " );
        if((i+o) % 100 != 0){
          fill(#85E357);
        }
        else{
          fill(#71C14A);
        }
      }
      square(o,i,SIZE);
    }
  }
}
void revealMines(int[][] field){
  float radius = SIZE/2.0;
  for(int i = 0; i<rows; i++){
    for(int j = 0; j<cols; j++){
      if (field[i][j] == -1){
        circle(j*SIZE+radius, (i+2)*SIZE+radius, radius);
      }
    }
  }
}
