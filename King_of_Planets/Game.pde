class Game {
  ArrayList<Screen> Screens = new ArrayList<Screen>();
  int currentScreenId = 0;

  int planet = 0;
  int selectedHero = 0;

  Match match;

  void init() {
    Screens.add(new MainScreen());
    PFont font;
    font = createFont("origa.ttf", 20);
    textFont(font);
  }
  
  void loop() {
    Screens.get(currentScreenId).render();
  }
  
  void click() {
    Screens.get(currentScreenId).click();
  }
  
  void keyPressed() {
    Screens.get(currentScreenId).keyPressed();
  }
  
  void keyReleased() {
    Screens.get(currentScreenId).keyReleased();
  }
  
  Screen getScreen(int id) {
    return(Screens.get(id));
  }
}
