import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:google_fonts/google_fonts.dart";

import "../Homescreen/home_screen.dart";

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreen();
}

class _SearchScreen extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        bottomNavigationBar: const BottomNav_1(),
        body: CustomScrollView(
          slivers: [
            const SliverAppBar(
              pinned: true,
              stretch: true,
              flexibleSpace: FlexibleSpaceBar(
                stretchModes: <StretchMode>[
                  StretchMode.zoomBackground,
                  StretchMode.blurBackground,
                  StretchMode.fadeTitle,
                ],
                centerTitle: true,
                expandedTitleScale: 1.0,
                titlePadding: EdgeInsets.fromLTRB(0, 50, 0, 10),
                title: SearchBarBox(),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Categories',
                        style:
                            GoogleFonts.inter(fontSize: 25, color: Colors.grey),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Pizza(),
                      Burger(),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FrenchFries(),
                      Noodles(),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      KathiRoll(),
                      PaneerTikka(),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Samosa(),
                      Juice(),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IceCream(),
                      Coffee(),
                    ],
                  ),
                  Container(
                    width: double.maxFinite,
                    height: 100,
                    decoration: const BoxDecoration(color: Colors.white),
                  )
                ],
              ),
            )
          ],
        ));
  }
}

class Pizza extends StatelessWidget {
  const Pizza({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.go('/night_canteen_screen.dart');
      },
      child: Container(
        width: 160,
        height: 160,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
                image:
                    const AssetImage('assets/Deepesh/assets/images/pizza.png'),
                // Preferred To Use Network Image Instead Of assets/Deepesh/assets
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.15),
                  BlendMode.darken,
                ))),
        child: const Stack(
          children: [
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  'Pizza',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Burger extends StatelessWidget {
  const Burger({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.go('/tapri_iitians_ki_screen.dart');
      },
      child: Container(
        width: 160,
        height: 160,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
                image:
                    const AssetImage('assets/Deepesh/assets/images/burger.jpg'),
                // Preferred To Use Network Image Instead Of assets/Deepesh/assets
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.15),
                  BlendMode.darken,
                ))),
        child: const Stack(
          children: [
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  'Burger',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FrenchFries extends StatelessWidget {
  const FrenchFries({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/addlocation');
      },
      child: Container(
        width: 160,
        height: 160,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
                image: const AssetImage(
                    'assets/Deepesh/assets/images/frenchfries.jpg'),
                // Preferred To Use Network Image Instead Of assets/Deepesh/assets
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.15),
                  BlendMode.darken,
                ))),
        child: const Stack(
          children: [
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  'French Fries',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Noodles extends StatelessWidget {
  const Noodles({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/addlocation');
      },
      child: Container(
        width: 160,
        height: 160,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
                image: const AssetImage(
                    'assets/Deepesh/assets/images/noodles.png'),
                // Preferred To Use Network Image Instead Of assets/Deepesh/assets
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.15),
                  BlendMode.darken,
                ))),
        child: const Stack(
          children: [
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  'Noodles',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class KathiRoll extends StatelessWidget {
  const KathiRoll({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/addlocation');
      },
      child: Container(
        width: 160,
        height: 160,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
                image: const AssetImage(
                    'assets/Deepesh/assets/images/kathiroll.jpg'),
                // Preferred To Use Network Image Instead Of assets/Deepesh/assets
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.15),
                  BlendMode.darken,
                ))),
        child: const Stack(
          children: [
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  'Kathi Roll',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PaneerTikka extends StatelessWidget {
  const PaneerTikka({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/addlocation');
      },
      child: Container(
        width: 160,
        height: 160,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
                image: const AssetImage(
                    'assets/Deepesh/assets/images/paneertikka.png'),
                // Preferred To Use Network Image Instead Of assets/Deepesh/assets
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.15),
                  BlendMode.darken,
                ))),
        child: const Stack(
          children: [
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  'Paneer Tikka',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Samosa extends StatelessWidget {
  const Samosa({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/addlocation');
      },
      child: Container(
        width: 160,
        height: 160,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
                image:
                    const AssetImage('assets/Deepesh/assets/images/samosa.png'),
                // Preferred To Use Network Image Instead Of assets/Deepesh/assets
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.15),
                  BlendMode.darken,
                ))),
        child: const Stack(
          children: [
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  'Samosa',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Coffee extends StatelessWidget {
  const Coffee({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/addlocation');
      },
      child: Container(
        width: 160,
        height: 160,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
                image:
                    const AssetImage('assets/Deepesh/assets/images/coffee.jpg'),
                // Preferred To Use Network Image Instead Of assets/Deepesh/assets
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.15),
                  BlendMode.darken,
                ))),
        child: const Stack(
          children: [
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  'Coffee',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Juice extends StatelessWidget {
  const Juice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/addlocation');
      },
      child: Container(
        width: 160,
        height: 160,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
                image:
                    const AssetImage('assets/Deepesh/assets/images/juice.jpg'),
                // Preferred To Use Network Image Instead Of assets/Deepesh/assets
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.15),
                  BlendMode.darken,
                ))),
        child: const Stack(
          children: [
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  'Juice',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class IceCream extends StatelessWidget {
  const IceCream({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/addlocation');
      },
      child: Container(
        width: 160,
        height: 160,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
                image: const AssetImage(
                    'assets/Deepesh/assets/images/icecream.jpg'),
                // Preferred To Use Network Image Instead Of assets/Deepesh/assets
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.15),
                  BlendMode.darken,
                ))),
        child: const Stack(
          children: [
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  'Ice Cream',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchBarBox extends StatefulWidget {
  const SearchBarBox({
    super.key,
  });

  @override
  State<SearchBarBox> createState() => SearchBarBoxState();
}

class SearchBarBoxState extends State<SearchBarBox> {
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const BorderRadius.all(Radius.circular(25)),
      elevation: 2,
      child: GestureDetector(
        onTap: () {
          context.go('/search_bar_screen.dart');
        },
        child: Container(
          height: 45,
          width: 375,
          decoration: const BoxDecoration(
              color: Color.fromRGBO(255, 243, 240, 1),
              border: Border(
                  right: BorderSide(color: Color.fromRGBO(164, 73, 21, 1)),
                  bottom: BorderSide(color: Color.fromRGBO(164, 73, 21, 1)),
                  left: BorderSide(color: Color.fromRGBO(164, 73, 21, 1)),
                  top: BorderSide(color: Color.fromRGBO(164, 73, 21, 1))),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Row(
            children: [
              const SizedBox(
                width: 20,
              ),
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
                      fontSize: 18,
                      color: const Color.fromRGBO(164, 73, 21, 1))),
            ],
          ),
        ),
      ),
    );
  }
}
