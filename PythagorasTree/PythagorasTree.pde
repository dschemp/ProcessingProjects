class Point {
  public int x, y;
  Point(int _x, int _y) {
    x = _x;
    y = _y;
  }
  
  int distanceTo(Point p) {
    int dx = x - p.x;
    int dy = y - p.y;
    
    return (int) sqrt( sq(dx) + sq(dy) );
  }
}

// declares the level of recursion. 
// defining in setup()
int level;

// base width of the tree. 
// defining in setup()
int baseWidth;

// activate skewing of the triangle.
// currently only the x part relative to length of the triangle base. for changes, see drawTree() -> skewX and skewY.
// activate in setup()
Boolean activateSkewing;

void setup() {
  level = 5;
  baseWidth = 100;
  activateSkewing = true;
}

void settings() {
  size(1200, 900);
  // fullScreen();
}

void draw() {
  background(255);
  
  // calc base points based on the initial tree width and width of the window
  Point lowerLeft = new Point((width / 2) - baseWidth / 2, height - 1);
  Point lowerRight = new Point((width / 2) + baseWidth / 2, height - 1);
  
  // draw text indicating the level of recursion and width x height
  fill(10);
  textSize(20);
  text("Pythagoras tree fractal", 30, 35);
  text("Level: " + level, 30, 75);
  text("Size (px): " + width + "x" + height, 30, 100);
  noFill();
  
  // begin drawing
  drawTree(lowerLeft, lowerRight, level);
  
  // draw only once
  noLoop();
  
  // Save the output as an image
  save("PythagorasTree.png");
  // Activate exit() in case you plan to create big pictures as it after rendering doesn't show easily if it's done or not
  // exit(); 
}

void drawTree(Point lowerLeft, Point lowerRight, int levels) {
  
  if (levels <= 0) return;
  
  levels -= 1;
  
  // get offset
  int dx = lowerRight.x - lowerLeft.x; // offset on x-axis
  int dy = lowerLeft.y - lowerRight.y; // offset on y-axis
  
  // draw square
  // uL --- uR
  // |       |
  // |       |
  // lL --- lR
  Point upperRight = new Point(lowerRight.x - dy, lowerRight.y - dx);
  Point upperLeft = new Point(lowerLeft.x - dy, lowerLeft.y - dx);
  
  rect(lowerLeft, lowerRight, upperLeft, upperRight);
  
  // draw triangle on top of the square
  //    tip
  //   /  \
  //  /    \
  // uL --- uR
  int skewX = 0, skewY = 0;
  
  if (activateSkewing) {
    skewX = (int)(upperLeft.distanceTo(upperRight) * 0);
    skewY = 0;
  }
  
  Point tip = new Point(
    (upperRight.x + upperLeft.x) / 2 - (dy / 2) + skewX,
    (upperRight.y + upperLeft.y) / 2 - (dx / 2) + skewY
  );
  
  fill(100);
  triangle(upperRight.x, upperRight.y, tip.x, tip.y, upperLeft.x, upperLeft.y);
  noFill();
  
  // branch to the left of the triangle
  drawTree(upperLeft, tip, levels);
  
  // branch to the right of the triangle
  drawTree(tip, upperRight, levels);
}

void rect(Point lL, Point lR, Point uL, Point uR) {
  fill(0);
  
  // rectMode(CORNERS);
  // rect(lL.x, lL.y, uR.x, uR.y);
  
  line(lL.x, lL.y, uL.x, uL.y);
  line(lL.x, lL.y, lR.x, lR.y);
  line(uR.x, uR.y, uL.x, uL.y);
  line(uR.x, uR.y, lR.x, lR.y);
  
  noFill();
}
