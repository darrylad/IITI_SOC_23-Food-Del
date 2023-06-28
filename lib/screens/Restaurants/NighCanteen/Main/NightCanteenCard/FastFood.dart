// ignore: filFast_Foodort 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_2/screens/Restaurants/NighCanteen/Cart(SUM)/sum.dart';
import 'package:google_fonts/google_fonts.dart';

import 'NightCanteen_dishes.dart';

// ignore: camel_case_types
class Fast_Food extends StatelessWidget {
  const Fast_Food({
    super.key,
  });

  final int sum = 0;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Column(
      children: [
        ExpansionTile(
          backgroundColor: const Color.fromARGB(255, 238, 238, 238),
          collapsedBackgroundColor: const Color.fromARGB(255, 238, 238, 238),
          tilePadding: const EdgeInsets.fromLTRB(22, 0, 220, 0),
          title: Text(
            'Fast Food',
            style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          initiallyExpanded: true,
          children: <Widget>[
            // ListTile(title: Text('This is tile number 1')),
            Column(
              children: [
                CheeseMOMO(
                  sum: sum,
                ),
                const SizedBox(
                  height: 20,
                ),
                CheeseCornMOMO(
                  sum: sum,
                ),
                const SizedBox(
                  height: 20,
                ),
                Cheese_Maggi(
                  sum: sum,
                ),
                const SizedBox(
                  height: 20,
                ),
                Kathiroll(
                  sum: sum,
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            )
          ],
        ),
      ],
    ));
  }
}

// ignore: camel_case_types
class CheeseMOMO extends StatefulWidget {
  const CheeseMOMO({super.key, required this.sum});

  final int sum;

  @override
  State<CheeseMOMO> createState() => _CheeseMOMOState();
}

// ignore: camel_case_types
class _CheeseMOMOState extends State<CheeseMOMO> {
  bool isTap = false;
  double top = 45;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.all(Radius.circular(30))),
        width: 400,
        height: 130,
        child: Stack(
          children: [
            Positioned(
                top: 10,
                left: 10,
                child: Image.asset(
                  'assets/buttons/veg.png',
                  height: 20,
                  width: 20,
                )),
            Positioned(
                top: 6,
                left: 40,
                child: Text(
                  Veg[6],
                  style: GoogleFonts.roboto(
                      fontSize: 20, fontWeight: FontWeight.w400),
                )),
            Positioned(
                top: 36,
                left: 40,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Delicious Paneer cubes serverd',
                      style: GoogleFonts.roboto(
                          fontSize: 15, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      'with craving orange gravy',
                      style: GoogleFonts.roboto(
                          fontSize: 15, fontWeight: FontWeight.w400),
                    ),
                  ],
                )),
            Positioned(
                top: 80,
                left: 60,
                child: Text(Veg_Price[6].toString(),
                    style: GoogleFonts.roboto(
                        fontSize: 18, fontWeight: FontWeight.w400))),
            Positioned(
                top: 83,
                left: 40,
                child: Image.asset(
                  'assets/buttons/Rupee.png',
                  height: 20,
                  width: 20,
                )),
            Positioned(
                top: 0,
                right: 20,
                child: Image.asset(
                  'assets/dispics/dishes/cheesemomo.jpg',
                  height: 130,
                  width: 117,
                )),
            Positioned(
                top: top,
                right: 10,
                child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isTap = true;
                        Items[0]++;

                        top = 20;
                      });
                    },
                    child: PBM_GD())),
          ],
        ));
  }

  // ignore: non_constant_identifier_names
  Container PBM_GD() {
    if (Items[0] == 0) {
      return Container(
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 42, 252, 0),
            borderRadius: BorderRadius.all(Radius.circular(50))),
        child: Image.asset(
          'assets/buttons/plus.png',
          height: 30,
          width: 30,
        ),
      );
    } else {
      return Container(
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 255, 122, 56),
            borderRadius: BorderRadius.all(Radius.circular(50))),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  Items[0]++;

                  if (Items[0] == 0) {
                    top = 45;
                  } else {
                    top = 20;
                  }
                });
              },
              child: Image.asset(
                'assets/buttons/plus.png',
                height: 30,
                width: 30,
              ),
            ),
            Text(Items[0].toString()),
            GestureDetector(
              onTap: () {
                setState(() {
                  Items[0]--;
                  if (Items[0] == 0) {
                    top = 45;
                  } else {
                    top = 20;
                  }
                });
              },
              child: Image.asset(
                'assets/buttons/minus.png',
                height: 30,
                width: 30,
              ),
            ),
          ],
        ),
      );
    }
  }
}

