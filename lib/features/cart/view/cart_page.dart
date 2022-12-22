import 'package:big_burger_app/core/app_router.dart';
import 'package:big_burger_app/features/cart/models/item_cart.dart';
import 'package:big_burger_app/features/cart/services/cart_service.dart';
import 'package:big_burger_app/features/cart/view/widgets/cart_element.dart';
import 'package:big_burger_app/features/menu/services/menu_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    List<ItemCart>? cartList = context.watch<CartService>().cartList;

    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                AppLocalizations.of(context)!.cart,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          cartList.isEmpty
              ? Text('Rien dans le panier')
              : Flexible(
                  child: ListView.builder(
                    itemBuilder: (ctx, idx) {
                      return CartElement(
                        menuModelAPI: context
                            .read<MenuService>()
                            .getOneItem(cartList[idx].ref),
                        number: cartList[idx].number,
                      );
                    },
                    itemCount: cartList.length,
                    physics: const AlwaysScrollableScrollPhysics(),
                  ),
                ),
          Text(
              'Total : ${context.read<CartService>().getTotalOfCart(context)}'),
          ElevatedButton(
            onPressed: () => AppRoute.toPaymentScreenRoute(context),
            child: Text('Go to payment'),
          )
        ],
      ),
    );
  }
}
