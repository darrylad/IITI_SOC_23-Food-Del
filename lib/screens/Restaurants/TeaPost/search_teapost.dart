import "package:flutter/material.dart";
import 'package:flutter_2/Screens/Cart/item_model.dart';
import 'package:flutter_2/Screens/Restaurants/TeaPost/tea_post_menu.dart';
import 'package:flutter_2/Screens/Search/search_widget.dart';
import 'package:google_fonts/google_fonts.dart';



class SearchBarScreenTeaPost extends StatefulWidget {
  const SearchBarScreenTeaPost({Key? key}) : super(key: key);

  static const String routeName = '/searchbarteapost';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const SearchBarScreenTeaPost(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  State<SearchBarScreenTeaPost> createState() => _SearchBarScreenTeaPost();
}

class _SearchBarScreenTeaPost extends State<SearchBarScreenTeaPost> {
  late List<Item> menuItems;
  String query = '';

  @override
  void initState() {
    super.initState();

    menuItems = productsTP;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          centerTitle: true,
          leading: BackButton(
            onPressed: () {
              Navigator.pushNamed(context, '/teapost');
            },
            color: const Color.fromARGB(255, 152, 46, 1),
          ),
          title: SearchWidget(
            text: query,
            hintText: 'Search In Tea Post...',
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
                              style: GoogleFonts.lato(
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                              )
                            ),
                            tileColor: Colors.white70,
                            subtitle: Text(
                              menuItem.restaurant,
                              style: GoogleFonts.lato(
                                fontSize: 16,
                                fontWeight: FontWeight.w400
                              )
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
    final menuItems = productsTP.where((menuItem) {
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
