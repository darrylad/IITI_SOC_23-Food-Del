/* import 'package:flutter/material.dart';
import 'package:flutter_2/global/globals.dart';

class NavBarCartStateProvider extends ChangeNotifier {
  bool? cartEmptyState;

  void assignCartEmptyState(bool cartState) {
    if (cartState == true) {
      cartEmptyState = true;
      notifyListeners();
    } else {
      cartEmptyState = false;
      notifyListeners();
    }
  }

  dynamic totalCartItems;

  void assignTotalCartItems(noOFCartItems) {
    totalCartItems = noOFCartItems;
    notifyListeners();
  }

  Color? cartBackgroundColor;

  Color assignCartBackgroundColor() {
    return currentIndex == 1
        ? const Color.fromARGB(255, 222, 117, 72)
        : (currentIndex != 1 && cartEmptyState == false)
            ? const Color.fromARGB(255, 38, 193, 127)
            : Colors.white;
  }

 Widget assignCartWidget() {
    return (currentIndex != 1 && cartEmptyState == true)
        ? emptyCartNotSelectedWidget
        : (currentIndex != 1 && cartEmptyState == false)
            ? nonEmptyCartNotSelectedWidget
            : (currentIndex == 1 && cartEmptyState == false)
                ? nonEmptyCartSelectedWidget
                : emptyCartSelectedWidget;
  }
 
  Widget? cartWidget;

/*   void assignCartWidget() {
    if (currentIndex != 1 && cartEmptyState == true) {
      cartWidget = emptyCartNotSelectedWidget;
      notifyListeners();
    } else if (currentIndex != 1 && cartEmptyState == false) {
      nonEmptyCartNotSelectedWidget;
      notifyListeners();
    } else if (currentIndex == 1 && cartEmptyState == false) {
      cartWidget = nonEmptyCartSelectedWidget;
      notifyListeners();
    } else if (currentIndex != 1 && cartEmptyState == true) {
      cartWidget = emptyCartNotSelectedWidget;
      notifyListeners();
    }
  } */
}
 */
/* import 'package:flutter/material.dart';
import 'package:flutter_2/Screens/Cart/cart_provider.dart';
import 'package:flutter_2/Screens/Cart/data_base.dart';
import 'package:flutter_2/global/globals.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class MyNavBar extends StatefulWidget {
  final ValueNotifier<bool> cartEmptyState;
  const MyNavBar({
    required this.cartEmptyState,
    Key? key,
  }) : super(key: key);

  @override
  State<MyNavBar> createState() => _MyNavBarState();
}

class _MyNavBarState extends State<MyNavBar> {
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
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 0.0277 * screenwidth,
                vertical: 0.0236 * screenwidth),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ValueListenableBuilder<int>(
                  valueListenable: currentIndex,
                  builder: (context, indexvalue, _) {
                    return InkWell(
                      onTap: () {
                        currentIndex.value = 0;
                        context.go('/home_screen.dart');
                      },
                      child: Container(
                        width: 0.26 * screenwidth,
                        height: 0.125 * screenwidth,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: indexvalue == 0
                              ? const Color.fromARGB(255, 222, 117, 72)
                              : Colors.transparent,
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            'assets/buttons/home-04.svg',
                            colorFilter: ColorFilter.mode(
                              indexvalue == 0 ? Colors.white : Colors.black,
                              BlendMode.srcIn,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                ValueListenableBuilder<int>(
                    valueListenable: currentIndex,
                    builder: (context, indexValue, _) {
                      return GestureDetector(
                        onTap: () {
                          currentIndex.value = 1;
                          context.push('/CartScreen.dart');
                        },
                        child: ValueListenableBuilder<bool>(
                          valueListenable: widget.cartEmptyState,
                          builder: (context, value, _) {
                            return Container(
                              width: 0.26 * screenwidth,
                              height: 0.125 * screenwidth,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                color: indexValue == 1
                                    ? const Color.fromARGB(255, 222, 117, 72)
                                    : (indexValue != 1 && value == false)
                                        ? const Color.fromARGB(
                                            255, 38, 193, 127)
                                        : Colors.white,
                              ),
                              child: Center(
                                child: value == true
                                    ? emptyCartNotSelectedWidget
                                    : indexValue != 1
                                        ? nonEmptyCartNotSelectedWidget
                                        : nonEmptyCartSelectedWidget,
                              ),
                            );
                          },
                        ),
                      );
                    }),
                ValueListenableBuilder<int>(
                    valueListenable: currentIndex,
                    builder: (context, indexValue, _) {
                      return GestureDetector(
                        onTap: () {
                          currentIndex.value = 2;
                          context.go(route);
                        },
                        child: Container(
                          width: 0.26 * screenwidth,
                          height: 0.125 * screenwidth,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: indexValue == 2
                                ? const Color.fromARGB(255, 222, 117, 72)
                                : Colors.transparent,
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              'assets/buttons/Users.svg',
                              colorFilter: ColorFilter.mode(
                                indexValue == 2
                                    ? Colors.white
                                    : Colors.black,
                                BlendMode.srcIn,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

 */
/* import 'package:flimport 'package:flutter_2/global/globals.dart';
utter/material.dart';
import 'package:flutter_2/global/globals.dart';
import 'package:flutter_2/global/globals.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class MyNavBar extends StatelessWidget {
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
                        .updateCartEmptyState(true);
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
                        .updateCurrentIndex(
                            1); // Update currentIndex to 1 when the cart tab is tapped
                    // ... Your cart button onTap implementation ...
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
                              ? const Color.fromARGB(255, 38, 193, 127)
                              : Colors.white,
                    ),
                    child: Center(
                      child: Provider.of<CartEmptyStateProvider>(context)
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
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Provider.of<CartEmptyStateProvider>(context, listen: false)
                        .updateCurrentIndex(1);
                    context.go(route);
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
                        'assets/buttons/cart.svg',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
 */