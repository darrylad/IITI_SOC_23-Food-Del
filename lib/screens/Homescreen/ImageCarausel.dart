import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageCarausal extends StatefulWidget {
  const ImageCarausal({
    super.key,
  });
  // ignore: non_constant_identifier_names

  @override
  State<ImageCarausal> createState() => _ImageCarausalState();
}

int activeindex = 0;
// ignore: non_constant_identifier_names
final Imglocation = [
  "assets/dispics/bigimage/big_1.jpg",
  "assets/dispics/bigimage/big_2.jpg",
  "assets/dispics/bigimage/big_3.jpg",
  "assets/dispics/bigimage/big_4.jpg",
];

class _ImageCarausalState extends State<ImageCarausal> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 10),
          CarouselSlider.builder(
            itemCount: Imglocation.length,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              final img = Imglocation[index];
              return buildimage(img, index);
            },
            options: CarouselOptions(
              autoPlay: true,
              autoPlayAnimationDuration: const Duration(seconds: 3),
              enlargeCenterPage: true,
              height: 230,
              enlargeFactor: 0.23,
              viewportFraction: 0.88,
              onPageChanged: (index, reason) {
                setState(() {
                  activeindex = index;
                });
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          // buildindicator(),
        ],
      ),
    );
  }
}

Widget buildimage(String img, int index) {
  return Container(
    decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(100))),
    // margin: const EdgeInsets.symmetric(horizontal: 3),
    child: ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: Image.asset(
        img,
        fit: BoxFit.cover,
      ),
    ),
  );
}

Widget buildindicator() {
  return AnimatedSmoothIndicator(
    activeIndex: activeindex,
    count: Imglocation.length,
    effect: const ExpandingDotsEffect(
        dotWidth: 9, activeDotColor: Colors.blue, dotHeight: 9),
  );
}