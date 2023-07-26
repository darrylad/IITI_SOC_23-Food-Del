import "package:flutter/material.dart";
import 'package:flutter_2/Screens/Cart/item_model.dart';
import 'package:flutter_2/Screens/Restaurants/JuiciliciousCafe/juici_cafe_menu.dart';
import '../../Search/search_widget.dart';


class SearchBarScreenJuiciliciousCafe extends StatefulWidget {
  const SearchBarScreenJuiciliciousCafe({Key? key}) : super(key: key);

  static const String routeName = '/searchbarjuiciliciouscafe';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const SearchBarScreenJuiciliciousCafe(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  State<SearchBarScreenJuiciliciousCafe> createState() => _SearchBarScreenJuiciliciousCafe();
}

class _SearchBarScreenJuiciliciousCafe extends State<SearchBarScreenJuiciliciousCafe> {
  late List<Item> menuItems;
  String query = '';

  @override
  void initState() {
    super.initState();

    menuItems = productsJC;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          centerTitle: true,
          leading: BackButton(
            onPressed: () {
              Navigator.pushNamed(context, '/juiciliciouscafe');
            },
            color: const Color.fromARGB(255, 152, 46, 1),
          ),
          title: SearchWidget(
            text: query,
            hintText: 'Search In Juicilicious Cafe...',
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
                              menuItem.restaurant ,
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
    final menuItems = productsJC.where((menuItem) {
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
