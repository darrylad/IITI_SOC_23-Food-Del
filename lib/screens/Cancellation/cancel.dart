import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Cancel extends StatefulWidget {
  const Cancel({super.key});

  @override
  State<Cancel> createState() => _CancelState();
}

class _CancelState extends State<Cancel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Stack(children: [
            Container(
              decoration: const BoxDecoration(
                gradient: RadialGradient(colors: [
                  Color.fromRGBO(219, 66, 36, 1),
                  Color.fromRGBO(186, 56, 0, 1),
                  Color.fromRGBO(115, 23, 2, 1),
                ], center: Alignment.center, radius: 1.2),
              ),
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Request Cancellation?',
                    style: GoogleFonts.inter(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'Please refer to company policy',
                    style: GoogleFonts.inter(
                        fontSize: 20,
                        color: const Color.fromRGBO(255, 195, 195, 1),
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'for refund',
                    style: GoogleFonts.inter(
                        fontSize: 20,
                        color: const Color.fromRGBO(255, 195, 195, 1),
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Container(
                    height: 55,
                    width: 250,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: Color.fromRGBO(255, 222, 222, 1),
                    ),
                    child: Center(
                        child: Text(
                      'Cancel the order',
                      style: GoogleFonts.inter(
                          fontSize: 20,
                          color: const Color.fromRGBO(195, 0, 0, 1)),
                    )),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 55,
                    width: 250,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: Color.fromRGBO(255, 222, 222, 1),
                    ),
                    child: Center(
                        child: Text(
                      'Don\u0027t cancel',
                      style: GoogleFonts.inter(
                          fontSize: 20,
                          color: const Color.fromRGBO(0, 106, 42, 1)),
                    )),
                  )
                ],
              ),
            ),
          ]),
        ));
  }
}

