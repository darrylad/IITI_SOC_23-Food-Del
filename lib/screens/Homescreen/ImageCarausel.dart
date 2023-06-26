import 'dart:async';

import 'package:flutter/material.dart';

import '../../demo/demo_img.dart';

class ImageCarausal extends StatefulWidget {
  const ImageCarausal({
    super.key,
  });

  @override
  State<ImageCarausal> createState() => _ImageCarausalState();
}

class _ImageCarausalState extends State<ImageCarausal> {
  int currentpage = 0;

  PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 4), (Timer timer) {
      if (currentpage < 3) {
        currentpage++;
        pageController.animateToPage(
          currentpage,
          duration: const Duration(seconds: 1),
          curve: Curves.easeIn,
        );
      } else {
        currentpage = -1;
      }
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 8, 10, 10),
      child: AspectRatio(
        aspectRatio: 1.61,
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            PageView.builder(
                controller: pageController,
                onPageChanged: (value) {
                  setState(() {
                    currentpage = value;
                  });
                },
                itemCount: demoBigimage.length,
                itemBuilder: ((context, index) => Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Material(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        elevation: 2,
                        child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                            child: Image.asset(demoBigimage[index],
                                fit: BoxFit.fill)),
                      ),
                    ))),
            Positioned(
              bottom: 16,
              right: 178,
              child: Padding(
                padding: EdgeInsets.only(
                    left: ((MediaQuery.of(context).size.width / 2) - 50)),
                child: Row(
                    children: List.generate(
                        demoBigimage.length,
                        (index) => Padding(
                              padding: const EdgeInsets.only(left: 6),
                              child: Indicator(
                                isActive: index == currentpage,
                              ),
                            ))),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  const Indicator({
    Key? key,
    required this.isActive,
  }) : super(key: key);
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4,
      width: 8,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.white38,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
    );
  }
}
