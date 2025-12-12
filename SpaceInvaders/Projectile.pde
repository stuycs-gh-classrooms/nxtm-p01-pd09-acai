class Projectile {
  
  int x,y;
  int size;
  boolean facing;
  
  Projectile(int x, int y, int size, boolean facing){
    this.x = x;
    this.y = y;
    this.size = size;
    this.facing = facing;
  }
  
  void display(){
    fill(255);
    rect(x, y, size, 5*size);
  }
  
  boolean collide(Spaceship s) {
    if (s.x - x <= size && s.x - x >= -s.size){
      if (s.y - y <= 5*size && s.y - y >= -s.size){
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
  
  boolean collide(Block b) {
    if (b.x - x <= size && b.x - x >= -b.size){
      if (b.y - y <= 5*size && b.y - y >= -b.size){
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
}    
