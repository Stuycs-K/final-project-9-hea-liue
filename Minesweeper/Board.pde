public class Board{
  int[][] field;
  Squares[][] board;
  int mines;
  int row;
  int col;
  
  public Board(int numMines, int rows, int cols){
    row = rows;
    col = cols;
    mines = 0;
    float density = mines/(rows*cols); //uses the desired numMines to create a density
    field = new int[row][col];
    for (int i = 0; i < cols; i ++){
      for (int j = 0; j < rows; j++){
        float rand = random(0,1);
        if (rand < density){
          field[i][j] = -1;
          mines++; //the real number of mines won't be exactly numMines but close
        }
        else{
          field[i][j] = 0;
        }
      }
    }
  }
  
}
