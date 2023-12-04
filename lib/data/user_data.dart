import 'dart:convert';
import 'package:console_words_app/services/extension_colors_service.dart';

List<User> userListFromJson(String data)
=> List<User>.from(jsonDecode(data).map((e)
=> User.fromJson(e)));

String userToJson(User user)
=> jsonEncode(user.toJson());

class User{

  late String id;
  late String name;
  late String username;
  late int age;
  late String email;
  late String password;
  late DateTime registerData;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.age,
    required this.email,
    required this.password,
    required this.registerData,
  });

  User.fromJson(Map<String, dynamic> json){
    id = json["id"];
    name = json["name"];
    username = json["username"];
    age = json["age"];
    email = json["email"];
    password = json["password"];
    registerData = json["registerData"];
  }

  Map<String, dynamic> toJson(){
    Map<String, dynamic> map = {
      "id": id,
      "name": name,
      "username": username,
      "age": age,
      "email": email,
      "password": password,
      "registerData": registerData
    };
    return map;
  }

  @override
  String toString() {
    return '''
      Sizning id raqamingiz: $id 
      Sizning ismingiz: $name 
      Sizning taxallusingiz: $username 
      Sizning yoshingiz: $age 
      Sizning elektron pochtangiz: $email 
      Sizning parolingiz: $password 
      Siz dasturimizdan ro'yxatdan o'tgan sana: $registerData
      '''.yellow();
  }

}