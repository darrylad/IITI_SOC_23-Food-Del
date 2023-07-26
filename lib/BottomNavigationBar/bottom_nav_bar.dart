import 'package:flutter/material.dart';
import 'package:flutter_2/global/globals.dart';
import 'package:flutter_2/global/globals.dart';
import 'package:flutter_2/global/globals.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../screens/Cart/cart_provider.dart';

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
                    Provider.of<CartEmptyStateProvider>(context, listen: false)
                        .updateCurrentIndex(0);
                    context.go('/home_screen.dart');
                  },
                  child: Container(
                    width: 0.26 * screenwidth,
                    height: 0.125 * screenwidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: Provider.of<CartEmptyStateProvider>(context)
                                  .currentIndex ==
                              0
                          ? const Color.fromARGB(255, 222, 117, 72)
                          : Colors.transparent,
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/buttons/home-04.svg',
                        colorFilter: ColorFilter.mode(
                          Provider.of<CartEmptyStateProvider>(context)
                                      .currentIndex ==
                                  0
                              ? Colors.white
                              : Colors.black,
                          BlendMode.srcIn,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Provider.of<CartEmptyStateProvider>(context, listen: false)
                        .updateCurrentIndex(1);
                    context.push('/CartScreen.dart');
                  },
                  child: Container(
                    width: 0.26 * screenwidth,
                    height: 0.125 * screenwidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: Provider.of<CartEmptyStateProvider>(context)
                                  .currentIndex ==
                              1
                          ? const Color.fromARGB(255, 222, 117, 72)
                          : Provider.of<CartEmptyStateProvider>(context)
                                          .currentIndex !=
                                      1 &&
                                  Provider.of<CartEmptyStateProvider>(context)
                                          .cartEmptyState ==
                                      false
                              ? const Color.fromARGB(255, 204, 255, 233)
                              : Colors.white,
                    ),
                    child: Center(
                        child: SvgPicture.asset(
                      'assets/buttons/cart.svg',
                      colorFilter: ColorFilter.mode(
                        Provider.of<CartEmptyStateProvider>(context)
                                        .currentIndex !=
                                    1 &&
                                Provider.of<CartEmptyStateProvider>(context)
                                        .cartEmptyState ==
                                    true
                            ? Colors.black
                            : Provider.of<CartEmptyStateProvider>(context)
                                            .currentIndex !=
                                        1 &&
                                    Provider.of<CartEmptyStateProvider>(context)
                                            .cartEmptyState ==
                                        false
                                ? const Color.fromARGB(255, 0, 183, 139)
                                : Colors.white,
                        BlendMode.srcIn,
                      ),
                      fit: BoxFit.cover,
                    )

                        /*  Provider.of<CartEmptyStateProvider>(context)
                                      .currentIndex !=
                                  1 &&
                              Provider.of<CartEmptyStateProvider>(context)
                                      .cartEmptyState ==
                                  true
                          ? emptyCartNotSelectedWidget
                          : Provider.of<CartEmptyStateProvider>(context)
                                          .currentIndex !=
                                      1 &&
                                  Provider.of<CartEmptyStateProvider>(context)
                                          .cartEmptyState ==
                                      false
                              ? nonEmptyCartNotSelectedWidget
                              : Provider.of<CartEmptyStateProvider>(context)
                                              .currentIndex ==
                                          1 &&
                                      Provider.of<CartEmptyStateProvider>(
                                                  context)
                                              .cartEmptyState ==
                                          false
                                  ? nonEmptyCartSelectedWidget
                                  : emptyCartSelectedWidget,
                    */
                        ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Provider.of<CartEmptyStateProvider>(context, listen: false)
                        .updateCurrentIndex(2);
                    context.go(route);
                  },
                  child: Container(
                    width: 0.26 * screenwidth,
                    height: 0.125 * screenwidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: Provider.of<CartEmptyStateProvider>(context)
                                  .currentIndex ==
                              2
                          ? const Color.fromARGB(255, 222, 117, 72)
                          : Colors.transparent,
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/buttons/Users.svg',
                        colorFilter: ColorFilter.mode(
                          Provider.of<CartEmptyStateProvider>(context)
                                      .currentIndex ==
                                  2
                              ? Colors.white
                              : Colors.black,
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
      ),
    );
  }
}
