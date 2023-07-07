import 'package:flutter/material.dart';
import 'package:flutter_2/screens/Cart/data_base.dart';
import 'package:flutter_2/screens/Restaurants/NightCanteen/nc_item_identifier.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import 'nc_introduction_box.dart';
import 'night_canteen_menu.dart';

class NightCanteenScreen extends StatefulWidget {
  const NightCanteenScreen({Key? key}) : super(key: key);

  @override
  State<NightCanteenScreen> createState() => _NightCanteenScreenState();
}

class _NightCanteenScreenState extends State<NightCanteenScreen> {
  DBHelper dbHelper = DBHelper();

  //List<bool> clicked = List.generate(10, (index) => false, growable: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: const BottomNav_nightcanteen(),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        // physics: const ClampingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 70,
            ),
            const NCIntroduction(),
            ExpansionTile(
              collapsedIconColor: const Color.fromARGB(255, 152, 46, 1),
              iconColor: const Color.fromARGB(255, 152, 46, 1),
              initiallyExpanded: true,
              title: Text(
                'Main Course',
                style: GoogleFonts.inter(
                    fontSize: 18,
                    color: const Color.fromARGB(255, 152, 46, 1),
                    fontWeight: FontWeight.w500),
              ),
              children: <Widget>[
                InkWell(
                  onTap: () {},
                  child: ListView.builder(
                      itemCount: productsNC.length,
                      physics: const ClampingScrollPhysics(),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 8.0),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return NCMainCourse(menuindex: index);
                      }),
                ),
              ],
            ),
            ExpansionTile(
              collapsedIconColor: const Color.fromARGB(255, 152, 46, 1),
              iconColor: const Color.fromARGB(255, 152, 46, 1),
              initiallyExpanded: true,
              title: Text(
                'Fast Food',
                style: GoogleFonts.inter(
                    fontSize: 18,
                    color: const Color.fromARGB(255, 152, 46, 1),
                    fontWeight: FontWeight.w500),
              ),
              children: <Widget>[
                InkWell(
                  onTap: () {},
                  child: ListView.builder(
                      itemCount: productsNC.length,
                      physics: const ClampingScrollPhysics(),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 8.0),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return NCFastFood(menuindex: index);
                      }),
                ),
              ],
            ),
            ExpansionTile(
              collapsedIconColor: const Color.fromARGB(255, 152, 46, 1),
              iconColor: const Color.fromARGB(255, 152, 46, 1),
              initiallyExpanded: true,
              title: Text(
                'Beverages',
                style: GoogleFonts.inter(
                    fontSize: 18,
                    color: const Color.fromARGB(255, 152, 46, 1),
                    fontWeight: FontWeight.w500),
              ),
              children: <Widget>[
                InkWell(
                  onTap: () {},
                  child: ListView.builder(
                      itemCount: productsNC.length,
                      physics: const ClampingScrollPhysics(),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 8.0),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return NCBeverages(menuindex: index);
                      }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AlertDialogCancelButtons extends StatelessWidget {
  const AlertDialogCancelButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7.5),
      child: Container(
        height: 50,
        width: 125,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: const Color.fromARGB(255, 185, 255, 212)),
        child: Center(
          child: TextButton(
            child: const Text(
              'Cancel',
              style: TextStyle(
                  fontFamily: 'Dropdown',
                  fontSize: 16,
                  color: Color.fromARGB(255, 0, 126, 51),
                  fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              //Put your code here which you want to execute on Yes button click.
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
    );
  }
}

class AlertDialogReplaceButtons extends StatelessWidget {
  const AlertDialogReplaceButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7.5),
      child: Container(
        height: 50,
        width: 125,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: const Color.fromARGB(255, 36, 194, 128)),
        child: Center(
          child: TextButton(
            child: const Text(
              'Replace',
              style: TextStyle(
                  fontFamily: 'Dropdown',
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              //Put your code here which you want to execute on Yes button click.
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
    );
  }
}

class BottomNav_nightcanteen extends StatefulWidget {
  const BottomNav_nightcanteen({
    super.key,
  });

  @override
  State<BottomNav_nightcanteen> createState() => _BottomNav_nightcanteenState();
}

// ignore: camel_case_types
class _BottomNav_nightcanteenState extends State<BottomNav_nightcanteen> {
  // ignore: prefer_typing_uninitialized_variables

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 15),
      child: Container(
        height: 60,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
        //

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {
                  context.go('/home_screen.dart');
                },
                icon: Image.asset(
                  'assets/buttons/Home.png',
                  height: 30,
                  width: 30,
                )),
            const SizedBox(
              width: 60,
            ),
            IconButton(
                onPressed: () {
                  context.go('/cart_screen.dart');
                },
                icon: SvgPicture.asset(
                  'assets/buttons/cart.svg',
                  height: 30,
                  width: 30,
                )),
            const SizedBox(
              width: 60,
            ),
            IconButton(
                onPressed: () {
                  context.go('/accounts.dart');
                },
                icon: SvgPicture.asset(
                  'assets/buttons/User.svg',
                  height: 30,
                  width: 30,
                )),
          ],
        ),
      ),
    );
  }
}
