import 'package:flutter/material.dart';
import 'package:flutter_2/Screens/Cart/cart_model.dart';
import 'package:flutter_2/Screens/Cart/cart_provider.dart';
import 'package:flutter_2/Screens/Cart/cart_screen.dart';
import 'package:flutter_2/Screens/Cart/data_base.dart';
import 'package:flutter_2/Screens/Restaurants/TapriIITiansKi/tapri_iitians_ki.dart';
import 'package:flutter_2/Screens/Restaurants/alertwidgetcancel.dart';
import 'package:flutter_2/Screens/Restaurants/restaurants_logo_decider.dart';
import 'package:flutter_2/global/globals.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';

class TIKMainCourse extends StatefulWidget {
  final int menuindex;
  const TIKMainCourse({
    Key? key,
    required this.menuindex,
  }) : super(key: key);

  @override
  State<TIKMainCourse> createState() => _TIKMainCourseState();
}

class _TIKMainCourseState extends State<TIKMainCourse> {
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    DBHelper dbHelper = DBHelper();

    final cart = Provider.of<CartProvider>(context);
    void saveData(int index) {
      dbHelper
          .insert(
        Cart(
          id: index,
          productId: '${productsTIK[index].identity}00000$index',
          productName: productsTIK[index].name,
          restaurantName: productsTIK[index].restaurant,
          initialPrice: productsTIK[index].price,
          productPrice: productsTIK[index].price,
          identity: productsTIK[index].identity,
          menutype: productsTIK[index].menutype,
          quantity: ValueNotifier(1),
          categoryTag: productsTIK[index].category,
          image: productsTIK[index].image,
        ),
      )
          .then((value) {
        cart.addTotalPrice(productsTIK[widget.menuindex].price.toDouble());
        cart.addCounter();
        print('Product Added to cart');
      }).onError((error, stackTrace) {
        print(error.toString());
      });
    }

