import "package:flutter/material.dart";
import 'package:flutter_2/Screens/Cart/item_model.dart';
// ignore: unused_import
import "package:go_router/go_router.dart";

import "../search_widget.dart";
import "menu_item_data.dart";

class SearchBarScreen extends StatefulWidget {
  const SearchBarScreen({Key? key}) : super(key: key);

  static const String routeName = '/searchbarafter';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const SearchBarScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  State<SearchBarScreen> createState() => _SearchBarScreen();
}

class _SearchBarScreen extends State<SearchBarScreen> {
  late List<Item> menuItems;
  String query = '';

  @override
  void initState() {
    super.initState();

    menuItems = products;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          centerTitle: true,
          leading: BackButton(
            onPressed: () {
              context.go('/home_screen.dart');
            },
            color: const Color.fromARGB(255, 152, 46, 1),
          ),
          title: SearchWidget(
            text: query,
            hintText: 'Search Restaurants, Dishes and More...',
            onChanged: searchMenuItem,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 800,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemCount: menuItems.length,
                itemBuilder: (context, index) {
                  final menuItem = menuItems[index];

                  return InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 5),
                      child: Container(
                        child: Center(
                          child: ListTile(
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                menuItem.image,
                                fit: BoxFit.cover,
                                width: 56,
                                height: 56,
                              ),
                            ),
                            splashColor: Colors.grey,
                            title: Text(
                              menuItem.restaurant,
                              style: const TextStyle(
                                  fontFamily: 'Dropdown',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            tileColor: Colors.white70,
                            subtitle: Text(
                              menuItem.name,
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 80, 80, 80),
                                  fontFamily: 'Dropdown',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                              onTap: () {
                                (menuItem.restaurant == 'Night Canteen')
                                    ? context.go('/NightCanteenScreen.dart')
                                    : menuItem.restaurant == 'Tapri IITians Ki'
                                    ? context.go('/TapriIITiansKiScreen.dart')
                                    : menuItem.restaurant == 'Tea Post'
                                    ? context.go('/TeaPostScreen.dart')
                                    : context.go(
                                    '/JuiciliciousCafeScreen.dart');
                              },
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ]),
        ));
  }

  void searchMenuItem(String query) {
    final menuItems = products.where((menuItem) {
      final restaurantLower = menuItem.restaurant.toLowerCase();
      final dishLower = menuItem.name.toLowerCase();
      final searchLower = query.toLowerCase();

      return restaurantLower.contains(searchLower) ||
          dishLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.menuItems = menuItems;
    });
  }
}
