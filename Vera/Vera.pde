color[] colArr = {
  color(255, 255, 255),
  color(200, 5, 20),
  color(55, 188, 25),
  color(15, 35, 250),
  color(125, 235, 250),
  color(240, 245, 15),
  color(160, 60, 235)
};

int grid = 150;
int margin = 150;

void setup() {
  size(800, 800);
  noLoop();
}

void draw() {
  background(15, 20, 30);
  noFill();
  stroke(255);
  float d = 60;
  

  for(int i = margin; i<=width-margin; i += grid){
    for(int j = margin; j<=height-margin; j+= grid){
      
      int colArrNum = (int)random(7);
      stroke(colArr[colArrNum]);
      strokeWeight(3);
      for(int num = 0; num < 7; num++){
        float x1 = -random(d);
        float y1 = -random(d);
        float x2 = random(d);
        float y2 = -random(d);
        float x3 = random(d);
        float y3 = random(d);
        float x4 = -random(d);
        float y4 = random(d);
  
        pushMatrix();
        translate(i, j);
        quad(x1, y1, x2, y2, x3, y3, x4, y4);
        popMatrix();
      }
    }
  }
}

void keyPressed() {
  if(key == ' ') redraw();
}
