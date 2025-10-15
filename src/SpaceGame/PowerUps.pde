class Power {
  int x, y, diam, speed;
  PImage p1;
  char type;

  Power () {
    x = int(random(width));
    y = -100;
    diam = int(100);
    speed = int(random (1, 10));
    if (random (10)>7) {
      p1 = loadImage ("ammo.png");
      type='a';
    } else if (random (10)>6.1) {
      p1 = loadImage ("health.png");
       type='h';
    } else if (random (10)>5.3){
      p1 = loadImage ("emptyglass.png");
       type='t';
    } else {
      p1 = loadImage ("chocolatemilk.png");
       type='c';
    }
  }
  void display() {
    imageMode(CENTER);
    p1.resize (diam, diam);
    image (p1, x, y);
  }

  void move() {
    y+=speed;
  }

  boolean reachedBottom () {
    if (y>height+100) {
      return true;
    } else {
      return false;
    }
  }
}
