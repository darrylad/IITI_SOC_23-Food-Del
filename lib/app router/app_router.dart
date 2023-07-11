import 'package:flutter/material.dart';
import 'package:flutter_2/Screens/Restaurants/JuiciliciousCafe/juicilicious_cafe_screen.dart';
import 'package:flutter_2/Screens/Restaurants/JuiciliciousCafe/search_juiciliciouscafe.dart';
import 'package:flutter_2/Screens/Restaurants/NightCanteen/search_nightcanteen.dart';
import 'package:flutter_2/Screens/Restaurants/TapriIITiansKi/search_tapri.dart';
import 'package:flutter_2/Screens/Restaurants/TeaPost/search_teapost.dart';
import 'package:flutter_2/Screens/Restaurants/TeaPost/tea_post_screen.dart';
import 'package:flutter_2/screen.dart';
import 'package:flutter_2/Screens/Accountspage/accounts.dart';
import 'package:flutter_2/Screens/Cart/cart_screen.dart';
import 'package:flutter_2/Screens/Homescreen/home_screen.dart';
import 'package:flutter_2/Screens/Location/add_location_screen.dart';
import 'package:flutter_2/Screens/Payment/payments_screen.dart';
import 'package:flutter_2/Screens/Restaurants/NightCanteen/night_canteen_screen.dart';
import 'package:flutter_2/Screens/Restaurants/TapriIITiansKi/tapri_iitians_ki_screen.dart';
import 'package:flutter_2/Screens/Search/SearchUsingStoredData/search_bar_screen.dart';
import 'package:flutter_2/Screens/Search/search_screen.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    // ignore: avoid_print
    print('The Route Is : ${settings.name}');

    switch (settings.name) {
      case '/':
        return Startscreen.route();
      case Startscreen.routeName:
        return Startscreen.route();
      case HomeScreen.routeName:
        return HomeScreen.route();
      case AddLocationScreen.routeName:
        return AddLocationScreen.route();
      case SearchScreen.routeName:
        return SearchScreen.route();
      case SearchBarScreen.routeName:
        return SearchBarScreen.route();
      case CartScreen.routeName:
        return CartScreen.route();
      case SearchBarScreenNight.routeName:
        return SearchBarScreenNight.route();
      case SearchBarScreenTapri.routeName:
        return SearchBarScreenTapri.route();
      case NightCanteenScreen.routeName:
        return NightCanteenScreen.route();
      case TapriIITiansKiScreen.routeName:
        return TapriIITiansKiScreen.route();
      case ProfileScreen.routeName:
        return ProfileScreen.route();
      case PaymentsPage.routeName:
        return PaymentsPage.route();
      case TeaPostScreen.routeName:
        return TeaPostScreen.route();
      case JuiciliciousCafeScreen.routeName:
        return JuiciliciousCafeScreen.route();
      case SearchBarScreenTeaPost.routeName:
        return SearchBarScreenTeaPost.route();
      case SearchBarScreenJuiciliciousCafe.routeName:
        return SearchBarScreenJuiciliciousCafe.route();

        break;

      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(appBar: AppBar(title: const Text('error'))),
      settings: const RouteSettings(name: '/error'),
    );
  }
}
