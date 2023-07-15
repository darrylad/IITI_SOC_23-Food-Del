import 'package:flutter/material.dart';
import 'package:flutter_2/global/globals.dart';

class ExpandStateProvider extends ChangeNotifier {
  bool? expandstate;
  double blurradiusall = 8;
  double blurradiusveg = 0;
  double blurradiusnonveg = 0;

  bool? expansionstate;

  Color? colorall = Colors.white;
  Color? colorveg = Colors.white.withOpacity(0.8);
  Color? colornonveg = Colors.white.withOpacity(0.8);

  String expansionTile1Image = 'assets/buttons/expandedtile.svg';
  Color expansionTile1TitleColor = Colors.white;
  Color expansionTile1TileColor = const Color.fromARGB(255, 211, 93, 7);

  String expansionTile2Image = 'assets/buttons/expandedtile.svg';
  Color expansionTile2TitleColor = Colors.white;
  Color expansionTile2TileColor = const Color.fromARGB(255, 211, 93, 7);

  String expansionTile3Image = 'assets/buttons/expandedtile.svg';
  Color expansionTile3TitleColor = Colors.white;
  Color expansionTile3TileColor = const Color.fromARGB(255, 211, 93, 7);

  void assignExpansionTile1Paramenters(isexpanded) {
    if (isexpanded == false) {
      expansionTile1Image = 'assets/buttons/collapsedtile.svg';
      expansionTile1TileColor = const Color.fromARGB(255, 255, 223, 200);
      expansionTile1TitleColor = const Color.fromARGB(255, 211, 93, 7);
      notifyListeners();
    } else {
      expansionTile1Image = 'assets/buttons/expandedtile.svg';
      expansionTile1TileColor = const Color.fromARGB(255, 211, 93, 7);
      expansionTile1TitleColor = Colors.white;
      notifyListeners();
    }
  }

  void assignExpansionTile2Paramenters(isexpanded) {
    if (isexpanded == false) {
      expansionTile2Image = 'assets/buttons/collapsedtile.svg';
      expansionTile2TileColor = const Color.fromARGB(255, 255, 223, 200);
      expansionTile2TitleColor = const Color.fromARGB(255, 211, 93, 7);
      notifyListeners();
    } else {
      expansionTile2Image = 'assets/buttons/expandedtile.svg';
      expansionTile2TileColor = const Color.fromARGB(255, 211, 93, 7);
      expansionTile2TitleColor = Colors.white;
      notifyListeners();
    }
  }

  void assignExpansionTile3Paramenters(isexpanded) {
    if (isexpanded == false) {
      expansionTile3Image = 'assets/buttons/collapsedtile.svg';
      expansionTile3TileColor = const Color.fromARGB(255, 255, 223, 200);
      expansionTile3TitleColor = const Color.fromARGB(255, 211, 93, 7);
      notifyListeners();
    } else {
      expansionTile3Image = 'assets/buttons/expandedtile.svg';
      expansionTile3TileColor = const Color.fromARGB(255, 211, 93, 7);
      expansionTile3TitleColor = Colors.white;
      notifyListeners();
    }
  }

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
      notifyListeners();
    } else if (categorySelected == 'Veg') {
      blurradiusall = 0;
      blurradiusveg = 8;
      blurradiusnonveg = 0;
      notifyListeners();
    } else {
      blurradiusall = 0;
      blurradiusveg = 0;
      blurradiusnonveg = 8;
      notifyListeners();
    }
  }

  void assigncolor() {
    if (categorySelected == 'All') {
      colorall = Colors.white;
      colorveg = Colors.white.withOpacity(0.8);
      colornonveg = Colors.white.withOpacity(0.8);
      notifyListeners();
    } else if (categorySelected == 'Veg') {
      colorall = Colors.white.withOpacity(0.8);
      colorveg = Colors.white;
      colornonveg = Colors.white.withOpacity(0.8);
      notifyListeners();
    } else {
      colorall = Colors.white.withOpacity(0.8);
      colorveg = Colors.white.withOpacity(0.8);
      colornonveg = Colors.white;
      notifyListeners();
    }
  }
}
