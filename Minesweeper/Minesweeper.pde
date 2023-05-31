private static final int DIFFICULTY = 1; // 1 = easy, 2 = medium
private static final int SIZE = 50;
private int timePassed;
private int turns;
private int numMines;
private int numFlags;
private int rows;
private int cols;
private boolean gameEnd;
private Board board;
private int[][] field;
private int[][] flagsPlaced;
private boolean reveal;
private int gameNumber = 0;

void setup(){
  textSize(30);
  size(1000,1000);
  gameEnd = false;
  turns = 0;
  if (DIFFICULTY == 1){
    gameNumber++;
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
    if (board.getSquaresRevealed() + numMines == rows*cols){
      endGame();
    }
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
  if (gameEnd == true){
    if (keyCode == ENTER){
      setup();
    }
  }
}
void keyReleased(){
  if (gameEnd == false){
    if (keyCode == 'R' || keyCode == 'E'){
      reveal = false;
      printGrid();
      printBoard();
    }
  }
}

void mousePressed(){
  int x = mouseX;
  int y = mouseY; 
  if (gameEnd == false && isValid(x,y)){
    if (mouseButton == LEFT){
      if(board.getBoard()[(y-2*SIZE)/SIZE][x/SIZE].getBombsNear() == 0 && !(board.getBoard()[(y-2*SIZE)/SIZE][x/SIZE].getIsMine())){
        carve(x,y);
      }
      else{
        dig(x,y);
      }
    }
    if (mouseButton == RIGHT){
      flag(x,y);
    }
  }
}
void carve(int x, int y){ // when dug square has 0 bombs near 
  int i = (y-2*SIZE)/SIZE;
  int j = x/SIZE;
    if(board.getBoard()[i][j].getBombsNear() == 0){
      stroke(#DBC8AC);
      fill(#DBC8AC);
      square(j*SIZE,(i+2)*SIZE,SIZE);
      if (field[i][j] == 0){
        board.reveal(i,j);
      }
      if(i > 0 && j > 0){ //1,1
        if(board.getBoard()[i-1][j-1].getIsHidden() == true){
          if(board.getBoard()[i-1][j-1].getBombsNear() != 0){
            dig(x-SIZE,y-SIZE);
          }
          else if (field[i-1][j-1] == 0){
            board.reveal(i-1,j-1);
            carve(x=SIZE,y-SIZE);
          } 
        }
      }  
      if(i > 0){ //1,2
        if(board.getBoard()[i-1][j].getIsHidden() == true){
          if(board.getBoard()[i-1][j].getBombsNear() != 0){
            dig(x,y-SIZE);
          }
          else if (field[i-1][j] == 0){
            board.reveal(i-1,j);
            carve(x,y-SIZE);
          } 
        }
      }  
      if(i > 0 && j < cols-1){ //1,3
        if(board.getBoard()[i-1][j+1].getIsHidden() == true){
          if(board.getBoard()[i-1][j+1].getBombsNear() != 0){
            dig(x+SIZE,y-SIZE);
          }
          else if (field[i-1][j+1] == 0){
            board.reveal(i-1,j+1);
            carve(x+SIZE,y-SIZE);
          }
        }
      }
      if(j > 0){//2,1
        if(board.getBoard()[i][j-1].getIsHidden() == true){
          if(board.getBoard()[i][j-1].getBombsNear() != 0){
            dig(x-SIZE,y);
          }
          else if (field[i][j-1] == 0){
            board.reveal(i,j-1);
            carve(x-SIZE,y);
          }
        }
      }      
      if(j < cols-1){//2,3
        if(board.getBoard()[i][j+1].getIsHidden() == true){
          if(board.getBoard()[i][j+1].getBombsNear() != 0){
            dig(x+SIZE,y);
          }
          else if (field[i][j+1] == 0){
            board.reveal(i,j+1);
            carve(x+SIZE,y);
          }
        }
      }
      if(i < rows-1 && j > 0){ //3,1
        if(board.getBoard()[i+1][j-1].getIsHidden() == true){
          if(board.getBoard()[i+1][j-1].getBombsNear() != 0){
            dig(x-SIZE,y+SIZE);
          }
          else if (field[i+1][j-1] == 0){
            board.reveal(i+1,j-1);
            carve(x-SIZE,y+SIZE);
          }
        }
      }
      if(i < rows-1){ //3,2
        if(board.getBoard()[i+1][j].getIsHidden() == true){
          if(board.getBoard()[i+1][j].getBombsNear() != 0){
            dig(x,y+SIZE);
          }
          else if (field[i+1][j] == 0){
            board.reveal(i+1,j);
            carve(x,y+SIZE);
          }
        }
      }
      if(i < rows-1 && j < cols-1){ //3,3
        if(board.getBoard()[i+1][j+1].getIsHidden() == true){
          if(board.getBoard()[i+1][j+1].getBombsNear() != 0){
            dig(x+SIZE,y+SIZE);
          }
          else if (field[i+1][j+1] == 0){
            board.reveal(i+1,j+1);
            carve(x+SIZE,y+SIZE);
          }
        }
      }
    }
  
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
      fill(0,0,255);
      stroke(255);
      circle(j*SIZE+SIZE/2, (i+2)*SIZE+SIZE/2, SIZE/2);
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
  gameEnd = true;
  printGrid();
  printBoard();
  revealMines();
  textSize(SIZE);
  fill(255,0,0);
  text("YOU LOSE", SIZE/2,SIZE);
  textSize(SIZE/2);
  fill(0);
  text("press 'enter' to restart", SIZE/2,SIZE*1.75);
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
//          stroke(#A1DF50);
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
  text("Game#" +gameNumber, (cols-2)*SIZE, SIZE/2);
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
      else if (bombsNear == -2){
        stroke(#DBC8AC);
        fill(#DBC8AC);
        square(j*SIZE,(i+2)*SIZE,SIZE);
      }
    }
  }
  textSize(25);
  float shift = 255.0/(numMines/2);
  fill(510-shift*numFlags,0+shift*numFlags,0);
  if (gameEnd == true){
    fill(#4C9A2A);
  }
  text("Remaining Flags: "+numFlags + "/" + numMines,15,30);
}


void revealMines(){
  float radius = SIZE/2.0;
  for(int i = 0; i<rows; i++){
    for(int j = 0; j<cols; j++){
      if (field[i][j] == -1){
        stroke(0);
        fill(0);
        if (gameEnd == true){
          fill(150,0,150);
        }
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
