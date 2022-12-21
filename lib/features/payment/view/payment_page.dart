import 'package:big_burger_app/core/app_router.dart';
import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text('Payment'),
          ElevatedButton(
            onPressed: () => AppRoute.toSuccessScreenRoute(context),
            child: Text('Payer'),
          )
        ],
      ),
    );
  }
}
