// declares the level of recursion. defined in setup()
int level;

void setup() {
  level = 5;
}

void settings() {
  size(729, 729);
}

void draw() {
  // init recursion of sierpinski carpet
  drawSierpinskiCarpet(0, 0, width, height, level);
  
  // draw only once
  noLoop();
  
  // Save the output as an image and quit
  save("SierpinskiCarpet_Level" + level + "_" + width + "x" + height + ".png");
  // Activate exit() in case you plan to create big pictures as it after rendering doesn't show easily if it's done or not
  exit(); 
}

void drawSierpinskiCarpet(int x, int y, int _width, int _height, int levels) {
  
  if (levels <= 0) return;
  levels -= 1;
  
  if (_width > 2 && _height > 2) {
    int newWidth = _width / 3;
    int newHeight = _height / 3;
    
    fillRect(x + newHeight, y + newWidth, newHeight, newWidth);
    
    for (int k = 0; k < 9; k++) {
      int i = k / 3;
      int j = k % 3;
      drawSierpinskiCarpet(x + i * newWidth, y + j * newHeight, newWidth, newHeight, levels);
    }    
  }
}

void fillRect(int x, int y, int w, int h) {
  fill(0);
  rect(x, y, w, h);
  noFill();
}
