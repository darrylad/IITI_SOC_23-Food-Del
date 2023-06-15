import 'package:flutter/material.dart';

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
          const SizedBox(height: 50),
          Positioned(
              top: 630,
              left: 144,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Get Started"),
              )),
        ]));
  }
}
