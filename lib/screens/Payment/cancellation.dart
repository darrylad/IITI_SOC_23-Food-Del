import 'package:flutter/material.dart';
import 'package:flutter_2/screens/Cancellation/cancel.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class Cancellation extends StatelessWidget {
  const Cancellation({super.key});

  @override
  Widget build(BuildContext context) {
    final sheight = MediaQuery.of(context).size.height;
    final swidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: SizedBox(
              height: sheight,
              width: swidth,
              child: Image.asset(
                'assets/buttons/Cancellation.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: sheight * 0.2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: swidth * 0.6,
                    decoration: const BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Text(
                      'Request For Cancellation?',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontSize: 30,
                          color: const Color.fromRGBO(255, 255, 255, 1)),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: sheight * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: swidth * 0.7,
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: Text(
                      'Please read the terms of the restaurant to know about the refund policy',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                          color: const Color.fromRGBO(255, 195, 195, 1)
                              .withOpacity(0.7)),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: sheight * 0.08,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /* Container(
                    width: swidth * 0.6,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: TextButton(
                        child: Text(
                          'Cancel the Order',
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: const Color.fromRGBO(197, 0, 0, 1)),
                        ),
                        onPressed: () {
                          context.go('/home_screen.dart');
                        }),
                  ), */SlideToAction(screenwidth: swidth)
                ],
              ),
              SizedBox(
                height: sheight * 0.09,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: swidth * 0.70556,
                    height: swidth*0.15277,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: TextButton(
                        child: Text(
                          'Don’t Cancel',
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: const Color.fromRGBO(0, 106, 42, 1)),
                        ),
                        onPressed: () {
                          context.pop('/Afterpayments.dart');
                        }),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
