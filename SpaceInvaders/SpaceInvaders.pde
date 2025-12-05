Spaceship player;

Spaceship[][] enemies;
int row, col;

Projectile[] projectiles;
int max_projectiles;

boolean running;

void setup() {
  running = false;
  row = 3;
  col = 5;
  max_projectiles = 100;
  
  restart();
}

void draw() {
  if (running) {
    for (int i=0; i<col; i++) {
      for (int j=0; j<row; j++) {
        enemies[i][j].move();
      }
    }
  } else {
    ;
  }
}

void restart() {
  player = new Spaceship();
  
  enemies = new Spaceship[row][col];
  for (int i=0; i<col; i++) {
    for (int j=0; j<row; j++) {
      enemies[i][j] = new Spaceship();
    }
  }
 
  projectiles = new Projectile[max_projectiles];
}
