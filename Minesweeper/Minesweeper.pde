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
  if (gameEnd == false){
    if (keyCode == 'R'){ //R button reveals the bomb placements on the board
     revealMines();
     reveal = true;
     textSize(25);
     text("Reveal Mines: ON",15,60);
    }
    if (keyCode == 'E'){
     revealNeutral();
     reveal = true;
     textSize(25);
     text("Reveal Numbers: ON",15,90);
    }
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
      dig(x,y);
    }
    if (mouseButton == RIGHT){
      flag(x,y);
    }
  }
}
void carve(int x, int y){ // when dug square has 0 bombs near 
  //should implement the maze spread method
}
void dig(int x, int y){
  int i = (y-2*SIZE)/SIZE;
  int j = x/SIZE;
  if (isValid(x,y)){
    if (field[i][j] == 0){
      board.reveal(i,j);
      field = board.getField();
    }
    else if (field[i][j] == -1){
      endGame(); // to be implemented
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
void endGame(){
//  gameEnd = true;
  textSize(50);
  fill(255,0,0);
  text("BOMB", 500,500);
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
        stroke(255,0,0);
        fill(255,0,0);
        circle(j*SIZE+radius, (i+2)*SIZE+radius, radius);
      }
      int bombsNear = field[i][j];
      if (bombsNear > 0){
        stroke(#DBC8AC);
        fill(#DBC8AC);
        square(j*SIZE,(i+2)*SIZE,SIZE);
        textSize(40);
        if (bombsNear == 3){
          fill(255,0,0);
        }
        else if (bombsNear == 2){
          fill(255,255,0);
        }
        else if (bombsNear == 1){
          fill(#4C9A2A);
        }
        else {
          fill(255,0,255);
        }
        text(bombsNear, j*50+15, (i+3)*50-10);
      }
    }
  }
  textSize(25);
  float shift = 255.0/(numMines/2);
  fill(510-shift*numFlags,0+shift*numFlags,0);
  text("Remaining Flags: "+numFlags + "/" + numMines,15,30);
}


void revealMines(){
  float radius = SIZE/2.0;
  for(int i = 0; i<rows; i++){
    for(int j = 0; j<cols; j++){
      if (field[i][j] == -1){
        stroke(0);
        fill(0);
        circle(j*SIZE+radius, (i+2)*SIZE+radius, radius);  //Press 'R' to reveal bombs on the board
      }
    }
  }
}

void revealNeutral(){
  for(int i = 0; i<rows; i++){
    for(int j = 0; j<cols; j++){
      if(!(board.getBoard()[i][j].getIsMine())){
        if(board.getBoard()[i][j].getBombsNear() != 0){
          fill(0);
          textSize(40);
          text(board.getBoard()[i][j].getBombsNear(), j*50+15, (i+3)*50-10); //Press 'E' to reveal safe square w/ bombs nearby
        }
      }
    }
  }
}