class CheeseCornMOMO extends StatefulWidget {
  const CheeseCornMOMO({
    required this.sum,
    super.key,
  });

  final int sum;

  @override
  State<CheeseCornMOMO> createState() => _CheeseCornMOMO();
}

// ignore: camel_case_types
class _CheeseCornMOMO extends State<CheeseCornMOMO> {
  bool isTap = false;
  double top = 45;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.all(Radius.circular(30))),
        width: 400,
        height: 130,
        child: Stack(
          children: [
            Positioned(
                top: 10,
                left: 10,
                child: Image.asset(
                  'assets/buttons/veg.png',
                  height: 20,
                  width: 20,
                )),
            Positioned(
                top: 6,
                left: 40,
                child: Text(
                  Veg[7],
                  style: GoogleFonts.roboto(
                      fontSize: 20, fontWeight: FontWeight.w400),
                )),
            Positioned(
                top: 36,
                left: 40,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Delicious Paneer cubes serverd',
                      style: GoogleFonts.roboto(
                          fontSize: 15, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      'with craving orange gravy',
                      style: GoogleFonts.roboto(
                          fontSize: 15, fontWeight: FontWeight.w400),
                    ),
                  ],
                )),
            Positioned(
                top: 80,
                left: 60,
                child: Text(Veg_Price[7].toString(),
                    style: GoogleFonts.roboto(
                        fontSize: 18, fontWeight: FontWeight.w400))),
            Positioned(
                top: 83,
                left: 40,
                child: Image.asset(
                  'assets/buttons/Rupee.png',
                  height: 20,
                  width: 20,
                )),
            Positioned(
                top: 0,
                right: 20,
                child: Image.asset(
                  'assets/dispics/dishes/cheesecornmomo.jpg',
                  height: 130,
                  width: 117,
                )),
            Positioned(
                top: top,
                right: 10,
                child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isTap = true;
                        Items[1]++;
                        top = 20;
                      });
                    },
                    child: PBM_GD())),
          ],
        ));
  }

  // ignore: non_constant_identifier_names
  Container PBM_GD() {
    if (Items[1] == 0) {
      return Container(
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 42, 252, 0),
            borderRadius: BorderRadius.all(Radius.circular(50))),
        child: Image.asset(
          'assets/buttons/plus.png',
          height: 30,
          width: 30,
        ),
      );
    } else {
      return Container(
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 255, 122, 56),
            borderRadius: BorderRadius.all(Radius.circular(50))),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  Items[1]++;

                  if (Items[1] == 0) {
                    top = 45;
                  } else {
                    top = 20;
                  }
                });
              },
              child: Image.asset(
                'assets/buttons/plus.png',
                height: 30,
                width: 30,
              ),
            ),
            Text(Items[1].toString()),
            GestureDetector(
              onTap: () {
                setState(() {
                  Items[1]--;
                  if (Items[1] == 0) {
                    top = 45;
                  } else {
                    top = 20;
                  }
                });
              },
              child: Image.asset(
                'assets/buttons/minus.png',
                height: 30,
                width: 30,
              ),
            ),
          ],
        ),
      );
    }
  }
}

// ignore: camel_case_types
class Cheese_Maggi extends StatefulWidget {
  const Cheese_Maggi({
    required this.sum,
    super.key,
  });

  final int sum;

  @override
  State<Cheese_Maggi> createState() => _Cheese_Maggi();
}

// ignore: camel_case_types
class _Cheese_Maggi extends State<Cheese_Maggi> {
  // ignore: non_constant_identifier_names

