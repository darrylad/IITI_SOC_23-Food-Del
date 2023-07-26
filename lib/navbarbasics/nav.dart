import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../global/globals.dart';

class Nav extends StatefulWidget {
  const Nav({
    super.key,
  });

  @override
  State<Nav> createState() => _NavState();
}

// ignore: camel_case_types
class _NavState extends State<Nav> {
  @override
  void initState() {
    colourdecider();
    super.initState();
  }
  // ignore: prefer_typing_uninitialized_variables

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 15),
      child: Container(
        height: 60,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(57)),
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
        //

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
                onTap: () {
                  home = true;
                  cart = false;
                  account = false;
                  colourdecider();
                  if (payed == true) {
                    context.push('/home_screen.dart');
                  } else {
                    context.go('/home_screen.dart');
                  }
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    dot_1(),
                    const SizedBox(
                      height: 8,
                    ),
                    SvgPicture.asset(
                      'assets/buttons/home.svg',
                      height: 30,
                      width: 30,
                    ),
                  ],
                )),
            const SizedBox(
              width: 80,
            ),
            GestureDetector(
                onTap: () {
                  home = false;
                  cart = true;
                  account = false;
                  colourdecider();
                  context.push('/CartScreen.dart');
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    dot_2(),
                    const SizedBox(
                      height: 8,
                    ),
                    SvgPicture.asset(
                      'assets/buttons/cart.svg',
                      height: 30,
                      width: 30,
                    ),
                  ],
                )),
            const SizedBox(
              width: 80,
            ),
            GestureDetector(
                onTap: () {
                  home = false;
                  cart = false;
                  account = true;
                  colourdecider();
                  if (payed == true) {
                    context.push(route);
                  } else {
                    context.go(route);
                  }
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    dot_3(),
                    const SizedBox(
                      height: 8,
                    ),
                    SvgPicture.asset(
                      'assets/buttons/User.svg',
                      height: 30,
                      width: 30,
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

// ignore: camel_case_types, non_constant_identifier_names
Widget dot_1() {
  return Container(
    height: 2,
    width: 30,
    color: colour_1,
  );
}

Widget dot_3() {
  return Container(
    height: 2,
    width: 30,
    color: colour_3,
  );
}

Widget dot_2() {
  return Container(
    height: 2,
    width: 30,
    color: colour_2,
  );
}
