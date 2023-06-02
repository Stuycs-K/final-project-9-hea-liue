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
    isHidden = true;
  }
  public boolean isMine(){
    return isMine;
  }
  public void setBomb(boolean isBomb){
    if (isBomb == true)
      isMine = true;
    else  
      isMine = false;
  }
  public void reveal(){
    isHidden = false;
  }
  public boolean getIsMine(){
    return isMine;
  }
  public int getBombsNear(){
    return bombsNear;
  }
  public boolean getIsHidden(){
    return isHidden;
  }
}
