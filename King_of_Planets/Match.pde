class Match{
  Map currentMap;
  Hero[] players = new Hero[6];
  int[] points = new int[2];
  int playerId = 0;
  boolean[] controls = new boolean[4];

  Match(Map newMap){
    currentMap = newMap;
    for(int i = 0; i < 3; i ++){
      players[i] = new Kinetic(0,0,0);
      players[i].spawn();
    }
    for(int i = 3; i < 6; i ++){
      players[i] = new Vrachos(1,0,0);
      players[i].spawn();
    }
    points[0] = 0;
    points[1] = 0;
  }

  void update(){
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
}
