public class Squares{
  private int bombsNear;
  private boolean isHidden;
  private boolean isMine;
  
  public Squares(){
  }
  public void hide(){
    
  }
  public boolean isMine(){
    return isMine;
  }
  public void explode(){
    if (isMine = true && isHidden == false){
//      endGame();
    }
  }
  public void setBomb(boolean isBomb){
    if (isBomb == true)
      isMine = true;
    else  
      isMine = false;
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
