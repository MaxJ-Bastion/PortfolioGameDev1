class Spaceship {
  //Member Variables
  int x, y, w, health, laserCount, turretCount,cCount;
  PImage spaceship;


  //Constructor
  Spaceship() {
    x = width/2;
    y = height/2;
    w = 100;
    health = 1000;
    laserCount = 101;
    turretCount = 1;
    spaceship = loadImage ("spaceship.png");
    cCount =10;
  }

  //Member Methods
  void display() {
    imageMode (CENTER);
    image (spaceship, x, y);
    //strokeWeight (0);
    //stroke (150, 15, 15);
    //fill (150, 15, 15);
    //rectMode (CENTER);
    //rect(x, y, 20, 80);
    //fill (100, 15, 15);
    //triangle(x, y-60, x-10, y-40, x+10, y-40);
    //stroke (15, 15, 200);
    //fill (15, 15, 200);
    //triangle(x+10, y, x+10, y+40, x+20, y+40);
    //triangle(x-10, y, x-10, y+40, x-20, y+40);
    //stroke (15, 15, 150);
    //fill (15, 15, 150);
    //ellipse(x, y-15, 10, 10);
  }

  void move(int x, int y) {
    this.x = x;
    this.y = y;
  }

  boolean fire() {
    if (laserCount <= 0) {
      return false;
    } else {
      return true;
    }
  }
  
  boolean fireC() {
    if (cCount <= 0) {
      return false;
    } else {
      return true;
    }
  }

  boolean intersect (Rock r) {
    float d = dist(x, y, r.x, r.y);
    if (d<r.diam) {
      return true;
    } else {
      return false;
    }
  }
  boolean intersectP (Power power) {
    float d = dist(x, y, power.x, power.y);
    if (d<power.diam) {
      return true;
    } else {
      return false;
    }
  }
}
