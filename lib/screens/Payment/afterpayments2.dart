import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class Afterpayments1 extends StatefulWidget {
  const Afterpayments1({super.key});

  @override
  State<Afterpayments1> createState() => _Afterpayments1State();
}

class _Afterpayments1State extends State<Afterpayments1> {
  @override
  void initState() {
    super.initState();
  }

  bool istrue = true;

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      if (istrue == false) {
        setState(() {
          istrue = true;
        });
      } else {
        setState(() {
          istrue = false;
        });
      } // Prints after 1 second.
    });
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: const BottomNav_1(),
      body: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Stack(children: [
            Container(
              decoration: const BoxDecoration(
                gradient: RadialGradient(colors: [
                  Color.fromRGBO(0, 229, 92, 1),
                  Color.fromRGBO(1, 159, 112, 1),
                  Color.fromRGBO(0, 78, 96, 1),
                ], center: Alignment.center, radius: 1),
              ),
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
            ),
            AnimatedOpacity(
              curve: Curves.linear,
              opacity: istrue ? 1 : 0,
              duration: const Duration(seconds: 1),
              child: Container(
                decoration: const BoxDecoration(
                  gradient: RadialGradient(colors: [
                    Color.fromRGBO(1, 159, 121, 1),
                    Color.fromRGBO(1, 139, 114, 1),
                    Color.fromRGBO(0, 67, 96, 1),
                  ], center: Alignment.center, radius: 1),
                ),
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
              ),
            ),
            Positioned(
                child: Container(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color.fromARGB(0, 255, 255, 255),
              ),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                Text(
                  '5',
                  style: GoogleFonts.inter(
                      fontSize: 160,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  'minutes',
                  style: GoogleFonts.inter(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 60,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                      height: 210,
                      width: 350,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 25,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Abhinav Tiwari',
                                  style: GoogleFonts.inter(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                    color: const Color.fromARGB(234, 0, 0, 0),
                                  )),
                            ],
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  color: const Color.fromRGBO(237, 237, 237, 1),
                                  height: 38,
                                  width: 200,
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/buttons/phone.png',
                                          height: 15,
                                          width: 15,
                                        ),
                                        const SizedBox(
                                          width: 2,
                                        ),
                                        Text(
                                          '8302193934',
                                          style: GoogleFonts.inter(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400,
                                              color: const Color.fromRGBO(
                                                  1, 62, 25, 0.75)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Your food has been picked up by',
                                style: GoogleFonts.inter(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: const Color.fromRGBO(0, 0, 0, 0.5)),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Abhinav Tiwari',
                                style: GoogleFonts.inter(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: const Color.fromRGBO(0, 0, 0, 0.5)),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 120,
                )
              ]),
            ))
          ])),
    );
  }
}

// ignore: camel_case_types
class BottomNav_1 extends StatefulWidget {
  const BottomNav_1({
    super.key,
  });

  @override
  State<BottomNav_1> createState() => _BottomNav_1State();
}

// ignore: camel_case_types
class _BottomNav_1State extends State<BottomNav_1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(0, 0, 0, 0),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
        child: Material(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          elevation: 2,
          child: Container(
            height: 60,
            decoration: const BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 1),
                boxShadow: [
                  //BoxShadow
                  BoxShadow(
                    color: Color.fromARGB(255, 0, 0, 0),
                    offset: Offset(1, 1),
                    blurRadius: 0.0,
                    spreadRadius: 0.0,
                  ), //BoxShadow
                ],
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 53,
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
                const SizedBox(
                  width: 60,
                ),
                IconButton(
                    onPressed: () {
                      context.go('/cart.dart');
                    },
                    icon: SvgPicture.asset(
                      'assets/buttons/cart.svg',
                      height: 30,
                      width: 30,
                    )),
                const SizedBox(
                  width: 60,
                ),
                IconButton(
                    onPressed: () {
                      context.go('/accounts.dart');
                    },
                    icon: SvgPicture.asset(
                      'assets/buttons/User.svg',
                      height: 30,
                      width: 30,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
