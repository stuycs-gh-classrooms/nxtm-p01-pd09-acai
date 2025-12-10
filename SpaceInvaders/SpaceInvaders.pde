Spaceship player;
int psize;
int pspeed;

Spaceship[][] enemies;
int row, col;
int size;
int speed;

Projectile[] projectiles;
int max_projectiles;

boolean running;

void setup() {
  size(1000,500);
  frameRate(5);
  running = false;
  
  psize = 50;
  pspeed = 10;
  
  row = 3;
  col = 5;
  size = 50;
  speed = 10;
  
  max_projectiles = 100;
  
  restart();
}

void draw() {
  background(255);
  
  display();
  move_enemies();
}

void display() {
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

void move_enemies() {
  int x = enemies[0][0].x;
  int y = enemies[0][0].y;
  
  if (x+speed < 0 || (x+speed)+col*(2*size) > width) {
    speed *= -1;
    for (int i=0; i<col; i++) {
      for (int j=0; j<row; j++) {
        enemies[i][j].y += size;
      }
    }
  } else {
    for (int i=0; i<col; i++) {
      for (int j=0; j<row; j++) {
        enemies[i][j].x += speed;
      }
    }
  }
}
      
void restart() {
  player = new Spaceship(width/2, height - psize, psize, true);
  
  enemies = new Spaceship[col][row];
  for (int i=0; i<col; i++) {
    for (int j=0; j<row; j++) {
      enemies[i][j] = new Spaceship(i*(2*size), j*(2*size), size, false);
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
  if (running) {
    //Player movement
    if (keyCode == RIGHT){
      player.x += pspeed;
    } else if (keyCode == LEFT){
      player.x -= pspeed;
    }
    
  //Player shoot
    if (key == ' '){
      player.shoot();
    }
  }

}

  
