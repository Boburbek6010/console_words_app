extension Colors on String{

  String black(){
    return "\x1B[30m$this\x1B[0m";
  }
  String red(){
    return "\x1B[31m$this\x1B[0m";
  }
  String green(){
    return "\x1B[32m$this\x1B[0m";
  }
  String yellow(){
    return "\x1B[33m$this\x1B[0m";
  }
  String blue(){
    return "\x1B[34m$this\x1B[0m";
  }
  String purple(){
    return "\x1B[35m$this\x1B[0m";
  }
  String cyan(){
    return "\x1B[36m$this\x1B[0m";
  }
  String gray(){
    return "\x1B[37m$this\x1B[0m";
  }

}