class MainScreen extends Screen{
  MainScreen(){
    SubScreens.add(new Sidebar());
    SubScreens.add(new AttackScreen());
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
