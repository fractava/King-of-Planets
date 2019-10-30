class MainScreen extends Screen{
  MainScreen(){
    //Objects.add(new Image(loadImage("merkel.jpg"),new xP(50),new yP(50), new xP(50), new yP(50)));
    Objects.add(new TestButton());
    Objects.add(new TestButton2());
    Objects.add(new AttackButton());
  }
}
