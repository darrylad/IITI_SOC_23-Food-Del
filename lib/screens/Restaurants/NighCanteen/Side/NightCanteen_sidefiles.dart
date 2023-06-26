// ignore: file_names
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Menu extends StatefulWidget {
  const Menu({
    super.key,
  });

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 45,
          width: 350,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(100)),
              color: Color.fromARGB(255, 209, 215, 223)),
          child: const MenuBar(),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}

class MenuBar extends StatefulWidget {
  const MenuBar({
    super.key,
  });

  @override
  State<MenuBar> createState() => _MenuBarState();
}

class _MenuBarState extends State<MenuBar> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        children: [
          const SizedBox(
            width: 20,
          ),
          Container(
            height: 30,
            width: 90,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Color.fromARGB(255, 255, 255, 255)),
            child: Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                Image.asset(
                  'assets/buttons/square.png',
                  height: 20,
                  width: 20,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'All',
                  style:
                      GoogleFonts.openSans(fontSize: 15, color: Colors.black),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            height: 30,
            width: 90,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Color.fromARGB(255, 255, 255, 255)),
            child: Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                Image.asset(
                  'assets/buttons/veg.png',
                  height: 20,
                  width: 20,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'Veg',
                  style:
                      GoogleFonts.openSans(fontSize: 15, color: Colors.black),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            height: 30,
            width: 110,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Color.fromARGB(255, 255, 255, 255)),
            child: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Image.asset(
                  'assets/buttons/non veg.png',
                  height: 20,
                  width: 20,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'Non-Veg',
                  style:
                      GoogleFonts.openSans(fontSize: 15, color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class Upper_Title extends StatelessWidget {
  const Upper_Title({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
                        onPressed: () {},
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
          height: 23,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'MENU',
            style: GoogleFonts.mavenPro(fontSize: 30, color: Colors.black),
          ),
        ])
      ],
    );
  }
}



                                // Text(
                                    
                             