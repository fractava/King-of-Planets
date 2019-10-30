class MainScreen extends Screen{
  MainScreen(){
    SubScreens.add(new Sidebar());
    SubScreens.add(new MenuSwitchScreen());
  }
}
class Sidebar extends Screen{
  Sidebar(){
    Objects.add(new AttackButton());
    Objects.add(new DeckButton());
    Objects.add(new SpaceButton());
    Objects.add(new SocialButton());
  }
}
class MenuSwitchScreen extends SwitchScreen{
  MenuSwitchScreen(){
    SubScreens.add(new AttackScreen());
    SubScreens.add(new DeckScreen());
    SubScreens.add(new SpaceScreen());
    SubScreens.add(new SocialScreen());
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
