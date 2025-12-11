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
  
  void move(){
    if(facing){
      y -= size;
    } else {
      y += size;
    }
  }
  
  void display(){
    fill(0);
    circle(x,y,50);
  }
  
  boolean hit(Spaceship s){
    if (s.x - x <= 50 && s.x - x >= -150){
      if (s.y - y <= 50 && s.y - y >= -150){
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
    } 
}    
