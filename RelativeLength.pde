abstract class RelativeLength{
  abstract int length();
}
class xP extends RelativeLength{
  float percent;

  xP(float newPercent){
    percent = newPercent;
  }
  int length(){
    return(int(width*percent*0.01));
  }
}
class yP extends RelativeLength{
  float percent;

  yP(float newPercent){
    percent = newPercent;
  }
  int length(){
    return(int(height*percent*0.01));
  }
}
