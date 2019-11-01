class Image extends Object {
  PImage image;
  RelativeLength x;
  RelativeLength y;
  RelativeLength width;
  RelativeLength height;
  int imageMode = CENTER;

  Image(PImage newImage, RelativeLength newX, RelativeLength newY, RelativeLength newWidth, RelativeLength newHeight, int... newImageMode) {
    setImage(newImage);
    setPosition(newX, newY);
    setSize(newWidth, newHeight);
    if (newImageMode.length > 0) {
      setImageMode(newImageMode[0]);
    }
  }
  
  void setImage(PImage newImage) {
    image = newImage;
  }
  
  void setPosition(RelativeLength newX, RelativeLength newY) {
    x = newX;
    y = newY;
  }
  
  void setImageMode(int newImageMode) {
    imageMode = newImageMode;
  }
  
  void setSize(RelativeLength newWidth, RelativeLength newHeight) {
    width = newWidth;
    height = newHeight;
  }
  
  void render() {
    imageMode(imageMode);
    image(image, x.length(), y.length(), width.length(), height.length());
  }
  
  BoundingBox getBoundingBox() {
    if (imageMode == CENTER) {
      return new BoundingBoxCenter(x.length(), y.length(), width.length(), height.length());
    } else if (imageMode == CORNER) {
      return new BoundingBoxCorner(x.length(), y.length(), width.length(), height.length());
    } else {
      return new BoundingBoxCorners(0, 0, 0, 0);
    }
  }
}

class Rect extends Object {
  color fillColor = #ffffff;
  RelativeLength x;
  RelativeLength y;
  RelativeLength width;
  RelativeLength height;
  int rectMode = CENTER;

  Rect(color newFillColor, RelativeLength newX, RelativeLength newY, RelativeLength newWidth, RelativeLength newHeight, int... newRectMode) {
    setPosition(newX, newY);
    setSize(newWidth, newHeight);
    setFillColor(newFillColor);
    if (newRectMode.length > 0) {
      setRectMode(newRectMode[0]);
    }
  }
  
  void setFillColor(color newFillColor) {
    fillColor = newFillColor;
  }
  void setPosition(RelativeLength newX, RelativeLength newY) {
    x = newX;
    y = newY;
  }
  
  void setRectMode(int newRectMode) {
    rectMode = newRectMode;
  }
  
  void setSize(RelativeLength newWidth, RelativeLength newHeight) {
    width = newWidth;
    height = newHeight;
  }
  
  void render() {
    pushStyle();
    rectMode(rectMode);
    fill(fillColor);
    noStroke();
    rect(x.length(), y.length(), width.length(), height.length());
    popStyle();
  }
  
  BoundingBox getBoundingBox() {
    if (rectMode == CENTER) {
      return new BoundingBoxCenter(x.length(), y.length(), width.length(), height.length());
    } else if (rectMode == CORNER) {
      return new BoundingBoxCorner(x.length(), y.length(), width.length(), height.length());
    } else if (rectMode == CORNERS) {
      return new BoundingBoxCorners(x.length(), y.length(), x.length()+width.length(), y.length()+height.length());
    } else {
      return new BoundingBoxCorners(0, 0, 0, 0);
    }
  }
}

abstract class Button extends Object {
  RelativeLength x;
  RelativeLength y;
  RelativeLength width;
  RelativeLength height;
  boolean hoverable = false;

  void setSize(RelativeLength newWidth, RelativeLength newHeight) {
    width = newWidth;
    height = newHeight;
  }
  
  void setPosition(RelativeLength newX, RelativeLength newY) {
    x = newX;
    y = newY;
  }


  void setHoverable(boolean newHoverable) {
    hoverable = newHoverable;
  }

  BoundingBox getBoundingBox() {
    return new BoundingBoxCenter(x.length(), y.length(), width.length(), height.length());
  }
}

class TextButton extends Button {
  String text = "";

  color backgroundColor = #ffffff;
  color strokeColor = #ffffff;
  color textColor = #000000;
  RelativeLength textSize = new yP(10);
  int textAlignX = CENTER;
  int textAlignY = CENTER;


  void setText(String newText) {
    text = newText;
  }
  
  void setTextSize(RelativeLength newTextSize) {
    textSize = newTextSize;
  }
  
  void render() {
    fill(backgroundColor);
    stroke(strokeColor);
    rectMode(CENTER);
    rect(x.length(), y.length(), width.length(), height.length());
    renderText();
  }
  
  void renderText() {
    stroke(textColor);
    fill(textColor);
    textAlign(textAlignX, textAlignY);
    textSize(textSize.length());
    text(text, x.length(), y.length());
  }
}

class ImageButton extends Button {
  PImage texture;

  void setTexture(PImage newTexture) {
    texture = newTexture;
  }

  void render() {
    imageMode(CENTER);
    image(texture, x.length(), y.length(), width.length(), height.length());

    if (hoverable) {
      if (mouseIsInsideBoundingBox(getBoundingBox())) {
        pushStyle();
        noFill();
        strokeWeight(4);
        stroke(#FFFFFF);
        rect(x.length(), y.length(), width.length(), height.length());
        popStyle();
      }
    }
  }
}
