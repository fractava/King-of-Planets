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
}