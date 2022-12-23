import 'package:big_burger_app/common/view/title_text.dart';
import 'package:big_burger_app/core/app_router.dart';
import 'package:big_burger_app/features/cart/services/cart_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<CartService>().initCart();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const TitleText('Big Burger'),
            Lottie.network(
                'https://assets6.lottiefiles.com/packages/lf20_ynz5xr.json',
                onLoaded: (_) => const CircularProgressIndicator()),
            Text(
              AppLocalizations.of(context)!.congratulation,
              style: const TextStyle(fontSize: 30),
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
              onPressed: () => AppRoute.toMainScreenRoute(context),
              child: Text(AppLocalizations.of(context)!.anotherMenu),
            )
          ],
        ),
      ),
    );
  }
}
