class Screen{
  ArrayList<Object> Objects = new ArrayList<Object>();
  ArrayList<Screen> SubScreens = new ArrayList<Screen>();
  Screen(){

  }
  void render(){
    Collections.sort(Objects, new zIndexComparator());
    for(int i=0; i < Objects.size(); i++){
      Objects.get(i).render();
    }
    
    for(int i=0; i < SubScreens.size(); i++){
        SubScreens.get(i).render();
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
  void setActiveScreenId(int newId){
  }
}

class SwitchScreen extends Screen{
  ArrayList<Screen> SubScreens = new ArrayList<Screen>();
  int activeScreenId = 0;
  SwitchScreen(){

  }
  void render(){
    SubScreens.get(activeScreenId).render();
  }
  void click(){
    SubScreens.get(activeScreenId).click();
  }
  void setActiveScreenId(int newId){
    activeScreenId = newId;
  }
}
