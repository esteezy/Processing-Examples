let x = 0;
let y = 0;

function setup() {
  createCanvas(640, 480);
  background(0);
}


function draw() {
  stroke(100);
  if(random(1) < 0.5){
    line(x, y, x+10, y+10);
    line(x+10, y+10, x, y);
  }
  else{
    line(x, y+10, x+10, y);
    line(x+10, y, x, y+10);
  }
  x = x + 10;
  if(x > width){
    x = 0;
    y = y + 10;
  }
}
