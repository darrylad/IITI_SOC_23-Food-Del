import 'package:flutter/material.dart';
import 'package:flutter_2/Screens/Cart/cart_provider.dart';
import 'package:flutter_2/Screens/Cart/data_base.dart';
import 'package:flutter_2/Screens/Restaurants/TapriIITiansKi/tapri_iitians_ki.dart';
import 'package:flutter_2/Screens/Restaurants/TapriIITiansKi/tik_introduction_box.dart';
import 'package:flutter_2/Screens/Restaurants/TapriIITiansKi/tik_item_identifier.dart';
import 'package:flutter_2/Screens/Restaurants/expand_state_provider.dart';
import 'package:flutter_2/global/globals.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TapriIITiansKiScreen extends StatefulWidget {
  const TapriIITiansKiScreen({Key? key}) : super(key: key);

  static const String routeName = '/tapri';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const TapriIITiansKiScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  State<TapriIITiansKiScreen> createState() => _TapriIITiansKiScreenState();
}

class _TapriIITiansKiScreenState extends State<TapriIITiansKiScreen> {
  DBHelper dbHelper = DBHelper();
    @override
  void initState() {
    super.initState();
    context.read<CartProvider>().getData();
  }

  //List<bool> clicked = List.generate(10, (index) => false, growable: true);
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;

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
            const TIKIntroduction(),
            SizedBox(
              height: 0.1 * screenwidth,
            ),
            Center(
              child: Text(
                'MENU',
                style: GoogleFonts.inter(
                    fontSize: 26, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 0.05 * screenwidth,
            ),
            ChangeNotifierProvider<ExpandStateProvider>(
                create: (context) => ExpandStateProvider(),
                child: Consumer<ExpandStateProvider>(
                  builder: (context, provider, child) {
                    return Column(
                      children: [
                        Container(
                          height: 0.175 * screenwidth,
                          padding: EdgeInsets.symmetric(
                              horizontal: 0.042 * screenwidth),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 40,
                                width: 0.21 * screenwidth,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: provider.blurradiusall,
                                          spreadRadius: 0,
                                          color: Colors.black.withOpacity(0.2))
                                    ],
                                    borderRadius: BorderRadius.circular(20),
                                    color: provider.colorall),
                                child: TextButton(
                                  onPressed: () {
                                    categorySelected = 'All';
                                    provider.assignstate(false);
                                    provider.assignblur();
                                    provider.assigncolor();
                                  },
                                  child: Text(
                                    'All',
                                    style: GoogleFonts.inter(
                                        fontSize: 0.036*screenwidth,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                              Container(
                                height: 40,
                                width: 0.23 * screenwidth,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: provider.blurradiusveg,
                                          spreadRadius: 0,
                                          color: Colors.black.withOpacity(0.2))
                                    ],
                                    borderRadius: BorderRadius.circular(20),
                                    color: provider.colorveg),
                                child: TextButton(
                                    onPressed: () {
                                      categorySelected = 'Veg';
                                      provider.assignstate(false);
                                      provider.assignblur();
                                      provider.assigncolor();
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 0.05 * screenwidth,
                                          width: 0.05 * screenwidth,
                                          child: ClipRRect(
                                            child: SvgPicture.asset(
                                              'assets/buttons/veg.svg',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 0.0255 * screenwidth,
                                        ),
                                        Text(
                                          'Veg',
                                          style: GoogleFonts.inter(
                                              fontSize: 0.036*screenwidth,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    )),
                              ),
                              Container(
                                height: 40,
                                width: 0.295 * screenwidth,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: provider.blurradiusnonveg,
                                          spreadRadius: 0,
                                          color: Colors.black.withOpacity(0.2))
                                    ],
                                    borderRadius: BorderRadius.circular(20),
                                    color: provider.colornonveg),
                                child: TextButton(
                                    onPressed: () {
                                      categorySelected = 'Non Veg';
                                      provider.assignstate(false);
                                      provider.assignblur();
                                      provider.assigncolor();
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 0.05 * screenwidth,
                                          width: 0.05 * screenwidth,
                                          child: ClipRRect(
                                            child: SvgPicture.asset(
                                              'assets/buttons/nonveg.svg',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 0.0255 * screenwidth,
                                        ),
                                        Text(
                                          'Non Veg',
                                          style: GoogleFonts.inter(
                                              fontSize: 0.0358*screenwidth,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    )),
                              ),
                            ],
                          ),
                        ),
                        Theme(
                          data: Theme.of(context)
                              .copyWith(dividerColor: Colors.transparent),
                          child: ExpansionTile(
                            collapsedIconColor: Colors.white,
                            iconColor: Colors.white,
                            initiallyExpanded: true,
                            title: Row(
                              children: [
                                Container(
                                  width: 170,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(255, 211, 93, 7),
                                    borderRadius: BorderRadius.circular(27),
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const SizedBox(
                                        width: 16,
                                      ),
                                      SvgPicture.asset(
                                          'assets/buttons/exptileicon.svg'),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Main Course',
                                        style: GoogleFonts.inter(
                                            fontSize: 18,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            children: <Widget>[
                              InkWell(
                                onTap: () {},
                                child: ListView.builder(
                                    itemCount: productsTIK.length,
                                    physics: const ClampingScrollPhysics(),
                                    padding: EdgeInsets.only(
                                      top: 0.025 * screenwidth,
                                      bottom: 0.025 * screenwidth,
                                      left: 0.025 * screenwidth,
                                    ),
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return TIKMainCourse(menuindex: index);
                                    }),
                              ),
                            ],
                          ),
                        ),
                        Theme(
                          data: Theme.of(context)
                              .copyWith(dividerColor: Colors.transparent),
                          child: ExpansionTile(
                            collapsedIconColor: Colors.white,
                            iconColor: Colors.white,
                            initiallyExpanded: true,
                            title: Row(
                              children: [
                                Container(
                                  width: 147,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(255, 211, 93, 7),
                                    borderRadius: BorderRadius.circular(27),
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const SizedBox(
                                        width: 16,
                                      ),
                                      SvgPicture.asset(
                                          'assets/buttons/exptileicon.svg'),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Fast Food',
                                        style: GoogleFonts.inter(
                                            fontSize: 18,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            children: <Widget>[
                              InkWell(
                                onTap: () {},
                                child: ListView.builder(
                                    itemCount: productsTIK.length,
                                    physics: const ClampingScrollPhysics(),
                                    padding: EdgeInsets.only(
                                      top: 0.025 * screenwidth,
                                      bottom: 0.025 * screenwidth,
                                      left: 0.025 * screenwidth,
                                    ),
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return TIKFastFood(menuindex: index);
                                    }),
                              ),
                            ],
                          ),
                        ),
                        Theme(
                          data: Theme.of(context)
                              .copyWith(dividerColor: Colors.transparent),
                          child: ExpansionTile(
                            collapsedIconColor: Colors.white,
                            iconColor: Colors.white,
                            initiallyExpanded: true,
                            title: Row(
                              children: [
                                Container(
                                  width: 150,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(255, 211, 93, 7),
                                    borderRadius: BorderRadius.circular(27),
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const SizedBox(
                                        width: 16,
                                      ),
                                      SvgPicture.asset(
                                          'assets/buttons/exptileicon.svg'),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Beverages',
                                        style: GoogleFonts.inter(
                                            fontSize: 18,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            children: <Widget>[
                              InkWell(
                                onTap: () {},
                                child: ListView.builder(
                                    itemCount: productsTIK.length,
                                    physics: const ClampingScrollPhysics(),
                                    padding: EdgeInsets.only(
                                      top: 0.025 * screenwidth,
                                      bottom: 0.025 * screenwidth,
                                      left: 0.025 * screenwidth,
                                    ),
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return TIKBeverages(menuindex: index);
                                    }),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                )),
            const SizedBox(
              height: 100,
            )
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
