import 'dart:io';

import '../models/menus.dart';

class HomeMenu extends Menu{

  Future<void> selectHomeMenu (String press)async {
    switch(press){
      case "1":{
        print("Play");
      }
      case "2":{
        print("Leader Board");
      }
      case "3":{
        print("Settings");
      }
      case "4": {
        print("Info");
      }
      case "5": {
        print("Exit");
      }
    }
  }
  @override
  Future<void> build() async {

    print("Play");
    print("Leader Board");
    print("Settings");
    print("Info");
    print("Exit");

    String press = stdin.readLineSync()??"";
    await selectHomeMenu(press);
  }

}