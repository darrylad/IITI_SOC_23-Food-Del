import 'package:flutter/material.dart';
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
    return Container(
      height: 370,
      width: double.maxFinite,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration:  BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 20,
                          spreadRadius: 0,
                          color: Colors.black.withOpacity(0.13))
                    ],
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                height: 275,
                width: 350,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                        Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Night Canteen',
                           style: GoogleFonts.inter(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: const Color.fromARGB(255, 0, 0, 0)),
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
                      SizedBox(height: 4,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/buttons/star.png',
                            height: 12,
                            width: 12,
                          ),
                          Text(
                            '3.2(200+ Ratings)',
                            style: GoogleFonts.inter(
                                fontSize: 15,
                                color: const Color.fromARGB(255, 200, 151, 3)),
                          )
                
                        ],
                      ),
                      Center(
                        child: Container(
                          height: 50,
                          width: 120,
                          child: Stack(
                            children: [
                               Image.asset(
                          'assets/buttons/final.png',
                          height: 90,
                          width: 50,
                        ),
                            ],
                
                          ),
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
                          bottom: 148,
                          right: 190,
                          child: Text(
                            'ETA: 10min',
                            style: GoogleFonts.inter(
                                fontSize: 11,
                                color: const Color.fromARGB(255, 0, 0, 0)),
                          )),
                Positioned(
                  bottom: 20,
                  left: 20,
                  child:   const SizedBox(
                  
                  width: 310,height: 60,
                  
                    child: Text('Step into a lively atmosphere filled with the aroma of mouthwatering dishes and the sounds of laughter and conversations.')
                  
                  ),
                )
                        
                     /* Positioned(
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
                          )),*/
                    ],
                  ),
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
