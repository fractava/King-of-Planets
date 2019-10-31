abstract class Entity{
  int teamId;
  PVector position;
  int ownerId;

  void update(){

  }

  void show(){

  }
}

class Admiral_Oculus_Shot extends Entity{
  PVector direction;
  float speed;

  Admiral_Oculus_Shot(int newOwnerId, int newTeamId, PVector startPosition, PVector startDirection){
    speed = 8;
    ownerId = newOwnerId;
    teamId = newTeamId;
    position = new PVector(startPosition.x, startPosition.y);
    direction = new PVector(startDirection.x, startDirection.y);
    direction.setMag(speed);
  }

  void update(){
    position.add(direction);

    for(int i = 3-teamId*3; i < 6-teamId*3; i++){
      if(pointRect(position.x, position.y, game.match.players[i].position.x, game.match.players[i].position.y, game.match.players[i].w, game.match.players[i].h)){
        game.match.players[i].addHealth(-70);
        game.match.players[ownerId].entities.remove(this);
      }
    }

    if(game.match.currentMap.collides(position,2,2)){
      game.match.players[ownerId].entities.remove(this);
    }
  }

  void show(){
    pushStyle();
    noStroke();
    fill(0);
    rectMode(CENTER);
    rect(position.x, position.y, 2, 2);
    popStyle();
  }
}

class Ashas_Fire extends Entity{
  int startFrame;
  int duration = 15;
  PVector direction;
  float speed = 0.7;
  PImage texture;

  Ashas_Fire(int newOwnerId, int newTeamId, PVector startPosition, PVector startDirection){
    ownerId = newOwnerId;
    teamId = newTeamId;
    startFrame = frameCount;
    texture = loadImage("Fire.png");
    position = startPosition;
    direction = startDirection;
  }

  void update(){
    for(int i = 3-teamId*3; i < 6-teamId*3; i++){
      if(rectRect(position.x, position.y, 14, 14, game.match.players[i].position.x, game.match.players[i].position.y, game.match.players[i].w, game.match.players[i].h)){
        game.match.players[i].addHealth(-2);
      }
    }

    direction.setMag(speed);
    position.add(direction);

    if(frameCount - startFrame > duration){
      game.match.players[ownerId].entities.remove(this);
    }

    if(game.match.currentMap.collides(position,14,14)){
      game.match.players[ownerId].entities.remove(this);
    }
  }

  void show(){
    pushStyle();
    imageMode(CENTER);
    image(texture, position.x, position.y, 16,16);
    popStyle();
  }
}

class Athon_Orb extends Entity{
  PVector direction;
  float speed;

  Athon_Orb(int newOwnerId, int newTeamId, PVector startPosition, PVector startDirection){
    speed = 4;
    ownerId = newOwnerId;
    teamId = newTeamId;
    position = new PVector(startPosition.x, startPosition.y);
    direction = new PVector(startDirection.x, startDirection.y);
    direction.setMag(speed);
  }

  void update(){
    position.add(direction);

    for(int i = teamId*3; i < 3+teamId*3; i++){
      if(i != ownerId && rectRect(position.x, position.y, 2, 2, game.match.players[i].position.x, game.match.players[i].position.y, game.match.players[i].w, game.match.players[i].h)){
        game.match.players[i].addHealth(15);
        game.match.players[ownerId].addHealth(5);
        game.match.players[ownerId].entities.remove(this);
      }
    }

    if(game.match.currentMap.collides(position,3,3)){
      game.match.players[ownerId].entities.remove(this);
    }
  }

  void show(){
    pushStyle();
    noStroke();
    fill(#ffdf7d);
    rectMode(CENTER);
    rect(position.x, position.y, 3, 3);
    popStyle();
  }
}

class Burac_Fire extends Entity{
  int radius = 11;
  PImage texture;

  Burac_Fire(int newOwnerId, int newTeamId, PVector startPosition){
    ownerId = newOwnerId;
    teamId = newTeamId;
    position = new PVector(startPosition.x, startPosition.y);
    texture = loadImage("Fire Circle.png");
  }

  void update(){
    position = game.match.players[ownerId].position;
    radius++;
    for(int i = 3-teamId*3; i < 6-teamId*3; i++){
      if(circleRect(position.x, position.y, radius/2, game.match.players[i].position.x, game.match.players[i].position.y, game.match.players[i].w, game.match.players[i].h)){
        game.match.players[i].addHealth(-6);
      }
    }
    if(radius >= 24){
      game.match.players[ownerId].entities.remove(this);
    }
  }

  void show(){
    pushStyle();
    imageMode(CENTER);
    image(texture,position.x,position.y,radius,radius);
    popStyle();
  }
}

class Kinetic_Shot extends Entity{
  float speed;
  PVector direction;

  Kinetic_Shot(int newOwnerId, int newTeamId, PVector startPosition, PVector startDirection){
    speed = 5;
    ownerId = newOwnerId;
    teamId = newTeamId;
    position = new PVector(startPosition.x, startPosition.y);
    direction = new PVector(startDirection.x, startDirection.y);
    direction.setMag(speed);
  }

  void update(){
    position.add(direction);

    for(int i = 3-teamId*3; i < 6-teamId*3; i++){
      if(rectRect(position.x, position.y, 2, 2, game.match.players[i].position.x, game.match.players[i].position.y, game.match.players[i].w, game.match.players[i].h)){
        game.match.players[i].addHealth(-10);
        game.match.players[ownerId].addHealth(10);
        game.match.players[ownerId].entities.remove(this);
      }
    }
    if(game.match.currentMap.collides(position,2,2)){
      game.match.players[ownerId].entities.remove(this);
    }
  }

  void show(){
    pushStyle();
    noStroke();
    fill(#ff3318);
    if(int(frameCount/3)%2 == 0){
      fill(#8aff00);
    }
    rectMode(CENTER);
    rect(position.x, position.y, 2, 2);
    popStyle();
  }
}

class Vrachos_Shot extends Entity{
  PVector direction;
  float speed;

  Vrachos_Shot(int newOwnerId, int newTeamId, PVector startPosition, PVector startDirection){
    speed = 2.5;
    ownerId = newOwnerId;
    teamId = newTeamId;
    position = new PVector(startPosition.x, startPosition.y);
    direction = new PVector(startDirection.x, startDirection.y);
    direction.setMag(speed);
  }

  void update(){
    position.add(direction);

    for(int i = 3-teamId*3; i < 6-teamId*3; i++){
      if(rectRect(position.x, position.y, 4, 4, game.match.players[i].position.x, game.match.players[i].position.y, game.match.players[i].w, game.match.players[i].h)){
        game.match.players[i].addHealth(-40);
        game.match.players[ownerId].entities.remove(this);
      }
    }
    if(game.match.currentMap.collides(position,4,4)){
      game.match.players[ownerId].entities.remove(this);
    }
  }

  void show(){
    pushStyle();
    noStroke();
    fill(#0090ff);
    rectMode(CENTER);
    rect(position.x, position.y, 4, 4);
    popStyle();
  }
}
