class Spaceship {
  
  int x,y;
  int size;
  boolean facing;
  
  Spaceship(int x, int y, int size, boolean facing){
    this.x = x;
    this.y = y;
    this.size = size;
    this.facing = facing;
  }
  
  Projectile shoot(){
    return new Projectile(x,y,size/2,facing);
  }
  
  void display(){
    fill(0);
    rect(x,y,size, size);
  }
}
  
