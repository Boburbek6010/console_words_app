import 'dart:convert';

List<User> userListFromJson(String data)
=> List<User>.from(jsonDecode(data).map((e)
=> User.fromJson(e)));

String userToJson(User user)
=> jsonEncode(user.toJson());

class User{

  late String id;
  late String username;
  late String email;
  late String password;
  late int registerData;

  User({
    required this.username,
    required this.email,
    required this.password,
    required this.registerData
  });

  User.fromJson(Map<String, dynamic> json){
    id = json["id"];
    username = json["username"];
    email = json["email"];
    password = json["password"];
    registerData = json["registerData"];
  }

  Map<String, dynamic> toJson(){
    Map<String, dynamic> map = {
      "username": username,
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
      Sizning taxallusingiz: $username 
      Sizning elektron pochtangiz: $email 
      Sizning parolingiz: $password 
      Siz dasturimizdan ro'yxatdan o'tgan sana: $registerData
      ''';
  }

  @override
  noSuchMethod(Invocation invocation) {
    print(invocation.memberName);
  }

}