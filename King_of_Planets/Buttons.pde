class AttackButton extends ImageButton{
  AttackButton(){
    setPosition(new yP(12.5), new yP(12.5));
    setSize(new yP(25), new yP(25));
    setHoverable(true);

    setTexture(loadImage("Attack.png"));
  }
  void click(){
    println("Attack !!!");
    game.Screens.get(0).SubScreens.get(1).setActiveScreenId(0);
  }
}

class DeckButton extends ImageButton{
  DeckButton(){
    setPosition(new yP(12.5), new yP(12.5+25));
    setSize(new yP(25), new yP(25));
    setHoverable(true);

    setTexture(loadImage("Deck.png"));
  }
  void click(){
    println("Deck !!!");
    game.Screens.get(0).SubScreens.get(1).setActiveScreenId(1);
  }
}

class SpaceButton extends ImageButton{
  SpaceButton(){
    setPosition(new yP(12.5), new yP(12.5+50));
    setSize(new yP(25), new yP(25));
    setHoverable(true);

    setTexture(loadImage("Space.png"));
  }
  void click(){
    println("Space !!!");
    game.Screens.get(0).SubScreens.get(1).setActiveScreenId(2);
  }
}

class SocialButton extends ImageButton{
  SocialButton(){
    setPosition(new yP(12.5), new yP(12.5+75));
    setSize(new yP(25), new yP(25));
    setHoverable(true);

    setTexture(loadImage("Social.png"));
  }
  void click(){
    println("Social !!!");
    game.Screens.get(0).SubScreens.get(1).setActiveScreenId(3);
  }
}



class AttackFightButton extends TextButton{
  AttackFightButton(){
      setPosition(new AddRelativeLength(new xP(50), new yP(12.5)), new yP(50+50*2/3));
      setSize(new yP(50), new yP(12.5));
      setText("FIGHT!");
  }
  void click(){
    println("Joining Match");
    game.match = new Match(new Industry());
    game.Screens.add(new Ingame());
    game.currentScreenId = 1;
  }
}
