
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
    return new Projectile(x,y,size/10,facing);
  }
  
  void display(){
    stroke(0);
    
    //body
    fill(#00FF00);
    triangle(x+0.5*size, y, x, y+size, x+size, y+size);
    fill(0);
    triangle(x+0.25*size, y+0.75*size, x, y+size, x+0.5*size, y+size);
    triangle(x+0.75*size, y+0.75*size, x+0.5*size, y+size, x+size, y+size);
    
    //gem
    fill(#00FFFF);
    ellipse(x+0.5*size, y+0.5*size, 0.2*size, 0.3*size);
    
    //arms
    fill(#00FF00);
    rect(x, y+0.5*size, size/10, size/2);
    rect(x+0.9*size, y+0.5*size, size/10, size/2);
  }
}
  
