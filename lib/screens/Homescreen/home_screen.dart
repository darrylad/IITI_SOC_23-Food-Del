import 'package:flutter/material.dart';
import 'package:flutter_2/screens/Homescreen/ImageCarausel.dart';
import 'package:google_fonts/google_fonts.dart';

import 'SectionTitle.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.url, required this.nameofperson});
  final String location = 'VSB Hostel';
  final String url;
  final String nameofperson;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 248, 248),
      body: MainScroll(
        name: nameofperson,
        url: url,
      ),
    );
  }
}

class MainScroll extends StatelessWidget {
  const MainScroll({
    super.key,
    required this.url,
    required this.name,
  });

  final String url;
  final String name;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverAppBar(
        backgroundColor: const Color.fromARGB(255, 248, 248, 248),
        foregroundColor: const Color.fromARGB(255, 248, 248, 248),
        pinned: true,
        stretch: true,
        // snap: true,
        // floating: true,
        expandedHeight: 160,
        flexibleSpace: FlexibleSpaceBar(
          stretchModes: const <StretchMode>[
            StretchMode.zoomBackground,
            StretchMode.blurBackground,
            StretchMode.fadeTitle,
          ],
          centerTitle: true,
          expandedTitleScale: 1.0,
          titlePadding: const EdgeInsets.fromLTRB(0, 1, 0, 5),
          title: const SearchBar_Homepage(),
          background: GoodMorning(url: url, name: name),
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
        child: NightCanteen_card(),
      ),
      const SliverToBoxAdapter(
        child: TeaPost_card(),
      ),
      const SliverToBoxAdapter(
        child: Aladeens_card(),
      ),
      const SliverToBoxAdapter(
        child: Juciliciouss_card(),
      ),
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
      onTap: () {},
      child: const SearchBar(),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const BorderRadius.all(Radius.circular(25)),
      elevation: 2,
      child: Container(
          height: 45,
          width: 375,
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 255, 220, 105),
              border: Border(
                  right: BorderSide(color: Color.fromARGB(255, 255, 185, 8)),
                  bottom: BorderSide(color: Color.fromARGB(255, 255, 185, 8)),
                  left: BorderSide(color: Color.fromARGB(255, 255, 185, 8)),
                  top: BorderSide(color: Color.fromARGB(255, 255, 185, 8))),
              borderRadius: BorderRadius.all(Radius.circular(25))),
          child: Center(
            child: Text('Search Reataurants,Dishes and more',
                style: GoogleFonts.lato(fontSize: 21, color: Colors.black)),
          )),
    );
  }
}

class GoodMorning extends StatelessWidget {
  const GoodMorning({
    super.key,
    required this.url,
    required this.name,
  });

  final String url;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 0, 0),
                  child: Text(
                    'Good Morning, $name ',
                    style: GoogleFonts.dmSans(
                        color: const Color.fromARGB(255, 152, 46, 1),
                        fontSize: 23,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(22, 2, 0, 0),
                  child: Text(
                    'Deliver to: VSB Hostel ',
                    style: GoogleFonts.dmSans(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 20, 10),
                  child: InkWell(
                    onTap: () {},
                    child: Image.network(
                      url,
                      height: 30,
                      width: 30,
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
class Aladeens_card extends StatelessWidget {
  const Aladeens_card({
    super.key,
  });

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
            elevation: 10,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Color.fromARGB(255, 255, 255, 255)),
              height: 210,
              width: 370,
              child: GestureDetector(
                onTap: () {},
                child: Stack(children: [
                  Positioned(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      child: SizedBox(
                        height: 130,
                        width: 370,
                        child: Image.asset(
                          'assets/dispics/dishes/shahi_paneer.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 140,
                    left: 9,
                    child: Text(
                      'Aladeens',
                      style: GoogleFonts.inter(
                          color: const Color.fromARGB(255, 2, 2, 2),
                          fontSize: 22,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  Positioned(
                    top: 170,
                    left: 9,
                    child: Text(
                      'Open till 10Pm',
                      style: GoogleFonts.inter(
                          color: const Color.fromARGB(255, 2, 2, 2),
                          fontSize: 16,
                          fontWeight: FontWeight.normal),
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

class Heading extends StatelessWidget {
  const Heading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const SizedBox(
          height: 20,
          width: 20,
        ),
        Center(
            child: Text(
          'DELIVERY TO:',
          style: GoogleFonts.inter(
            fontSize: 12,
            color: const Color.fromARGB(255, 240, 175, 25),
          ),
        )),
        Center(
          child: Text(
            'VSB Hostel',
            style: GoogleFonts.inter(fontSize: 20, color: Colors.black),
          ),
        )
      ],
    );
  }
}

// ignore: camel_case_types
class TeaPost_card extends StatelessWidget {
  const TeaPost_card({
    super.key,
  });

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
            elevation: 10,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Color.fromARGB(255, 255, 255, 255)),
              height: 210,
              width: 370,
              child: GestureDetector(
                onTap: () {},
                child: Stack(children: [
                  Positioned(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      child: SizedBox(
                        height: 130,
                        width: 370,
                        child: Image.asset(
                          'assets/dispics/dishes/Frenchfries.jpg',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 140,
                    left: 9,
                    child: Text(
                      'Tea Post',
                      style: GoogleFonts.inter(
                          color: const Color.fromARGB(255, 2, 2, 2),
                          fontSize: 22,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  Positioned(
                    top: 170,
                    left: 9,
                    child: Text(
                      'Open till 1Am',
                      style: GoogleFonts.inter(
                          color: const Color.fromARGB(255, 2, 2, 2),
                          fontSize: 16,
                          fontWeight: FontWeight.normal),
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

// ignore: camel_case_types
class NightCanteen_card extends StatelessWidget {
  const NightCanteen_card({
    super.key,
  });

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
            elevation: 10,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Color.fromARGB(255, 255, 255, 255)),
              height: 210,
              width: 370,
              child: GestureDetector(
                onTap: () {},
                child: Stack(children: [
                  Positioned(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      child: SizedBox(
                        height: 130,
                        width: 370,
                        child: Image.asset(
                          'assets/dispics/dishes/shahi_paneer.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 140,
                    left: 9,
                    child: Text(
                      'Night Canteen',
                      style: GoogleFonts.inter(
                          color: const Color.fromARGB(255, 2, 2, 2),
                          fontSize: 22,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  Positioned(
                    top: 170,
                    left: 9,
                    child: Text(
                      'Opens after 11Pm',
                      style: GoogleFonts.inter(
                          color: const Color.fromARGB(255, 2, 2, 2),
                          fontSize: 16,
                          fontWeight: FontWeight.normal),
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

// ignore: camel_case_types
class Juciliciouss_card extends StatelessWidget {
  const Juciliciouss_card({
    super.key,
  });

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
            elevation: 10,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Color.fromARGB(255, 255, 255, 255)),
              height: 210,
              width: 370,
              child: GestureDetector(
                onTap: () {},
                child: Stack(children: [
                  Positioned(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      child: SizedBox(
                        height: 130,
                        width: 370,
                        child: Image.asset(
                          'assets/dispics/dishes/shahi_paneer.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 140,
                    left: 9,
                    child: Text(
                      'Jucilicious Cafe',
                      style: GoogleFonts.inter(
                          color: const Color.fromARGB(255, 2, 2, 2),
                          fontSize: 22,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  Positioned(
                    top: 170,
                    left: 9,
                    child: Text(
                      'Open till 2Am',
                      style: GoogleFonts.inter(
                          color: const Color.fromARGB(255, 2, 2, 2),
                          fontSize: 16,
                          fontWeight: FontWeight.normal),
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
