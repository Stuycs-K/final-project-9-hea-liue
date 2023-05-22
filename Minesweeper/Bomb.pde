public class Bomb{
  private int amount = 10;
  
  public void bombPlacement(){
    while(amount > 0){
      int randY = (int)(Math.random()*10)+1;
      int randX = (int)(Math.random()*10)+1;
      //have Board create an array and basically check board[x][y] == 0
      //if == 0 then set that as 1
    }
  }
  
}
