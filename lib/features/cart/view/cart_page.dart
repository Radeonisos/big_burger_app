import 'package:big_burger_app/core/app_router.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text('Cart'),
          ElevatedButton(
            onPressed: () => AppRoute.toPaymentScreenRoute(context),
            child: Text('Go to payment'),
          )
        ],
      ),
    );
  }
}
