import 'package:flutter/material.dart';
import 'package:flutter_2/controller_login/login_controller.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Homescreen/ImageCarausel.dart';
import 'Homescreen/SectionTitle.dart';

// import 'package:google_sign_in/google_sign_in.dart';

// ignore: must_be_immutable
class Startscreen extends StatefulWidget {
  const Startscreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return State1();
  }
}

class State1 extends State<Startscreen> {
  bool onnnnn = false;
  final controller = Get.put(LoginController());
  // final GoogleSignIn _googleSignIn = GoogleSignIn();
  // ignore: prefer_typing_uninitialized_variables
  // var userName;
  // ignore: prefer_typing_uninitialized_variables
  // var photoUrl;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        onnnnn = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator StartscreenWidget - FRAME
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 254, 224, 196)),
        child: Stack(children: <Widget>[
          Center(
            child: Obx(() {
              if (controller.googleAccount.value == null) {
                return LoginView();
              } else {
                return Home(controller.googleAccount.value?.displayName ?? '',
                    controller.googleAccount.value?.photoUrl ?? '');
              }
            }),
          )
        ]),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  SizedBox LoginView() {
    return SizedBox(
        width: 900,
        height: 500,
        child: Stack(children: <Widget>[
          AnimatedPositioned(
              top: onnnnn ? 10.0 : 150.0,
              right: onnnnn ? 118 : 118,
              duration: const Duration(seconds: 3),
              curve: Curves.fastOutSlowIn,
              child: Center(
                child: Container(
                    width: 186,
                    height: 186,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(137),
                          topRight: Radius.circular(137),
                          bottomLeft: Radius.circular(137),
                          bottomRight: Radius.circular(137),
                        ),
                        image: DecorationImage(
                          image: AssetImage("assets/images/logo.png"),
                          fit: BoxFit.cover,
                        ))),
              )),
          Positioned(
            top: 400,
            right: 95,
            child: AnimatedOpacity(
              opacity: onnnnn ? 1.0 : 0.0,
              duration: const Duration(seconds: 3),
              child: FloatingActionButton.extended(
                onPressed: () {
                  // _googleSignIn.signIn().then((value) {
                  //   String username = value!.displayName!;
                  //   String profilePicture = value.photoUrl!;
                  //   return HomeScreen(
                  //       url: profilePicture, nameofperson: username);
                  // });
                  controller.login();
                },
                icon: Image.asset('assets/images/Google_logo.png',
                    height: 34, width: 34),
                label: const Text('Sign in with Google'),
                backgroundColor: const Color.fromARGB(255, 253, 205, 159),
                foregroundColor: Colors.black,
              ),
            ),
          )
        ]));
  }
}

// ignore: non_constant_identifier_names
Scaffold Home(String nameofperson, String url) {
  return Scaffold(
    backgroundColor: const Color.fromARGB(255, 248, 248, 248),
    body: MainScroll(
      name: nameofperson,
      url: url,
    ),
  );
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
        bottom: TabBar(tabs: <Widget>[
          Tab(
            text: 'Home',
            icon: Image.asset(
              'assets/buttons/Home.png',
              height: 20,
              width: 20,
            ),
          )
        ]),
        backgroundColor: const Color.fromARGB(255, 248, 248, 248),
        foregroundColor: const Color.fromARGB(255, 248, 248, 248),
        pinned: true,
        stretch: true,
        snap: true,
        floating: true,
        expandedHeight: 150,
        flexibleSpace: FlexibleSpaceBar(
          stretchModes: const <StretchMode>[
            StretchMode.zoomBackground,
            StretchMode.blurBackground,
            StretchMode.fadeTitle,
          ],
          centerTitle: true,
          expandedTitleScale: 1.0,
          titlePadding: const EdgeInsets.fromLTRB(0, 1, 0, 10),
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
                    'Hi, $name ',
                    style: GoogleFonts.dmSans(
                        color: const Color.fromARGB(255, 152, 46, 1),
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(22, 2, 0, 0),
                  child: Text(
                    'Deliver to: VSB Hostel ',
                    style: GoogleFonts.dmSans(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      url,
                      scale: 3,
                    ),
                    foregroundImage: NetworkImage(
                      url,
                      scale: 3,
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
                onTap: () {
                  context.go('/Nightcanteen.dart');
                },
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
