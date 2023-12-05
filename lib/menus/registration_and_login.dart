import 'dart:io';

import 'package:console_words_app/models/menus.dart';
import 'package:console_words_app/services/navigator_service.dart';

import 'login_menu.dart';



class RegisterAndLogin extends Menu{

  Future<void> registerAndLogin(String press) async{
    switch(press){
      case "I":{

      }
      case "II": {
        await Navigator.push(UserLogin());
      }


    }
  }



  @override
  Future<void> build() async {


    print("\nRegister ");
    print("\nLogin ");

   String press = stdin.readLineSync()??"";
   registerAndLogin(press);


  }

}