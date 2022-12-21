import 'dart:convert' as convert;

import 'package:big_burger_app/features/menu/models/menu_model_api.dart';
import 'package:http/http.dart' as http;

class MenuRepository {
  Future<List<MenuModelAPI>?> getMenusFromApi() async {
    print('request');

    var url = Uri.https('uad.io', '/bigburger');
    print('request start');
    print(url.path);
    var response = await http.get(url);
    print(response.statusCode);
    if (response.statusCode == 200) {
      List<MenuModelAPI> _menus = [];
      for (var e in convert.jsonDecode(response.body)) {
        _menus.add(MenuModelAPI());
      }
      return _menus;
    }
    return null;
    //GET  request to  https://uad.io/bigburger
  }
}
