class Match{
  Map currentMap;
  Hero[] players = new Hero[6];
  int playerId = 0;
  boolean[] controls = new boolean[4];

  Match(Map newMap){
    currentMap = newMap;
    for(int i = 0; i < 6; i ++){
      players[i] = new Admiral_Oculus(0,0);
    }
  }

  void render(){
    pushMatrix();
    translate(width/2,height/2);
    scale(height/64);
    currentMap.show();
    for(int i = 0; i < 6; i++){
      players[i].update();
      players[i].show();
    }
    popMatrix();
  }
}
