import 'package:flutter/material.dart';
import 'package:flutter_2/Screens/Location/locationpopup.dart';
import 'package:flutter_2/Screens/Restaurants/NightCanteen/night_canteen_screen.dart';
import 'package:flutter_2/global/globals.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    double screenwidth = MediaQuery.of(context).size.width;

    return Container(
      height: screenwidth * 0.9,
      width: screenwidth,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 20,
                          spreadRadius: 0,
                          color: Colors.black.withOpacity(0.13))
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                height: screenwidth * 0.81,
                width: screenwidth * 0.875,
                child: Padding(
                  padding: const EdgeInsets.only(top: 11, left: 21, bottom: 5),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 0.55*screenwidth,
                            child: Text(
                              'Night Canteen',
                              style: GoogleFonts.inter(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: const Color.fromARGB(255, 0, 0, 0)),
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/searchbarnight');
                              },
                              icon: SvgPicture.asset(
                                'assets/buttons/search.svg',
                                height: 24,
                                width: 24,
                              )),
                          IconButton(
                              onPressed: () {},
                              icon: SvgPicture.asset(
                                'assets/buttons/favourites.svg',
                                height: 24,
                                width: 24,
                              )),
                        ],
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/buttons/star.svg',
                            height: 18,
                            width: 18,
                          ),
                          Text(
                            '3.2',
                            style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: const Color.fromARGB(255, 0, 0, 0)),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            '(200+ Ratings)',
                            style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: const Color.fromARGB(255, 0, 0, 0)),
                          )
                        ],
                      ),
                      SizedBox(
                        height: screenwidth * 0.015,
                      ),
                      SizedBox(
                        width: screenwidth * 0.875,
                        height: 0.25 * screenwidth,
                        child: Stack(
                          children: [
                            Center(
                              child: SvgPicture.asset(
                                'assets/buttons/final.svg',
                                height: 0.2 * screenwidth,
                                width: 0.05 * screenwidth,
                              ),
                            ),
                            Positioned(
                              top: 0.02 * screenwidth,
                              left: screenwidth * 0.445,
                              child: Text(
                                'Night Canteen',
                                style: GoogleFonts.inter(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: const Color.fromARGB(255, 0, 0, 0)),
                              ),
                            ),
                            Positioned(
                              bottom: -0.01 * screenwidth,
                              left: screenwidth * 0.415,
                              child: TextButton(
                                  onPressed: () => _dialogBuilder(context),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        '$Locationselected ',
                                        style: GoogleFonts.inter(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: const Color.fromARGB(
                                                255, 0, 0, 0)),
                                      ),
                                      
                                    ],
                                  )),
                            ),
                            Positioned(
                              bottom: 0.1 * screenwidth,
                              left: screenwidth * 0.19,
                              child: Text(
                                'ETA: 10 min',
                                style: GoogleFonts.inter(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: const Color.fromARGB(255, 0, 0, 0)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 0.025 * screenwidth,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 22.0),
                        child: SizedBox(
                          width: screenwidth * 0.875,
                          height: screenwidth * 0.3,
                          child: Text(
                            'Step into a lively atmosphere filled with the aroma of mouthwatering dishes and the sounds of laughter and conversations.',
                            style: GoogleFonts.inter(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: const Color.fromARGB(255, 0, 0, 0)),
                          ),
                        ),
                      ),
                    ],
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

Future<void> _dialogBuilder(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return const popup();
    },
  );
}