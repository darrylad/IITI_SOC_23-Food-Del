import 'package:flutter/material.dart';
import 'package:flutter_2/BottomNavigationBar/bottom_nav_bar.dart';
import 'package:flutter_2/Screens/Cart/cart_provider.dart';
import 'package:flutter_2/Screens/Cart/data_base.dart';
import 'package:flutter_2/Screens/Restaurants/JuiciliciousCafe/juici_cafe_menu.dart';
import 'package:flutter_2/Screens/Restaurants/expand_state_provider.dart';
import 'package:flutter_2/global/globals.dart';
import 'package:flutter_2/screens/Restaurants/JuiciliciousCafe/jc_introduction_box.dart';
import 'package:flutter_2/screens/Restaurants/JuiciliciousCafe/jc_item_identifier.dart';
import 'package:flutter_2/screens/Restaurants/TeaPost/tea_post_menu.dart';
import 'package:flutter_2/screens/Restaurants/TeaPost/tp_introduction_box.dart';
import 'package:flutter_2/screens/Restaurants/TeaPost/tp_item_identifier.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TeaPostScreen extends StatefulWidget {
  const TeaPostScreen({Key? key}) : super(key: key);

  @override
  State<TeaPostScreen> createState() => _TeaPostScreenState();
}

class _TeaPostScreenState extends State<TeaPostScreen> {
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
      bottomNavigationBar: const MyNavBar(),
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
                                        'Fast Food',
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
                                    itemCount: productsTP.length,
                                    physics: const ClampingScrollPhysics(),
                                    padding: EdgeInsets.only(
                                      top: 0.025 * screenwidth,
                                      bottom: 0.025 * screenwidth,
                                      left: 0.025 * screenwidth,
                                    ),
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return TPFastFood(menuindex: index);
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
                                    itemCount: productsTP.length,
                                    physics: const ClampingScrollPhysics(),
                                    padding: EdgeInsets.only(
                                      top: 0.025 * screenwidth,
                                      bottom: 0.025 * screenwidth,
                                      left: 0.025 * screenwidth,
                                    ),
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return TPFastFood(menuindex: index);
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
                                    itemCount: productsTP.length,
                                    physics: const ClampingScrollPhysics(),
                                    padding: EdgeInsets.only(
                                      top: 0.025 * screenwidth,
                                      bottom: 0.025 * screenwidth,
                                      left: 0.025 * screenwidth,
                                    ),
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return TPBeverages(menuindex: index);
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
