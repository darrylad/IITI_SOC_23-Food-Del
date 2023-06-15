import 'package:flutter/material.dart';
import 'dart:math' as math;

class StartscreenWidget extends StatelessWidget {
  const StartscreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator StartscreenWidget - FRAME
    return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment(6.123234262925839e-17, -1),
              end: Alignment(1, 6.123234262925839e-17),
              colors: [
                Color.fromRGBO(227, 109, 0, 1),
                Color.fromRGBO(249, 140, 15, 1),
                Color.fromRGBO(255, 211, 160, 1)
              ]),
        ),
        child: Stack(children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Positioned(
                child: Center(
              child: SizedBox(
                  width: 186,
                  height: 186,
                  child: Stack(children: <Widget>[
                    Positioned(
                        top: 0,
                        left: 0,
                        child: Center(
                          child: Container(
                              width: 186,
                              height: 186,
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(137),
                                    topRight: Radius.circular(137),
                                    bottomLeft: Radius.circular(137),
                                    bottomRight: Radius.circular(137),
                                  ),
                                  image: DecorationImage(
                                    image: AssetImage("assets/logo.png"),
                                    fit: BoxFit.cover,
                                  ))),
                        )),
                  ])),
            )),
          ),
          Positioned(
              top: 632,
              left: 159,
              child: SizedBox(
                  width: 75,
                  height: 75,
                  child: Stack(children: <Widget>[
                    Positioned(
                        top: 0,
                        left: 0,
                        child: Container(
                            width: 75,
                            height: 75,
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              borderRadius:
                                  BorderRadius.all(Radius.elliptical(75, 75)),
                            ))),
                    const Positioned(
                        top: 37,
                        left: 25,
                        child: Divider(
                            color: Color.fromRGBO(249, 104, 0, 1),
                            thickness: 5)),
                    Positioned(
                        top: 22,
                        left: 59,
                        child: Transform.rotate(
                          angle: -49.08561712407484 * (math.pi / 180),
                          child: const Divider(
                              color: Color.fromRGBO(249, 104, 0, 1),
                              thickness: 5),
                        )),
                    Positioned(
                        top: 52,
                        left: 59,
                        child: Transform.rotate(
                          angle: 49.08561712407484 * (math.pi / 180),
                          child: const Divider(
                              color: Color.fromRGBO(249, 104, 0, 1),
                              thickness: 5),
                        )),
                  ]))),
          Positioned(
              top: 613,
              left: 91,
              child: Container(
                  width: 179,
                  height: 54,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(95),
                      topRight: Radius.circular(95),
                      bottomLeft: Radius.circular(95),
                      bottomRight: Radius.circular(95),
                    ),
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.20000000298023224),
                          offset: Offset(0, 0),
                          blurRadius: 35)
                    ],
                    color: const Color.fromRGBO(255, 255, 255, 1),
                    border: Border.all(
                      color: const Color.fromRGBO(155, 65, 0, 1),
                      width: 3,
                    ),
                  )))
        ]));
  }
}
