class Hero{
  PVector position;
  PVector direction;
  PImage cover;
  PImage skin;

  void update(){
    println((mouseX-width/2) + " " + (mouseY-height/2));
    direction = new PVector(mouseX-width/2, mouseY-height/2);
  }

  void show(){
    pushMatrix();
    pushStyle();
    imageMode(CENTER);
    translate(position.x,position.y);
    rotate(HALF_PI+direction.heading());
    image(skin,0,0,16,16);
    popStyle();
    popMatrix();
  }
}

class Admiral_Oculus extends Hero{
  Admiral_Oculus(float startX, float startY){
    position = new PVector(startX, startY);
    cover = loadImage("Admiral Oculus.png");
    skin = loadImage("Admiral Oculus Top.png");
  }
}
