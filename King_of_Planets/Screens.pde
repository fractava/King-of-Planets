class MainScreen extends Screen{
  MainScreen(){
    SubScreens.add(new Sidebar());
    SubScreens.add(new AttackScreen());
    SubScreens.add(new DeckScreen());
    SubScreens.add(new SpaceScreen());
    SubScreens.add(new SocialScreen());
  }

  void switchMenu(int menu){
    for(int i = 1; i < 5; i++){
      Subscreens.get(i).setActive(false);
    }
    Subscreens.get(menu).setActive(true);
  }
}
class Sidebar extends Screen{
  Sidebar(){
    Objects.add(new AttackButton());
  }
}
class AttackScreen extends Screen{
  AttackScreen(){
  }
}
class DeckScreen extends Screen{
  DeckScreen(){
  }
}
class SpaceScreen extends Screen{
  SpaceScreen(){
  }
}
class SocialScreen extends Screen{
  SocialScreen(){
  }
}
