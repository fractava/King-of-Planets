class Game{
  ArrayList<Screen> Screens = new ArrayList<Screen>();
  int currentScreenId = 0;

  int planet = 0;

  void init(){
    Screens.add(new MainScreen());
    PFont font;
    font = createFont("origa.ttf", 20);
    textFont(font);
  }
  void loop(){
    Screens.get(currentScreenId).render();
  }
  void click(){
    Screens.get(currentScreenId).click();
  }
  Screen getScreen(int id){
    return(Screens.get(id));
  }
}
