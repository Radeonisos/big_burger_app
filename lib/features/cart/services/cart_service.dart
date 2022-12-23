import 'package:big_burger_app/common/utils/convert_cost.dart';
import 'package:big_burger_app/features/menu/models/menu_model_api.dart';
import 'package:big_burger_app/features/menu/services/menu_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/item_cart.dart';

class CartService extends ChangeNotifier {
  List<ItemCart> cartList = [];

  void addProducts(String ref, int number) {
    if (cartList.isEmpty) {
      cartList.add(ItemCart(ref: ref, number: number));
    } else {
      final index = cartList.indexWhere((element) => element.ref == ref);
      if (index >= 0) {
        int numberItemUpdated = cartList[index].number + number;

        cartList[index] = ItemCart(ref: ref, number: numberItemUpdated);
      } else {
        cartList.add(ItemCart(ref: ref, number: number));
      }
    }
    notifyListeners();
  }

  void removeOne(String ref) {
    final index = cartList.indexWhere((element) => element.ref == ref);
    if (index >= 0) {
      int numberItemUpdated = cartList[index].number - 1;
      if (numberItemUpdated <= 0) {
        cartList.removeAt(index);
      } else {
        cartList[index] = ItemCart(ref: ref, number: numberItemUpdated);
      }
      notifyListeners();
    }
  }

  String getTotalOfOneElement(MenuModelAPI menuModelAPI) {
    final index =
        cartList.indexWhere((element) => element.ref == menuModelAPI.ref);
    if (index >= 0) {
      return ConverCost.getCost(cartList[index].number * menuModelAPI.price);
    }
    return '-';
  }

  String getTotalOfCart(BuildContext context) {
    int amount = 0;
    for (var i in cartList) {
      amount += i.number * context.read<MenuService>().getOneItem(i.ref).price;
    }
    return ConverCost.getCost(amount);
  }

  void initCart() {
    cartList = [];
  }
}
