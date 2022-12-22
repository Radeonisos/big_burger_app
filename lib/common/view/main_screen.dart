import 'package:big_burger_app/core/app_router.dart';
import 'package:big_burger_app/features/menu/services/menu_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:vrouter/vrouter.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key, required this.body}) : super(key: key);
  final Widget body;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<MenuService>().getMenusFromApi();
    });
  }

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
      body: SafeArea(child: widget.body),
    );
  }
}
