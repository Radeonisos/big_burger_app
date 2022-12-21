import 'package:big_burger_app/core/app_router.dart';
import 'package:flutter/material.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          children: [
            Text('Success'),
            ElevatedButton(
              onPressed: () => AppRoute.toMainScreenRoute(context),
              child: Text('retour arrière'),
            )
          ],
        ),
      ),
    );
  }
}
