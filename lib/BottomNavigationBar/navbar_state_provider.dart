import 'package:flutter/material.dart';
import 'package:flutter_2/Screens/Cart/cart_provider.dart';
import 'package:flutter_2/global/globals.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NavBarStateProvider extends ChangeNotifier {
  Color? colorhomeicon;
  Color? colorcarticon;
  Color? colorusericon;

  Color? colorHomeBackground;
  Color? colorCartBackground;
  Color? colorUserBackground;

  String? navigationRoute;

  Widget? cartWidget;

  void designHomeContainer() {
    if (homeselected == false) {
      colorhomeicon = Colors.black;
      colorusericon = Colors.black;
      colorHomeBackground = Colors.white;
      colorCartBackground = Colors.white;
      colorUserBackground = Colors.white;
      notifyListeners();
    } else {
      colorhomeicon = Colors.white;
      colorusericon = Colors.black;
      colorHomeBackground = const Color.fromARGB(255, 222, 117, 72);
      colorCartBackground = Colors.white;
      colorUserBackground = Colors.white;
      notifyListeners();
    }
  }

  void designCartContainer() {
    if (cartselected == false) {
      colorhomeicon = Colors.black;
      colorusericon = Colors.black;
      colorHomeBackground = Colors.white;
      colorUserBackground = Colors.white;
      notifyListeners();
    } else {
      colorhomeicon = Colors.black;
      colorusericon = Colors.black;
      colorHomeBackground = Colors.white;
      colorUserBackground = Colors.white;
      notifyListeners();
    }
  }

  void designProfileContainer() {
    if (profileselected == false) {
      colorhomeicon = Colors.black;
      colorusericon = Colors.black;
      colorHomeBackground = Colors.white;
      colorCartBackground = Colors.white;
      colorUserBackground = Colors.white;
      notifyListeners();
    } else {
      colorhomeicon = Colors.black;
      colorusericon = Colors.white;
      colorHomeBackground = Colors.white;
      colorCartBackground = Colors.white;
      colorUserBackground = const Color.fromARGB(255, 222, 117, 72);

      notifyListeners();
    }
  }

  void assignCartBackgroundColor() {
    if (cartselected == false && cartEmptyState == true) {
      colorCartBackground = Colors.white;
    } else if (cartselected == false && cartEmptyState == false) {
      colorCartBackground = const Color.fromARGB(255, 38, 193, 127);
    } else if (cartselected == true) {
      colorCartBackground = const Color.fromARGB(255, 222, 117, 72);
    }
  }

  void assignCartWidget() {
    if (cartselected == false && cartEmptyState == true) {
      cartWidget = SvgPicture.asset(
        'assets/buttons/cart.svg',
        color: Colors.black,
        fit: BoxFit.cover,
      );
      notifyListeners();
    } else if (cartselected == false && cartEmptyState == false) {
      cartWidget = Row(
        children: [
          SizedBox(
            width: 13,
          ),
          SvgPicture.asset(
            'assets/buttons/cart.svg',
            width: 24,
            height: 24,
            color: Colors.white,
          ),
          SizedBox(
            width: 5,
          ),
          Container(
            height: 40,
            width: 55,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(27),
              color: const Color.fromARGB(255, 216, 255, 218),
            ),
            child: Center(
              child: ChangeNotifierProvider<CartProvider>(
                create: (context) => CartProvider(),
                child: Consumer<CartProvider>(
                  builder: (context, value, child) {
                    return Text(
                      (value.getCounter()).toString(),
                      style: GoogleFonts.inter(
                          color: const Color.fromARGB(255, 38, 193, 127),
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    );
                  },
                ),
              ),
            ),
          )
        ],
      );
      notifyListeners();
    } else if (cartselected == true && cartEmptyState == true) {
      cartWidget = SvgPicture.asset(
        'assets/buttons/cart.svg',
        color: Colors.white,
        fit: BoxFit.cover,
      );
      notifyListeners();
    } else if (cartselected == true && cartEmptyState == false) {
      cartWidget = Row(
        children: [
          SizedBox(
            width: 13,
          ),
          SvgPicture.asset(
            'assets/buttons/cart.svg',
            width: 24,
            height: 24,
            color: Colors.white,
          ),
          SizedBox(
            width: 5,
          ),
          Container(
            height: 40,
            width: 55,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(27),
              color: const Color.fromARGB(255, 216, 255, 218),
            ),
            child: Center(
              child: ChangeNotifierProvider<CartProvider>(
                create: (context) => CartProvider(),
                child: Consumer<CartProvider>(
                  builder: (context, value, child) {
                    return Text(
                      (value.getCounter()).toString(),
                      style: GoogleFonts.inter(
                          color: const Color.fromARGB(255, 222, 117, 72),
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    );
                  },
                ),
              ),
            ),
          )
        ],
      );
      notifyListeners();
    }
  }
}

/*icon colour change from blaCK TO WHITE AFTER TAPPING THE ICON;
cart management;
expand tile changes in menu*/

/*
 padding:
                            EdgeInsets.symmetric(horizontal: 7, vertical: 6),
                        leading: Row(
                          children: [
                            SizedBox(width: 13,),
                            SvgPicture.asset(
                              'assets/buttons/cart.svg',
                              color: provider.colorcarticon,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              height: 40,
                              width: 55,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(27),
                                color: const Color.fromARGB(255, 216, 255, 218),
                              ),
                              child: Center(
                                child: ChangeNotifierProvider<CartProvider>(
                                  create: (context) => CartProvider(),
                                  child: Consumer<CartProvider>(
                                    builder: (context, value, child) {
                                      return Text((value.getCounter()+2).toString(),
                                      style: GoogleFonts.inter(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15
                                      ),);
                                    },
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        */
