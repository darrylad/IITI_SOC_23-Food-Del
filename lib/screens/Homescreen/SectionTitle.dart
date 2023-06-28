// ignore: file_names
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color.fromARGB(255, 230, 230, 230),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: GoogleFonts.inter(
                    color: const Color.fromARGB(255, 2, 2, 2),
                    fontSize: 29,
                    fontWeight: FontWeight.normal,
                    decorationColor: Colors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
