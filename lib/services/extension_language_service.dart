import 'package:console_words_app/services/language_service.dart';
import 'package:console_words_app/services/locals/en_USA.dart';
import 'package:console_words_app/services/locals/ru_RU.dart';
import 'package:console_words_app/services/locals/uz_UZB.dart';

extension LanguageExtension on String{

  String translate(){
    switch(LanguageService.language){
      case Language.uz:
        return uzUZB[this] ?? this;
      case Language.ru:
        return ruRUS[this] ?? this;
      case Language.eng:
        return enUSA[this] ?? this;
    }
  }
}