    if (productsTIK[widget.menuindex].menutype == 'Main Course' &&
        (categorySelected == productsTIK[widget.menuindex].category ||
            categorySelected == 'All')) {
      return Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        height: screenwidth * 0.30,
        width: screenwidth,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 0.0127 * screenwidth,
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  TIKLogoDecider(logoindex: widget.menuindex),
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                width: 0.475 * screenwidth,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Text(productsTIK[widget.menuindex].name,
                        style: GoogleFonts.inter(
                            fontSize: 0.0425 * screenwidth,
                            color: Colors.black,
                            fontWeight: FontWeight.w600)),
                    const SizedBox(
                      height: 2.5,
                    ),
                    SizedBox(
                      width: 0.45 * screenwidth,
                      height: 0.0765 * screenwidth,
                      child: Text(productsTIK[widget.menuindex].itemdescription,
                          style: GoogleFonts.inter(
                              fontSize: 10,
                              color: const Color.fromARGB(255, 69, 69, 69),
                              fontWeight: FontWeight.w500)),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                        '\u{20B9}'
                        '${productsTIK[widget.menuindex].price.toString()}',
                        style: GoogleFonts.inter(
                            fontSize: 15,
                            color: const Color.fromARGB(255, 69, 69, 69),
                            fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
              Stack(
                children: [
                  SizedBox(
                    width: 0.415 * screenwidth,
                    height: screenwidth * 0.30,
                    child: Center(
                      child: SizedBox(
                        width: screenwidth * 0.30,
                        height: screenwidth * 0.30,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            productsTIK[widget.menuindex].image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: -0.04 * screenwidth,
                    top: 0.04 * screenwidth,
                    child: Consumer<CartProvider>(
                        builder: (BuildContext context, provider, widget) {
                      if (provider.cart.isEmpty) {
                        return Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 12,
                                  spreadRadius: 0,
                                  color: Colors.black.withOpacity(0.10))
                            ],
                          ),
                          height: 0.2 * screenwidth,
                          width: 0.2 * screenwidth,
                          child: InkWell(
                            onTap: () {
                              saveData(this.widget.menuindex);

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Item Added Successfully!'),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            },
                            child: SvgPicture.asset(
                              'assets/buttons/plus.svg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      } else if (!((provider.cart[0].productId!).contains(
                          (productsTIK[this.widget.menuindex].identity)))) {
                        return Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 12,
                                  spreadRadius: 0,
                                  color: Colors.black.withOpacity(0.10))
                            ],
                          ),
                          height: 0.2 * screenwidth,
                          width: 0.2 * screenwidth,
                          child: InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: AlertDialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      title: const Text('Replace Cart Item?'),
                                      titleTextStyle: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 20),
                                      content: Text(
                                          "Your cart contains dishes from ${provider.cart[0].restaurantName}. Do you wish to discard those and add dishes from ${productsTIK[this.widget.menuindex].restaurant}"),
                                      actionsOverflowButtonSpacing: 20,
                                      actions: <Widget>[
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const AlertDialogCancelButtons(),
                                            Consumer<CartProvider>(builder:
                                                (BuildContext context, provider,
                                                    widget) {
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.all(7.5),
                                                child: Container(
                                                  height: 0.127 * screenwidth,
                                                  width: 0.29 * screenwidth,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      color:
                                                          const Color.fromARGB(
                                                              255,
                                                              36,
                                                              194,
                                                              128)),
                                                  child: Center(
                                                    child: TextButton(
                                                      child: const Text(
                                                        'Replace',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'Dropdown',
                                                            fontSize: 16,
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      onPressed: () {
                                                        while (provider
                                                            .cart.isNotEmpty) {
                                                          dbHelper
                                                              .deleteCartItem(
                                                                  provider
                                                                      .cart[0]
                                                                      .id!);
                                                          provider.removeItem(
                                                              provider
                                                                  .cart[0].id!);
                                                          provider
                                                              .removeCounter();
                                                        }
                                                        saveData(this
                                                            .widget
                                                            .menuindex);
                                                        Navigator.of(context)
                                                            .pop();

                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          const SnackBar(
                                                            content: Text(
                                                                'Item Added Successfully!'),
                                                            duration: Duration(
                                                                seconds: 2),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              );
                                            })
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            child: SvgPicture.asset(
                              'assets/buttons/plus.svg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      } else {
                        return Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 12,
                                  spreadRadius: 0,
                                  color: Colors.black.withOpacity(0.10))
                            ],
                          ),
                          height: 0.2 * screenwidth,
                          width: 0.2 * screenwidth,
                          child: InkWell(
                            onTap: () {
                              saveData(this.widget.menuindex);

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Item Added Successfully!'),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            },
                            child: SvgPicture.asset(
                              'assets/buttons/plus.svg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      }
                    }),
                  )
                ],
              ),
            ],
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}

class TIKFastFood extends StatefulWidget {
  final int menuindex;
  const TIKFastFood({
    Key? key,
    required this.menuindex,
  }) : super(key: key);

  @override
  State<TIKFastFood> createState() => _TIKFastFoodState();
}

class _TIKFastFoodState extends State<TIKFastFood> {
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    DBHelper dbHelper = DBHelper();

    final cart = Provider.of<CartProvider>(context);
    void saveData(int index) {
      dbHelper
          .insert(
        Cart(
          id: index,
          productId: '${productsTIK[index].identity}00000$index',
          productName: productsTIK[index].name,
          restaurantName: productsTIK[index].restaurant,
          initialPrice: productsTIK[index].price,
          productPrice: productsTIK[index].price,
          identity: productsTIK[index].identity,
          menutype: productsTIK[index].menutype,
          quantity: ValueNotifier(1),
          categoryTag: productsTIK[index].category,
          image: productsTIK[index].image,
        ),
      )
          .then((value) {
        cart.addTotalPrice(productsTIK[widget.menuindex].price.toDouble());
        cart.addCounter();
        print('Product Added to cart');
      }).onError((error, stackTrace) {
        print(error.toString());
      });
    }

    if (productsTIK[widget.menuindex].menutype == 'Fast Food' &&
        (categorySelected == productsTIK[widget.menuindex].category ||
            categorySelected == 'All')) {
      return Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        height: screenwidth * 0.30,
        width: screenwidth,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 0.0127 * screenwidth,
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  TIKLogoDecider(logoindex: widget.menuindex),
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                width: 0.475 * screenwidth,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Text(productsTIK[widget.menuindex].name,
                        style: GoogleFonts.inter(
                            fontSize: 0.0425 * screenwidth,
                            color: Colors.black,
                            fontWeight: FontWeight.w600)),
                    const SizedBox(
                      height: 2.5,
                    ),
                    SizedBox(
                      width: 0.45 * screenwidth,
                      height: 0.0765 * screenwidth,
                      child: Text(productsTIK[widget.menuindex].itemdescription,
                          style: GoogleFonts.inter(
                              fontSize: 10,
                              color: const Color.fromARGB(255, 69, 69, 69),
                              fontWeight: FontWeight.w500)),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                        '\u{20B9}'
                        '${productsTIK[widget.menuindex].price.toString()}',
                        style: GoogleFonts.inter(
                            fontSize: 15,
                            color: const Color.fromARGB(255, 69, 69, 69),
                            fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
              Stack(
                children: [
                  SizedBox(
                    width: 0.415 * screenwidth,
                    height: screenwidth * 0.30,
                    child: Center(
                      child: SizedBox(
                        width: screenwidth * 0.30,
                        height: screenwidth * 0.30,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            productsTIK[widget.menuindex].image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: -0.04 * screenwidth,
                    top: 0.04 * screenwidth,
                    child: Consumer<CartProvider>(
                        builder: (BuildContext context, provider, widget) {
                      if (provider.cart.isEmpty) {
                        return Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 12,
                                  spreadRadius: 0,
                                  color: Colors.black.withOpacity(0.10))
                            ],
                          ),
                          height: 0.2 * screenwidth,
                          width: 0.2 * screenwidth,
                          child: InkWell(
                            onTap: () {
                              saveData(this.widget.menuindex);

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Item Added Successfully!'),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            },
                            child: SvgPicture.asset(
                              'assets/buttons/plus.svg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      } else if (!((provider.cart[0].productId!).contains(
                          (productsTIK[this.widget.menuindex].identity)))) {
                        return Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 12,
                                  spreadRadius: 0,
                                  color: Colors.black.withOpacity(0.10))
                            ],
                          ),
                          height: 0.2 * screenwidth,
                          width: 0.2 * screenwidth,
                          child: InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: AlertDialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      title: const Text('Replace Cart Item?'),
                                      titleTextStyle: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 20),
                                      content: Text(
                                          "Your cart contains dishes from ${provider.cart[0].restaurantName}. Do you wish to discard those and add dishes from ${productsTIK[this.widget.menuindex].restaurant}"),
                                      actionsOverflowButtonSpacing: 20,
                                      actions: <Widget>[
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const AlertDialogCancelButtons(),
                                            Consumer<CartProvider>(builder:
                                                (BuildContext context, provider,
                                                    widget) {
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.all(7.5),
                                                child: Container(
                                                  height: 0.127 * screenwidth,
                                                  width: 0.29 * screenwidth,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      color:
                                                          const Color.fromARGB(
                                                              255,
                                                              36,
                                                              194,
                                                              128)),
                                                  child: Center(
                                                    child: TextButton(
                                                      child: const Text(
                                                        'Replace',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'Dropdown',
                                                            fontSize: 16,
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      onPressed: () {
                                                        while (provider
                                                            .cart.isNotEmpty) {
                                                          dbHelper
                                                              .deleteCartItem(
                                                                  provider
                                                                      .cart[0]
                                                                      .id!);
                                                          provider.removeItem(
                                                              provider
                                                                  .cart[0].id!);
                                                          provider
                                                              .removeCounter();
                                                        }
                                                        saveData(this
                                                            .widget
                                                            .menuindex);
                                                        Navigator.of(context)
                                                            .pop();

                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          const SnackBar(
                                                            content: Text(
                                                                'Item Added Successfully!'),
                                                            duration: Duration(
                                                                seconds: 2),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              );
                                            })
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            child: SvgPicture.asset(
                              'assets/buttons/plus.svg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      } else {
                        return Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 12,
                                  spreadRadius: 0,
                                  color: Colors.black.withOpacity(0.10))
                            ],
                          ),
                          height: 0.2 * screenwidth,
                          width: 0.2 * screenwidth,
                          child: InkWell(
                            onTap: () {
                              saveData(this.widget.menuindex);

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Item Added Successfully!'),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            },
                            child: SvgPicture.asset(
                              'assets/buttons/plus.svg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      }
                    }),
                  )
                ],
              ),
            ],
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}

class TIKBeverages extends StatefulWidget {
  final int menuindex;
  const TIKBeverages({
    Key? key,
    required this.menuindex,
  }) : super(key: key);

  @override
  State<TIKBeverages> createState() => _TIKBeveragesState();
}

class _TIKBeveragesState extends State<TIKBeverages> {
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    DBHelper dbHelper = DBHelper();

    final cart = Provider.of<CartProvider>(context);
    void saveData(int index) {
      dbHelper
          .insert(
        Cart(
          id: index,
          productId: '${productsTIK[index].identity}00000$index',
          productName: productsTIK[index].name,
          restaurantName: productsTIK[index].restaurant,
          initialPrice: productsTIK[index].price,
          productPrice: productsTIK[index].price,
          identity: productsTIK[index].identity,
          menutype: productsTIK[index].menutype,
          quantity: ValueNotifier(1),
          categoryTag: productsTIK[index].category,
          image: productsTIK[index].image,
        ),
      )
          .then((value) {
        cart.addTotalPrice(productsTIK[widget.menuindex].price.toDouble());
        cart.addCounter();
        print('Product Added to cart');
      }).onError((error, stackTrace) {
        print(error.toString());
      });
    }

    if (productsTIK[widget.menuindex].menutype == 'Beverages' &&
        (categorySelected == productsTIK[widget.menuindex].category ||
            categorySelected == 'All')) {
      return Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        height: screenwidth * 0.30,
        width: screenwidth,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 0.0127 * screenwidth,
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  TIKLogoDecider(logoindex: widget.menuindex),
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                width: 0.475 * screenwidth,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Text(productsTIK[widget.menuindex].name,
                        style: GoogleFonts.inter(
                            fontSize: 0.0425 * screenwidth,
                            color: Colors.black,
                            fontWeight: FontWeight.w600)),
                    const SizedBox(
                      height: 2.5,
                    ),
                    SizedBox(
                      width: 0.45 * screenwidth,
                      height: 0.0765 * screenwidth,
                      child: Text(productsTIK[widget.menuindex].itemdescription,
                          style: GoogleFonts.inter(
                              fontSize: 10,
                              color: const Color.fromARGB(255, 69, 69, 69),
                              fontWeight: FontWeight.w500)),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                        '\u{20B9}'
                        '${productsTIK[widget.menuindex].price.toString()}',
                        style: GoogleFonts.inter(
                            fontSize: 15,
                            color: const Color.fromARGB(255, 69, 69, 69),
                            fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
              Stack(
                children: [
                  SizedBox(
                    width: 0.415 * screenwidth,
                    height: screenwidth * 0.30,
                    child: Center(
                      child: SizedBox(
                        width: screenwidth * 0.30,
                        height: screenwidth * 0.30,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            productsTIK[widget.menuindex].image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: -0.04 * screenwidth,
                    top: 0.04 * screenwidth,
                    child: Consumer<CartProvider>(
                        builder: (BuildContext context, provider, widget) {
                      if (provider.cart.isEmpty) {
                        return Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 12,
                                  spreadRadius: 0,
                                  color: Colors.black.withOpacity(0.10))
                            ],
                          ),
                          height: 0.2 * screenwidth,
                          width: 0.2 * screenwidth,
                          child: InkWell(
                            onTap: () {
                              saveData(this.widget.menuindex);

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Item Added Successfully!'),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            },
                            child: SvgPicture.asset(
                              'assets/buttons/plus.svg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      } else if (!((provider.cart[0].productId!).contains(
                          (productsTIK[this.widget.menuindex].identity)))) {
                        return Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 12,
                                  spreadRadius: 0,
                                  color: Colors.black.withOpacity(0.10))
                            ],
                          ),
                          height: 0.2 * screenwidth,
                          width: 0.2 * screenwidth,
                          child: InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: AlertDialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      title: const Text('Replace Cart Item?'),
                                      titleTextStyle: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 20),
                                      content: Text(
                                          "Your cart contains dishes from ${provider.cart[0].restaurantName}. Do you wish to discard those and add dishes from ${productsTIK[this.widget.menuindex].restaurant}"),
                                      actionsOverflowButtonSpacing: 20,
                                      actions: <Widget>[
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const AlertDialogCancelButtons(),
                                            Consumer<CartProvider>(builder:
                                                (BuildContext context, provider,
                                                    widget) {
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.all(7.5),
                                                child: Container(
                                                  height: 0.127 * screenwidth,
                                                  width: 0.29 * screenwidth,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      color:
                                                          const Color.fromARGB(
                                                              255,
                                                              36,
                                                              194,
                                                              128)),
                                                  child: Center(
                                                    child: TextButton(
                                                      child: const Text(
                                                        'Replace',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'Dropdown',
                                                            fontSize: 16,
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      onPressed: () {
                                                        while (provider
                                                            .cart.isNotEmpty) {
                                                          dbHelper
                                                              .deleteCartItem(
                                                                  provider
                                                                      .cart[0]
                                                                      .id!);
                                                          provider.removeItem(
                                                              provider
                                                                  .cart[0].id!);
                                                          provider
                                                              .removeCounter();
                                                        }
                                                        saveData(this
                                                            .widget
                                                            .menuindex);
                                                        Navigator.of(context)
                                                            .pop();

                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          const SnackBar(
                                                            content: Text(
                                                                'Item Added Successfully!'),
                                                            duration: Duration(
                                                                seconds: 2),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              );
                                            })
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            child: SvgPicture.asset(
                              'assets/buttons/plus.svg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      } else {
                        return Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 12,
                                  spreadRadius: 0,
                                  color: Colors.black.withOpacity(0.10))
                            ],
                          ),
                          height: 0.2 * screenwidth,
                          width: 0.2 * screenwidth,
                          child: InkWell(
                            onTap: () {
                              saveData(this.widget.menuindex);

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Item Added Successfully!'),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            },
                            child: SvgPicture.asset(
                              'assets/buttons/plus.svg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      }
                    }),
                  )
                ],
              ),
            ],
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
