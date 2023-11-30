enum Language{
  uz,
  ru,
  eng
}

class LanguageService{

  static Language language = Language.eng;

  static languageSetting(String lang){
    if ("uz" == lang){
      return language = Language.uz;
    } else if ("ru" == lang) {
      return language = Language.ru;
    } else if ("eng" == lang) {
      return language = Language.eng;
    }
  }

}