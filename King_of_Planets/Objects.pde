class Image extends Object{
  PImage image;
  RelativeLength x;
  RelativeLength y;
  RelativeLength width;
  RelativeLength height;
  int imageMode = CENTER;

  Image(PImage newImage, RelativeLength newX, RelativeLength newY, RelativeLength newWidth, RelativeLength newHeight, int... newImageMode){
    setImage(newImage);
    setPosition(newX, newY);
    setSize(newWidth, newHeight);
    if(newImageMode.length > 0){
      setImageMode(newImageMode[0]);
    }
  }
  void setImage(PImage newImage){
    image = newImage;
  }
  void setPosition(RelativeLength newX, RelativeLength newY){
    x = newX;
    y = newY;
  }
  void setImageMode(int newImageMode){
    imageMode = newImageMode;
  }
  void setSize(RelativeLength newWidth, RelativeLength newHeight){
    width = newWidth;
    height = newHeight;
  }
  void render(){
    imageMode(imageMode);
    image(image,x.length(),y.length(),width.length(),height.length());
  }
  BoundingBox getBoundingBox(){
    if(imageMode == CENTER){
      return new BoundingBoxCenter(x.length(),y.length(),width.length(),height.length());
    }else if(imageMode == CORNER){
      return new BoundingBoxCorner(x.length(),y.length(),width.length(),height.length());
    }else{
      return new BoundingBoxCorners(0,0,0,0);
    }
  }
}

abstract class Button extends Object{
  RelativeLength x;
  RelativeLength y;
  RelativeLength width;
  RelativeLength height;

  void setSize(RelativeLength newWidth, RelativeLength newHeight){
    width = newWidth;
    height = newHeight;
  }
  void setPosition(RelativeLength newX, RelativeLength newY){
    x = newX;
    y = newY;
  }

  BoundingBox getBoundingBox(){
    return new BoundingBoxCenter(x.length(),y.length(),width.length(),height.length());
  }
}

class TextButton extends Button{
  String text = "";

  color backgroundColor = #ffffff;
  color strokeColor = #ffffff;
  color textColor = #000000;
  int textSize = 30;
  int textAlignX = CENTER;
  int textAlignY = CENTER;


  void setText(String newText){
    text = newText;
  }
  void render(){
    fill(backgroundColor);
    stroke(strokeColor);
    rectMode(CENTER);
    rect(x.length(),y.length(),width.length(),height.length());
    renderText();
  }
  void renderText(){
    stroke(textColor);
    fill(textColor);
    textAlign(textAlignX,textAlignY);
    textSize(textSize);
    text(text,x.length(),y.length());
  }
}

class ImageButton extends Button{
  PImage texture;

  void setTexture(PImage newTexture){
    texture = newTexture;
  }

  void render(){
    imageMode(CENTER);
    image(texture,x.length(),y.length(),width.length(),height.length());
  }
}
