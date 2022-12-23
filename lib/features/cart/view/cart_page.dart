import 'package:big_burger_app/common/view/title_text.dart';
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
          TitleText(AppLocalizations.of(context)!.cart),
          cartList.isEmpty
              ? Text(AppLocalizations.of(context)!.noCart)
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
          if (cartList.isNotEmpty)
            Text(
                '${AppLocalizations.of(context)!.total} : ${context.read<CartService>().getTotalOfCart(context)}'),
          if (cartList.isNotEmpty)
            ElevatedButton(
              onPressed: () => AppRoute.toPaymentScreenRoute(context),
              child: Text(AppLocalizations.of(context)!.payment),
            )
        ],
      ),
    );
  }
}
