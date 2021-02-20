function setup(){
  createCanvas(640, 640);
  pixelDensity(1);

}

var minVal = -2.5;
var maxVal = 2.5;
var times = 0;
var maxIterations = 100;

function draw() {
  mandelbrot();
}


function mandelbrot(){
  loadPixels();
 
  for(var x = 0; x < width; x++){
    for(var y = 0; y < height; y++){
      
      var a = map(x, 0, width, minVal, maxVal);
      var b = map(y, 0, height, minVal, maxVal);
      minVal += 0.00000001;
      maxVal -= 0.00000002;
      
      var ca = a;
      var cb = b;
      var n = 0;
      while (n < maxIterations) {
        var newa = a*a - b*b;
        var newb = 2 * a * b;
        
        a = newa + ca;
        b = newb + cb;
        
        if(abs(a + b) > 16){
          break;
        }
        n++;
      }
      var bright = map(n, 0, maxIterations, 0, 255);
      if (n == maxIterations){
        brightness = 0;
      }

      var pix = (x + y * width) * 4;
      pixels[pix + 0] = bright;
      pixels[pix + 1] = bright; 
      pixels[pix + 2] = bright;
      pixels[pix + 3] = 255;
      
    }
  }
  updatePixels();
}
