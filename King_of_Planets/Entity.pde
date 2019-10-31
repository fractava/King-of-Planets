abstract class Entity{
  int teamId;
  PVector position;


  void update(){

  }

  void show(){

  }
}

class Admiral_Oculus_Shot extends Entity{
  PVector direction;
  float speed;

  Admiral_Oculus_Shot(int teamId, PVector startPosition, PVector startDirection){
    speed = 8;
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
        game.match.entities.remove(this);
      }
    }

    for(int i = 0; i < game.match.currentMap.obstacles.size(); i++){
      if(pointRect(position.x, position.y, game.match.currentMap.obstacles.get(i).x, game.match.currentMap.obstacles.get(i).y, game.match.currentMap.obstacles.get(i).width,game.match.currentMap.obstacles.get(i).height)){
        game.match.entities.remove(this);
      }
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

class Vrachos_Shot extends Entity{
  PVector direction;
  float speed;

  Vrachos_Shot(int teamId, PVector startPosition, PVector startDirection){
    speed = 2.4;
    teamId = teamId;
    position = new PVector(startPosition.x, startPosition.y);
    direction = new PVector(startDirection.x, startDirection.y);
    direction.setMag(speed);
  }

  void update(){
    position.add(direction);

    for(int i = 3-teamId*3; i < 6-teamId*3; i++){
      if(pointRect(position.x, position.y, game.match.players[i].position.x, game.match.players[i].position.y, 12, 12)){
        game.match.players[i].addHealth(-40);
        game.match.entities.remove(this);
      }
    }

    for(int i = 0; i < game.match.currentMap.obstacles.size(); i++){
      if(pointRect(position.x, position.y, game.match.currentMap.obstacles.get(i).x, game.match.currentMap.obstacles.get(i).y, game.match.currentMap.obstacles.get(i).width,game.match.currentMap.obstacles.get(i).height)){
        game.match.entities.remove(this);
      }
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
