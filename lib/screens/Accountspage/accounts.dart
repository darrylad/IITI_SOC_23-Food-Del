import 'package:flutter/material.dart';
import 'package:flutter_2/global/globals.dart';
import 'package:go_router/go_router.dart';

import '../Homescreen/home_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

    static const String routeName = '/accounts';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const ProfileScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class CustomDialog extends StatelessWidget {
  final Widget content;

  CustomDialog({required this.content});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Container(
                      width: 329,
                      height: 498,
       
        decoration: BoxDecoration(
          borderRadius : BorderRadius.only(
            topLeft: Radius.circular(17),
            topRight: Radius.circular(17),
            bottomLeft: Radius.circular(17),
            bottomRight: Radius.circular(17),
          ),
      boxShadow : [BoxShadow(
          color: Color.fromRGBO(0, 0, 0, 0.15000000596046448),
          offset: Offset(0,0),
          blurRadius: 39
      )],
      color : Color.fromRGBO(255, 243, 235, 1),
  ),
  child: content,
                    ),
    );
  }
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      bottomNavigationBar: const BottomNav_1(),
      body: Column(
        children: [
          const SizedBox(
            height: 80,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(180)),
                      child: Image.asset(
                        'assets/images/logo.png',
                        height: 180,
                        width: 180,
                      )))
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(username,
                  style: const TextStyle(
                      color: Color.fromRGBO(18, 18, 18, 1),
                      fontFamily: 'Inter',
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      height: 1)),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              const SizedBox(
                width: 70,
              ),
              TextButton.icon(
                onPressed: () {},
                icon: Image.asset(
                  'assets/Tejas/to-do-list.png',
                  width: 26,
                  height: 26,
                ),
                label: const Padding(
                  padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                  child: Text(
                    'My Orders',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontFamily: 'Inter',
                        fontSize: 22,
                        letterSpacing: 0,
                        fontWeight: FontWeight.normal,
                        height: 1),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              const SizedBox(
                width: 70,
              ),
              TextButton.icon(
                onPressed: () {},
                icon: Image.asset(
                  'assets/Tejas/creditcard.png',
                  width: 26,
                  height: 26,
                ),
                label: const Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Text(
                    'Payment Methods',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontFamily: 'Inter',
                        fontSize: 22,
                        letterSpacing: 0,
                        fontWeight: FontWeight.normal,
                        height: 1),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              const SizedBox(
                width: 70,
              ),
              TextButton.icon(
                onPressed: () {},
                icon: Image.asset(
                  'assets/Tejas/heart.png',
                  width: 26,
                  height: 26,
                ),
                label: const Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Text(
                    'Favourites',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontFamily: 'Inter',
                        fontSize: 22,
                        letterSpacing: 0,
                        fontWeight: FontWeight.normal,
                        height: 1),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              const SizedBox(
                width: 70,
              ),
              TextButton.icon(
                onPressed: () {},
                icon: Image.asset(
                  'assets/Tejas/feedback.png',
                  width: 26,
                  height: 26,
                ),
                label: const Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Text(
                    'Feedback',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontFamily: 'Inter',
                        fontSize: 22,
                        letterSpacing: 0,
                        fontWeight: FontWeight.normal,
                        height: 1),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              const SizedBox(
                width: 70,
              ),
              TextButton.icon(
                onPressed: () {},
                icon: Image.asset(
                  'assets/Tejas/ringing.png',
                  width: 26,
                  height: 26,
                ),
                label: const Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Text(
                    'Notification',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontFamily: 'Inter',
                        fontSize: 22,
                        letterSpacing: 0,
                        fontWeight: FontWeight.normal,
                        height: 1),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              const SizedBox(
                width: 70,
              ),
              TextButton.icon(
                onPressed: () {},
                icon: Image.asset(
                  'assets/Tejas/moon.png',
                  width: 26,
                  height: 26,
                ),
                label: const Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Text(
                    'Appearance',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontFamily: 'Inter',
                        fontSize: 22,
                        letterSpacing: 0,
                        fontWeight: FontWeight.normal,
                        height: 1),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              const SizedBox(
                width: 70,
              ),
              TextButton.icon(
                onPressed: () {
                  showDialog(context: context, 
                  builder: (context){
                    return CustomDialog(
                      content: Container(
                    child: Column(
                      mainAxisAlignment:MainAxisAlignment.start,
                      children:<Widget> [
                       
                        Padding(padding: EdgeInsets.only(top: 30),
                        
                        child: Container(
                          width:276,
                          height:104,
                          
                          child:Row(
                            children:<Widget> [
                              Padding(padding: EdgeInsets.only(right: 20),
                             child: Image.asset('assets/Tejas/lodo_draft1.png',
                            height: 104,
                            width: 104,),),
                             Text('Deliver Eat',
                           style: TextStyle(
        color: Color.fromRGBO(143, 63, 5, 1),
        fontFamily: 'Inter',
        fontSize: 24,
        letterSpacing: 0,
        fontWeight: FontWeight.normal,
        height: 1
      ),),
                            ],
                          )
                        ),),
                        Padding(padding: EdgeInsets.all(24),
                        child: ElevatedButton(onPressed: (){}, 
                        child: Text('Open in Store',textAlign: TextAlign.center, style: TextStyle(
        color: Color.fromRGBO(255, 255, 255, 1),
        fontFamily: 'Inter',
        fontSize: 16,
        letterSpacing: 0,
        fontWeight: FontWeight.normal,
        height: 1
      ),),
      style:ElevatedButton.styleFrom(
        primary: Color.fromRGBO(217, 137, 79, 1),
  )
      ), ),
      Padding(padding: EdgeInsets.all(20),
      child: Text('We made this app to give on-campus restaurants an intuitive platform to display their menu and provide delivery services. This project was a part of IITISoC’23.', textAlign: TextAlign.center, style: TextStyle(
        color: Color.fromRGBO(115, 49, 2, 0.6000000238418579),
        fontFamily: 'Inter',
        fontSize: 17,
        letterSpacing: 0,
        fontWeight: FontWeight.normal,
        height: 1
      ),),),
       Padding(padding: EdgeInsets.all(32),
      child: Text('Made by Shivam, Darryl, Tejas, and Deepesh', textAlign: TextAlign.center, style: TextStyle(
        color: Color.fromRGBO(115, 49, 2, 0.6000000238418579),
        fontFamily: 'Inter',
        fontSize: 17,
        letterSpacing: 0,
        fontWeight: FontWeight.normal,
        height: 1
      ),),)

                        
                      ],
                    ),
                  ),
                    );
             
                  }
                  );
                },
                icon: Image.asset(
                  'assets/Tejas/information.png',
                  width: 26,
                  height: 26,
                ),
                label: const Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Text(
                    'About',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontFamily: 'Inter',
                        fontSize: 22,
                        letterSpacing: 0,
                        fontWeight: FontWeight.normal,
                        height: 1),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              const SizedBox(
                width: 70,
              ),
              TextButton.icon(
                onPressed: () {
                  controller.logout();
                  Navigator.pushNamed(context, '/');
                },
                icon: Image.asset(
                  'assets/Tejas/logout.png',
                  width: 26,
                  height: 26,
                ),
                label: const Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Text(
                    'Log Out',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color.fromRGBO(255, 166, 0, 1),
                        fontFamily: 'Inter',
                        fontSize: 22,
                        letterSpacing: 0,
                        fontWeight: FontWeight.normal,
                        height: 1),
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

// ignore: camel_case_types

