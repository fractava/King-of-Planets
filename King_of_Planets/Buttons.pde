class AttackButton extends ImageButton{
  AttackButton(){
    setPosition(new yP(12.5), new yP(12.5));
    setSize(new yP(25), new yP(25));

    setTexture(loadImage("Attack.png"));
  }
  void click(){
    println("Attack !!!");
    game.Screens.get(0).SubScreens.get(0).setActiveScreenId(0);
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
    game.Screens.get(0).SubScreens.get(0).setActiveScreenId(1);
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
    game.Screens.get(0).SubScreens.get(0).setActiveScreenId(2);
  }
}

class SocialButton extends ImageButton{
  SocialButton(){
    setPosition(new yP(12.5), new yP(12.5+75));
    setSize(new yP(25), new yP(25));

    setTexture(loadImage("Social.png"));
  }
  void click(){
    println("Social !!!");
    game.Screens.get(0).SubScreens.get(0).setActiveScreenId(3);
  }
}
