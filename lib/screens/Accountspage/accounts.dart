import 'package:flutter/material.dart';

import '../Restaurants/NighCanteen/Main/NightCanteenCard/NightCanteen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNav(),
      body: Column(
        children: [
          const SizedBox(
            height: 100,
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
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Shivam',
                  style: TextStyle(
                      color: Color.fromRGBO(56, 56, 56, 1),
                      fontFamily: 'Inter',
                      fontSize: 25,
                      fontWeight: FontWeight.normal,
                      height: 1)),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              const SizedBox(
                width: 50,
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
          Row(
            children: [
              const SizedBox(
                width: 50,
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
          Row(
            children: [
              const SizedBox(
                width: 50,
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
          Row(
            children: [
              const SizedBox(
                width: 50,
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
          Row(
            children: [
              const SizedBox(
                width: 50,
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
          Row(
            children: [
              const SizedBox(
                width: 50,
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
          Row(
            children: [
              const SizedBox(
                width: 50,
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
          Row(
            children: [
              const SizedBox(
                width: 50,
              ),
              TextButton.icon(
                onPressed: () {},
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
      // body: Stack(children: <Widget>[
      //   Positioned(
      //     left: 120,
      //     top: 85,
      //     child: SizedBox(
      //       width: 152,
      //       height: 204,
      //       child: Stack(
      //         children: [
      //           Align(
      //             alignment: Alignment.topCenter,
      //             child: Container(
      //               width: 152,
      //               height: 152,
      //               decoration: const BoxDecoration(
      //                 boxShadow: [
      //                   BoxShadow(
      //                       color:
      //                           Color.fromRGBO(103, 30, 0, 0.3100000023841858),
      //                       offset: Offset(0, 0),
      //                       blurRadius: 69)
      //                 ],
      //                 gradient: LinearGradient(
      //                     begin: Alignment(6.123234262925839e-17, 1),
      //                     end: Alignment(-1, 6.123234262925839e-17),
      //                     colors: [
      //                       Color.fromRGBO(255, 170, 91, 1),
      //                       Color.fromRGBO(207, 127, 59, 1)
      //                     ]),
      //                 borderRadius:
      //                     BorderRadius.all(Radius.elliptical(152, 152)),
      //               ),
      //             ),
      //           ),
      //           const Align(
      //             alignment: Alignment.bottomCenter,
      //             child:
      //         ],
      //       ),
      //     ),
      //   ),
      //   Positioned(
      //     top: 318,
      //     left: 43,
      //     child: SizedBox(
      //         width: 208,
      //         height: 384,
      //         child: Column(
      //           children: <Widget>[
      //             Align(
      //               alignment: Alignment.centerLeft,
      //               child:
      //             ),
      //             Align(
      //               alignment: Alignment.centerLeft,
      //               child: TextButton.icon(
      //                 onPressed: () {},
      //                 icon: Image.asset(
      //                   'assets/Tejas/credit-card (1).png',
      //                   width: 30,
      //                   height: 30,
      //                 ),
      //                 label: const Text(
      //                   'Payment Methods',
      //                   style: TextStyle(
      //                       color: Color.fromRGBO(0, 0, 0, 1),
      //                       fontFamily: 'Inter',
      //                       fontSize: 18,
      //                       letterSpacing: 0,
      //                       fontWeight: FontWeight.normal,
      //                       height: 1),
      //                 ),
      //               ),
      //             ),
      //             Align(
      //               alignment: Alignment.centerLeft,
      //               child: TextButton.icon(
      //                 onPressed: () {},
      //                 icon: Image.asset(
      //                   'assets/Tejas/heart.png',
      //                   width: 30,
      //                   height: 30,
      //                 ),
      //                 label: const Text(
      //                   'Favourites',
      //                   style: TextStyle(
      //                       color: Color.fromRGBO(0, 0, 0, 1),
      //                       fontFamily: 'Inter',
      //                       fontSize: 18,
      //                       letterSpacing: 0,
      //                       fontWeight: FontWeight.normal,
      //                       height: 1),
      //                 ),
      //               ),
      //             ),
      //             Align(
      //               alignment: Alignment.centerLeft,
      //               child: TextButton.icon(
      //                 onPressed: () {},
      //                 icon: Image.asset(
      //                   'assets/Tejas/feedback.png',
      //                   width: 30,
      //                   height: 30,
      //                 ),
      //                 label: const Text(
      //                   'Feedback',
      //                   style: TextStyle(
      //                       color: Color.fromRGBO(0, 0, 0, 1),
      //                       fontFamily: 'Inter',
      //                       fontSize: 18,
      //                       letterSpacing: 0,
      //                       fontWeight: FontWeight.normal,
      //                       height: 1),
      //                 ),
      //               ),
      //             ),
      //             Align(
      //               alignment: Alignment.centerLeft,
      //               child: TextButton.icon(
      //                 onPressed: () {},
      //                 icon: Image.asset(
      //                   'assets/Tejas/ringing.png',
      //                   width: 30,
      //                   height: 30,
      //                 ),
      //                 label: const Text(
      //                   'Notifications',
      //                   style: TextStyle(
      //                       color: Color.fromRGBO(0, 0, 0, 1),
      //                       fontFamily: 'Inter',
      //                       fontSize: 18,
      //                       letterSpacing: 0,
      //                       fontWeight: FontWeight.normal,
      //                       height: 1),
      //                 ),
      //               ),
      //             ),
      //             Align(
      //               alignment: Alignment.centerLeft,
      //               child: TextButton.icon(
      //                 onPressed: () {},
      //                 icon: Image.asset(
      //                   'assets/Tejas/moon.png',
      //                   width: 30,
      //                   height: 30,
      //                 ),
      //                 label: const Text(
      //                   'Appearance',
      //                   style: TextStyle(
      //                       color: Color.fromRGBO(0, 0, 0, 1),
      //                       fontFamily: 'Inter',
      //                       fontSize: 18,
      //                       letterSpacing: 0,
      //                       fontWeight: FontWeight.normal,
      //                       height: 1),
      //                 ),
      //               ),
      //             ),
      //             Align(
      //               alignment: Alignment.centerLeft,
      //               child: TextButton.icon(
      //                 onPressed: () {},
      //                 icon: Image.asset(
      //                   'assets/Tejas/information.png',
      //                   width: 30,
      //                   height: 30,
      //                 ),
      //                 label: const Text(
      //                   'About',
      //                   style: TextStyle(
      //                       color: Color.fromRGBO(0, 0, 0, 1),
      //                       fontFamily: 'Inter',
      //                       fontSize: 18,
      //                       letterSpacing: 0,
      //                       fontWeight: FontWeight.normal,
      //                       height: 1),
      //                 ),
      //               ),
      //             ),
      //             Align(
      //               alignment: Alignment.centerLeft,
      //               child: TextButton.icon(
      //                 onPressed: () {},
      //                 icon: Image.asset(
      //                   'assets/Tejas/logout.png',
      //                   width: 30,
      //                   height: 30,
      //                 ),
      //                 label: const Text(
      //                   'Log Out',
      //                   style: TextStyle(
      //                       color: Color.fromRGBO(193, 39, 5, 1),
      //                       fontFamily: 'Inter',
      //                       fontSize: 18,
      //                       letterSpacing: 0,
      //                       fontWeight: FontWeight.normal,
      //                       height: 1),
      //                 ),
      //               ),
      //             ),
      //           ],
      //         )),
      //   ),
      // ]),
    );
  }
}
