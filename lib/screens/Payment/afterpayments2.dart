import 'dart:async';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_2/screens/Homescreen/home_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class Afterpayments1 extends StatefulWidget {
  const Afterpayments1({super.key});

  @override
  State<Afterpayments1> createState() => _Afterpayments1State();
}

class _Afterpayments1State extends State<Afterpayments1> {

 final String deliveryAgentName = "Abhinav Tiwari";
  final String deliveryAgentPhone = "9876543210";




  @override
  void initState() {
    startTimer();
    super.initState();
  }

  static const maxmin = 10;
  int minutes = maxmin;
  Timer? timer;

  void startTimer() {
    timer = Timer.periodic(const Duration(minutes: 1), (_) {
      setState(() {
        if (minutes < 1) {
          context.go('/Afterpayments2.dart');
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
                            height: 25,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(deliveryAgentName.toString(),
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
                                onTap: ()async {
                                  final Uri url = Uri(
                                scheme: 'tel',
                                path: deliveryAgentPhone,
                              );
                              if (await canLaunchUrl(url)) {
                                await launchUrl(url);
                              } else {
                                throw 'Could not launch $url';
                              }
                                },
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
                                          deliveryAgentPhone.toString(),
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
                                deliveryAgentName.toString(),
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
