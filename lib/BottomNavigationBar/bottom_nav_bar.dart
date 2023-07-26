import 'package:flutter/material.dart';
import 'package:flutter_2/global/globals.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class MyNavBar extends StatelessWidget {
  const MyNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;

    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          height: 0.17 * screenwidth,
          width: screenwidth,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40),
            boxShadow: [
              BoxShadow(
                blurRadius: 250,
                color: const Color.fromARGB(255, 95, 34, 0).withOpacity(.3),
              ),
            ],
          ),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 0.0277 * screenwidth,
                vertical: 0.0236 * screenwidth,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      currentIndex = 0;
                      context.go('/home_screen.dart');
                    },
                    child: Container(
                      width: 0.26 * screenwidth,
                      height: 0.125 * screenwidth,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: currentIndex == 0
                            ? const Color.fromARGB(255, 222, 117, 72)
                            : Colors.transparent,
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/buttons/home-04.svg',
                          colorFilter: ColorFilter.mode(
                            currentIndex == 0 ? Colors.white : Colors.black,
                            BlendMode.srcIn,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      currentIndex = 1;
                      context.push('/CartScreen.dart');
                    },
                    child: Container(
                      width: 0.26 * screenwidth,
                      height: 0.125 * screenwidth,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: currentIndex == 1
                            ? const Color.fromARGB(255, 222, 117, 72)
                            : Colors.white,
                      ),
                      child: Center(
                          child: SvgPicture.asset(
                        'assets/buttons/cart.svg',
                        colorFilter: ColorFilter.mode(
                          currentIndex != 1 ? Colors.black : Colors.white,
                          BlendMode.srcIn,
                        ),
                        fit: BoxFit.cover,
                      )),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      currentIndex = 2;
                      context.go(route);
                    },
                    child: Container(
                      width: 0.26 * screenwidth,
                      height: 0.125 * screenwidth,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: currentIndex == 2
                            ? const Color.fromARGB(255, 222, 117, 72)
                            : Colors.transparent,
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/buttons/Users.svg',
                          colorFilter: ColorFilter.mode(
                            currentIndex == 2 ? Colors.white : Colors.black,
                            BlendMode.srcIn,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
