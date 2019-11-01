class Obstacle {
  int x, y;
  int width, height;
  color fillColor = color(#000000);

  Obstacle(int newX, int newY, int newWidth, int newHeight, color... newFillColor) {
    x = newX;
    y = newY;
    width = newWidth;
    height = newHeight;
    if (newFillColor.length > 0) {
      fillColor = newFillColor[0];
    }
  }

  void show() {
    pushStyle();
    noStroke();
    fill(fillColor);
    rectMode(CENTER);
    rect(x, y, width, height);
    popStyle();
  }
}
