abstract class Map {
  int width, height;
  PImage backgroundImage;
  ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();

  abstract void show();

  boolean collides(PVector position, int w, int h) {
    if (rectInRect(position.x, position.y, w, h, 0, 0, width, height) == false) {
      return true;
    }
    for (int i = 0; i < obstacles.size(); i++) {
      if (rectRect(position.x, position.y, w, h, obstacles.get(i).x, obstacles.get(i).y, obstacles.get(i).width, obstacles.get(i).height)) {
        return true;
      }
    }
    return false;
  }

  void loadJSON(String path) {
    JSONObject json = loadJSONObject(path);

    width = json.getInt("width");
    height = json.getInt("height");

    for (int i = 0; i < json.getJSONArray("obstacles").size(); i++) {
      JSONObject obstacle = json.getJSONArray("obstacles").getJSONObject(i);

      obstacles.add(new Obstacle(obstacle.getInt("x"), obstacle.getInt("y"), obstacle.getInt("width"), obstacle.getInt("height"), unhex("FF" + obstacle.getString("color"))));
    }

    backgroundImage = loadImage(json.getString("backgroundImage"));
  }
}

class Industry extends Map {
  Industry() {
    loadJSON("industry.map.json");
  }

  void show() {
    pushStyle();
    imageMode(CENTER);
    image(backgroundImage, 0, 0);
    popStyle();
    for (int i = 0; i < obstacles.size(); i++) {
      obstacles.get(i).show();
    }
  }
}
