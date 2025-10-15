class Rock {
  int x, y, diam, speed;
  PImage r1;

  Rock () {
    if (boss == false) {
    x = int(random(width));
    y = -100;} else {
      x= oven.x;
      y=oven.y;
    }
    
    diam = int(random (30, 120));
    speed = int(random (1, 10));
    if (random (10)>7.5) {
      r1 = loadImage ("ChipRock.png");
    } else if (random (10)>6.6) {
      r1 = loadImage ("SnickerRock.png");
    } else if (random (10)>5) {
      r1 = loadImage ("SugarRock.png");
    } else {
      r1 = loadImage ("OreoRock.png");
    }
  }
  void display() {
    imageMode(CENTER);
    r1.resize (diam, diam);
    image (r1, x, y);
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
