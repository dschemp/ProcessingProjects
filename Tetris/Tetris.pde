PImage I_Block, J_Block, L_Block, O_Block, S_Block, T_Block, Z_Block;

int rowCounter;
int scale;

void settings() {
  I_Block = loadImage("Tetrominos/I.png");
  J_Block = loadImage("Tetrominos/J.png");
  L_Block = loadImage("Tetrominos/L.png");
  O_Block = loadImage("Tetrominos/O.png");
  S_Block = loadImage("Tetrominos/S.png");
  T_Block = loadImage("Tetrominos/T.png");
  Z_Block = loadImage("Tetrominos/Z.png");
  scale = 3;
  
  size(800, 600);
}

void setup() {
}

void draw() {
  image(I_Block, 0, I_Block.height * rowCounter++);
  delay(1000);
}
