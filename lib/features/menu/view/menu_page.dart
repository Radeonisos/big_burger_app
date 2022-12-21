import 'package:big_burger_app/features/menu/models/menu_model_api.dart';
import 'package:big_burger_app/features/menu/services/menu_service.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text('Menu'),
          FutureBuilder<List<MenuModelAPI>?>(
              future: MenuService()
                  .getMenusFromApi(), // a previously-obtained Future<String> or null
              builder: (BuildContext context,
                  AsyncSnapshot<List<MenuModelAPI>?> snapshot) {
                if (snapshot.hasData && snapshot.data != null) {
                  return Text(snapshot.data!.length.toString());
                }
                return const CircularProgressIndicator();
              })
        ],
      ),
    );
  }
}
