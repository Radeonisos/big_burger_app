import 'package:big_burger_app/common/view/main_screen.dart';
import 'package:big_burger_app/features/cart/view/cart_page.dart';
import 'package:big_burger_app/features/detail/view/detail_page.dart';
import 'package:big_burger_app/features/menu/view/menu_page.dart';
import 'package:big_burger_app/features/payment/view/payment_page.dart';
import 'package:big_burger_app/features/success/view/success_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:vrouter/vrouter.dart';

class AppRoute extends VRouteElementBuilder {
  AppRoute({required this.context});
  final BuildContext context;

  static const String mainScreenRoute = 'mainScreenRoute';
  static const String menuScreenRoute = 'menuScreenRoute';
  static const String cartScreenRoute = 'cartScreenRoute';
  static const String paymentScreenRoute = 'paymentScreenRoute';
  static const String successScreenRoute = 'successScreenRoute';
  static const String detailScreenRoute = 'detailScreenRoute';

  static void toMainScreenRoute(BuildContext context) =>
      context.vRouter.toNamed(mainScreenRoute);
  static void toMenuScreenRoute(BuildContext context) =>
      context.vRouter.toNamed(menuScreenRoute);
  static void toCartScreenRoute(BuildContext context) =>
      context.vRouter.toNamed(cartScreenRoute);
  static void toPaymentScreenRoute(BuildContext context) =>
      context.vRouter.toNamed(paymentScreenRoute);
  static void toSuccessScreenRoute(BuildContext context) =>
      context.vRouter.toNamed(successScreenRoute);
  static void toDetailScreenRoute(BuildContext context, String ref) =>
      context.vRouter.toNamed(detailScreenRoute, pathParameters: {'ref': ref});

  @override
  List<VRouteElement> buildRoutes() {
    return [
      VNester(
        path: '/',
        name: mainScreenRoute,
        widgetBuilder: (child) => MainScreen(body: child),
        nestedRoutes: [
          VWidget(
              path: null,
              name: menuScreenRoute,
              widget: const MenuPage(),
              stackedRoutes: [
                VWidget(
                    path: 'detail/:ref',
                    name: detailScreenRoute,
                    widget: const DetailPage()),
              ]),
          VWidget(
              path: 'cart',
              name: cartScreenRoute,
              widget: const CartPage(),
              stackedRoutes: [
                VWidget(
                    path: 'payment',
                    name: paymentScreenRoute,
                    widget: const PaymentPage()),
              ])
        ],
      ),
      VWidget(
          path: '/success',
          transitionDuration: const Duration(milliseconds: 300),
          buildTransition: (animation, _, child) => ClipRect(
                  child: SlideTransition(
                position:
                    Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
                        .animate(animation),
                child: child,
              )),
          name: successScreenRoute,
          widget: const SuccessPage()),
    ];
  }
}
