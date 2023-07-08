import 'package:flutter/material.dart';
import 'package:flutter_2/Screens/Cart/exp.dart';
import 'package:flutter_2/Screens/Restaurants/NighCanteen/Cart(SUM)/sum.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class Cart extends StatelessWidget {
  const Cart({
    super.key,
  });

  final int i = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 227, 255, 238),
      appBar: AppBar(
        leading: BackButton(
          color: const Color.fromARGB(255, 0, 0, 0),
          onPressed: () {
           Navigator.pushNamed(context, '/nightcanteen');
          },
        ),
        backgroundColor: const Color.fromARGB(255, 227, 255, 238),
        foregroundColor: const Color.fromARGB(255, 0, 0, 0),
        title: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 0, 5),
          child: Text(
            'Cart',
            style: GoogleFonts.inter(fontSize: 30, fontWeight: FontWeight.w500),
          ),
        ),
      ),
      body: Card(),
    );
  }

  // ignore: non_constant_identifier_names
  Widget Card() {
    if (no_of_selections > 0) {
      return const Card_cart();
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 300,
          ),
          Row(
            children: [
              const SizedBox(
                width: 60,
              ),
              Text(
                'Your Cart is empty',
                style: GoogleFonts.inter(fontSize: 30),
              ),
            ],
          ),
        ],
      );
    }
  }

  // ignore: non_constant_identifier_names
}
