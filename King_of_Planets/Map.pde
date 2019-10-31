abstract class Map{
  int x, y;
  int width, height;
  PImage backgroundImage;
  ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();

  abstract void show();
}

class Industry extends Map{
  Industry(){
    x = 1024;
    y = 512;
    backgroundImage = loadImage("Industry.png");
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
