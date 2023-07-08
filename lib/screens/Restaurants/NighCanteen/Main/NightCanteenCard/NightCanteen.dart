// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_2/Screens/Restaurants/NighCanteen/Cart(SUM)/sum.dart';
import 'package:go_router/go_router.dart';

import '../../Side/NightCanteen_sidefiles.dart';
import 'MainCourse.dart';

class NightCanteen extends StatefulWidget {
  const NightCanteen({super.key});

  @override
  State<NightCanteen> createState() => _NightCanteenState();
}

class _NightCanteenState extends State<NightCanteen> {
  final int sum = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: const BottomNav(),
        backgroundColor: const Color.fromARGB(255, 238, 238, 238),
        body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                const SliverAppBar(),
              ];
            },
            body: const Main_Course()));
  }

  // ignore: non_constant_identifier_names
  SliverAppBar SliverAppbar() {
    return const SliverAppBar(
      backgroundColor: Color.fromARGB(255, 239, 239, 239),
      foregroundColor: Color.fromARGB(255, 255, 255, 255),
      pinned: true,
      stretch: true,
      snap: true,
      floating: true,
      expandedHeight: 420,
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: <StretchMode>[
          StretchMode.zoomBackground,
          StretchMode.blurBackground,
          StretchMode.fadeTitle,
        ],
        centerTitle: true,
        expandedTitleScale: 1.0,
        titlePadding: EdgeInsets.fromLTRB(0, 0, 0, 5),
        title: Menu(),
        background: Padding(
          padding: EdgeInsets.fromLTRB(20, 80, 20, 0),
          child: Upper_Title(),
        ),
      ),
    );
  }
}

class BottomNav extends StatelessWidget {
  const BottomNav({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
      child: Container(
        height: 60,
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              width: 1,
            ),
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                },
                icon: Image.asset(
                  'assets/buttons/Home.png',
                  height: 30,
                  width: 30,
                )),
            IconButton(
                onPressed: () {
                  Summer();
                  Navigator.pushNamed(context, '/cart');
                },
                icon: Image.asset(
                  'assets/buttons/cart.png',
                  height: 30,
                  width: 30,
                )),
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/accounts');
                },
                icon: Image.asset(
                  'assets/buttons/user.png',
                  height: 30,
                  width: 30,
                )),
            const SizedBox(
              width: 1,
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: camel_case_types
