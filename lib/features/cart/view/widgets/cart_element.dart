import 'package:big_burger_app/features/cart/services/cart_service.dart';
import 'package:big_burger_app/features/menu/models/menu_model_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartElement extends StatelessWidget {
  const CartElement(
      {Key? key, required this.menuModelAPI, required this.number})
      : super(key: key);
  final MenuModelAPI menuModelAPI;
  final int number;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: Column(
        children: [
          Row(children: [
            Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    menuModelAPI.title,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 8),
                    decoration: const BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () => context
                              .read<CartService>()
                              .removeOne(menuModelAPI.ref),
                          icon: number == 1
                              ? const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                )
                              : const Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                ),
                        ),
                        Text(
                          number.toString(),
                          style: const TextStyle(
                              fontSize: 25, color: Colors.white),
                        ),
                        IconButton(
                          onPressed: () => context
                              .read<CartService>()
                              .addProducts(menuModelAPI.ref, 1),
                          icon: const Icon(Icons.add, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  menuModelAPI.thumbnail == null
                      ? const FlutterLogo(
                          size: 100,
                        )
                      : Image.network(
                          menuModelAPI.thumbnail!,
                          errorBuilder: (_, __, ___) => const FlutterLogo(
                            size: 100,
                          ),
                        ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                      'total : ${context.read<CartService>().getTotalOfOneElement(menuModelAPI)}'),
                ],
              ),
            ),
          ]),
          const SizedBox(
            height: 8,
          ),
          const Divider(
            indent: 50,
            endIndent: 50,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
