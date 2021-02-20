
float CameraX;
float CameraY;
float x = 0.01;
float y = 2;
float z = -1;
float rotate = 0;
float sigma = 10;
float rho = 28;
float beta = 11/3;

float turns = 0;

ArrayList<PVector> points = new ArrayList<PVector> ();

void setup(){
  size(800, 600, P3D);
  colorMode(HSB);
  //cam = new PeasyCam(this, 500);
  CameraX = width/2;
  CameraY = height/2;
  
}


void draw(){
  
  background(0);
  
  float dt = 0.01;
  
  float dx = (sigma * (y - x)) * dt;
  x = x + dx;
  
  float dy = (x * (rho - z) - y) * dt;
  y = y + dy;
  
  float dz = ((x * y) - (beta * z)) * dt;
  z = z + dz;
  
  points.add(new PVector(x,y,z));
  
  translate(width-400, height-300);
  scale(3);
  strokeWeight(0.1);
  noFill();

  float hu = 0;
  beginShape();
  for(PVector v: points){
    stroke(hu, 255, 255);
    vertex(v.x, v.y, v.z);
    //PVector offset = PVector.random3D();
    //offset.mult(0.1);
    //v.add(offset);
    hu += 0.1;
    if(hu>255){
      hu = 0;
    }
  }
  endShape();
  println(x, y, z);
}
