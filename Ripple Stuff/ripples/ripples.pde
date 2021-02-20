int cols = 200;
int rows = 200;

float[][] cur; 
float[][] prev; 

float damping = 0.99;

void setup(){
  size(720, 480);
  cols = width;
  rows = height;
  cur = new float[cols][rows];
  prev = new float[cols][rows];
  for (int i = 250; i < 356; i++){
    for(int j = 1; j < rows - 1; j++){
      if(190 < j && j < 210){
        cur[i][j] = 0;
      }
      else{
        cur[i][j] = 255;
      }
    }
  }
      
}

void mousePressed(){
  cur[mouseX][mouseY] = 255;
}

void draw(){
  background(0);
  loadPixels();
  
  for (int i = 1; i < cols-1; i++){
    for(int j = 1; j < rows-1; j++){
      cur[i][j] = (
        prev[i-1][j] + 
        prev[i+1][j] + 
        prev[i][j-1] + 
        prev[i][j+1]) / 2 - 
        cur[i][j];
                    
      cur[i][j] = cur[i][j] * damping;
      int index = i + j * cols;
      pixels[index] = color(cur[i][j] * 255);
    }
  }
  
  updatePixels();
  float[][] temp = prev;
  prev = cur;
  cur = temp;

}
