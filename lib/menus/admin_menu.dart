import 'dart:io';
import 'package:console_words_app/data/user_data.dart';
import 'package:console_words_app/models/menus.dart';
import '../services/network_service.dart';

class AdminMenu extends Menu{
  @override
  Future<void> build() async{
    print('\nAdmin Oynasi\n');

    String data = await NetworkService.getData(NetworkService.baseUrl, NetworkService.apiUsers);

    List<User> userListData = userListFromJson(data);

    for (int i = 0; i < 1; i++){
      for (int j = 0; j < 3; j++){
        if (j == 0){
          stdout.write("   №   ");
        } else if (j == 1){
          stdout.write("Email    ");
        } else if (j == 2){
          stdout.write("Date");
        }
      }
      print("");
    }

    for (int i = 0; i < userListData.length; i++){
      for (int j = 0; j < 3; j++){
        if (j == 0){
          stdout.write("   ${i + 1}   ");
        } else if (j == 1){
          stdout.write("${userListData[i].email}  ");
        } else if (j == 2){
          DateTime date = DateTime.fromMillisecondsSinceEpoch(userListData[i].registerData * 1000);
          int day = date.day;
          int month = date.month;
          int year = date.year;
          stdout.write("$day-$month-$year");
        }
      }
      print("");
    }
    exit(0);
  }

}