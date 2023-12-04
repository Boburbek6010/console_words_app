import '../models/menus.dart';
import '../services/language_service.dart';

class MyApp{

  static Map<String, Menu> routeMenu = {};

  MyApp({
    required Menu home,
    required Map<String, Menu> routes,
    required Language language,
  }){
    LanguageService.language = language;
    routeMenu = routes;
    _runApp(home);
  }

  Future<void> _runApp(Menu menu)async{
    while(true){
      await menu.build();
    }
  }

}