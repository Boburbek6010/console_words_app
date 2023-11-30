extension BackgroundColors on String{

  String backgroundBlack(){
    return "\x1B[40m$this\x1B[0m";
  }
  String backgroundRed(){
    return "\x1B[41m$this\x1B[0m";
  }
  String backgroundGreen(){
    return "\x1B[42m$this\x1B[0m";
  }
  String backgroundYellow(){
    return "\x1B[43m$this\x1B[0m";
  }
  String backgroundBlue(){
    return "\x1B[44m$this\x1B[0m";
  }
  String backgroundPurple(){
    return "\x1B[45m$this\x1B[0m";
  }
  String backgroundCyan(){
    return "\x1B[46m$this\x1B[0m";
  }
  String backgroundGray(){
    return "\x1B[47m$this\x1B[0m";
  }

}