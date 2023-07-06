import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class NCIntroduction extends StatefulWidget {
  const NCIntroduction({
    Key? key,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _NCIntroductionState createState() => _NCIntroductionState();
}

class _NCIntroductionState extends State<NCIntroduction> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 330,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 20,
                          spreadRadius: 0,
                          color: Color.fromARGB(64, 0, 0, 0))
                    ],
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                height: 250,
                width: 350,
                child: Stack(
                  children: [
                    Positioned(
                      top: 15,
                      left: 20,
                      child: Text(
                        'Night Canteen',
                        style: GoogleFonts.inter(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 50,
                      child: IconButton(
                          onPressed: () {
                            context.go('/search_bar_screen.dart');
                          },
                          icon: Image.asset(
                            'assets/buttons/search.png',
                            height: 23,
                            width: 23,
                          )),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            'assets/buttons/Heart.png',
                            height: 22,
                            width: 22,
                          )),
                    ),
                    Positioned(
                        top: 50,
                        left: 18,
                        child: Image.asset(
                          'assets/buttons/star.png',
                          height: 18,
                          width: 18,
                        )),
                    Positioned(
                        top: 50,
                        left: 37,
                        child: Text(
                          '3.2',
                          style: GoogleFonts.inter(
                              fontSize: 15,
                              color: const Color.fromARGB(255, 200, 151, 3)),
                        )),
                    Positioned(
                      top: 72,
                      left: 150,
                      child: Image.asset(
                        'assets/buttons/final.png',
                        height: 90,
                        width: 50,
                      ),
                    ),
                    Positioned(
                        top: 77,
                        right: 82,
                        child: Text(
                          'Night Canteen',
                          style: GoogleFonts.inter(
                              fontSize: 11,
                              color: const Color.fromARGB(255, 0, 0, 0)),
                        )),
                    Positioned(
                        top: 140,
                        right: 100,
                        child: Text(
                          'VSB Hostel',
                          style: GoogleFonts.inter(
                              fontSize: 11,
                              color: const Color.fromARGB(255, 0, 0, 0)),
                        )),
                    Positioned(
                        top: 108,
                        right: 190,
                        child: Text(
                          'ETA: 10min',
                          style: GoogleFonts.inter(
                              fontSize: 11,
                              color: const Color.fromARGB(255, 0, 0, 0)),
                        )),
                    Positioned(
                        top: 170,
                        left: 20,
                        child: Text(
                          'Step into a lively atmosphere filled with the aroma',
                          style: GoogleFonts.inter(
                              fontSize: 12,
                              color: const Color.fromARGB(255, 0, 0, 0)),
                        )),
                    Positioned(
                        top: 190,
                        left: 20,
                        child: Text(
                          'of mouthwatering dishes and the sounds of',
                          style: GoogleFonts.inter(
                              fontSize: 12,
                              color: const Color.fromARGB(255, 0, 0, 0)),
                        )),
                    Positioned(
                        top: 210,
                        left: 20,
                        child: Text(
                          'laughter and conversations.',
                          style: GoogleFonts.inter(
                              fontSize: 12,
                              color: const Color.fromARGB(255, 0, 0, 0)),
                        )),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              'MENU',
              style: GoogleFonts.mavenPro(fontSize: 30, color: Colors.black),
            ),
          ])
        ],
      ),
    );
  }
}
