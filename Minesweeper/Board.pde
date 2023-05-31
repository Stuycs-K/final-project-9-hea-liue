public class Board{
  private int[][] field;
  private Squares[][] board;
  private int mines;
  private int row;
  private int col;
  private int squaresRevealed;
  
  public Board(int numMines, int rows, int cols){
    row = rows;
    col = cols;
    mines = numMines;
    field = new int[row][col];
    board = new Squares[row][col];
    setBomb();
    sumSquare();
  }
  public void setBomb(){
    while(mines > 0){
      int xran = (int)(random(0,col));
      int yran = (int)(random(0,row));
      if(field[yran][xran] == 0){
        field[yran][xran] = -1;
        board[yran][xran] = new Squares(true,0);
        mines--;
      }
    }
  }
  public void reveal(int row, int col){
    int bombsNear = board[row][col].getBombsNear();
    if (board[row][col].getBombsNear() == 0){
      bombsNear =  -2;
    }
    field[row][col] = bombsNear;
    board[row][col].reveal();
    squaresRevealed++;
  }
  public void sumSquare(){
    for(int i = 0; i<field.length; i++){
      for(int o = 0; o<field[0].length; o++){
        if(field[i][o] == 0){
          board[i][o] = new Squares(false,checkSquares(i, o));
        }
      }
    }
  }
  public int checkSquares(int x, int y){
    int sum = 0;
    if(x-1 > -1){
      if(y-1 > -1 && field[x-1][y-1] == -1) sum++;
      if(field[x-1][y] == -1) sum++;
      if(y+1 < field[0].length && field[x-1][y+1] == -1) sum++;
    }
    if(x+1 < field.length){
      if(y-1 > -1 && field[x+1][y-1] == -1) sum++;
      if(field[x+1][y] == -1) sum++;
      if(y+1 < field[0].length && field[x+1][y+1] == -1) sum++;
    }
    if(y+1 < field[0].length && field[x][y+1] == -1) sum++;
    if(y-1 > -1 && field[x][y-1] == -1) sum++;
    return sum;
  }
  public int minesAround(){
    return 0;
  }
  public Squares[][] getBoard(){
    return board;
  }
  public int[][] getField(){
    return field;
  }
  public int getMines(){
    return mines;
  }
  public int getSquaresRevealed(){
    return squaresRevealed;
  }
}
