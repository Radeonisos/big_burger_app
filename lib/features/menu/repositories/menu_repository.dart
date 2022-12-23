import 'dart:convert' as convert;

import 'package:big_burger_app/features/menu/models/menu_model_api.dart';
import 'package:http/http.dart' as http;

class MenuRepository {
  Future<List<MenuModelAPI>?> getMenusFromApi() async {
    var url = Uri.https('uad.io', '/bigburger');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      List<MenuModelAPI> menus = [];
      for (var e in convert.jsonDecode(response.body)) {
        menus.add(MenuModelAPI.fromJson(e));
      }
      return menus;
    }
    return null;
  }
}
