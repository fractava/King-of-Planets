abstract class BoundingBox{
  int x, y, x2, y2;
}
class BoundingBoxCorners extends BoundingBox{
  BoundingBoxCorners(int newX, int newY, int newX2, int newY2){
    x = newX;
    y = newY;
    x2 = newX2;
    y2 = newY2;
  }
}
class BoundingBoxCorner extends BoundingBox{
  BoundingBoxCorner(int newX, int newY, int newWidth, int newHeight){
    x = newX;
    y = newY;
    x2 = newX+newWidth;
    y2 = newY+newHeight;
  }
}
class BoundingBoxCenter extends BoundingBox{
  BoundingBoxCenter(int newX, int newY, int newWidth, int newHeight){
    x = newX-(newWidth/2);
    y = newY-(newHeight/2);
    x2 = newX+(newWidth/2);
    y2 = newY+(newHeight/2);
  }
}
