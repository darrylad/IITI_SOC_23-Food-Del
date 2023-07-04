import 'package:flutter/material.dart';
import 'package:flutter_2/screens/Accountspage/accounts.dart';
import 'package:flutter_2/screens/Cart/cart.dart';
import 'package:flutter_2/screens/Homescreen/home_screen.dart';
import 'package:flutter_2/screens/Location/add_location_screen.dart';
import 'package:flutter_2/screens/Payment/afterpayments2.dart';
import 'package:flutter_2/screens/Restaurants/NighCanteen/Main/NightCanteenCard/NightCanteen.dart';
import 'package:flutter_2/screens/Start/start_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/Payment/payments_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        debugShowCheckedModeBanner: false,
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
        path: '/startscreen.dart',
        builder: (BuildContext context, GoRouterState state) {
          // ignore: prefer_const_constructors
          return Startscreen();
        }),
    GoRoute(
        name: 'After Payment before 5 min',
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          // ignore: prefer_const_constructors
          return Paymentpage();
        }),
    GoRoute(
        name: 'Add location',
        path: '/add_location_screen.dart',
        builder: (BuildContext context, GoRouterState state) {
          // ignore: prefer_const_constructors
          return Add_Location_Screen();
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
          return HomeScreen();
        }),
    GoRoute(
        name: 'Accounts',
        path: '/accounts.dart',
        builder: (BuildContext context, GoRouterState state) {
          // ignore: prefer_const_constructors
          return ProfileScreen();
        }),
    GoRoute(
        name: 'Upi',
        path: '/payments.dart',
        builder: (BuildContext context, GoRouterState state) {
          // ignore: prefer_const_constructors
          return Paymentpage();
        }),
  ],
);
