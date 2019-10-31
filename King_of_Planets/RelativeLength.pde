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

class AddRelativeLength extends RelativeLength{
  RelativeLength RelativeLength1;
  RelativeLength RelativeLength2;

  AddRelativeLength(RelativeLength newRelativeLength1,RelativeLength newRelativeLength2){
    RelativeLength1 = newRelativeLength1;
    RelativeLength2 = newRelativeLength2;
  }

  int length(){
    return(RelativeLength1.length()+RelativeLength2.length());
  }
}

class SubtractRelativeLength extends RelativeLength{
  RelativeLength RelativeLength1;
  RelativeLength RelativeLength2;

  SubtractRelativeLength(RelativeLength newRelativeLength1,RelativeLength newRelativeLength2){
    RelativeLength1 = newRelativeLength1;
    RelativeLength2 = newRelativeLength2;
  }

  int length(){
    return(RelativeLength1.length()-RelativeLength2.length());
  }
}

class MultiplyRelativeLength extends RelativeLength{
  RelativeLength RelativeLength1;
  float factor;

  MultiplyRelativeLength(RelativeLength newRelativeLength1, float newFactor){
    RelativeLength1 = newRelativeLength1;
    factor = newFactor;
  }

  int length(){
    return(int(RelativeLength1.length()*factor));
  }
}

class DevideRelativeLength extends RelativeLength{
  RelativeLength RelativeLength1;
  float divisor;

  DevideRelativeLength(RelativeLength newRelativeLength1,float newDivisor){
    RelativeLength1 = newRelativeLength1;
    divisor = newDivisor;
  }

  int length(){
    return(int(RelativeLength1.length()/divisor));
  }
}
