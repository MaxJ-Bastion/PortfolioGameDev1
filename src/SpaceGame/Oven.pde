class Oven {
  int x, y, diam, speed, xspeed, h;
  PImage o1;

  Oven () {
    x = int (random (200,550));
    y = -200;
    diam = 300;
    speed = int(random (1, 2));
    xspeed = int(random (1, 5));
    o1 = loadImage("oven.png");
    h = 3;
  }
  void display() {
    imageMode(CENTER);
    o1.resize(diam, diam);
    image(o1, x, y);
  }

  void move() {
    y+=speed;
    x+=xspeed;
    if (x>width-diam/2 || x<0+diam/2) {
      xspeed = -1 * xspeed;
    }
  }

  boolean reachedBottom () {
    if (y>height+100) {
      return true;
    } else {
      return false;
    }
  }
}
