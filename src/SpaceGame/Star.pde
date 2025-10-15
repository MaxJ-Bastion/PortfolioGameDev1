class Star {
  int x, y, diam, speed;

  Star() {
    x = int (random (width));
    y = -10;
    diam = int (random (1, 5));
    speed = int (random (1, 30));
  }

  void display () {
    fill (random (150, 225));
    ellipse (x, y, diam, diam);
  }

  void move() {
    y+=speed;
  }

  boolean reachedBottom () {
    if (y> height+10) {
      return true;
    } else {
      return false;
    }
  }
}
