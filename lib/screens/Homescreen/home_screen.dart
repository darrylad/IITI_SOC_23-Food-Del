import 'package:flutter/material.dart';
import 'package:flutter_2/BottomNavigationBar/bottom_nav_bar.dart';
import 'package:flutter_2/Screens/Cart/cart_provider.dart';
import 'package:flutter_2/Screens/Cart/data_base.dart';
import 'package:flutter_2/Screens/Homescreen/ImageCarausel.dart';
import 'package:flutter_2/Screens/Homescreen/data.dart';

import 'package:go_router/go_router.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

import '../../global/globals.dart';
import '../Location/locationpopup.dart';
import 'SectionTitle.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

// ignore: camel_case_types
class _HomeScreen extends State<HomeScreen> {
  DBHelper dbHelper = DBHelper();
  @override
  void initState() {
    super.initState();
    // print(username);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: const MyNavBar(),
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: MainScroll(
        name: username,
      ),
    );
  }
}

class MainScroll extends StatelessWidget {
  const MainScroll({
    super.key,
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverAppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
        pinned: true,
        stretch: true,
        // snap: true,
        // floating: true,
        expandedHeight: 175,
        flexibleSpace: FlexibleSpaceBar(
          stretchModes: const <StretchMode>[
            StretchMode.zoomBackground,
            StretchMode.blurBackground,
            StretchMode.fadeTitle,
          ],
          centerTitle: true,
          expandedTitleScale: 1.0,
          titlePadding: const EdgeInsets.fromLTRB(0, 1, 0, 8),
          title: const SearchBar_Homepage(),
          background: GoodMorning(name: name),
        ),
      ),
      const SliverToBoxAdapter(
        child: ImageCarausal(),
      ),
      const SliverToBoxAdapter(
        child: Center(
          child: SectionTitle(
            title: 'Restaurants',
          ),
        ),
      ),
      const SliverToBoxAdapter(
        child: RestCard(),
      ),
      const SliverToBoxAdapter(
        child: SizedBox(
          height: 100,
        ),
      )
    ]);
  }
}

// ignore: camel_case_types
class SearchBar_Homepage extends StatelessWidget {
  const SearchBar_Homepage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go('/SearchBarScreen.dart');
      },
      child: const SearchBar(),
    );
  }
}

class SearchBar extends StatefulWidget {
  const SearchBar({
    super.key,
  });

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
      child: Container(
        height: 45,
        width: 350,
        decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(160, 80, 0, 1),
                spreadRadius: -19.0,
                offset: Offset.zero,
                blurRadius: 30,
              )
            ],
            color: Color.fromRGBO(255, 243, 240, 1),
            border: Border(
                right: BorderSide(color: Color.fromRGBO(164, 73, 21, 1)),
                bottom: BorderSide(color: Color.fromRGBO(164, 73, 21, 1)),
                left: BorderSide(color: Color.fromRGBO(164, 73, 21, 1)),
                top: BorderSide(color: Color.fromRGBO(164, 73, 21, 1))),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/buttons/Search_1.png',
              height: 25,
              width: 25,
            ),
            const SizedBox(
              width: 5,
            ),
            Text('Search Reataurants,Dishes and more',
                style: GoogleFonts.lato(
                    fontSize: 18, color: const Color.fromRGBO(164, 73, 21, 1))),
          ],
        ),
      ),
    );
  }
}

Future<void> _dialogBuilder(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return const popup();
    },
  );
}

class GoodMorning extends StatefulWidget {
  final String name;
  const GoodMorning({super.key, required this.name});

  @override
  State<GoodMorning> createState() => _GoodMorning();
}

// ignore: camel_case_types
class _GoodMorning extends State<GoodMorning> {
  @override
  Widget build(BuildContext context) {
    // String username = widget.name;

    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(26, 2, 0, 0),
                  child: Text(
                    'Hi, $username ',
                    style: GoogleFonts.inter(
                        color: const Color.fromARGB(255, 152, 46, 1),
                        fontSize: 24,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(23, 0, 0, 0),
                      child: Image.asset('assets/buttons/location.png',
                          height: 14, width: 14),
                    ),
                    GestureDetector(
                        onTap: () =>
                            _dialogBuilder(context).then((dropdownvalue) {
                              setState(() {
                                Locationselected = dropdownValue;
                              });
                            }),
                        child: Text(
                          'Deliver to: $Locationselected ',
                          style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: const Color.fromARGB(255, 0, 0, 0)),
                        )),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 35, 18, 10),
                  child: IconButton(
                    onPressed: () {},
                    icon: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(50)),
                      child: Image.asset(
                        'assets/appicon/1024.png',
                        height: 70,
                        width: 70,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}

// ignore: camel_case_types

// ignore: camel_case_types

// ignore: camel_case_types

// ignore: camel_case_types

class RestCard extends StatelessWidget {
  const RestCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: Restaurants_name.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              index: index,
            );
          }),
    );
  }
}

class Card extends StatefulWidget {
  final int index;
  const Card({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<Card> createState() => _CardState();
}

class _CardState extends State<Card> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
          child: Material(
            elevation: 0,
            borderRadius: const BorderRadius.all(Radius.circular(13)),
            child: Container(
              decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 40,
                      spreadRadius: -15,
                    )
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(13)),
                  color: Color.fromARGB(255, 255, 255, 255)),
              height: 240,
              width: 356,
              child: GestureDetector(
                onTap: () {
                  context.push(Restaurants_route[widget.index].toString());
                  currentIndex = 3;
                  categorySelected = 'All';
                },
                child: Stack(children: [
                  Positioned(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      child: SizedBox(
                        height: 173,
                        width: 370,
                        child: Image.asset(
                          Restaurants_Img[widget.index].toString(),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 180,
                    left: 15,
                    child: Text(
                      Restaurants_name[widget.index].toString(),
                      style: GoogleFonts.inter(
                          color: const Color.fromARGB(255, 2, 2, 2),
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Positioned(
                      top: 185,
                      right: 40,
                      child: Image.asset(
                        'assets/buttons/star.png',
                        height: 20,
                        width: 20,
                      )),
                  Positioned(
                    top: 208,
                    left: 15,
                    child: Text(
                      Restaurants_disc[widget.index].toString(),
                      style: GoogleFonts.inter(
                          color: const Color.fromRGBO(142, 140, 140, 1),
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Positioned(
                    top: 185,
                    right: 13,
                    child: Text(
                      Restaurants_stars[widget.index].toString(),
                      style: GoogleFonts.inter(
                          color: const Color.fromARGB(255, 208, 184, 0),
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ]),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
