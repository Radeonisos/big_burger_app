import 'package:big_burger_app/common/utils/convert_cost.dart';
import 'package:big_burger_app/core/app_router.dart';
import 'package:big_burger_app/features/menu/models/menu_model_api.dart';
import 'package:big_burger_app/features/menu/services/menu_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    List<MenuModelAPI>? menu = context.watch<MenuService>().menuList;
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Big Burger',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        menu == null
            ? ElevatedButton(
                onPressed: () => context.read<MenuService>().getMenusFromApi(),
                child: Text(AppLocalizations.of(context)!.tryagain))
            : menu.isEmpty
                ? const CircularProgressIndicator()
                : Flexible(
                    child: RefreshIndicator(
                      child: ListView.builder(
                        itemBuilder: (ctx, idx) {
                          // List Item
                          return InkWell(
                            onTap: () => AppRoute.toDetailScreenRoute(
                                context, menu[idx].ref),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 8),
                              child: Row(children: [
                                Expanded(
                                  flex: 5,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        menu[idx].title,
                                        style: const TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(ConverCost.getCost(menu[idx].price)),
                                      if (menu[idx].description != null)
                                        Text(
                                          menu[idx].description!,
                                          maxLines: 4,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontStyle: FontStyle.italic),
                                        )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: menu[idx].thumbnail == null
                                      ? const FlutterLogo(
                                          size: 100,
                                        )
                                      : Image.network(
                                          menu[idx].thumbnail!,
                                          errorBuilder: (_, __, ___) =>
                                              const FlutterLogo(
                                            size: 100,
                                          ),
                                        ),
                                ),
                              ]),
                            ),
                          );
                        },

                        // Length of the list
                        itemCount: menu.length,

                        // To make listView scrollable
                        // even if there is only a single item.
                        physics: const AlwaysScrollableScrollPhysics(),
                      ),
                      // Function that will be called when
                      // user pulls the ListView downward
                      onRefresh: () async {
                        context.read<MenuService>().getMenusFromApi();
                      },
                    ),
                  )
      ],
    );
  }
}
