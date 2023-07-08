import 'package:flutter/material.dart';
import 'package:flutter_2/global/globals.dart';
import 'package:flutter_2/Screens/Location/add_location_screen.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// import 'package:google_sign_in/google_sign_in.dart';

// ignore: must_be_immutable
class Startscreen extends StatefulWidget {
  const Startscreen({super.key});

    static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const Startscreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  State<StatefulWidget> createState() {
    return State1();
  }
}

class State1 extends State<Startscreen> {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator StartscreenWidget - FRAME
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        height: MediaQuery.of(context).size.height,
        width: double.maxFinite,
        decoration:
            const BoxDecoration(color: Color.fromRGBO(255, 222, 192, 1)),
        child: Stack(children: <Widget>[
          Center(
            child: Obx(() {
              if (controller.googleAccount.value == null) {
                return LoginView();
              } else {
                username = controller.googleAccount.value?.displayName ?? '';
                return const AddLocationScreen();
              }
            }),
          )
        ]),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget LoginView() {
    return Material(
      child: Container(
          color: const Color.fromRGBO(255, 222, 192, 1),
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 140,
                ),
                Container(
                    width: 248,
                    height: 248,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(137),
                          topRight: Radius.circular(137),
                          bottomLeft: Radius.circular(137),
                          bottomRight: Radius.circular(137),
                        ),
                        image: DecorationImage(
                          image: AssetImage("assets/images/logo.png"),
                          fit: BoxFit.cover,
                        ))),
                const SizedBox(
                  height: 100,
                ),
                Text(
                  'Hello there!',
                  style: GoogleFonts.inter(
                      color: const Color.fromRGBO(110, 46, 0, 1),
                      fontSize: 30,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 70,
                ),
                GestureDetector(
                  onTap: () {
                    controller.login();
                  },
                  child: Container(
                    height: 52,
                    width: 260,
                    decoration: const BoxDecoration(
                      border: Border(
                          top: BorderSide(
                              color: Color.fromRGBO(103, 31, 0, 1), width: 2),
                          right: BorderSide(
                              color: Color.fromRGBO(103, 31, 0, 1), width: 2),
                          bottom: BorderSide(
                              color: Color.fromRGBO(103, 31, 0, 1), width: 2),
                          left: BorderSide(
                              color: Color.fromRGBO(103, 31, 0, 1), width: 2)),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color.fromRGBO(255, 232, 211, 1),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(
                            'Login with your institute ID',
                            style: GoogleFonts.inter(
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                                color: const Color.fromRGBO(103, 31, 0, 1)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ])),
    );
  }
}
