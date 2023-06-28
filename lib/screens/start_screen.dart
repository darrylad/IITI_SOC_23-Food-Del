import 'package:flutter/material.dart';
import 'package:flutter_2/controller_login/login_controller.dart';
import 'package:flutter_2/screens/Homescreen/home_screen.dart';
import 'package:get/get.dart';

// import 'package:google_sign_in/google_sign_in.dart';

// ignore: must_be_immutable
class Startscreen extends StatefulWidget {
  const Startscreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return State1();
  }
}

class State1 extends State<Startscreen> {
  bool onnnnn = false;
  final controller = Get.put(LoginController());
  // final GoogleSignIn _googleSignIn = GoogleSignIn();
  // ignore: prefer_typing_uninitialized_variables
  // var userName;
  // ignore: prefer_typing_uninitialized_variables
  // var photoUrl;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        onnnnn = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator StartscreenWidget - FRAME
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 254, 224, 196)),
        child: Stack(children: <Widget>[
          Center(
            child: Obx(() {
              if (controller.googleAccount.value == null) {
                return LoginView();
              } else {
                return HomeScreen(
                  nameofperson:
                      controller.googleAccount.value?.displayName ?? '',
                );
              }
            }),
          )
        ]),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  SizedBox LoginView() {
    return SizedBox(
        width: 900,
        height: 500,
        child: Stack(children: <Widget>[
          AnimatedPositioned(
              top: onnnnn ? 10.0 : 150.0,
              right: onnnnn ? 118 : 118,
              duration: const Duration(seconds: 3),
              curve: Curves.fastOutSlowIn,
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
                          image: AssetImage("assets/images/logo.png"),
                          fit: BoxFit.cover,
                        ))),
              )),
          Positioned(
            top: 400,
            right: 95,
            child: AnimatedOpacity(
              opacity: onnnnn ? 1.0 : 0.0,
              duration: const Duration(seconds: 3),
              child: FloatingActionButton.extended(
                onPressed: () {
                  // _googleSignIn.signIn().then((value) {
                  //   String username = value!.displayName!;
                  //   String profilePicture = value.photoUrl!;
                  //   return HomeScreen(
                  //       url: profilePicture, nameofperson: username);
                  // });
                  controller.login();
                },
                icon: Image.asset('assets/images/Google_logo.png',
                    height: 34, width: 34),
                label: const Text('Sign in with Google'),
                backgroundColor: const Color.fromARGB(255, 253, 205, 159),
                foregroundColor: Colors.black,
              ),
            ),
          )
        ]));
  }
}

// ignore: non_constant_identifier_names
