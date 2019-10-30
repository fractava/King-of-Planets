class Screen{
  ArrayList<Object> Objects = new ArrayList<Object>();
  Screen(){

  }
  void render(){
    for(int i=0; i < Objects.size(); i++){
      Objects.get(i).render();
    }
  }
}
