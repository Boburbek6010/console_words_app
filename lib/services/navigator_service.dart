import '../models/menus.dart';

class Navigator{

  static final List<Menu> _menuList = [];

  static Future _runMenu() async {
    await _menuList.last.build();
  }

  static Future push(Menu menu) async {
    _menuList.add(menu);
    await _runMenu();
  }

}


