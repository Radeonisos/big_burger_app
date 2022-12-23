import 'package:big_burger_app/core/app_router.dart';
import 'package:big_burger_app/features/cart/models/item_cart.dart';
import 'package:big_burger_app/features/cart/services/cart_service.dart';
import 'package:big_burger_app/features/menu/models/menu_model_api.dart';
import 'package:big_burger_app/features/menu/services/menu_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:vrouter/vrouter.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ItemCart>? cartList = context.read<CartService>().cartList;

    return Center(
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onPressed: () => context.vRouter.pop(),
              ),
              Text(
                AppLocalizations.of(context)!.payment,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Flexible(
            child: ListView.builder(
              itemBuilder: (ctx, idx) {
                MenuModelAPI menuModel =
                    context.read<MenuService>().getOneItem(cartList[idx].ref);
                return Padding(
                  padding: const EdgeInsets.only(
                      left: 18, right: 90, top: 8, bottom: 8),
                  child: Row(
                    children: [
                      Text(menuModel.title),
                      Text(' X ${cartList[idx].number}'),
                      const Spacer(),
                      Text(context
                          .read<CartService>()
                          .getTotalOfOneElement(menuModel)),
                    ],
                  ),
                );
              },
              itemCount: cartList.length,
            ),
          ),
          TextButton(
              onPressed: () => AppRoute.toSuccessScreenRoute(context),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                      '${AppLocalizations.of(context)!.pay} ${context.read<CartService>().getTotalOfCart(context)} '),
                  SizedBox(width: 40, child: Image.asset('assets/img/pp.png'))
                ],
              )),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
