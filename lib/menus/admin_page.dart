

import 'dart:io';

import 'package:console_words_app/models/menus.dart';
import 'package:console_words_app/services/network_service.dart';

import '../data/user_data.dart';

class AdminPage extends Menu{

 late String id;
 late String email;

  Future<void> adminPage(String press) async{
    switch(press){
      case "I":{
         infoUser(id, email);
      }
      case "II": {
        deleteUser(id);
      }
      case "III": {
        blockUser(id, true);
      }
    }
  }



  @override
  Future<void> build() async {

    print("Info");
    print("Delete");
    print("Block");

    String press = stdin.readLineSync as String;
    await adminPage(press);
  }

  Future<String> infoUser(String id, String email) async{
    String parol = "";
    String data = await NetworkService.getData(NetworkService.baseUrl, NetworkService.apiUsers);
    List<User> userList = userListFromJson(data);
    for (int i = 0; i < userList.length; i++){
      if (userList[i].id == id && userList[i].email == email) {
        User userMap = userList[i];
        for (int i = 0; i < userList[i].password.length; i++){
          parol += "*";
        }
        return '''
      Foydalanuvchining id raqami: ${userMap.id} 
      Foydalanuvchining taxallusi: ${userMap.username} 
      Foydalanuvchining elektron pochtasi: ${userMap.email} 
      Foydalanuvchining paroli: $parol
      Foydalanuvchining dasturimizdan ro'yxatdan o'tgan sana: ${userMap.registerData}
      ''';
      }
    }
    return "";
  }


  Future<String> deleteUser(String id) async{
    String data = await NetworkService.deleteData(NetworkService.baseUrl, NetworkService.apiDeleteUsers, id);
   return data;
  }

  Future<bool> blockUser(String id, bool block) async{
    String data = await NetworkService.getData(NetworkService.baseUrl, NetworkService.apiUsers);
    List<User> userList = userListFromJson(data);

    for (int i = 0; i < userList.length; i++){
      if (userList[i].id == id){
        userList[i].isBlock = block;
      }
    }

    for (int i = 0; i < userList.length; i++){
        await NetworkService.deleteData(NetworkService.baseUrl, NetworkService.apiDeleteUsers, userList[i].id);
    }

    for(int i = 0; i < userList.length; i++ ){
      await NetworkService.postData(NetworkService.baseUrl, NetworkService.apiUsers, userList[i].toJson());
    }

    return true;
  }


}

