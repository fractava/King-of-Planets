class Game{
  ArrayList<Screen> Screens = new ArrayList<Screen>();
  int currentScreenId = 0;
  void init(){
    Screens.add(new MainScreen());
  }
  void loop(){
    Screens.get(currentScreenId).render();
  }
}
