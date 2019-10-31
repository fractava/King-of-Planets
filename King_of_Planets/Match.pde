class Match{
  Map currentMap;
  Hero[] players = new Hero[6];
  ArrayList<Entity> entities = new ArrayList<Entity>();
  int playerId = 0;
  boolean[] controls = new boolean[4];

  Match(Map newMap){
    currentMap = newMap;
    for(int i = 0; i < 3; i ++){
      players[i] = new Vrachos(0,0,0);
      players[i].spawn();
    }
    for(int i = 3; i < 6; i ++){
      players[i] = new Vrachos(1,0,0);
      players[i].spawn();
    }
  }

  void update(){
    for(int i = 0; i < 6; i++){
      players[i].update();
    }
    for(int i = 0; i < entities.size(); i++){
      entities.get(i).update();
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
    fill(255,0,0);
    textAlign(CENTER,CENTER);
    text(players[playerId].health + " / " + players[playerId].maxHealth, width-height/4, height-height/16);
    popStyle();
  }
}
