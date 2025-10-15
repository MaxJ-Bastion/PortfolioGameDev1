// Maxwell Johnson | 17 Sept 2025 | SpaceGame
Spaceship s1;
Oven oven;
ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<Laser> lasers = new ArrayList<Laser>();
ArrayList<Star> stars = new ArrayList<Star>();
ArrayList<Power> pu = new ArrayList<Power>();
int death, score, rocksPassed, level, sc2,powertime,br;
PImage background;
boolean start, boss, c;
Timer rockTimer;
Timer powerTimer;
Timer chocolateTimer, brTimer;

void setup () {
  size (700,900);
  background = loadImage ("SpaceGameBackground.png");
  background.resize (width, height);
  background (background);
  s1 = new Spaceship();
  death = 1000;
  score = 0;
  rocksPassed= 0;
  powertime =500;
  rockTimer = new Timer(death);
  rockTimer.start();
  powerTimer = new Timer (powertime);
  chocolateTimer = new Timer (5000);
  br = 1001;
  brTimer = new Timer (br);
  start = true;
  boss = false;
  oven = new Oven();
  level = 0;
  sc2 = 0;
  c = false;
}

void draw () {
  if (start == true) {
    background (background);
    fill (1);
    textSize (10);
    text ("By: Maxwell Johnson", 40, height-10);
  } else {
    background (10, 10, 50);

    //Distribute Stars
    stars.add (new Star());

    //Display and Remove stars
    for (int i = 0; i < stars.size(); i++) {
      Star star = stars.get(i);
      star.display();
      star.move();
      if (star.reachedBottom()) {
        stars.remove(star);
        i--;
      }
      println("Stars :" +stars.size());
    }

    //controls rock distribution
  if  (boss == false) {
      if (rockTimer.isFinished()) {
        rocks.add(new Rock());
        rockTimer.start();
    }
  } else {
  if (brTimer.isFinished()) {
        rocks.add(new Rock());
        brTimer.start();
  }
  }
    //Rock adder (and remover) and mover
    for (int i = 0; i < rocks.size(); i++) {
      Rock rock = rocks.get(i);
      rock.display();
      rock.move();

      if (s1.intersect(rock)) {
        rocks.remove(rock);
        score+=rock.diam;
        sc2+=rock.diam;
        i--;
        s1.health-=rock.diam;
      }

      if (rock.reachedBottom()) {
        rocks.remove(rock);
        i--;
        rocksPassed+=1;
        s1.health-=75;
        s1.turretCount-=1;
        if (s1.turretCount ==0) {
        s1.turretCount =1;
        }
      }
      println("Rocks :" +rocks.size());
    }

    // Laser adder (and remover)
    for (int i = 0; i < lasers.size(); i++) {
      Laser laser = lasers.get(i);
      for (int j = 0; j<rocks.size(); j++) {
        Rock r = rocks.get(j);
        if (laser.intersect(r)) {
          //if (c == false){
          if (laser.nm == true) {
          lasers.remove(laser);}
          score+=r.diam;
          sc2+=r.diam;
          r.diam=r.diam/2;
          // r.resize(r.diam,r.diam);
          if (r.diam<25) {
            rocks.remove(r);
          }
        }
      }
      laser.display();
      laser.move();
      if (laser.reachedTop()) {
        lasers.remove(laser);
        i--;
      }
      println("Lasers: " +lasers.size());
      if (laser.intersectO(oven)) {
        if (laser.nm == false){
        lasers.remove(laser);
        oven.h-=1;
        }
      }
    }
    if (powerTimer.isFinished()) {
      pu.add(new Power());
      powertime = int(random (1000,5000));
      powerTimer = new Timer (powertime);
      powerTimer.start();
    }
    //Power adder (and remover) and mover
    for (int i = 0; i < pu.size(); i++) {
      Power power = pu.get(i);
      power.display();
      power.move();

      if (s1.intersectP(power)) {
        pu.remove(power);
        i--;
        if (power.type == 'a')
        {
          s1.laserCount+=50*s1.turretCount/2;
          s1.laserCount*=1.25;
        }
        if (power.type == 't') {
        
          s1.turretCount+=1;
          
        }
        if (power.type == 'h')
        {
          s1.health+=100;
        }
        if (power.type == 'c') {
          s1.cCount+=10*s1.turretCount/2;
        //c =true;
        //chocolateTimer.start();
        }
      }
      
      //if (chocolateTimer.isFinished()) {
      //c = false;
      //}

      if (power.reachedBottom()) {
        pu.remove(power);
        i--;
      }
      println("Powers :" +pu.size());
    }
    //rocky.display();
    //rocky.move();

    s1.display();
    s1.move(mouseX, mouseY);

    infoPanel();
    //   spaceShip(mouseX,mouseY);
    boss();
    end();
  }
}

