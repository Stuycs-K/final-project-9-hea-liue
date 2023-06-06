private int difficulty;
private boolean gameStart;

void setup(){
  gameStart = true;
  size(1000,1000);
  fill(#7DCB79);
  square(0,0,1000);
  fill(#61FF5A);
  rect(width/2-200,200,400,75,20);
  rect(width/2-150,350,300,75,20);
  rect(width/2-150,500,300,75,20);
  rect(width/2-150,650,300,75,20);
  textSize(50);
  fill(0);
  text("MINESWEEPER",width/2-160,255);
  text("EASY",width/2-55,405);
  text("MEDIUM",width/2-85,555);
  text("HARD",width/2-55,705);
}
void mousePressed(){
  int x = mouseX;
  int y = mouseY;
  if(gameStart){
    if(x >= width/2-150 && x <= width/2+150){
      if(y >= 350 && y <= 425){
        difficulty = 1;
        gameStart = false;
        size(100,100);
      }
    }
  }
}
