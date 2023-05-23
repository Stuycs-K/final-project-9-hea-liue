public class Board{
  int[][] displayField;
  Squares[][] board;
  int bomb;
  int row;
  int col;
  
  public Board(int numBombs, int rows, int cols){
    bomb = numBombs;
    row = rows;
    col = cols;
    displayField = new int[row][col];
  }
  
}