//not useful. Built the spaceship

//void spaceShip(int x,int y) {
//  strokeWeight (0);
//  stroke (150,15,15);
//    fill (150,15,15);
//  rectMode (CENTER);
//  rect(x,y,20,80);
//  fill (100,15,15);
//  triangle(x,y-60,x-10,y-40,x+10,y-40);
//  stroke (15,15,200);
//  fill (15,15,200);
//    triangle(x+10,y,x+10,y+40,x+20,y+40);
//    triangle(x-10,y,x-10,y+40,x-20,y+40);
//    stroke (15,15,150);
//    fill (15,15,150);
//  ellipse(x,y-15, 10,10);
//}

void mousePressed() {
  if (mouseButton == LEFT) {
  if (s1.fire()) {
    if (s1.turretCount == 1) {
    lasers.add(new Laser(s1.x, s1.y ));
    s1.laserCount-=1;
    }
    if (s1.turretCount == 2) {
    lasers.add(new Laser(s1.x+15, s1.y ));
    lasers.add(new Laser(s1.x-15, s1.y ));
    s1.laserCount-=2;
    }
    if (s1.turretCount == 3) {
    lasers.add(new Laser(s1.x, s1.y-20 ));
    lasers.add(new Laser(s1.x+30, s1.y ));
    lasers.add(new Laser(s1.x-30, s1.y ));
    s1.laserCount-=3;
    }
    if (s1.turretCount == 4) {
    lasers.add(new Laser(s1.x+15, s1.y-20 ));
    lasers.add(new Laser(s1.x+45, s1.y ));
    lasers.add(new Laser(s1.x-15, s1.y-20 ));
    lasers.add(new Laser(s1.x-45, s1.y ));
    s1.laserCount-=4;
    }
    if (s1.turretCount >= 5) {
    lasers.add(new Laser(s1.x, s1.y-40 ));
    lasers.add(new Laser(s1.x+30, s1.y-20 ));
    lasers.add(new Laser(s1.x-30, s1.y-20 ));
    lasers.add(new Laser(s1.x-60, s1.y ));
    lasers.add(new Laser(s1.x+60, s1.y ));
    s1.laserCount-=5;
    }
  }
  } else if (mouseButton == RIGHT) {
    if (s1.fireC()) {
      c =true;
    if (s1.turretCount == 1) {
    lasers.add(new Laser(s1.x, s1.y ));
    s1.cCount-=1;
    }
    if (s1.turretCount == 2) {
    lasers.add(new Laser(s1.x+15, s1.y ));
    lasers.add(new Laser(s1.x-15, s1.y ));
    s1.cCount-=2;
    }
    if (s1.turretCount == 3) {
    lasers.add(new Laser(s1.x, s1.y-20 ));
    lasers.add(new Laser(s1.x+30, s1.y ));
    lasers.add(new Laser(s1.x-30, s1.y ));
    s1.cCount-=3;
    }
    if (s1.turretCount == 4) {
    lasers.add(new Laser(s1.x+15, s1.y-20 ));
    lasers.add(new Laser(s1.x+45, s1.y ));
    lasers.add(new Laser(s1.x-15, s1.y-20 ));
    lasers.add(new Laser(s1.x-45, s1.y ));
    s1.cCount-=4;
    }
    if (s1.turretCount >= 5) {
    lasers.add(new Laser(s1.x, s1.y-40 ));
    lasers.add(new Laser(s1.x+30, s1.y-20 ));
    lasers.add(new Laser(s1.x-30, s1.y-20 ));
    lasers.add(new Laser(s1.x-60, s1.y ));
    lasers.add(new Laser(s1.x+60, s1.y ));
    s1.cCount-=5;
    }
    c= false;
  }
  }
  start = false;
  
}

