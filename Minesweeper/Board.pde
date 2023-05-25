public class Board{
  private int[][] field;
  private Squares[][] board;
  private int mines;
  private int row;
  private int col;
  
  public Board(int numMines, int rows, int cols){
    row = rows;
    col = cols;
    mines = 0;
    float density = numMines*1.0/(rows*cols); //uses the desired numMines to create a density
    print(density);
    field = new int[row][col];
    board = new Squares[row][col];
    for (int i = 0; i < cols; i ++){
      for (int j = 0; j < rows; j++){
        float rand = random(0,1);
        if (rand < density){
          field[j][i] = -1; //bombspots are marked by -1
          board[j][i] = new Squares(true,0);
          mines++; //the real number of mines won't be exactly numMines but close
        }
        else{
//          field[i][j] = 0; //safespots are marked by -1
        }
      }
    }
  }
  public void setNeutral(){
    for(int i = 0; i<field.length; i++){
      for(int o = 0; o<field[0].length; o++){
        if(field[i][o] == 0){
          field[i][o] = sumAround(i, o, field);
        }
      }
    }
  }
  public int sumAround(int x, int y, int[][] grid){
    int sum = 0;
    if(x-1 > -1 && y-1 > -1 && grid[x-1][y-1] == -1) sum++;
    if(y-1 > -1 && grid[x][y-1] == -1) sum++;
    if(x+1 < grid.length && y-1 > -1 && grid[x+1][y-1] == -1) sum++;
    if(x-1 > -1 && grid[x-1][y] == -1) sum++;
    if(x+1 < grid.length && grid[x+1][y] == -1) sum++;
    if(x-1 > -1 && y+1 < grid[0].length && grid[x-1][y+1] == -1) sum++;
    if(y+1 > grid[0].length && grid[x][y+1] == -1) sum++;
    if(x+1 > grid.length && y+1 > grid[0].length && grid[x+1][y+1] == -1) sum++;
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
  
}
