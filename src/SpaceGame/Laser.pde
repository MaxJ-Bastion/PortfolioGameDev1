class Laser {
  int x, y, w, h, speed;
  boolean nm;
  PImage l1;
  
  Laser(int x, int y) {
    nm = true;
  this.x = x;
  this.y = y;
  w = 50;
  h =50;
  speed = 5;
  if (c == false) {
 l1 = loadImage ("MilkLaser.png");
 nm = true;
  } else {
    l1 = loadImage ("chocolatelaser.png");
    nm = false;
  }
  }

  void display () {
    imageMode (CENTER);
    l1.resize (w,h);
  image (l1,x,y);
  }
  
  void move() {
  y-=speed;
  }
  
  boolean intersect (Rock r) {
    float d = dist(x,y,r.x,r.y);
    if (d<r.diam) {
        return true;
    } else {return false;}
  }
    boolean intersectO (Oven o) {
    float d = dist(x,y,o.x,o.y);
    if (d<o.diam/2) {
        return true;
    } else {return false;}
  }
    boolean reachedTop () {
      if (y<0-20) { 
    return true;
      } else {return false;}
  }
}
