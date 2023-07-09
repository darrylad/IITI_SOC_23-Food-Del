import 'package:flutter/material.dart';
import 'package:flutter_2/Screens/Cart/data_base.dart';
import 'package:flutter_2/Screens/Restaurants/TeaPost/tp_item_identifier.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'tp_introduction_box.dart';
import 'tea_post_menu.dart';

class TeaPostScreen extends StatefulWidget {
  const TeaPostScreen({Key? key}) : super(key: key);

    static const String routeName = '/teapost';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const TeaPostScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  State<TeaPostScreen> createState() => _TeaPostScreenState();
}

class _TeaPostScreenState extends State<TeaPostScreen> {
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
            const TPIntroduction(),
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
                      itemCount: productsTP.length,
                      physics: const ClampingScrollPhysics(),
                      padding: const EdgeInsets.only(
                        top: 10,bottom: 10,left: 10,
                           ),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return TPMainCourse(menuindex: index);
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
                      itemCount: productsTP.length,
                      physics: const ClampingScrollPhysics(),
                      padding: const EdgeInsets.only(
                        top: 10,bottom: 10,left: 10,
                           ),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return TPFastFood(menuindex: index);
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
                      itemCount: productsTP.length,
                      physics: const ClampingScrollPhysics(),
                      padding: const EdgeInsets.only(
                        top: 10,bottom: 10,left: 10,
                           ),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return TPBeverages(menuindex: index);
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
                  Navigator.pushNamed(context, '/home');
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
                  Navigator.pushNamed(context, '/cart');
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
                  Navigator.pushNamed(context, '/accounts');
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
