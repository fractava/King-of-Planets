class Match{
  Map currentMap;
  Hero[] players = new Hero[6];
  ArrayList<Entity> entities = new ArrayList<Entity>();
  int[] points = new int[2];

  int playerId = 0;
  //TODO get playerID from Server

  boolean[] controls = new boolean[4];

  Match(Map newMap){
    currentMap = newMap;
    for(int i = 0; i < 3; i ++){
      players[i] = assignHero(0, 0, 0, 0);
      players[i].spawn();
    }
    for(int i = 3; i < 6; i ++){
      players[i] = assignHero(1, 1, 0, 0);
      players[i].spawn();
    }
    players[playerId] = assignHero(game.selectedHero, 0, 0, 0);
    points[0] = 0;
    points[1] = 0;
  }

  void update(){
    //TODO get the entity positions from server
    for(int i = 0; i < entities.size(); i++){
      entities.get(i).update();
    }
    //TODO get players heroes, positions and directions from server
    for(int i = 0; i < 6; i++){
      players[i].update();
    }
    players[playerId].control();
  }

  void render(){
    background(#272847);
    pushMatrix();
    translate(width/2,height/2);
    scale(height/64);
    translate(-players[playerId].position.x, -players[playerId].position.y);
    currentMap.show();
    for(int i = 0; i < entities.size(); i++){
      entities.get(i).show();
    }
    for(int i = 0; i < 6; i++){
      players[i].show();
    }
    popMatrix();
    pushStyle();
    textSize(height/16);
    textAlign(CENTER,CENTER);
    fill(255,0,0);
    text(players[playerId].health + " / " + players[playerId].maxHealth, width-height/4, height-height/16);
    fill(#ff5400);
    text(points[0], width/2+width/16, height/16);
    fill(#7b004b);
    text(points[1], width/2-width/16, height/16);
    popStyle();
  }

  Hero assignHero(int heroId, int teamId, int x, int y){
    switch(heroId){
      case 0:
        return new Admiral_Oculus(teamId, x, y);
      case 1:
        return new Ashas(teamId, x, y);
      case 2:
        return new Athon(teamId, x, y);
      case 3:
        return new Burac(teamId, x ,y);
      case 4:
        return new Kinetic(teamId, x, y);
      case 5:
        return new Vrachos(teamId, x, y);
      default:
        return new Ashas(teamId, x, y);
    }
  }
}
