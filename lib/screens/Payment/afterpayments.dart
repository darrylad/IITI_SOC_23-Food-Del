import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_2/screens/Homescreen/home_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class Afterpayments extends StatefulWidget {
  const Afterpayments({super.key});

  @override
  State<Afterpayments> createState() => _AfterpaymentsState();
}

class _AfterpaymentsState extends State<Afterpayments> {
  @override
  void initState() {
    startTimer();
    super.initState();
  }

  static const maxmin = 12;
  int minutes = maxmin;
  Timer? timer;

  void startTimer() {
    timer = Timer.periodic(Duration(minutes: 1), (_) {
      setState(() {
        if (minutes <= 11) {
          context.go('/Afterpayments1.dart');
        } else {
          minutes--;
        }
      });
    });
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
      bottomNavigationBar: const Nav(),
      body: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Stack(children: [
            Container(
              decoration: const BoxDecoration(
                gradient: RadialGradient(colors: [
                  Color.fromRGBO(200, 86, 62, 1),
                  Color.fromRGBO(171, 52, 1, 1),
                  Color.fromRGBO(115, 23, 2, 1),
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
                    Color.fromRGBO(255, 163, 96, 1),
                    Color.fromRGBO(205, 78, 06, 1),
                    Color.fromRGBO(146, 19, 2, 1),
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
                  minutes.toString(),
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
                            height: 35,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Your food is being prepared',
                                  style: GoogleFonts.inter(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color:
                                        const Color.fromRGBO(2, 119, 56, 0.92),
                                  )),
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  color: const Color.fromRGBO(237, 237, 237, 1),
                                  height: 38,
                                  width: 275,
                                  child: Center(
                                    child: Text(
                                      'Call Night Canteen',
                                      style: GoogleFonts.inter(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black),
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
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  color: const Color.fromRGBO(237, 237, 237, 1),
                                  height: 38,
                                  width: 275,
                                  child: Center(
                                    child: Text(
                                      'Request Cancellation',
                                      style: GoogleFonts.inter(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black),
                                    ),
                                  ),
                                ),
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

  @override
  void dispose() {
    startTimer();
    super.dispose();
  }
}

// ignore: camel_case_types
