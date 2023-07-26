import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_2/Screens/Restaurants/expand_state_provider.dart';
import 'package:flutter_2/Screens/Cart/cart_provider.dart';
import 'package:flutter_2/screens/Payment/cancellation.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'Services/notifi.dart';
import 'package:flutter_2/Screens/Location/add_location_screen.dart';
import 'package:flutter_2/Screens/Search/search_screen.dart';
import '../Screens/Accountspage/accounts.dart';
import '../Screens/Cart/cart_screen.dart';
import '../Screens/Homescreen/home_screen.dart';
import '../Screens/Payment/afterpayments.dart';
import '../Screens/Payment/afterpayments2.dart';
import '../Screens/Payment/payments_screen.dart';
import '../Screens/Restaurants/JuiciliciousCafe/juicilicious_cafe_screen.dart';
import '../Screens/Restaurants/JuiciliciousCafe/search_juiciliciouscafe.dart';
import '../Screens/Restaurants/NightCanteen/night_canteen_screen.dart';
import '../Screens/Restaurants/NightCanteen/search_nightcanteen.dart';
import '../Screens/Restaurants/TapriIITiansKi/search_tapri.dart';
import '../Screens/Restaurants/TapriIITiansKi/tapri_iitians_ki_screen.dart';
import '../Screens/Restaurants/TeaPost/search_teapost.dart';
import '../Screens/Restaurants/TeaPost/tea_post_screen.dart';
import '../Screens/Search/SearchUsingStoredData/search_bar_screen.dart';
import '../Start/start_screen.dart';
import 'screens/Payment/afterpayments3.dart';

String locationdropdownvalue = 'Choose Your Location';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

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
        ),
        ChangeNotifierProvider(
          create: (_) => ExpandStateProvider(),
        ),
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
        routerConfig: router,
      ),
    );
  }
}

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
        name: 'Startscreen',
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          // ignore: prefer_const_constructors
          return Startscreen();
        }),
    GoRoute(
        name: 'Cancel',
        path: '/Cancellation.dart',
        builder: (BuildContext context, GoRouterState state) {
          // ignore: prefer_const_constructors
          return Cancellation();
        }),
    GoRoute(
        name: 'addlocationscreen',
        path: '/add_location_screen.dart',
        builder: (BuildContext context, GoRouterState state) {
          // ignore: prefer_const_constructors
          return AddLocationScreen();
        }),
    GoRoute(
        name: 'homescreen',
        path: '/home_screen.dart',
        builder: (BuildContext context, GoRouterState state) {
          // ignore: prefer_const_constructors
          return HomeScreen();
        }),
    GoRoute(
        name: 'searchscreen',
        path: '/search_screen.dart',
        builder: (BuildContext context, GoRouterState state) {
          // ignore: prefer_const_constructors
          return SearchScreen();
        }),
    GoRoute(
        name: 'SearchBarScreen',
        path: '/SearchBarScreen.dart',
        builder: (BuildContext context, GoRouterState state) {
          // ignore: prefer_const_constructors
          return SearchBarScreen();
        }),
    GoRoute(
        name: 'CartScreen',
        path: '/CartScreen.dart',
        builder: (BuildContext context, GoRouterState state) {
          // ignore: prefer_const_constructors
          return CartScreen();
        }),
    GoRoute(
        name: 'SearchBarScreenNight',
        path: '/SearchBarScreenNight.dart',
        builder: (BuildContext context, GoRouterState state) {
          // ignore: prefer_const_constructors
          return SearchBarScreenNight();
        }),
    GoRoute(
        name: 'SearchBarScreenTapri',
        path: '/SearchBarScreenTapri.dart',
        builder: (BuildContext context, GoRouterState state) {
          // ignore: prefer_const_constructors
          return SearchBarScreenTapri();
        }),
    GoRoute(
        name: 'NightCanteenScreen',
        path: '/NightCanteenScreen.dart',
        builder: (BuildContext context, GoRouterState state) {
          // ignore: prefer_const_constructors
          return NightCanteenScreen();
        }),
    GoRoute(
        name: 'TapriIITiansKiScreen',
        path: '/TapriIITiansKiScreen.dart',
        builder: (BuildContext context, GoRouterState state) {
          // ignore: prefer_const_constructors
          return TapriIITiansKiScreen();
        }),
    GoRoute(
        name: 'ProfileScreen',
        path: '/ProfileScreen.dart',
        builder: (BuildContext context, GoRouterState state) {
          // ignore: prefer_const_constructors
          return ProfileScreen();
        }),
    GoRoute(
        name: 'PaymentsPage',
        path: '/PaymentsPage.dart',
        builder: (BuildContext context, GoRouterState state) {
          // ignore: prefer_const_constructors
          return PaymentsPage();
        }),
    GoRoute(
        name: 'TeaPostScreen',
        path: '/TeaPostScreen.dart',
        builder: (BuildContext context, GoRouterState state) {
          // ignore: prefer_const_constructors
          return TeaPostScreen();
        }),
    GoRoute(
        name: 'JuiciliciousCafeScreen',
        path: '/JuiciliciousCafeScreen.dart',
        builder: (BuildContext context, GoRouterState state) {
          // ignore: prefer_const_constructors
          return JuiciliciousCafeScreen();
        }),
    GoRoute(
        name: 'SearchBarScreenTeaPost',
        path: '/SearchBarScreenTeaPost.dart',
        builder: (BuildContext context, GoRouterState state) {
          // ignore: prefer_const_constructors
          return SearchBarScreenTeaPost();
        }),
    GoRoute(
        name: 'SearchBarScreenJuiciliciousCafe',
        path: '/SearchBarScreenJuiciliciousCafe.dart',
        builder: (BuildContext context, GoRouterState state) {
          // ignore: prefer_const_constructors
          return SearchBarScreenJuiciliciousCafe();
        }),
    GoRoute(
        name: 'Afterpayments',
        path: '/Afterpayments.dart',
        builder: (BuildContext context, GoRouterState state) {
          // ignore: prefer_const_constructors
          return Afterpayments();
        }),
    GoRoute(
        name: 'Afterpayments1',
        path: '/Afterpayments1.dart',
        builder: (BuildContext context, GoRouterState state) {
          // ignore: prefer_const_constructors
          return Afterpayments1();
        }),
    GoRoute(
        name: 'Afterpayments2',
        path: '/Afterpayments2.dart',
        builder: (BuildContext context, GoRouterState state) {
          // ignore: prefer_const_constructors
          return DeliveredScreen();
        }),
  ],
);
