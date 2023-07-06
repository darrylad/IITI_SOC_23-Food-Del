import 'package:flutter/material.dart';
import 'package:flutter_2/screens/Accountspage/accounts.dart';
import 'package:flutter_2/screens/Cart/cart.dart';
import 'package:flutter_2/screens/Cart/cart_provider.dart';
import 'package:flutter_2/screens/Homescreen/home_screen.dart';
import 'package:flutter_2/screens/Location/add_location_screen.dart';
import 'package:flutter_2/screens/Payment/afterpayments.dart';
import 'package:flutter_2/screens/Restaurants/NightCanteen/night_canteen_screen.dart';
import 'package:flutter_2/screens/Restaurants/TapriIITiansKi/tapri_iitians_ki_screen.dart';
import 'package:flutter_2/screens/Start/start_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'screens/Payment/payments_screen.dart';
import 'screens/Search/SearchUsingStoredData/search_bar_screen.dart';
import 'screens/Search/search_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CartProvider(),
        )
      ],
      child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'DeliverEat',
          theme: ThemeData(
            fontFamily: GoogleFonts.lato().fontFamily,
            colorScheme: ColorScheme.fromSeed(
                seedColor: const Color.fromARGB(255, 255, 225, 135)),
            useMaterial3: true,
          ),
          routerConfig: router),
    );
  }
}

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
        name: 'START',
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          // ignore: prefer_const_constructors
          return Afterpayments();
        }),
    GoRoute(
        name: 'After Payment before 5 min',
        path: '/afterpayment.dart',
        builder: (BuildContext context, GoRouterState state) {
          // ignore: prefer_const_constructors
          return HomeScreen();
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
      path: '/night_canteen_screen.dart',
      builder: (BuildContext context, GoRouterState state) {
        return const NightCanteenScreen();
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
    GoRoute(
        name: 'Tapri',
        path: '/tapri_iitians_ki_screen.dart',
        builder: (BuildContext context, GoRouterState state) {
          // ignore: prefer_const_constructors
          return TapriIITiansKiScreen();
        }),
    GoRoute(
        name: 'search',
        path: '/search_screen.dart',
        builder: (BuildContext context, GoRouterState state) {
          // ignore: prefer_const_constructors
          return SearchScreen();
        }),
    GoRoute(
        name: 'searchbarafter',
        path: '/search_bar_screen.dart',
        builder: (BuildContext context, GoRouterState state) {
          // ignore: prefer_const_constructors
          return SearchBarScreen();
        }),
  ],
);
