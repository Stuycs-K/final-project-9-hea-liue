public class Board{
  int field[][];
  int bomb;
  int row;
  int col;
  
  public Board(int numBombs, int rows, int cols){
    bomb = numBombs;
    row = rows;
    col = cols;
    field = new int[row][col];
  }
  
}
