import 'package:big_burger_app/features/menu/models/menu_model_api.dart';
import 'package:big_burger_app/features/menu/repositories/menu_repository.dart';
import 'package:flutter/material.dart';

class MenuService extends ChangeNotifier {
  List<MenuModelAPI>? menuList = [];

  void getMenusFromApi() async {
    menuList = [];
    notifyListeners();
    List<MenuModelAPI>? futureMenuList =
        await MenuRepository().getMenusFromApi();
    if (futureMenuList == null) {
      menuList = null;
    } else {
      menuList = [];
      menuList!.addAll(futureMenuList);
    }
    notifyListeners();
  }

  MenuModelAPI getOneItem(String ref) {
    return menuList!.firstWhere((element) => element.ref == ref);
  }
}
