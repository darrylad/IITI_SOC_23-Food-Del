import 'package:flutter/material.dart';
import 'package:flutter_2/BottomNavigationBar/bottom_nav_bar.dart';
import 'package:flutter_2/Screens/Cart/cart_provider.dart';
import 'package:flutter_2/global/globals.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../navbarbasics/nav.dart';
import '../Homescreen/home_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  static const String routeName = '/accounts';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const ProfileScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class CustomDialog extends StatelessWidget {
  final Widget content;

  CustomDialog({required this.content});

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Container(
        width: 0.92 * screenwidth,
        height: 498,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(17),
            topRight: Radius.circular(17),
            bottomLeft: Radius.circular(17),
            bottomRight: Radius.circular(17),
          ),
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.15000000596046448),
                offset: Offset(0, 0),
                blurRadius: 39)
          ],
          color: Color.fromRGBO(255, 243, 235, 1),
        ),
        child: content,
      ),
    );
  }
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    // print(username);
    context.read<CartProvider>().getData();
  }

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      bottomNavigationBar: const MyNavBar(),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
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
                          'assets/appicon/1024.png',
                          height: 180,
                          width: 180,
                        )))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(username,
                    style: GoogleFonts.inter(
                        color: const Color.fromRGBO(18, 18, 18, 1),
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        height: 1)),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 0.130 * screenwidth,
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'assets/Tejas/to-do-list..svg',
                    width: 26,
                    height: 26,
                  ),
                  label: Padding(
                    padding: const EdgeInsets.fromLTRB(13, 0, 0, 0),
                    child: Text(
                      'Active Orders',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.inter(
                          color: const Color.fromRGBO(0, 0, 0, 1),
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 0.125 * screenwidth,
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'assets/Tejas/heart.svg',
                    width: 26,
                    height: 26,
                  ),
                  label: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                    child: Text(
                      'Favourites',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.inter(
                          color: const Color.fromRGBO(0, 0, 0, 1),
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
                SizedBox(
                  width: 0.125 * screenwidth,
                ),
                TextButton.icon(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return CustomDialog(
                            content: SizedBox(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(top: 30),
                                    child: SizedBox(
                                        width: 276,
                                        height: 104,
                                        child: Row(
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 20),
                                              child: Image.asset(
                                                'assets/appicon/1024.png',
                                                height: 104,
                                                width: 104,
                                              ),
                                            ),
                                            Text(
                                              'MunchMate',
                                              style: GoogleFonts.inter(
                                                  color: const Color.fromRGBO(
                                                      143, 63, 5, 1),
                                                  fontSize: 26,
                                                  letterSpacing: 0,
                                                  fontWeight: FontWeight.w600,
                                                  height: 1),
                                            ),
                                          ],
                                        )),
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(20, 50, 20, 20),
                                    child: Text(
                                      'We made this app to give on-campus restaurants an intuitive platform to display their menu and provide delivery services. This project was a part of IITISoC’23.',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color.fromRGBO(
                                              115, 49, 2, 0.6000000238418579),
                                          fontFamily: 'Inter',
                                          fontSize: 21,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.normal,
                                          height: 1),
                                    ),
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(32, 40, 32, 32),
                                    child: Text(
                                      'Made by Shivam, Darryl, Tejas, and Deepesh',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color.fromRGBO(
                                              115, 49, 2, 0.6000000238418579),
                                          fontFamily: 'Inter',
                                          fontSize: 23,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.w500,
                                          height: 1),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        });
                  },
                  icon: SvgPicture.asset(
                    'assets/Tejas/information.svg',
                    width: 26,
                    height: 26,
                  ),
                  label: const Padding(
                    padding: EdgeInsets.fromLTRB(14, 0, 0, 0),
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 0.125 * screenwidth,
                ),
                TextButton.icon(
                  onPressed: () {
                    controller.logout();
                    context.go('/');
                  },
                  icon: SvgPicture.asset(
                    'assets/Tejas/logout.svg',
                    width: 26,
                    height: 26,
                  ),
                  label: Padding(
                    padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                    child: Text(
                      'Log Out',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.inter(
                          color: const Color.fromRGBO(255, 166, 0, 1),
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
      ),
    );
  }
}

// ignore: camel_case_types

