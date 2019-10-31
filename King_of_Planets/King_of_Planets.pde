import java.util.Comparator;
import java.util.Collections;

Game game = new Game();

void settings(){
  float windowScale = 0.5;
  int width = int(1920*windowScale);
  int height = int(1080*windowScale);
  size(width,height,P2D);
}
void setup(){
  surface.setResizable(true);
  hint(DISABLE_TEXTURE_MIPMAPS);
  ((PGraphicsOpenGL)g).textureSampling(3);
  frameRate(30);
  game.init();
}
void draw(){
  game.loop();
}
void mouseReleased(){
  game.click();
}
void keyPressed(){
  game.keyPressed();
}
void keyReleased(){
  game.keyReleased();
}

boolean mouseIsInsideBoundingBox(BoundingBox ThisBoundingBox) {

  float lowX = Math.min(ThisBoundingBox.x, ThisBoundingBox.x2);
  float lowY = Math.min(ThisBoundingBox.y, ThisBoundingBox.y2);
  float highX = Math.max(ThisBoundingBox.x, ThisBoundingBox.x2);
  float highY = Math.max(ThisBoundingBox.y, ThisBoundingBox.y2);

  return (mouseX > lowX && mouseX < highX && mouseY > lowY && mouseY < highY);
}

public class zIndexComparator implements Comparator<Object> {
    @Override
    public int compare(Object Object1, Object Object2) {
        return Object1.zIndex - Object2.zIndex;
    }
}
