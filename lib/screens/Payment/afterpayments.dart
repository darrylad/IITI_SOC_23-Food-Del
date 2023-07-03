import 'package:flutter/material.dart';

class Afterpayments extends StatelessWidget {
  const Afterpayments({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
        child: Container(
            color: Color.fromARGB(255, 87, 23, 23),
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Image.asset(
              'assets/maps/map.png',
              fit: BoxFit.fill,
            )),
      ),
    );
  }
}
