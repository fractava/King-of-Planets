Game game = new Game();

void settings(){
  float windowScale = 0.5;
  int width = int(1920*windowScale);
  int height = int(1080*windowScale);
  size(width,height,P2D);
  noSmooth();
}
void setup(){
  surface.setResizable(true);
  hint(DISABLE_TEXTURE_MIPMAPS);
  ((PGraphicsOpenGL)g).textureSampling(3);
  game.init();
}
void draw(){
  game.loop();
}
void mousePressed(){
  game.click();
}

boolean mouseIsInsideBoundingBox(BoundingBox ThisBoundingBox) {

  float lowX = Math.min(ThisBoundingBox.x, ThisBoundingBox.x2);
  float lowY = Math.min(ThisBoundingBox.y, ThisBoundingBox.y2);
  float highX = Math.max(ThisBoundingBox.x, ThisBoundingBox.x2);
  float highY = Math.max(ThisBoundingBox.y, ThisBoundingBox.y2);

  return (mouseX > lowX && mouseX < highX && mouseY > lowY && mouseY < highY && mousePressed);
}
