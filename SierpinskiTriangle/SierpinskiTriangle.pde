class Point {
  public int x, y;
  Point(int _x, int _y) {
    x = _x;
    y = _y;
  }
}

// declares the level of recursion. defining in setup()
int level;

void setup() {  
  level = 7;
}

void settings() {
  size(1200, 900);
  // fullScreen();  
}

void draw() {
  background(255);
  
  Point a = new Point(0, height - 1); // bottom left corner
  Point b = new Point(width, height - 1); // bottom right corner
  Point c = new Point(width / 2, 0); // top middle corner
  
  // drawing starting triangle
  triangle(a, b, c);
  
  // parse corner points of parent triangle
  drawTriangles(a, b, c, level);
  noLoop(); // Draw only once
  
  // Save the output as an image and quit
  save("SierpinskiTriangle.png");
  // Activate exit() in case you plan to create big pictures as it after rendering doesn't show easily if it's done or not
  // exit(); 
}

void drawTriangles(Point a, Point b, Point c, int level) {
  if (level <= 0) return;
    
  level -= 1; // decrease level as it is in a triangle
    
  // upside down triangle in parent triangle
  triangle(c.x, b.y, (c.x + b.x) / 2, (c.y + a.y) / 2, (a.x + c.x) / 2, (c.y + a.y) / 2);
  
  // draw three new triangles
  // down left
  drawTriangles(
    new Point(a.x, a.y),
    new Point(c.x, b.y),
    new Point((a.x + c.x) / 2, (c.y + a.y) / 2),
    level);
    
  // down right
  drawTriangles(
    new Point(c.x, b.y),
    new Point(b.x, b.y),
    new Point((c.x + b.x) / 2, (c.y + a.y) / 2),
    level);
  
  // upper center
  drawTriangles(
    new Point((a.x + c.x) / 2, (c.y + a.y) / 2),
    new Point((c.x + b.x) / 2, (c.y + a.y) / 2),
    new Point(c.x, c.y),
    level);
}

// Just an overloaded method. Might be obsolete as rare as it's used
void triangle(Point a, Point b, Point c) {
  triangle(a.x, a.y, b.x, b.y, c.x, c.y);
}
