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
private int[][] flagsPlaced;
private boolean reveal;

void setup(){
  textSize(30);
  size(1000,1000);
  gameEnd = false;
  if (DIFFICULTY == 1){
    numMines = 10;
    numFlags = numMines;
    rows = 8;
    cols = 10;
    reveal = false;
    flagsPlaced = new int[rows][cols];
    board = new Board(numMines, rows, cols);
    field = board.getField();
    printGrid();
  }
}
void draw(){
  if (gameEnd == false  && reveal == false){
    printGrid();
    printBoard();
  }
}

void keyPressed(){
  if (keyCode == 'R'){ //R button reveals the bomb placements on the board
   revealMines();
   reveal = true;
   text("Reveal Mines: ON",15,70);
  }
  if (keyCode == 'E'){
   revealNeutral(field);
   reveal = true;
   text("Reveal Mines: ON",15,50);
  }
}
void keyReleased(){
  if (keyCode == 'R' || keyCode == 'E'){
    reveal = false;
    printGrid();
    printBoard();
  }
}

void mousePressed(){
  int x = mouseX;
  int y = mouseY; 
  if (gameEnd == false){
    if (mouseButton == LEFT){
    //  dig(); // to be implemented
    }
    if (mouseButton == RIGHT){
      flag(x,y);
    }
  }
}
void flag(int x, int y){
  int i = (y-2*SIZE)/SIZE;
  int j = x/SIZE;
  if (isValid(x,y)){
    if (flagsPlaced[i][j] == -1){
      flagsPlaced[i][j] = 0;
      numFlags++;
    }
    else if (numFlags !=0){
      flagsPlaced[(y-2*SIZE)/SIZE][x/SIZE] = -1;
      numFlags--;
    }
  }
}
boolean isValid(int x, int y){
  return !(y < 2*SIZE || y > (rows+2)*SIZE || x < 0 || x > cols*SIZE); //checks if the coordinate is within the minefield
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
        if((i+o) % 100 != 0){
          stroke(#C1F376);
          fill(#C1F376);
        }
        else{
          stroke(#A1DF50);
          fill(#A1DF50);
        }
      }
      square(o,i,SIZE);
    }
  }
  stroke(0);
}
void printBoard(){
  float radius = SIZE/2.0;
  stroke(255);
  for(int i = 0; i<rows; i++){
    for(int j = 0; j<cols; j++){
      if (flagsPlaced[i][j] == -1){  // places flags in track
        stroke(255);
        fill(255,0,0);
        circle(j*SIZE+radius, (i+2)*SIZE+radius, radius);
      }
    }
  }
  textSize(30);
  float shift = 255.0/(numMines/2);
  fill(510-shift*numFlags,0+shift*numFlags,0);
  text("Remaining Flags: "+numFlags + "/" + numMines,15,40);
}


void revealMines(){
  float radius = SIZE/2.0;
  for(int i = 0; i<rows; i++){
    for(int j = 0; j<cols; j++){
      if (field[i][j] == -1){
        stroke(255);
        fill(0);
        circle(j*SIZE+radius, (i+2)*SIZE+radius, radius);
      }
    }
  }
}

void revealNeutral(int[][]field){
  for(int i = 0; i<rows; i++){
    for(int j = 0; j<cols; j++){
      if(field[i][j] != -1){
        fill(0);
        textSize(40);
        text(field[i][j], j*50+15, (i+3)*50-10);
      }
    }
  }
}
