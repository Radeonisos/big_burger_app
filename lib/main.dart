import 'package:big_burger_app/core/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:vrouter/vrouter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return VMaterialApp(
      title: 'Big Burger',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      child: VRouter(
        debugShowCheckedModeBanner: false,
        mode: VRouterMode.history,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('fr', 'FR'), // English, no country code
          Locale('es', 'US'), // Spanish, no country code
        ],
        routes: [AppRoute(context: context)],
      ),
    );
  }
}