Spaceship player;

Spaceship[][] enemies;
int row, col;

Projectile[] projectiles;
int max_projectiles;

boolean running;

void setup() {
  size(1000,500);
  running = false;
  row = 3;
  col = 5;
  max_projectiles = 100;
  
  restart();
}

void draw() {
  background(255);
  if (running) {
    player.display();
    for (int i=0; i<col; i++) {
      for (int j=0; j<row; j++) {
        enemies[i][j].display();
      }
    }
  } else {
    ;
  }
}

void restart() {
  player = new Spaceship(width/2, height - 100, true);
  
  enemies = new Spaceship[col][row];
  for (int i=0; i<col; i++) {
    for (int j=0; j<row; j++) {
      enemies[i][j] = new Spaceship(i * (width/col), j * ((height/2)/row), false );
    }
  }
 
  projectiles = new Projectile[max_projectiles];
}

void keyPressed(){
  if (keyCode == BACKSPACE){
    running = false;
  } else if (keyCode == ENTER){
    running = true;
  }
}

  
