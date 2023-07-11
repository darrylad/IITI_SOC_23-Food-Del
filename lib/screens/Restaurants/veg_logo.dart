import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VegLogo extends StatelessWidget {
  const VegLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 0.0382*screenwidth,
      width: 0.0382*screenwidth,
      child: ClipRRect(
        child: SvgPicture.asset(
          'assets/buttons/veg.svg',
          fit: BoxFit.cover,
        ),
      ),
    );

  }
}
