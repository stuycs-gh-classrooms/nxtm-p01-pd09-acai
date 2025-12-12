class Block {
  
  int x, y;
  int size;
  int health;
  PVector[][] cracks;
  
  Block(int x, int y, int size, int health) {
    this.x = x;
    this.y = y;
    this.size = size;
    this.health = health;
    this.cracks = new PVector[health][4];
    for (int i=0; i<health; i++) {
    for (int j=0; j<4; j++) {
      cracks[i][j] = new PVector(int(random(size)), int(random(size)));
    }}
  }
  
  void display() {
    //block
    fill(#00FF00);
    rect(x, y, size, size);
    fill(0);
    circle(x+size/2, y+size, size);
    //cracks
    stroke(0);
    for (int i=0; i<cracks.length-health; i++) {
    for (int j=0; j<3; j++) {
      line(cracks[i][j].x, cracks[i][j].y, cracks[i][j+1].x, cracks[i][j+1].y);
    }}
  }
}
