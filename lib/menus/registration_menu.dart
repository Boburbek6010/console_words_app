import 'dart:io';
import 'package:console_words_app/data/user_data.dart';
import 'package:console_words_app/services/network_service.dart';
import '../models/menus.dart';

class Registration extends Menu {

  @override
  Future<void> build() async {
    String username, email, password;

    /// write username

    stdout.write("\nIsmingizni kiriting: ");
    username = stdin.readLineSync()!;

    ///Checking User Name

    if (checkName(username)) {
      print("\nIsm to`g`ri kiritildi");
    } else {
      print("\nBunday ism mavjud emas");
      while (checkName(username) != true) {

        print(
            "\nIsm katta harfda boshlash kerak.\nIsmning uzunligi kamida uchta harfdan iborat bo'lishi kerak");
        stdout.write("\nIsmingizni kiriting: ");
        username = stdin.readLineSync()!;

      }
      if (checkName(username)) {
        print("\nIsm to`g`ri kiritildi");
      }
    }

    /// write email

    stdout.write("\nEmailni kiriting: ");
    email = stdin.readLineSync()!;

    /// Checking email

    if (checkEmail(email)) {
      print("\nEmail to`g`ri yaratildi");
    } else {
      print("\nBunday email mavjud emas");
      while (checkEmail(email) != true) {
        stdout.write("\nEmailni kiriting: ");
        email = stdin.readLineSync()!;
      }
      if (checkEmail(email)) {
        print("\nEmail to`g`ri yaratildi");
      }
    }

    /// write password

    stdout.write("\nParol yarating: ");
    password = stdin.readLineSync()!;

    /// Checking password

    if (passwordCheck(password)) {
      print("\nParol to`g`ri yaratildi !");
    } else {
      print("\nParol noto`g`ri yaratildi !");
      while (passwordCheck(password) != true) {
        print(
            "Parolda kamida bitta belgi\nKamida bitta raqam\nKamida bitta katta va kichik harf bo'lsin.\nEng asosiysi parol uzinligi 8 ta ga teng yoki undan ko'p bo'lishi kerak !!!");
        stdout.write("Parol kiriting: ");
        password = stdin.readLineSync()!;
      }
      if (passwordCheck(password)) {
        print("\nParol to`g`ri yaratildi !");
      }
    }

    DateTime registerData = DateTime.now();
    int dateParseToInt = registerData.millisecondsSinceEpoch ~/ 1000;

    /// Data received

    User user = User(username: username, email: email, password: password, registerData: dateParseToInt);

    String data = await NetworkService.postData(NetworkService.baseUrl, NetworkService.apiUsers, user.toJson());

    if (data == "200" || data == "201"){
      // boshqa menu ga jo'natish
    } else {
      // boshqa menu ga jo'natish
    }
  }

  bool checkName(String name) {
    List<int> unitList = name.codeUnits;
    bool alfa = false;
    if (3 > name.length) {
      return false;
    }

    if (name.codeUnits.first >= 65 && name.codeUnits.first <= 90) {
      for (int i = 1; i < unitList.length; i++) {
        if (97 <= unitList[i] && 122 >= unitList[i]) {
          alfa = true;
        } else {
          return false;
        }
      }
      return alfa;
    } else {
      return false;
    }
  }

  bool checkEmail(String email) {
    List<String> listEmail = [
      "@mail.ru",
      "@inbox.ru",
      "@bk.ru",
      "@list.ru",
      "@internet.ru",
      "@xmail.ru",
      "@yandex.ru",
      "@gmail.com",
      "@yahoo.com",
      "@hotmail.com",
      "@outlook.com"
    ];
    for (int i = 0; i < listEmail.length; i++) {
      if (email.endsWith(listEmail[i])) {
        return true;
      }
    }
    return false;
  }

  bool passwordCheck(String password) {
    if (password.length < 8) {
      return false;
    }

    bool upperCase = password.codeUnits.any((char) => char >= 65 && char <= 90);
    bool lowerCase =
        password.codeUnits.any((char) => char >= 97 && char <= 122);
    bool digit = password.codeUnits.any((char) => char >= 48 && char <= 57);
    bool specialChar = password.codeUnits.any((char) =>
        (char >= 33 && char <= 47) ||
        (char >= 58 && char <= 64) ||
        (char >= 91 && char <= 96) ||
        (char >= 123 && char <= 126));

    return (upperCase && lowerCase && digit && specialChar);
  }

}
