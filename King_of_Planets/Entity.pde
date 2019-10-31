abstract class Entity{
  int teamId;
  PVector position;
  int playerId;

  void update(){

  }

  void show(){

  }
}

class Admiral_Oculus_Shot extends Entity{
  PVector direction;
  float speed;

  Admiral_Oculus_Shot(int playerId, int teamId, PVector startPosition, PVector startDirection){
    speed = 8;
    playerId = playerId;
    teamId = teamId;
    position = new PVector(startPosition.x, startPosition.y);
    direction = new PVector(startDirection.x, startDirection.y);
    direction.setMag(speed);
  }

  void update(){
    println(position + " " + direction);
    position.add(direction);

    for(int i = 3-teamId*3; i < 6-teamId*3; i++){
      if(pointRect(position.x, position.y, game.match.players[i].position.x, game.match.players[i].position.y, game.match.players[i].w, game.match.players[i].h)){
        game.match.players[i].addHealth(-70);
        game.match.players[playerId].entities.remove(this);
      }
    }

    if(game.match.currentMap.collides(position,2,2)){
      game.match.players[playerId].entities.remove(this);
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

  Ashas_Fire(int playerId, int teamId, PVector startPosition, PVector startDirection){
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
      game.match.players[playerId].entities.remove(this);
    }

    if(game.match.currentMap.collides(position,14,14)){
      game.match.players[playerId].entities.remove(this);
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

  Athon_Orb(int playerId, int teamId, PVector startPosition, PVector startDirection){
    speed = 4;
    playerId = playerId;
    teamId = teamId;
    position = new PVector(startPosition.x, startPosition.y);
    direction = new PVector(startDirection.x, startDirection.y);
    direction.setMag(speed);
  }

  void update(){
    println(position + " " + direction);
    position.add(direction);

    for(int i = teamId*3; i < 3+teamId*3; i++){
      if(i != playerId && pointRect(position.x, position.y, game.match.players[i].position.x, game.match.players[i].position.y, game.match.players[i].w, game.match.players[i].h)){
        game.match.players[i].addHealth(10);
        game.match.players[playerId].addHealth(2);
        game.match.players[playerId].entities.remove(this);
      }
    }

    if(game.match.currentMap.collides(position,3,3)){
      game.match.players[playerId].entities.remove(this);
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

class Vrachos_Shot extends Entity{
  PVector direction;
  float speed;

  Vrachos_Shot(int playerId, int teamId, PVector startPosition, PVector startDirection){
    speed = 2.4;
    playerId = playerId;
    teamId = teamId;
    position = new PVector(startPosition.x, startPosition.y);
    direction = new PVector(startDirection.x, startDirection.y);
    direction.setMag(speed);
  }

  void update(){
    position.add(direction);

    for(int i = 3-teamId*3; i < 6-teamId*3; i++){
      if(pointRect(position.x, position.y, game.match.players[i].position.x, game.match.players[i].position.y, game.match.players[i].w, game.match.players[i].h)){
        game.match.players[i].addHealth(-40);
        game.match.players[playerId].entities.remove(this);
      }
    }
    if(game.match.currentMap.collides(position,4,4)){
      game.match.players[playerId].entities.remove(this);
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
