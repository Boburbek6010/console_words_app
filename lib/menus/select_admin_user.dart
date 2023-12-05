
import 'dart:io';

import 'package:console_words_app/menus/registration_and_login.dart';
import 'package:console_words_app/services/navigator_service.dart';

import '../models/menus.dart';

class SelectAdminUser extends Menu{

      Future<void> selectAdminUser(String press) async{
        switch(press){
          case "1":{
            print("Admin");
          }
          case "2": {
            print("User");
            Navigator.push(RegisterAndLogin());
          }
        }
      }

  @override
  Future<void> build() async{
    print("Admin");
    print("User");

    String press = stdin.readLineSync()!;
    await selectAdminUser(press);

  }
}