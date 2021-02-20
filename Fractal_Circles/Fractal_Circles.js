function setup() {
  createCanvas(640, 480);
}


function draw() {
  background(0);
  stroke(255);
  noFill();
  drawCircle(300, 200, 300);
  
}

function drawCircle(x, y, d){
  ellipse(x, y, d);
  if(d > 2){
    drawCircle(x + d * 0.5, y, d * 0.5);
    drawCircle(x - d * 0.5, y, d * 0.5);
    drawCircle(x, y + d * 0.5, d * 0.5);
  }

  
}
  
