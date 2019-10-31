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

boolean pointRect(float x, float y, float rectX, float rectY, float rectWidth, float rectHeight){
  if(x >= rectX-rectWidth/2 &&
    x <= rectX+rectWidth/2 &&
    y >= rectY-rectHeight/2 &&
    y <= rectY+rectHeight/2){
      return true;
    }else{
      return false;
    }
}


boolean circleRect(float cx, float cy, float radius, float rx, float ry, float rw, float rh) {

  // temporary variables to set edges for testing
  float testX = cx;
  float testY = cy;

  // which edge is closest?
  if (cx < rx-rw/2)         testX = rx-rw/2;      // test left edge
  else if (cx > rx+rw/2) testX = rx+rw/2;   // right edge
  if (cy < ry-rh/2)         testY = ry-rh/2;      // top edge
  else if (cy > ry+rh/2) testY = ry+rh/2;   // bottom edge

  // get distance from closest edges
  float distX = cx-testX;
  float distY = cy-testY;
  float distance = sqrt( (distX*distX) + (distY*distY) );

  // if the distance is less than the radius, collision!
  if (distance <= radius) {
    return true;
  }
  return false;
}

boolean rectRect(float r1x, float r1y, float r1w, float r1h, float r2x, float r2y, float r2w, float r2h) {

  // are the sides of one rectangle touching the other?

  if (r1x + r1w/2 >= r2x - r2w/2 &&    // r1 right edge past r2 left
    r1x - r1w/2 <= r2x + r2w/2 &&    // r1 left edge past r2 right
    r1y + r1h/2 >= r2y - r2h/2 &&    // r1 top edge past r2 bottom
    r1y - r1h/2 <= r2y + r2h/2) {    // r1 bottom edge past r2 top
    return true;
  }
  return false;
}

boolean rectInRect(float r1x, float r1y, float r1w, float r1h, float r2x, float r2y, float r2w, float r2h) {

  // are the sides of one rectangle touching the other?

  if(r1x+r1w/2 <= r2x+r2w/2 &&
    r1x-r1w/2 >= r2x-r2w/2 &&
    r1y+r1h/2 <= r2y+r2h/2 &&
    r2y-r2h/2 >= r2y-r2h/2){
      return true;
    }
  return false;
}

public class zIndexComparator implements Comparator<Object> {
    @Override
    public int compare(Object Object1, Object Object2) {
        return Object1.zIndex - Object2.zIndex;
    }
}
