import 'package:big_burger_app/core/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:vrouter/vrouter.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key, required this.body}) : super(key: key);
  final Widget body;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: context.vRouter.url.contains('cart') ? 1 : 0,
        onTap: (value) => value == 0
            ? AppRoute.toMenuScreenRoute(context)
            : AppRoute.toCartScreenRoute(context),
        items: [
          BottomNavigationBarItem(
              icon: const Icon(Icons.menu_book),
              label: AppLocalizations.of(context)!.menu),
          BottomNavigationBarItem(
              icon: const Icon(Icons.shopping_cart),
              label: AppLocalizations.of(context)!.cart), // TODO : langue
        ],
      ),
      body: SafeArea(child: body),
    );
  }
}
