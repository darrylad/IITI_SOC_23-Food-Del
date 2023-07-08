// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_2/Screens/Restaurants/NighCanteen/Cart(SUM)/sum.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: camel_case_types
class Main_Course extends StatelessWidget {
  const Main_Course({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListView.builder(
            itemCount: Names.length - 4,
            itemBuilder: (context, index) {
              return Food(
                index: index,
              );
            }),
      ],
    );
  }
}

// ignore: camel_case_types
class Food extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables

  const Food({
    super.key,
    required this.index,
  });

  final int index;

  @override
  State<Food> createState() => _FoodState();
}

// ignore: camel_case_types
class _FoodState extends State<Food> {
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
                top: 6,
                left: 40,
                child: Text(
                  Names[widget.index + 4],
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
                child: Text(Price[widget.index + 4].toString(),
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
                  Item_images[widget.index + 4],
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
                        Items[widget.index + 4]++;
                        top = 20;
                      });
                    },
                    child: PBM_GD())),
          ],
        ));
  }

  // ignore: non_constant_identifier_names
  Container PBM_GD() {
    if (Items[widget.index + 4] == 0) {
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
                  Items[widget.index + 4]++;

                  if (Items[widget.index + 4] == 0) {
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
            Text(Items[widget.index + 4].toString()),
            GestureDetector(
              onTap: () {
                setState(() {
                  Items[widget.index + 4]--;
                  if (Items[widget.index + 4] == 0) {
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