  bool isTap = false;
  double top = 45;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.all(Radius.circular(30))),
        width: 400,
        height: 130,
        child: Stack(
          children: [
            Positioned(
                top: 10,
                left: 10,
                child: Image.asset(
                  'assets/buttons/veg.png',
                  height: 20,
                  width: 20,
                )),
            Positioned(
                top: 6,
                left: 40,
                child: Text(
                  Veg[8],
                  style: GoogleFonts.roboto(
                      fontSize: 20, fontWeight: FontWeight.w400),
                )),
            Positioned(
                top: 36,
                left: 40,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Delicious Paneer cubes serverd',
                      style: GoogleFonts.roboto(
                          fontSize: 15, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      'with craving orange gravy',
                      style: GoogleFonts.roboto(
                          fontSize: 15, fontWeight: FontWeight.w400),
                    ),
                  ],
                )),
            Positioned(
                top: 80,
                left: 60,
                child: Text(Veg_Price[8].toString(),
                    style: GoogleFonts.roboto(
                        fontSize: 18, fontWeight: FontWeight.w400))),
            Positioned(
                top: 83,
                left: 40,
                child: Image.asset(
                  'assets/buttons/Rupee.png',
                  height: 20,
                  width: 20,
                )),
            Positioned(
                top: 0,
                right: 20,
                child: Image.asset(
                  'assets/dispics/dishes/cheesemaggi.jpg',
                  height: 130,
                  width: 117,
                )),
            Positioned(
                top: top,
                right: 10,
                child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isTap = true;
                        Items[2]++;
                        top = 20;
                      });
                    },
                    child: PBM_GD())),
          ],
        ));
  }

  // ignore: non_constant_identifier_names
  Container PBM_GD() {
    if (Items[2] == 0) {
      return Container(
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 42, 252, 0),
            borderRadius: BorderRadius.all(Radius.circular(50))),
        child: Image.asset(
          'assets/buttons/plus.png',
          height: 30,
          width: 30,
        ),
      );
    } else {
      return Container(
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 255, 122, 56),
            borderRadius: BorderRadius.all(Radius.circular(50))),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  Items[2]++;

                  if (Items[2] == 0) {
                    top = 45;
                  } else {
                    top = 20;
                  }
                });
              },
              child: Image.asset(
                'assets/buttons/plus.png',
                height: 30,
                width: 30,
              ),
            ),
            Text(Items[2].toString()),
            GestureDetector(
              onTap: () {
                setState(() {
                  Items[2]--;
                  if (Items[2] == 0) {
                    top = 45;
                  } else {
                    top = 20;
                  }
                });
              },
              child: Image.asset(
                'assets/buttons/minus.png',
                height: 30,
                width: 30,
              ),
            ),
          ],
        ),
      );
    }
  }
}

class Kathiroll extends StatefulWidget {
  const Kathiroll({
    super.key,
    required this.sum,
  });
  final int sum;
  @override
  State<Kathiroll> createState() => _Kathiroll();
}

// ignore: camel_case_types
class _Kathiroll extends State<Kathiroll> {
  bool isTap = false;
  double top = 45;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.all(Radius.circular(30))),
        width: 400,
        height: 130,
        child: Stack(
          children: [
            Positioned(
                top: 10,
                left: 10,
                child: Image.asset(
                  'assets/buttons/veg.png',
                  height: 20,
                  width: 20,
                )),
            Positioned(
                top: 6,
                left: 40,
                child: Text(
                  Veg[9],
                  style: GoogleFonts.roboto(
                      fontSize: 20, fontWeight: FontWeight.w400),
                )),
            Positioned(
                top: 36,
                left: 40,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Delicious Paneer cubes serverd',
                      style: GoogleFonts.roboto(
                          fontSize: 15, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      'with craving orange gravy',
                      style: GoogleFonts.roboto(
                          fontSize: 15, fontWeight: FontWeight.w400),
                    ),
                  ],
                )),
            Positioned(
                top: 80,
                left: 60,
                child: Text(Veg_Price[9].toString(),
                    style: GoogleFonts.roboto(
                        fontSize: 18, fontWeight: FontWeight.w400))),
            Positioned(
                top: 83,
                left: 40,
                child: Image.asset(
                  'assets/buttons/Rupee.png',
                  height: 20,
                  width: 20,
                )),
            Positioned(
                top: 0,
                right: 20,
                child: Image.asset(
                  'assets/dispics/dishes/Kathiroll.jpg',
                  height: 130,
                  width: 117,
                )),
            Positioned(
                top: top,
                right: 10,
                child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isTap = true;
                        Items[3]++;
                        top = 20;
                      });
                    },
                    child: PBM_GD())),
          ],
        ));
  }

  // ignore: non_constant_identifier_names
  Container PBM_GD() {
    if (Items[2] == 0) {
      return Container(
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 42, 252, 0),
            borderRadius: BorderRadius.all(Radius.circular(50))),
        child: Image.asset(
          'assets/buttons/plus.png',
          height: 30,
          width: 30,
        ),
      );
    } else {
      return Container(
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 255, 122, 56),
            borderRadius: BorderRadius.all(Radius.circular(50))),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  Items[2]++;

                  if (Items[2] == 0) {
                    top = 45;
                  } else {
                    top = 20;
                  }
                });
              },
              child: Image.asset(
                'assets/buttons/plus.png',
                height: 30,
                width: 30,
              ),
            ),
            Text(Items[2].toString()),
            GestureDetector(
              onTap: () {
                setState(() {
                  Items[2]--;
                  if (Items[2] == 0) {
                    top = 45;
                  } else {
                    top = 20;
                  }
                });
              },
              child: Image.asset(
                'assets/buttons/minus.png',
                height: 30,
                width: 30,
              ),
            ),
          ],
        ),
      );
    }
  }
}
