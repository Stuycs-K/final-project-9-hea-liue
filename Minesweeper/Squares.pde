public class Squares{
  private int bombsNear;
  private boolean isHidden;
  private boolean isBomb;
  
  public Squares(){
  }
  public void hide(){
    
  }
  public boolean isBomb(){
    return isBomb;
  }
  public void explode(){
    if (isBomb = true && isHidden == false){
//      endGame();
    }
  }
/*    public void bombPlacement(){
    while(bomb > 0){
      int randY = (int)(Math.random()*10)+1;
      int randX = (int)(Math.random()*10)+1;
      //have Board create an array and basically check board[x][y] == 0
      //if == 0 then set that as 1
    }
  } */
  
}
