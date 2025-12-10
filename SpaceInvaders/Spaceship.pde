class Spaceship {
  
  int x,y;
  int dx;
  int size;
  boolean facing;
  
  Spaceship(int x, int y, int size, boolean facing){
    this.x = x;
    this.y = y;
    this.size = size;
    this.facing = facing;
  }
  
  Projectile shoot(){
    return new Projectile(x,y,facing);
  }
  
  void display(){
    fill(0);
    rect(x,y,size, size);
  }
}
  
