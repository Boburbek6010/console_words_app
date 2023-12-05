
import 'dart:io';
import 'package:console_words_app/data/user_data.dart';
import 'package:console_words_app/models/menus.dart';
import 'package:console_words_app/services/network_service.dart';


class UserLogin extends Menu {
  @override
  Future<void> build() async {
  String email, password;

  stdout.write("\nEmailni kiriting: ");
  email = stdin.readLineSync()??"";

  stdout.write("\nParolni kiriting: ");
  password = stdin.readLineSync()??"";

  print(await checkLogin(email, password));
  }

  Future<bool> checkLogin(String email, password) async{
    String data = await NetworkService.getData(
        NetworkService.baseUrl, NetworkService.apiUsers);
    List<User> userList = userListFromJson(data);
    for (int i = 0; i <userList.length; i++){
      if (userList[i].email == email && userList[i].password == password){
        return true;
      }
    }
    return false;
  }



}










