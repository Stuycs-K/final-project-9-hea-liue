public class Squares{
  private int bombsNear;
  private boolean isHidden;
  private boolean isMine;
  
  public Squares(boolean isMine, int bombsNear){
    if (isMine == true){
      this.isMine = isMine;
    }
    else {
      this.bombsNear = bombsNear;
    }
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
  public boolean getIsMine(){
    return isMine;
  }
  public int getBombsNear(){
    return bombsNear;
  }
  
  
}
