import 'package:flutter/material.dart';
import 'package:flutter_2/screens/Restaurants/NightCanteen/night_canteen_menu.dart';
import 'package:flutter_2/screens/Restaurants/TapriIITiansKi/tapri_iitians_ki.dart';
import 'package:flutter_2/screens/Restaurants/non_veg_logo.dart';
import 'package:flutter_2/screens/Restaurants/veg_logo.dart';

class NCLogoDecider extends StatelessWidget {
  final int logoindex;
  const NCLogoDecider({
    super.key,
    required this.logoindex,
  });

  @override
  Widget build(BuildContext context) {
    if (productsNC[logoindex].category == 'Veg') {
      return const VegLogo();
    } else {
      return const NonVegLogo();
    }
  }
}

class TIKLogoDecider extends StatelessWidget {
  final int logoindex;
  const TIKLogoDecider({
    super.key,
    required this.logoindex,
  });

  @override
  Widget build(BuildContext context) {
    if (productsTIK[logoindex].category == 'Veg') {
      return const VegLogo();
    } else {
      return const NonVegLogo();
    }
  }
}
