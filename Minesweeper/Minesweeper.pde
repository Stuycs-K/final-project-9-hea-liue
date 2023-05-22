static final int SIZE = 50;

void setup(){
  size(500,400);
  grid();
}

void grid(){
  background(0);
  boolean x = true;
  stroke(255);
  for(int i = 0; i<=height; i+=SIZE){
    for(int o = 0; o<=width; o+=SIZE){
      if(x){
        fill(#85E357);
        x = false;
      }
      else{
        fill(#71C14A);
        x = true;
      }
      square(o,i,SIZE);
    }
  }
}
