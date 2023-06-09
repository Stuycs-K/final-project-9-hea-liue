private int DIFFICULTY; // 1 = easy, 2 = medium
private int SIZE;
private int numMines;
private int numFlags;
private int rows;
private int cols;
private boolean gameEnd;
private boolean isWin;
private Board board;
private int[][] field;
private int[][] flagsPlaced;
private boolean reveal;
private int gameNumber = 0;
private boolean firstTurn;
private int startTime;
private boolean gameStart;
<<<<<<< HEAD
private boolean popUp;
=======
>>>>>>> refs/remotes/origin/main

void setup(){ //chooses difficulty and sets mines, rows, cols
  gameStart = true;
  textSize(0.6*SIZE);
  size(1000,1000);
  background(#4C9A2A);
  gameEnd = false;
<<<<<<< HEAD
  popUp = true;
=======
>>>>>>> refs/remotes/origin/main
  startScreen();
}
void startScreen(){
  gameStart = true;
  size(1000,1000);
  fill(#7DCB79);
  square(0,0,1000);
  fill(#61FF5A);
<<<<<<< HEAD
  stroke(0);
  strokeWeight(1);
=======
>>>>>>> refs/remotes/origin/main
  rect(width/2-200,200,400,75,20);
  rect(width/2-150,350,300,75,20);
  rect(width/2-150,500,300,75,20);
  rect(width/2-150,650,300,75,20);
  textSize(50);
  fill(0);
  text("MINESWEEPER",width/2-160,255);
  text("EASY",width/2-55,405);
  text("MEDIUM",width/2-85,555);
  text("HARD",width/2-55,705);
<<<<<<< HEAD
  //print(DIFFICULTY);
}

void startGame(){
=======
  print(DIFFICULTY);
}
void startGame(int num){
  DIFFICULTY = num;
>>>>>>> refs/remotes/origin/main
  if (DIFFICULTY == 1){
    numMines = 10;
    rows = 8;
    cols = 10;
    SIZE = 100;
  }
  if (DIFFICULTY == 2){
    numMines = 40;
    rows = 16;//14
    cols = 20;//18
    SIZE = 50;
  }
  if (DIFFICULTY == 3){
    numMines = 100;
    rows = 20;//20
    cols = 25;//24
    SIZE = 40;
  }
  gameNumber++;
  numFlags = numMines;
  reveal = false;
  gameStart = false;
  firstTurn = true;
  flagsPlaced = new int[rows][cols];
  printGrid();
}

void draw(){
  if (gameStart == false && firstTurn == false && gameEnd == false  && reveal == false){
    printGrid();
    printBoard();
    if (board.getSquaresRevealed() + numMines == rows*cols){
      isWin = true;
      endGame();
    }
  }
}

void keyPressed(){
  if (gameEnd == false && firstTurn == false){
    if (keyCode == 'R'){ //R button reveals the bomb placements on the board
     revealMines();
     reveal = true;
     textSize(SIZE/2);
     text("Reveal Mines: ON",0.3*SIZE,1.2*SIZE);
    }
    if (keyCode == 'E'){ //E button reveals the safe squares with bombs nearby
     revealNeutral();
     reveal = true;
     textSize(SIZE/2);
     text("Reveal Numbers: ON",0.3*SIZE,1.8*SIZE);
    }
  }
  if (keyCode == ENTER){
    if (gameEnd){ // Enter button restarts the game when it ends
      if(popUp){
        popUp = false;
      }
      else{
        popUp = true;
      }
      endGame();
    }
  }
    if (keyCode == BACKSPACE){ // Enter button restarts the game when it ends
<<<<<<< HEAD
      if(!gameEnd){
        setup();
      }
=======
      setup();
>>>>>>> refs/remotes/origin/main
    }
}
void keyReleased(){
  if (gameEnd == false && firstTurn == false){
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
  if (gameStart == false && gameEnd == false && isValid(x,y)){
    if (mouseButton == LEFT){
      if (!firstTurn){
        if(board.getBoard()[(y-2*SIZE)/SIZE][x/SIZE].getIsHidden() && board.getBoard()[(y-2*SIZE)/SIZE][x/SIZE].getBombsNear() == 0 && !(board.getBoard()[(y-2*SIZE)/SIZE][x/SIZE].getIsMine())){
          carve(x,y); //reveals all nearby 0-bombs-near safe squares if a 0-bombs-near safesquare is clicked
        }
        else{
          dig(x,y); //reveals the safesquare with the number of bombs near
        }
      }
      else if (isValid(x,y)){ //first turn protocol to make sure that initial carve isn't a bomb
        int i = (y-2*SIZE)/SIZE;
        int j = x/SIZE;
        board = new Board(numMines, rows, cols,i,j); 
        field = board.getField();
        firstTurn = false;
        carve(x,y);
        startTime = millis()/1000;
      } 
    }
    if (!firstTurn && mouseButton == RIGHT){
      flag(x,y); //flags the square if right click
    }
  }
  else if (gameStart == true){
    if(mouseButton == LEFT){
      if(x >= width/2-150 && x <= width/2+150){
        if(y >= 350 && y <= 425){
<<<<<<< HEAD
          DIFFICULTY = 1;
          startGame();
        }
        if(y >= 500 && y <= 575){
          DIFFICULTY = 2;
          startGame();
        }
        if(y >= 650 && y <= 725){
          DIFFICULTY = 3;
          startGame();
        }
      }
    }
  }
  else if (gameEnd && popUp){
    if(mouseButton == LEFT){
      if(y >= height/2-15 && y <= height/2+85){
        if(x >= width/2+10 && x <= width/2+375){
          gameEnd = false;
          setup();
        }
        if(x >= width/2-285 && x <= width/2-10){
          gameEnd = false;
          gameStart = true;
          firstTurn = true;
          startGame();
=======
          startGame(1);
        }
        if(y >= 500 && y <= 575){
          startGame(2);
        }
        if(y >= 650 && y <= 725){
          startGame(3);
>>>>>>> refs/remotes/origin/main
        }
      }
    }
  }
}

boolean carve(int x, int y){ // when dug square has 0 bombs near 
  int i = (y-2*SIZE)/SIZE;
  int j = x/SIZE;
    if(board.getBoard()[i][j].getBombsNear() == 0 && board.getBoard()[i][j].isMine() == false){
      if (flagsPlaced[i][j] == -1){
        flagsPlaced[i][j] = 0;
        numFlags++;
      }
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
        }
      }
      return true;
    }
  return false;
  //should implement the maze spread method
}

void dig(int x, int y){ //reveals one square
  int i = (y-2*SIZE)/SIZE;
  int j = x/SIZE;
  if (isValid(x,y)){
    if (flagsPlaced[i][j] == -1){
      flagsPlaced[i][j] = 0;
      numFlags++;
    }
    if (field[i][j] == 0){
      board.reveal(i,j);
      field = board.getField();
    }
    else if (field[i][j] == -1){
      isWin = false; //checkpoint (for eric to test win screen)
      fill(0,0,255);
      stroke(255);
      circle(j*SIZE+SIZE/2, (i+2)*SIZE+SIZE/2, SIZE/2);
      endGame(); // to be implemented
    }
  }
}

void flag(int x, int y){ //marks one square
  int i = (y-2*SIZE)/SIZE;
  int j = x/SIZE;
  if (isValid(x,y)){
    if (flagsPlaced[i][j] == -1){
      flagsPlaced[i][j] = 0;
      numFlags++;
    }
    else if (numFlags !=0 && board.getBoard()[i][j].getIsHidden()){
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
  if (!isWin){
    if(popUp){
      stroke(255,0,0);
      strokeWeight(10);
      fill(#7DCB79);
      rect(width/2-300,height/2-100,600,200,40);
      fill(255);
      stroke(0);
      strokeWeight(6);
      rect(width/2+10,height/2-15,275,100,25);
      rect(width/2-285,height/2-15,275,100,25);
      fill(0);
      textSize(75);
      text("YOU LOSE!!!", width/2-190,height/2-25);
      textSize(40);
      text("return to menu",width/2+20,height/2+45);
      text("replay",width/2-200,height/2+45);
      strokeWeight(1);
    }
  }
  else{
    if(popUp){
      stroke(0,0,255);
      strokeWeight(10);
      fill(#7DCB79);
      rect(width/2-300,height/2-100,600,200,40);
      fill(255);
      stroke(0);
      strokeWeight(6);
      rect(width/2+10,height/2-15,275,100,25);
      rect(width/2-285,height/2-15,275,100,25);
      fill(0);
      textSize(75);
      text("YOU WIN!!!", width/2-165,height/2-25);
      textSize(40);
      text("return to menu",width/2+20,height/2+45);
      text("replay",width/2-200,height/2+45);
      strokeWeight(1);
    }
  }
  textSize(SIZE/2);
  fill(0);
  if(popUp)
  text("press 'enter' to remove popup", SIZE/2,SIZE*1.75);
  else text("press 'enter' to show popup", SIZE/2,SIZE*1.75);
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
        if((i+o) % (2*SIZE) != 0){
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
  text("Game#" +gameNumber, (cols-2)*SIZE, SIZE/2);
  int currentTime = millis()/1000 - startTime;
  if(gameEnd) text("Score: " + currentTime, (cols-2)*SIZE, SIZE*1.5);
  else text("Time: " + currentTime/60 + "m" + currentTime%60 + "s", (cols-3)*SIZE, SIZE*1.5);
  for(int i = 0; i<rows; i++){
    for(int j = 0; j<cols; j++){
      if (flagsPlaced[i][j] == -1){  // places flags in track
        stroke(255,0,0);
        fill(255,0,0);
        circle(j*SIZE+radius, (i+2)*SIZE+radius, radius);
      }
      int bombsNear = field[i][j];
      if (gameEnd && isWin){
        stroke(0);
        if(!(board.getBoard()[i][j].getIsMine())) fill(#7EC3FA);
        else fill(#7ED661);
        square(j*SIZE,(i+2)*SIZE,SIZE);
      }
      else
      if (bombsNear > 0){
        stroke(0);
        fill(#DBC8AC);
        square(j*SIZE,(i+2)*SIZE,SIZE);
        textSize(0.8*SIZE);
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
        text(bombsNear, j*SIZE+SIZE*0.3, (i+3)*SIZE-SIZE*0.2);
      }
      else if (bombsNear == -2){
        stroke(0);
        fill(#DBC8AC);
        square(j*SIZE,(i+2)*SIZE,SIZE);
      }
    }
  }
  textSize(SIZE/2);
  float shift = 255.0/(numMines/2);
  fill(510-shift*numFlags,0+shift*numFlags,0);
  if (gameEnd == true){
    fill(#4C9A2A);
  }
  text("Remaining Flags: "+numFlags + "/" + numMines,0.3*SIZE,0.6*SIZE);
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
          textSize(0.8*SIZE);
          text(board.getBoard()[i][j].getBombsNear(), j*SIZE+SIZE*0.3, (i+3)*SIZE-SIZE*0.2); //Press 'E' to reveal safe square w/ bombs nearby
        }
      }
    }
  }
}
