static final int SIZE = 50;

void setup(){
  size(520,520);
  background(0);
  grid();
}

void grid(){
  int x = 0;
  stroke(255);
  for(int i = 110; i<height-10; i+=SIZE){
    for(int o = 10; o<width-10; o+=SIZE){
      if(x/10%2 == 0){
        if(x%2 == 0){
          fill(#85E357);
        }
        else fill(#71C14A);
      }
      else{
        if(x%2 == 0){
          fill(#71C14A);
        }
        else fill(#85E357);
      }
      x++;
      square(o,i,SIZE);
    }
  }
}
