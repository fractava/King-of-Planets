class TestButton extends TextButton{
  TestButton(){
    setPosition(new xP(15),new yP(50));
    setSize(new xP(30), new yP(30));
    setText("test");
  }
  void click(){
    println("test Button clicked");
  }
}
class TestButton2 extends TextButton{
  TestButton2(){
    setPosition(new xP(100-15),new yP(50));
    setSize(new xP(30), new yP(30));
    setText("test 2");

    backgroundColor = #000000;
    textColor = #ffffff;
  }
  void click(){
    println("test Button 2 clicked");
  }
}

class AttackButton extends Image{
  AttackButton(){
    setPosition(new yP(12.5), new yP(12.5);
    setSize(new yP(25), new yP(25));
    setTexture(loadImage("attac.png"));
  }
}
