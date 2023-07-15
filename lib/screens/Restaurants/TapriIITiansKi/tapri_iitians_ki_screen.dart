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
              height: 0.056 * screenwidth,
            ),
            Center(
              child: Text(
                'MENU',
                style: GoogleFonts.inter(
                    fontSize: 26, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 0.033 * screenwidth,
            ),
            ChangeNotifierProvider<ExpandStateProvider>(
                create: (context) => ExpandStateProvider(),
                child: Consumer<ExpandStateProvider>(
                  builder: (context, provider, child) {
                    return Column(
                      children: [
                        Container(
                          width: 0.86 * screenwidth,
                          height: 0.115 * screenwidth,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Color.fromARGB(255, 223, 217, 212)
                                .withOpacity(0.31),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 0.085 * screenwidth,
                                width: 0.24 * screenwidth,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: provider.blurradiusall,
                                          spreadRadius: 0,
                                          color: Colors.black.withOpacity(0.2))
                                    ],
                                    borderRadius: BorderRadius.circular(15),
                                    color: provider.colorall),
                                child: TextButton(
                                    onPressed: () {
                                      categorySelected = 'All';
                                      provider.assignstate(false);
                                      provider.assignblur();
                                      provider.assigncolor();
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 0.04 * screenwidth,
                                          width: 0.04 * screenwidth,
                                          child: ClipRRect(
                                            child: SvgPicture.asset(
                                              'assets/buttons/all.svg',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 0.01 * screenwidth,
                                        ),
                                        Text(
                                          'All',
                                          style: GoogleFonts.inter(
                                              color: Colors.black,
                                              fontSize: 0.03 * screenwidth,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    )),
                              ),
                              Container(
                                height: 0.085 * screenwidth,
                                width: 0.24 * screenwidth,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: provider.blurradiusveg,
                                          spreadRadius: 0,
                                          color: Colors.black.withOpacity(0.2))
                                    ],
                                    borderRadius: BorderRadius.circular(15),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 0.04 * screenwidth,
                                          width: 0.04 * screenwidth,
                                          child: ClipRRect(
                                            child: SvgPicture.asset(
                                              'assets/buttons/veg.svg',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 0.01 * screenwidth,
                                        ),
                                        Text(
                                          'Veg',
                                          style: GoogleFonts.inter(
                                              color: const Color.fromARGB(
                                                  255, 0, 143, 57),
                                              fontSize: 0.03 * screenwidth,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    )),
                              ),
                              Container(
                                height: 0.085 * screenwidth,
                                width: 0.24 * screenwidth,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: provider.blurradiusnonveg,
                                          spreadRadius: 0,
                                          color: Colors.black.withOpacity(0.2))
                                    ],
                                    borderRadius: BorderRadius.circular(15),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 0.04 * screenwidth,
                                          width: 0.04 * screenwidth,
                                          child: ClipRRect(
                                            child: SvgPicture.asset(
                                              'assets/buttons/nonveg.svg',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 0.01 * screenwidth,
                                        ),
                                        Text(
                                          'Non Veg',
                                          style: GoogleFonts.inter(
                                              color: const Color.fromARGB(
                                                  255, 210, 63, 0),
                                              fontSize: 0.03 * screenwidth,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    )),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 0.0972 * screenwidth,
                        ),
                        Theme(
                          data: Theme.of(context)
                              .copyWith(dividerColor: Colors.transparent),
                          child: ExpansionTile(
                            collapsedIconColor: Colors.white,
                            iconColor: Colors.white,
                            initiallyExpanded: true,
                            onExpansionChanged: (value) =>
                                provider.assignExpansionTile1Paramenters(value),
                            title: Row(
                              children: [
                                Container(
                                  width: 170,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    color: provider.expansionTile1TileColor,
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
                                          provider.expansionTile1Image),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Main Course',
                                        style: GoogleFonts.inter(
                                            fontSize: 18,
                                            color: provider
                                                .expansionTile1TitleColor,
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
                            onExpansionChanged: (value) =>
                                provider.assignExpansionTile2Paramenters(value),
                            initiallyExpanded: true,
                            title: Row(
                              children: [
                                Container(
                                  width: 147,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    color: provider.expansionTile2TileColor,
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
                                          provider.expansionTile2Image),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Fast Food',
                                        style: GoogleFonts.inter(
                                            fontSize: 18,
                                            color: provider
                                                .expansionTile2TitleColor,
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
                            onExpansionChanged: (value) =>
                                provider.assignExpansionTile3Paramenters(value),
                            title: Row(
                              children: [
                                Container(
                                  width: 150,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    color: provider.expansionTile3TileColor,
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
                                          provider.expansionTile3Image),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Beverages',
                                        style: GoogleFonts.inter(
                                            fontSize: 18,
                                            color: provider
                                                .expansionTile3TitleColor,
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
