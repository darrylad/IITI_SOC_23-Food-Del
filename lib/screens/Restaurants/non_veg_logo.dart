import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NonVegLogo extends StatelessWidget {
  const NonVegLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 15,
      width: 15,
      child: ClipRRect(
        child: SvgPicture.asset(
          'assets/buttons/nonveg.svg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
