abstract class Map{
  int x, y;
  PImage backgroundImage;
  ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();

  abstract void show();

  boolean collides(PVector position, int w, int h){
    if(rectInRect(position.x,position.y,w,h,0,0,x/2,y/2) == false){
      return true;
    }
    for(int i = 0; i < obstacles.size(); i++){
      if(rectRect(position.x, position.y, w, h , obstacles.get(i).x, obstacles.get(i).y,obstacles.get(i).width,obstacles.get(i).height)){
        return true;
      }
    }
    return false;
  }
}

class Industry extends Map{
  Industry(){
    x = 512;
    y = 256;
    backgroundImage = loadImage("Industry.png");

    obstacles.add(new Obstacle(32,0,8,48, #696969));
    obstacles.add(new Obstacle(-32,0,8,48, #696969));
    obstacles.add(new Obstacle(-128+32,0,8,32, #696969));
    obstacles.add(new Obstacle(128-32,0,8,32, #696969));
  }

  void show(){
    pushStyle();
    imageMode(CENTER);
    image(backgroundImage,0,0);
    popStyle();
    for(int i = 0; i < obstacles.size(); i++){
      obstacles.get(i).show();
    }
  }
}
