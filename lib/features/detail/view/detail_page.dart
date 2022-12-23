import 'package:big_burger_app/common/utils/convert_cost.dart';
import 'package:big_burger_app/core/app_router.dart';
import 'package:big_burger_app/features/cart/services/cart_service.dart';
import 'package:big_burger_app/features/menu/models/menu_model_api.dart';
import 'package:big_burger_app/features/menu/services/menu_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:vrouter/vrouter.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int numberOfItem = 1;
  @override
  Widget build(BuildContext context) {
    String ref = context.vRouter.pathParameters['ref']!;
    MenuModelAPI menuModelAPI = context.read<MenuService>().getOneItem(ref);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                color: Colors.blueGrey,
                width: double.infinity,
                child: menuModelAPI.thumbnail == null
                    ? const FlutterLogo(
                        size: 200,
                      )
                    : Image.network(
                        menuModelAPI.thumbnail!,
                        errorBuilder: (_, __, ___) => const FlutterLogo(
                          size: 200,
                        ),
                      ),
              ),
              Positioned(
                left: 15,
                top: 15,
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.white,
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                    onPressed: () => context.vRouter.pop(),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              menuModelAPI.title,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              ConverCost.getCost(menuModelAPI.price),
              style: const TextStyle(
                fontSize: 30,
              ),
            ),
          ),
          if (menuModelAPI.description != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                menuModelAPI.description!,
                style:
                    const TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
              ),
            ),
          const SizedBox(
            height: 40,
          ),
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 8),
              decoration: const BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {
                      if (numberOfItem > 0) {
                        setState(() {
                          numberOfItem -= 1;
                        });
                      }
                    },
                    icon: Icon(
                      Icons.remove,
                      color: numberOfItem <= 1 ? Colors.grey : Colors.white,
                    ),
                  ),
                  Text(
                    numberOfItem.toString(),
                    style: const TextStyle(fontSize: 25, color: Colors.white),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        numberOfItem += 1;
                      });
                    },
                    icon: const Icon(Icons.add, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                context
                    .read<CartService>()
                    .addProducts(menuModelAPI.ref, numberOfItem);
                AppRoute.toMainScreenRoute(context);
              },
              child: Text(AppLocalizations.of(context)!.add),
            ),
          ),
        ],
      ),
    );
  }
}
