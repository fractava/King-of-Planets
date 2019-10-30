class Screen{
  ArrayList<Object> Objects = new ArrayList<Object>();
  ArrayList<Screen> SubScreens = new ArrayList<Screen>();
  boolean active = true;
  Screen(){

  }
  void render(){
    for(int i=0; i < SubScreens.size(); i++){
      SubScreens.get(i).render();
    }
    for(int i=0; i < Objects.size(); i++){
      Objects.get(i).render();
    }
  }
  void click(){
    for(int i=0; i < SubScreens.size(); i++){
      SubScreens.get(i).click();
    }
    for(int i=0; i < Objects.size(); i++){
      if(mouseIsInsideBoundingBox(Objects.get(i).getBoundingBox())){
        Objects.get(i).click();
      }
    }
  }
  void toggleActive(){
    active != active;
  }
  void setActive(boolean newActive){
    active = newActive;
  }
}
