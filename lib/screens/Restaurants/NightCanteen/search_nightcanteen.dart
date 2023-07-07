import "package:flutter/material.dart";
import "package:flutter_2/screens/Cart/item_model.dart";
// ignore: unused_import
import "package:go_router/go_router.dart";

import "../../Search/search_widget.dart";

import "night_canteen_menu.dart";

class SearchBarScreennight extends StatefulWidget {
  const SearchBarScreennight({Key? key}) : super(key: key);

  @override
  State<SearchBarScreennight> createState() => _SearchBarScreennight();
}

class _SearchBarScreennight extends State<SearchBarScreennight> {
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
              context.go('/night_canteen_screen.dart');
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
    final menuItems = productsNC.where((Item) {
      final restaurantLower = Item.restaurant.toLowerCase();
      final dishLower = Item.name.toLowerCase();
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
