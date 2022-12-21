import 'package:big_burger_app/features/menu/models/menu_model_api.dart';
import 'package:big_burger_app/features/menu/repositories/menu_repository.dart';

class MenuService {
  Future<List<MenuModelAPI>?> getMenusFromApi() async {
    print('requets');
    return MenuRepository().getMenusFromApi();
  }
}
