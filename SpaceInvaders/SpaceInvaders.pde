boolean running;
int health;
int score;

Spaceship player;
int psize;
int pspeed;

Spaceship[][] enemies;
int row, col;
int x, y;
int size;
int speed;
float shootrate;

Projectile[] projectiles;
int max_projectiles;

void setup() {
  size(1000,500);
  frameRate(5);
  background(0);
  
  running = false;
  health = 3;
  score = 0;
  
  psize = 20;
  pspeed = 10;
  
  row = 3;
  col = 5;
  x = 0;
  y = 0;
  size = 20;
  speed = 10;
  shootrate = 5.0 / (row*col);
  
  max_projectiles = 100;
}

void restart() {
  health = 3;
  score = 0;
  
  player = new Spaceship(width/2, height - 5*psize, psize, true);
  
  enemies = new Spaceship[col][row];
  for (int i=0; i<col; i++) {
  for (int j=0; j<row; j++) {
      enemies[i][j] = new Spaceship(x + i*(5*size), y + j*(3*size), size, false);
  }}
 
  projectiles = new Projectile[max_projectiles];
}

void draw() {
  background(0);
  
  display();
  if (running) {
    enemies_event();
    projectiles_event();
    if (health == 0) {
      running = false;
    }
  }
}

void display() {
  if (running) {
   //stats
   stroke(255);
   textSize(32);
   
   textAlign(LEFT, TOP);
   text("Score: " + str(score), 0, 0);
   textAlign(RIGHT, TOP);
   text("Lives: " + "@ ".repeat(health), width, 0);
   
   //player
   player.display();
   //enemies
   for (int i=0; i<col; i++) {
   for (int j=0; j<row; j++) {
     if (enemies[i][j] != null) {
       enemies[i][j].display();
     }
   }}
   //projectiles
   for (int z=0; z<max_projectiles; z++){
     if (projectiles[z] != null){
       projectiles[z].display();
     }
   }
  }
  //home screen
  else {
    textAlign(CENTER, CENTER);
    textSize(32);
    stroke(255);
    text("CLICK ENTER TO START", width/2, height/2);
  }
}

void enemies_event() {
  if ( (x+speed < 0) || ( (x+speed) + col*(5*size) > width ) ) { //move into wall?
  if ( (y+size) + row*(3*size) < height ) { //move past bottom?
    speed *= -1; //go other direction
    y += size; //move down
  }}
  else {
    x += speed; //move left/right
  }
  
  for (int i=0; i<col; i++) {
  for (int j=0; j<row; j++) {
    if (enemies[i][j] != null) {
      //movement
      enemies[i][j].x = x + i*(5*size);
      enemies[i][j].y = y + j*(3*size);
      //shoot
      if (shootrate > random(100)) { //shoot with shootrate% chance
        add_projectile(enemies[i][j].shoot());
      }
    }
  }}
}

void projectiles_event(){
  for (int z=0; z<max_projectiles; z++) {
  if (projectiles[z] != null) {
    //player projectile
    if (projectiles[z].facing) {
      //movement
      projectiles[z].y -= pspeed; //move up
      //collide with enemies
      for (int i=0; i<col; i++) {
      for (int j=0; j<row; j++) {
      if (enemies[i][j] != null) {
        if (projectiles[z].collide(enemies[i][j])) { //hit enemy?
          score ++; //add score
          enemies[i][j] = null; //delete enemy
          projectiles[z] = null; //delete projectile
          //end loop for projectile z
          i = col;
          j = row;
        }
      }}}
    }
    //enemy projectile
    else {
      //movement
      projectiles[z].y += pspeed; //move down
      //collide with player
      if (projectiles[z].collide(player)) {
        projectiles[z] = null; //delete projectile
        health --; //lose health;
      }
    }
  }}
}

void add_projectile(Projectile p) {
  for (int z=0; z<max_projectiles; z++) {
    if (projectiles[z] == null) {
      projectiles[z] = p; //add projectile
      z = max_projectiles; //end loop
    }
  }
}
      
void keyPressed() {
  //pause/start
  if (keyCode == BACKSPACE) {
    running = false;
  } else if (keyCode == ENTER) {
    running = true;
    restart();
  }
  
  if (running) {
    //movement
    if (keyCode == RIGHT){
      if (player.x + psize + pspeed < width) {
        player.x += pspeed;
      }
    } else if (keyCode == LEFT){
      if (player.x + pspeed > 0) {
        player.x -= pspeed;
      }
    }
    //shoot
    if (key == ' ') {
      add_projectile(player.shoot());
    }
  }
}
  
