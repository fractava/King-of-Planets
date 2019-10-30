class TestButton extends Button{
  TestButton(){
    setPosition(new xP(15),new yP(50));
    setSize(new xP(30), new yP(30));
    setText("test");
  }
  void click(){
    println("test Button clicked");
  }
}
class TestButton2 extends Button{
  TestButton2(){
    setPosition(new xP(100-15),new yP(50));
    setSize(new xP(30), new yP(30));
    setText("test 2");

    backgroundColor = #000000;
  }
  void click(){
    println("test Button 2 clicked");
  }
}
