class AttackButton extends ImageButton{
  AttackButton(){
    setPosition(new yP(12.5), new yP(12.5));
    setSize(new yP(25), new yP(25));

    setTexture(loadImage("Attack.png"));
  }
  void click(){
    println("Attack !!!");
    Game.Screens.get(0).switchMenu(1);
  }
}

class DeckButton extends ImageButton{
  DeckButton(){
    setPosition(new yP(12.5), new yP(12.5+25));
    setSize(new yP(25), new yP(25));

    setTexture(loadImage("Deck.png"));
  }
  void click(){
    println("Deck !!!");
    Game.Screens.get(0).switchMenu(2);
  }
}

class SpaceButton extends ImageButton{
  SpaceButton(){
    setPosition(new yP(12.5), new yP(12.5+50));
    setSize(new yP(25), new yP(25));

    setTexture(loadImage("Space.png"));
  }
  void click(){
    println("Space !!!");
    Game.Screens.get(0).switchMenu(3);
  }
}

class SocialButton extends SocialButton{
  SocialButton(){
    setPosition(new yP(12.5), new yP(12.5+75));
    setSize(new yP(25), new yP(25));

    setTexture(loadImage("Space.png"));
  }
  void click(){
    println("Space !!!");
    Game.Screens.get(0).switchMenu(3);
  }
}
