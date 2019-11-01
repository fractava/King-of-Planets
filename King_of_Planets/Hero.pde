class Hero{
  int teamId;
  int lastFirst = 0;
  int coolDown;
  int w = 12;
  int h = 12;
  PVector position;
  PVector direction = new PVector(0,0);
  PImage cover;
  PImage skin;
  float speed;
  int maxHealth;
  int health;

  void update(){
    if(health >= 0){
      die();
    }
    if(health > maxHealth){
      health = maxHealth;
    }
  }

  void spawn(){
    if(teamId == 0){
      position.x = -128+16;
      position.y = 0;
    }else{
      position.x = 128-16;
      position.y = 0;
    }
  }

  void die(){

  }

  void control(){
    if(mousePressed){
      if(frameCount-lastFirst >= coolDown){
        first();
      }
    }

    direction = new PVector(mouseX-width/2, mouseY-height/2);

    if(game.match.controls[0] && !game.match.controls[1] && !game.match.controls[3]){
      direction.setMag(speed);
      if(game.match.currentMap.collides(position.add(direction), w, h)){
        position.sub(direction);
      }
    }
    if(game.match.controls[1]){
      direction.setMag(speed);
      if(game.match.currentMap.collides(position.add(new PVector(direction.x, direction.y).rotate(-HALF_PI)), w, h)){
        position.sub(new PVector(direction.x, direction.y).rotate(-HALF_PI));
      }
    }
    if(game.match.controls[2] && !game.match.controls[1] && !game.match.controls[3]){
      direction.setMag(speed);
      if(game.match.currentMap.collides(position.sub(direction), w, h)){
        position.add(direction);
      }
    }
    if(game.match.controls[3]){
      direction.setMag(speed);
      if(game.match.currentMap.collides(position.add(new PVector(direction.x, direction.y).rotate(HALF_PI)), w, h)){
        position.sub(new PVector(direction.x, direction.y).rotate(HALF_PI));
      }
    }
  }

  void addHealth(int amount){
    health+=amount;
  }

  void first(){

  }

  void show(){
    pushMatrix();
    pushStyle();
    rectMode(CENTER);
    noFill();
    if(teamId == 0){
      stroke(#7b004b);
    }else{
      stroke(#ff5400);
    }
    strokeWeight(1);
    rect(position.x,position.y,w,h);
    imageMode(CENTER);
    translate(position.x,position.y);
    rotate(HALF_PI+direction.heading());
    image(skin,0,0,16,16);
    popStyle();
    popMatrix();
  }
}
