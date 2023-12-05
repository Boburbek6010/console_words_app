import 'dart:io';
import 'package:console_words_app/data/user_data.dart';
import 'package:console_words_app/models/menus.dart';
import 'package:console_words_app/services/navigator_service.dart';
import 'package:console_words_app/services/network_service.dart';
import 'admin_menu.dart';

class LoginAdmin extends Menu {
  @override
  Future<void> build() async {
    String email, password;

    stdout.write("\nEmailni kiriting: ");
    email = stdin.readLineSync()!;

    stdout.write("\nParolni kiriting: ");
    password = stdin.readLineSync()!;

    if (await checkLogin(email, password) == true) {
      Navigator.push(AdminMenu());
    }
  }

  Future<bool> checkLogin(String email, password) async {
    String data = await NetworkService.getData(
        NetworkService.baseUrlAdmin, NetworkService.apiAdmin);
    List<User> userList = userListFromJson(data);
    for (int i = 0; i < userList.length; i++) {
      if (userList[i].email == email && userList[i].password == password) {
        return true;
      }
    }
    return false;
  }
}
