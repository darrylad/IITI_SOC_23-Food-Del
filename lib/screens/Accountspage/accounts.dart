import 'package:flutter/material.dart';
import 'package:flutter_2/global/globals.dart';
import 'package:flutter_2/screens/Start/start_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      bottomNavigationBar: const BottomNav_1(),
      body: Column(
        children: [
          const SizedBox(
            height: 80,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(180)),
                      child: Image.asset(
                        'assets/images/logo.png',
                        height: 180,
                        width: 180,
                      )))
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(username,
                  style: const TextStyle(
                      color: Color.fromRGBO(18, 18, 18, 1),
                      fontFamily: 'Inter',
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      height: 1)),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              const SizedBox(
                width: 70,
              ),
              TextButton.icon(
                onPressed: () {},
                icon: Image.asset(
                  'assets/Tejas/to-do-list.png',
                  width: 26,
                  height: 26,
                ),
                label: const Padding(
                  padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                  child: Text(
                    'My Orders',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontFamily: 'Inter',
                        fontSize: 22,
                        letterSpacing: 0,
                        fontWeight: FontWeight.normal,
                        height: 1),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              const SizedBox(
                width: 70,
              ),
              TextButton.icon(
                onPressed: () {},
                icon: Image.asset(
                  'assets/Tejas/creditcard.png',
                  width: 26,
                  height: 26,
                ),
                label: const Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Text(
                    'Payment Methods',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontFamily: 'Inter',
                        fontSize: 22,
                        letterSpacing: 0,
                        fontWeight: FontWeight.normal,
                        height: 1),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              const SizedBox(
                width: 70,
              ),
              TextButton.icon(
                onPressed: () {},
                icon: Image.asset(
                  'assets/Tejas/heart.png',
                  width: 26,
                  height: 26,
                ),
                label: const Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Text(
                    'Favourites',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontFamily: 'Inter',
                        fontSize: 22,
                        letterSpacing: 0,
                        fontWeight: FontWeight.normal,
                        height: 1),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              const SizedBox(
                width: 70,
              ),
              TextButton.icon(
                onPressed: () {},
                icon: Image.asset(
                  'assets/Tejas/feedback.png',
                  width: 26,
                  height: 26,
                ),
                label: const Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Text(
                    'Feedback',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontFamily: 'Inter',
                        fontSize: 22,
                        letterSpacing: 0,
                        fontWeight: FontWeight.normal,
                        height: 1),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              const SizedBox(
                width: 70,
              ),
              TextButton.icon(
                onPressed: () {},
                icon: Image.asset(
                  'assets/Tejas/ringing.png',
                  width: 26,
                  height: 26,
                ),
                label: const Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Text(
                    'Notification',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontFamily: 'Inter',
                        fontSize: 22,
                        letterSpacing: 0,
                        fontWeight: FontWeight.normal,
                        height: 1),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              const SizedBox(
                width: 70,
              ),
              TextButton.icon(
                onPressed: () {},
                icon: Image.asset(
                  'assets/Tejas/moon.png',
                  width: 26,
                  height: 26,
                ),
                label: const Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Text(
                    'Appearance',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontFamily: 'Inter',
                        fontSize: 22,
                        letterSpacing: 0,
                        fontWeight: FontWeight.normal,
                        height: 1),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              const SizedBox(
                width: 70,
              ),
              TextButton.icon(
                onPressed: () {},
                icon: Image.asset(
                  'assets/Tejas/information.png',
                  width: 26,
                  height: 26,
                ),
                label: const Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Text(
                    'About',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontFamily: 'Inter',
                        fontSize: 22,
                        letterSpacing: 0,
                        fontWeight: FontWeight.normal,
                        height: 1),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              const SizedBox(
                width: 70,
              ),
              TextButton.icon(
                onPressed: () {
                  controller.logout();
                  context.go('/');
                },
                icon: Image.asset(
                  'assets/Tejas/logout.png',
                  width: 26,
                  height: 26,
                ),
                label: const Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Text(
                    'Log Out',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color.fromRGBO(255, 166, 0, 1),
                        fontFamily: 'Inter',
                        fontSize: 22,
                        letterSpacing: 0,
                        fontWeight: FontWeight.normal,
                        height: 1),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class BottomNav_1 extends StatelessWidget {
  const BottomNav_1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
        child: Material(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          elevation: 2,
          child: Container(
            height: 60,
            decoration: const BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 1),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: 1,
                ),
                IconButton(
                    onPressed: () {
                      context.go('/home_screen.dart');
                    },
                    icon: Image.asset(
                      'assets/buttons/Home.png',
                      height: 30,
                      width: 30,
                    )),
                IconButton(
                    onPressed: () {
                      context.go('/cart.dart');
                    },
                    icon: SvgPicture.asset(
                      'assets/buttons/cart.svg',
                      height: 30,
                      width: 30,
                    )),
                IconButton(
                    onPressed: () {
                      context.go('/accounts.dart');
                    },
                    icon: SvgPicture.asset(
                      'assets/buttons/User.svg',
                      height: 30,
                      width: 30,
                    )),
                const SizedBox(
                  width: 1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
