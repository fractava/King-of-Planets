class MainScreen extends Screen{
  MainScreen(){
    SubScreens.add(new Sidebar());
    SubScreens.add(new MenuSwitchScreen());

    Object wallpaper = new Image(loadImage("Wallpaper.png"),new xP(0),new yP(0),new xP(100), new yP(100), CORNER);
    wallpaper.zIndex = 0;
    Objects.add(wallpaper);
    Objects.add(new Rect(color(#272847),new xP(0), new yP(0), new yP(25), new yP(100), CORNER));
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
    Objects.add(new Image(loadImage("Planet1.png"),new AddRelativeLength(new xP(50), new yP(12.5)), new SubtractRelativeLength(new yP(50), new yP(12.5)), new yP(50), new yP(50)));
    Objects.add(new AttackFightButton());
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

class Ingame extends Screen{
  Ingame(){
    Objects.add(new Image(game.match.players[game.match.playerId].cover, new yP(100/16), new yP(100-100/16), new yP(100/8), new yP(100/8)));
  }

  void render(){
    game.match.update();
    game.match.render();

    for(int i = 0; i < Objects.size(); i++){
      Objects.get(i).render();
    }
  }

  void keyPressed(){
    switch(key){
      case 'w':
        game.match.controls[0] = true;
        break;
      case 'a':
        game.match.controls[1] = true;
        break;
      case 's':
        game.match.controls[2] = true;
        break;
      case 'd':
        game.match.controls[3] = true;
        break;
    }
  }

  void keyReleased(){
    switch(key){
      case 'w':
        game.match.controls[0] = false;
        break;
      case 'a':
        game.match.controls[1] = false;
        break;
      case 's':
        game.match.controls[2] = false;
        break;
      case 'd':
        game.match.controls[3] = false;
        break;
    }
  }
}
