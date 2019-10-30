Game game = new Game();

void settings(){
  float windowScale = 0.5;
  int width = int(1920*windowScale);
  int height = int(1080*windowScale);
  size(width,height,P2D);
}
void setup(){
  surface.setResizable(true);
  game.init();
}
void draw(){
  game.loop();
}
