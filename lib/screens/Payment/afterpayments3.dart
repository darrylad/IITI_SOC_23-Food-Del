import 'package:flutter/material.dart';
import 'package:flutter_2/global/globals.dart';
import 'package:rive/rive.dart';
// import 'dart:ui';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DeliveredScreen extends StatelessWidget {
  const DeliveredScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double swidth = MediaQuery.of(context).size.width;
    double sheight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: swidth,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/buttons/greendarryl.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              bottom: sheight * 0.32, // distance from bottom of screen
              child: const Align(
                  alignment: Alignment.topCenter,
                  child: RiveAnimation.asset('assets/rive/news.riv')),
            ),
            Positioned.fill(
              bottom: 120, // distance from bottom of screen

              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: swidth * 0.85,
                  height: 230,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(23),
                    color: Colors.white.withOpacity(0.8),
                  ),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        // first item in stack, delivery agent name
                        top: 25,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Text(
                            deliveryAgentName,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 30,
                              color: Colors.black.withOpacity(0.8),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      Positioned.fill(
                          top: 85,
                          child: InkWell(
                            onTap: () async {
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
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                width: swidth * 0.5,
                                height: 39,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(9),
                                  color: Colors.black.withOpacity(0.1),
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/buttons/phone.svg',
                                        height: 25,
                                        width: 25,
                                      ),
                                      SizedBox(width: swidth * 0.02),
                                      Text(
                                        deliveryAgentPhone,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontSize: 19,
                                          color:
                                              const Color.fromRGBO(0, 46, 45, 1)
                                                  .withOpacity(0.8),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )),
                      Positioned.fill(
                        bottom: 40,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            "Delivered",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 25,
                              color: Colors.black.withOpacity(0.6),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
