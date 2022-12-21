import 'package:big_burger_app/core/app_router.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          children: [
            Text('Detail'),
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
