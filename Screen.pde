class Screen{
  ArrayList<Object> Objects = new ArrayList<Object>();
  Screen(){

  }
  void render(){
    for(int i=0; i < Objects.size(); i++){
      Objects.get(i).render();
    }
  }
  void click(){
    for(int i=0; i < Objects.size(); i++){
      if(mouseIsInsideBoundingBox(Objects.get(i).getBoundingBox())){
        Objects.get(i).click();
        break;
      }
    }
  }
}
