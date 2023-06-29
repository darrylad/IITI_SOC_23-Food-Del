import 'package:flutter/material.dart';
import 'package:flutter_2/screens/Accountspage/accounts.dart';
import 'package:flutter_2/screens/Cart/cart.dart';
import 'package:flutter_2/screens/Homescreen/home_screen.dart';
import 'package:flutter_2/screens/Restaurants/NighCanteen/Main/NightCanteenCard/NightCanteen.dart';
import 'package:flutter_2/screens/start_screen.dart';
import 'package:go_router/go_router.dart';

import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        title: 'DeliverEat',
        theme: ThemeData(
          fontFamily: GoogleFonts.lato().fontFamily,
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 255, 225, 135)),
          useMaterial3: true,
        ),
        routerConfig: router);
  }
}

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
        name: 'START',
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          // ignore: prefer_const_constructors
          return Startscreen();
        }),
    GoRoute(
      name: 'NightCanteen',
      path: '/NightCanteen.dart',
      builder: (BuildContext context, GoRouterState state) {
        return const NightCanteen();
      },
    ),
    GoRoute(
        name: 'Cart',
        path: '/cart.dart',
        builder: (BuildContext context, GoRouterState state) {
          // ignore: prefer_const_constructors
          return Cart();
        }),
    GoRoute(
        name: 'Home',
        path: '/home_screen.dart',
        builder: (BuildContext context, GoRouterState state) {
          // ignore: prefer_const_constructors
          return HomeScreen(
            nameofperson: 'Shivam Sharma',
          );
        }),
    GoRoute(
        name: 'Accounts',
        path: '/accounts.dart',
        builder: (BuildContext context, GoRouterState state) {
          // ignore: prefer_const_constructors
          return ProfileScreen();
        }),
  ],
);
