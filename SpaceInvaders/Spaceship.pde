class Spaceship {
  
  int x,y;
  boolean facing;
  
  Spaceship(int x, int y, boolean facing){
    this.x = x;
    this.y = y;
    this.facing = facing;
  }
  
  void move(int dx, int dy){
    x += dx;
    y += dy;
  }
  
  void move(int dx){
    move(dx, 0);
  }
  
  Projectile shoot(){
    return new Projectile(x,y,facing);
  }
  
  void display(){
    fill(0);
    rect(x,y,50,50);
  }
}
  