void infoPanel() {
  rectMode(CENTER);
  fill (127, 127);
  noStroke();
  textSize (15);
  rect(width/2, height-25, width, 50);
  fill (255);
  text ("Calories: " + score, 30, height-20);
  text ("Rocks Passed: "+ rocksPassed, 150, height-20);
  text ("Health:"+ s1.health, 275, height-20);
  text ("Ammo: "+s1.laserCount, 400, height-20);
  text ("Level: "+level, 500, height-20);
  text ("C. Ammo: "+s1.cCount, 600, height-20);
}

void end() {
  if (s1.health<0) {
    background (1);
    textAlign (CENTER);
    textSize (100);
    text ("Game Over", width/2, height/2);
    textSize(50);
    text ("Score: " + score, width/2, height/2 +50);
    textSize(35);
    if (score>15000) {
      text ("Rank: Obese", width/2, height/2 +100);
    } else if (score>10000) {
      text ("Rank: Rotund", width/2, height/2 +100);
    } else if (score> 5000) {
      text ("Rank: Portly", width/2, height/2 +100);
    } else if (score>3000) {
      text ("Rank: Dad Bod", width/2, height/2 +100);
    } else {
      text ("Rank: Anorexic Racing Jocky", width/2, height/2 +100);
    }

    noLoop();
  }
    if (oven.y>height+200) {
    background (1);
    textAlign (CENTER);
    textSize (100);
    text ("Game Over", width/2, height/2);
    textSize(50);
    text ("Calories: " + score, width/2, height/2 +50);
    textSize(35);
    if (score>15000) {
      text ("Rank: Obese", width/2, height/2 +100);
    } else if (score>10000) {
      text ("Rank: Rotund", width/2, height/2 +100);
    } else if (score> 5000) {
      text ("Rank: Portly", width/2, height/2 +100);
    } else if (score>3000) {
      text ("Rank: Dad Bod", width/2, height/2 +100);
    } else {
      text ("Rank: Anorexic Racing Jocky", width/2, height/2 +100);
    }

    noLoop();
  }
   if (level == 10) {
    background (255);
    fill (1);
    textAlign (CENTER);
    textSize (100);
    text ("You Win", width/2, height/2);
    textSize(50);
    text ("Score: " + score, width/2, height/2 +50);
    textSize(35);
    text ("Rank: Body shamed by Santa Claus", width/2, height/2 +100);

    noLoop();
  }
}

void boss() {
    oven.display();
    oven.move();
    if (level == 0){
    boss = true;}
  if (sc2 > level*500+1000 ) {
    br-=100;
    boss = true;
    oven.y=-200;
    oven.x = int (random (200,550));
    oven.display();
    oven.move();
    oven.speed = level;
    sc2=0;

  }
  if (oven.h <= 0) {
 oven.y=-1000;
 oven.speed= 0;
 level+=1;
 //s1.turretCount+=1;
 boss = false;
 sc2=0;
 oven.h=level*2;
 death-=100;
 if (level>8) {death = 0;}
 rockTimer = new Timer (death);
  }
}
//void hit () {
//float d = dist( rx,ry,lx,ly);

//}
