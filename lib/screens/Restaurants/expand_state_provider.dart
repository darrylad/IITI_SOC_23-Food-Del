import 'package:flutter/material.dart';
import 'package:flutter_2/global/globals.dart';

class ExpandStateProvider extends ChangeNotifier {
  bool? expandstate;
  double blurradiusall = 8;
  double blurradiusveg = 0;
  double blurradiusnonveg = 0;

  Color? colorall = Colors.black.withOpacity(0.1);
  Color? colorveg = Colors.white.withOpacity(0.7);
  Color? colornonveg = Colors.white.withOpacity(0.7);

  void assignstate(bool state) {
    if (state == true) {
      expandstate = true;
      notifyListeners();
    } else {
      expandstate = false;
      notifyListeners();
    }
  }

  void assignblur() {
    if (categorySelected == 'All') {
      blurradiusall = 8;
      blurradiusveg = 0;
      blurradiusnonveg = 0;
    } else if (categorySelected == 'Veg') {
      blurradiusall = 0;
      blurradiusveg = 0;
      blurradiusnonveg = 0;
    } else {
      blurradiusall = 0;
      blurradiusveg = 0;
      blurradiusnonveg = 8;
    }
  }

  void assigncolor() {
    if (categorySelected == 'All') {
      colorall = Colors.black.withOpacity(0.1);
      colorveg = Colors.white.withOpacity(0.7);
      colornonveg = Colors.white.withOpacity(0.7);
    } else if (categorySelected == 'Veg') {
      colorall = Colors.white.withOpacity(0.7);
      colorveg = Color.fromARGB(255, 202, 255, 223);
      colornonveg = Colors.white.withOpacity(0.7);
    } else {
      colorall = Colors.white.withOpacity(0.7);
      colorveg = Colors.white.withOpacity(0.7);
      colornonveg = Color.fromARGB(255, 255, 233, 233);
    }
  }
}
