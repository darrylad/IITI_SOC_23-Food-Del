import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_2/BottomNavigationBar/navbar_state_provider.dart';
import 'package:flutter_2/Screens/Cart/cart_provider.dart';
import 'package:flutter_2/Screens/Cart/data_base.dart';
import 'package:flutter_2/global/globals.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class MyNavBar extends StatefulWidget {
  const MyNavBar({
    super.key,
  });

  @override
  State<MyNavBar> createState() => _MyNavBarState();
}

// ignore: camel_case_types
class _MyNavBarState extends State<MyNavBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;

    return /* ChangeNotifierProvider<NavBarStateProvider>(
        create: (context) => NavBarStateProvider(),
        child:
            Consumer<NavBarStateProvider>(builder: (context, provider, child) {
          provider.designProfileContainer();
          provider.assignCartBackgroundColor();
          provider.designHomeContainer();
          provider.assignCartWidget();
          provider.designCartContainer();
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              height: 0.17 * screenwidth,
              width: screenwidth,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 250,
                    color: const Color.fromARGB(255, 95, 34, 0).withOpacity(.3),
                  )
                ],
              ),
              child: SafeArea(
                child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 0.0277 * screenwidth,
                        vertical: 0.0236 * screenwidth),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              homeselected = true;
                              cartselected = false;
                              profileselected = false;
                              Navigator.pushNamed(context, '/home');

                              provider.designProfileContainer();
                              provider.assignCartBackgroundColor();
                              provider.designHomeContainer();
                              provider.assignCartWidget();
                              provider.designCartContainer();
                            });
                          },
                          child: Container(
                            width: 0.26 * screenwidth,
                            height: 0.125 * screenwidth,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                color: provider.colorHomeBackground),
                            child: Center(
                                child: SvgPicture.asset(
                              'assets/buttons/home-04.svg',
                              color: provider.colorhomeicon,
                              fit: BoxFit.cover,
                            )),
                          ),
                        ),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                homeselected = false;
                                cartselected = true;
                                profileselected = false;
                                Navigator.pushNamed(context, '/cart');

                                provider.designProfileContainer();
                                provider.assignCartBackgroundColor();
                                provider.designHomeContainer();
                                provider.assignCartWidget();
                                provider.designCartContainer();
                              });
                            },
                            child: Container(
                                width: 0.26 * screenwidth,
                                height: 0.125 * screenwidth,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(24),
                                    color: provider.colorCartBackground),
                                child: Center(
                                  child: provider.cartWidget,
                                ))),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              homeselected = false;
                              cartselected = false;
                              profileselected = true;
                              Navigator.pushNamed(context, '/accounts');

                              provider.designProfileContainer();
                              provider.assignCartBackgroundColor();
                              provider.designHomeContainer();
                              provider.assignCartWidget();
                              provider.designCartContainer();
                            });
                          },
                          child: Container(
                            width: 0.26 * screenwidth,
                            height: 0.125 * screenwidth,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                color: provider.colorUserBackground),
                            child: Center(
                                child: SvgPicture.asset(
                              'assets/buttons/User.svg',
                              color: provider.colorusericon,
                              fit: BoxFit.cover,
                            )),
                          ),
                        ),
                      ],
                    )),
              ),
            ),
          );
        })); 
  }
}
*/
        Container(
      margin: EdgeInsets.all(screenwidth * .05),
      height: screenwidth * .17,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 250,
            color: const Color.fromARGB(255, 95, 34, 0).withOpacity(.3),
            offset: Offset(0, 10),
          )
        ],
        borderRadius: BorderRadius.circular(50),
      ),
      child: ListView.builder(
        itemCount: 3,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            setState(() {
              currentIndex = index;
              HapticFeedback.lightImpact();
              Navigator.pushNamed(context, listOfRoutes[index]);
            });
          },
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Stack(
            children: [
              Center(
                child: Container(
                  height: 0.125 * screenwidth,
                  width: screenwidth * .26,
                  child: AnimatedContainer(
                    duration: Duration(seconds: 1),
                    curve: Curves.fastLinearToSlowEaseIn,
                    height: index == currentIndex ? screenwidth * .32 : 0,
                    width: index == currentIndex ? screenwidth * .32 : 0,
                    decoration: BoxDecoration(
                      color: index == currentIndex
                          ? const Color.fromARGB(255, 222, 117, 72)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ),
              AnimatedContainer(
                duration: Duration(seconds: 1),
                curve: Curves.fastLinearToSlowEaseIn,
                width: index == currentIndex
                    ? screenwidth * .31
                    : screenwidth * .18,
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AnimatedContainer(
                          duration: Duration(seconds: 1),
                          curve: Curves.fastLinearToSlowEaseIn,
                          width: index == currentIndex ? screenwidth * .03 : 20,
                        ),
                        SvgPicture.asset(listOfIcons[index],
                            color: index == currentIndex
                                ? Colors.white
                                : Colors.black),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<String> listOfIcons = [
    'assets/buttons/home-04.svg',
    'assets/buttons/cart.svg',
    'assets/buttons/Users.svg'
  ];

  List<String> listOfStrings = [
    'Home',
    'Cart',
    'Profile',
  ];
  List<String> listOfRoutes = [
    '/home',
    '/cart',
    '/accounts',
  ];
}
