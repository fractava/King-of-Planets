import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class King_of_Planets extends PApplet {

Game game = new Game();

public void settings(){
  float windowScale = 0.5f;
  int width = PApplet.parseInt(1920*windowScale);
  int height = PApplet.parseInt(1080*windowScale);
  size(width,height,P2D);
  noSmooth();
}
public void setup(){
  surface.setResizable(true);
  hint(DISABLE_TEXTURE_MIPMAPS);
  ((PGraphicsOpenGL)g).textureSampling(3);
  game.init();
}
public void draw(){
  game.loop();
}
public void mousePressed(){
  game.click();
}

public boolean mouseIsInsideBoundingBox(BoundingBox ThisBoundingBox) {

  float lowX = Math.min(ThisBoundingBox.x, ThisBoundingBox.x2);
  float lowY = Math.min(ThisBoundingBox.y, ThisBoundingBox.y2);
  float highX = Math.max(ThisBoundingBox.x, ThisBoundingBox.x2);
  float highY = Math.max(ThisBoundingBox.y, ThisBoundingBox.y2);

  return (mouseX > lowX && mouseX < highX && mouseY > lowY && mouseY < highY && mousePressed);
}
abstract class BoundingBox{
  int x, y, x2, y2;
}
class BoundingBoxCorners extends BoundingBox{
  BoundingBoxCorners(int newX, int newY, int newX2, int newY2){
    x = newX;
    y = newY;
    x2 = newX2;
    y2 = newY2;
  }
}
class BoundingBoxCorner extends BoundingBox{
  BoundingBoxCorner(int newX, int newY, int newWidth, int newHeight){
    x = newX;
    y = newY;
    x2 = newX+newWidth;
    y2 = newY+newHeight;
  }
}
class BoundingBoxCenter extends BoundingBox{
  BoundingBoxCenter(int newX, int newY, int newWidth, int newHeight){
    x = newX-(newWidth/2);
    y = newY-(newHeight/2);
    x2 = newX+(newWidth/2);
    y2 = newY+(newHeight/2);
  }
}
class AttackButton extends ImageButton{
  AttackButton(){
    setPosition(new yP(12.5f), new yP(12.5f));
    setSize(new yP(25), new yP(25));

    setTexture(loadImage("Attack.png"));
  }
  public void click(){
    println("Attack !!!");
    game.Screens.get(0).SubScreens.get(0).setActiveScreenId(0);
  }
}

class DeckButton extends ImageButton{
  DeckButton(){
    setPosition(new yP(12.5f), new yP(12.5f+25));
    setSize(new yP(25), new yP(25));

    setTexture(loadImage("Deck.png"));
  }
  public void click(){
    println("Deck !!!");
    game.Screens.get(0).SubScreens.get(0).setActiveScreenId(1);
  }
}

class SpaceButton extends ImageButton{
  SpaceButton(){
    setPosition(new yP(12.5f), new yP(12.5f+50));
    setSize(new yP(25), new yP(25));

    setTexture(loadImage("Space.png"));
  }
  public void click(){
    println("Space !!!");
    game.Screens.get(0).SubScreens.get(0).setActiveScreenId(2);
  }
}

class SocialButton extends ImageButton{
  SocialButton(){
    setPosition(new yP(12.5f), new yP(12.5f+75));
    setSize(new yP(25), new yP(25));

    setTexture(loadImage("Space.png"));
  }
  public void click(){
    println("Space !!!");
    game.Screens.get(0).SubScreens.get(0).setActiveScreenId(3);
  }
}
class Game{
  ArrayList<Screen> Screens = new ArrayList<Screen>();
  int currentScreenId = 0;
  public void init(){
    Screens.add(new MainScreen());
  }
  public void loop(){
    Screens.get(currentScreenId).render();
  }
  public void click(){
    Screens.get(currentScreenId).click();
  }
  public Screen getScreen(int id){
    return(Screens.get(id));
  }
}
abstract class Object{
  public abstract void render();
  public abstract BoundingBox getBoundingBox();
  public void click(){}
}
class Image extends Object{
  PImage image;
  RelativeLength x;
  RelativeLength y;
  RelativeLength width;
  RelativeLength height;
  int imageMode = CENTER;

  Image(PImage newImage, RelativeLength newX, RelativeLength newY, RelativeLength newWidth, RelativeLength newHeight, int... newImageMode){
    setImage(newImage);
    setPosition(newX, newY);
    setSize(newWidth, newHeight);
    if(newImageMode.length > 0){
      setImageMode(newImageMode[0]);
    }
  }
  public void setImage(PImage newImage){
    image = newImage;
  }
  public void setPosition(RelativeLength newX, RelativeLength newY){
    x = newX;
    y = newY;
  }
  public void setImageMode(int newImageMode){
    imageMode = newImageMode;
  }
  public void setSize(RelativeLength newWidth, RelativeLength newHeight){
    width = newWidth;
    height = newHeight;
  }
  public void render(){
    imageMode(imageMode);
    image(image,x.length(),y.length(),width.length(),height.length());
  }
  public BoundingBox getBoundingBox(){
    if(imageMode == CENTER){
      return new BoundingBoxCenter(x.length(),y.length(),width.length(),height.length());
    }else if(imageMode == CORNER){
      return new BoundingBoxCorner(x.length(),y.length(),width.length(),height.length());
    }else{
      return new BoundingBoxCorners(0,0,0,0);
    }
  }
}

abstract class Button extends Object{
  RelativeLength x;
  RelativeLength y;
  RelativeLength width;
  RelativeLength height;

  public void setSize(RelativeLength newWidth, RelativeLength newHeight){
    width = newWidth;
    height = newHeight;
  }
  public void setPosition(RelativeLength newX, RelativeLength newY){
    x = newX;
    y = newY;
  }

  public BoundingBox getBoundingBox(){
    return new BoundingBoxCenter(x.length(),y.length(),width.length(),height.length());
  }
}

class TextButton extends Button{
  String text = "";

  int backgroundColor = 0xffffffff;
  int strokeColor = 0xffffffff;
  int textColor = 0xff000000;
  int textSize = 30;
  int textAlignX = CENTER;
  int textAlignY = CENTER;


  public void setText(String newText){
    text = newText;
  }
  public void render(){
    fill(backgroundColor);
    stroke(strokeColor);
    rectMode(CENTER);
    rect(x.length(),y.length(),width.length(),height.length());
    renderText();
  }
  public void renderText(){
    stroke(textColor);
    fill(textColor);
    textAlign(textAlignX,textAlignY);
    textSize(textSize);
    text(text,x.length(),y.length());
  }
}

class ImageButton extends Button{
  PImage texture;

  public void setTexture(PImage newTexture){
    texture = newTexture;
  }

  public void render(){
    imageMode(CENTER);
    image(texture,x.length(),y.length(),width.length(),height.length());
  }
}
abstract class RelativeLength{
  public abstract int length();
}
class xP extends RelativeLength{
  float percent;

  xP(float newPercent){
    percent = newPercent;
  }
  public int length(){
    return(PApplet.parseInt(width*percent*0.01f));
  }
}
class yP extends RelativeLength{
  float percent;

  yP(float newPercent){
    percent = newPercent;
  }
  public int length(){
    return(PApplet.parseInt(height*percent*0.01f));
  }
}
class Screen{
  ArrayList<Object> Objects = new ArrayList<Object>();
  ArrayList<Screen> SubScreens = new ArrayList<Screen>();
  Screen(){

  }
  public void render(){
    for(int i=0; i < SubScreens.size(); i++){
        SubScreens.get(i).render();
    }
    for(int i=0; i < Objects.size(); i++){
      Objects.get(i).render();
    }
  }
  public void click(){
    for(int i=0; i < SubScreens.size(); i++){
      SubScreens.get(i).click();
    }
    for(int i=0; i < Objects.size(); i++){
      if(mouseIsInsideBoundingBox(Objects.get(i).getBoundingBox())){
        Objects.get(i).click();
      }
    }
  }
  public void setActiveScreenId(int newId){
  }
}

class SwitchScreen extends Screen{
  ArrayList<Screen> SubScreens = new ArrayList<Screen>();
  int activeScreenId = 0;
  SwitchScreen(){

  }
  public void render(){
    SubScreens.get(activeScreenId).render();
  }
  public void click(){
    SubScreens.get(activeScreenId).click();
  }
  public void setActiveScreenId(int newId){
    activeScreenId = newId;
  }
}
class MainScreen extends Screen{
  MainScreen(){
    SubScreens.add(new Sidebar());
    SubScreens.add(new MenuSwitchScreen());
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
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "King_of_Planets" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
