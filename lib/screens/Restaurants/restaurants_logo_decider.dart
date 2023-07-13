import 'package:flutter/material.dart';
import 'package:flutter_2/Screens/Restaurants/JuiciliciousCafe/juici_cafe_menu.dart';
import 'package:flutter_2/Screens/Restaurants/NightCanteen/night_canteen_menu.dart';
import 'package:flutter_2/Screens/Restaurants/TapriIITiansKi/tapri_iitians_ki.dart';
import 'package:flutter_2/Screens/Restaurants/TeaPost/tea_post_menu.dart';
import 'package:flutter_2/Screens/Restaurants/non_veg_logo.dart';
import 'package:flutter_2/Screens/Restaurants/veg_logo.dart';

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

class JCLogoDecider extends StatelessWidget {
  final int logoindex;
  const JCLogoDecider({
    super.key,
    required this.logoindex,
  });

  @override
  Widget build(BuildContext context) {
    if (productsJC[logoindex].category == 'Veg') {
      return const VegLogo();
    } else {
      return const NonVegLogo();
    }
  }
}

class TPLogoDecider extends StatelessWidget {
  final int logoindex;
  const TPLogoDecider({
    super.key,
    required this.logoindex,
  });

  @override
  Widget build(BuildContext context) {
    if (productsTP[logoindex].category == 'Veg') {
      return const VegLogo();
    } else {
      return const NonVegLogo();
    }
  }
}
