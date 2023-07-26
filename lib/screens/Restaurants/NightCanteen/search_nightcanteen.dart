import "package:flutter/material.dart";
import 'package:flutter_2/Screens/Cart/item_model.dart';
// ignore: unused_import
import "package:go_router/go_router.dart";

import "../../Search/search_widget.dart";

import "night_canteen_menu.dart";

class SearchBarScreenNight extends StatefulWidget {
  const SearchBarScreenNight({Key? key}) : super(key: key);

  static const String routeName = '/searchbarnight';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const SearchBarScreenNight(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  State<SearchBarScreenNight> createState() => _SearchBarScreenNight();
}

class _SearchBarScreenNight extends State<SearchBarScreenNight> {
  late List<Item> menuItems;
  String query = '';

  @override
  void initState() {
    super.initState();

    menuItems = productsNC;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          centerTitle: true,
          leading: BackButton(
            onPressed: () {
              Navigator.pushNamed(context, '/nightcanteen');
            },
            color: const Color.fromARGB(255, 152, 46, 1),
          ),
          title: SearchWidget(
            text: query,
            hintText: 'Search In Night Canteen...',
            onChanged: searchMenuItem,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(
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
                              menuItem.name,
                              style: const TextStyle(
                                  fontFamily: 'Dropdown',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            tileColor: Colors.white70,
                            subtitle: Text(
                              menuItem.restaurant,
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 80, 80, 80),
                                  fontFamily: 'Dropdown',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            onTap: null,
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
    final menuItems = productsNC.where((menuItem) {
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
