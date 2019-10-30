class AttackButton extends ImageButton{
  AttackButton(){
    setPosition(new yP(12.5), new yP(12.5));
    setSize(new yP(25), new yP(25));
    
    setTexture(loadImage("Attack.png"));
  }
  void click(){
    println("Attack !!!");
  }
}
