import 'package:flutter/material.dart';
import 'package:flutter_2/Screens/Cart/cart_provider.dart';
import 'package:flutter_2/Screens/Cart/cart_screen.dart';
import 'package:flutter_2/Screens/Cart/data_base.dart';
import 'package:flutter_2/Screens/Restaurants/TeaPost/tea_post_menu.dart';
import 'package:flutter_2/Screens/Restaurants/alertwidgetcancel.dart';
import 'package:flutter_2/Screens/Restaurants/restaurants_logo_decider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';

import '../../Cart/cart_model.dart';

class TPMainCourse extends StatefulWidget {
  final int menuindex;
  const TPMainCourse({
    Key? key,
    required this.menuindex,
  }) : super(key: key);

  @override
  State<TPMainCourse> createState() => _TPMainCourseState();
}

class _TPMainCourseState extends State<TPMainCourse> {
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
          productId: '${productsTP[index].identity}00000$index',
          productName: productsTP[index].name,
          restaurantName: productsTP[index].restaurant,
          initialPrice: productsTP[index].price,
          productPrice: productsTP[index].price,
          identity: productsTP[index].identity,
          menutype: productsTP[index].menutype,
          quantity: ValueNotifier(1),
          categoryTag: productsTP[index].category,
          image: productsTP[index].image,
        ),
      )
          .then((value) {
        cart.addTotalPrice(productsTP[widget.menuindex].price.toDouble());
        cart.addCounter();
        print('Product Added to cart');
      }).onError((error, stackTrace) {
        print(error.toString());
      });
    }

    if (productsTP[widget.menuindex].menutype == 'Main Course') {
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
                  TPLogoDecider(logoindex: widget.menuindex),
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                width: 0.475*screenwidth,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Text(productsTP[widget.menuindex].name,
                        style: GoogleFonts.inter(
                            fontSize: 0.0425 * screenwidth,
                            color: Colors.black,
                            fontWeight: FontWeight.w600)),
                    const SizedBox(
                      height: 2.5,
                    ),
                    SizedBox(
                      width: 0.45*screenwidth,
                      height: 0.0765*screenwidth,
                      child: Text(productsTP[widget.menuindex].itemdescription,
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
                        '${productsTP[widget.menuindex].price.toString()}',
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
                            productsTP[widget.menuindex].image,
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
                              _showModalBottomSheet(context);

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
                          (productsTP[this.widget.menuindex].identity)))) {
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
                                          "Your cart contains dishes from ${provider.cart[0].restaurantName}. Do you wish to discard those and add dishes from ${productsTP[this.widget.menuindex].restaurant}"),
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

                                                        _showModalBottomSheet(
                                                            context);

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

class TPFastFood extends StatefulWidget {
  final int menuindex;
  const TPFastFood({
    Key? key,
    required this.menuindex,
  }) : super(key: key);

  @override
  State<TPFastFood> createState() => _TPFastFoodState();
}

class _TPFastFoodState extends State<TPFastFood> {
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
          productId: '${productsTP[index].identity}00000$index',
          productName: productsTP[index].name,
          restaurantName: productsTP[index].restaurant,
          initialPrice: productsTP[index].price,
          productPrice: productsTP[index].price,
          identity: productsTP[index].identity,
          menutype: productsTP[index].menutype,
          quantity: ValueNotifier(1),
          categoryTag: productsTP[index].category,
          image: productsTP[index].image,
        ),
      )
          .then((value) {
        cart.addTotalPrice(productsTP[widget.menuindex].price.toDouble());
        cart.addCounter();
        print('Product Added to cart');
      }).onError((error, stackTrace) {
        print(error.toString());
      });
    }

    if (productsTP[widget.menuindex].menutype == 'Fast Food') {
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
                  TPLogoDecider(logoindex: widget.menuindex),
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                width: 0.475*screenwidth,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Text(productsTP[widget.menuindex].name,
                        style: GoogleFonts.inter(
                            fontSize: 0.0425 * screenwidth,
                            color: Colors.black,
                            fontWeight: FontWeight.w600)),
                    const SizedBox(
                      height: 2.5,
                    ),
                    SizedBox(
                      width: 0.45*screenwidth,
                      height: 0.0765*screenwidth,
                      child: Text(productsTP[widget.menuindex].itemdescription,
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
                        '${productsTP[widget.menuindex].price.toString()}',
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
                            productsTP[widget.menuindex].image,
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
                              _showModalBottomSheet(context);

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
                          (productsTP[this.widget.menuindex].identity)))) {
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
                                          "Your cart contains dishes from ${provider.cart[0].restaurantName}. Do you wish to discard those and add dishes from ${productsTP[this.widget.menuindex].restaurant}"),
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

                                                        _showModalBottomSheet(
                                                            context);

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

class TPBeverages extends StatefulWidget {
  final int menuindex;
  const TPBeverages({
    Key? key,
    required this.menuindex,
  }) : super(key: key);

  @override
  State<TPBeverages> createState() => _TPBeveragesState();
}

class _TPBeveragesState extends State<TPBeverages> {
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
          productId: '${productsTP[index].identity}00000$index',
          productName: productsTP[index].name,
          restaurantName: productsTP[index].restaurant,
          initialPrice: productsTP[index].price,
          productPrice: productsTP[index].price,
          identity: productsTP[index].identity,
          menutype: productsTP[index].menutype,
          quantity: ValueNotifier(1),
          categoryTag: productsTP[index].category,
          image: productsTP[index].image,
        ),
      )
          .then((value) {
        cart.addTotalPrice(productsTP[widget.menuindex].price.toDouble());
        cart.addCounter();
        print('Product Added to cart');
      }).onError((error, stackTrace) {
        print(error.toString());
      });
    }

    if (productsTP[widget.menuindex].menutype == 'Beverages') {
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
                  TPLogoDecider(logoindex: widget.menuindex),
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                width: 0.475*screenwidth,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Text(productsTP[widget.menuindex].name,
                        style: GoogleFonts.inter(
                            fontSize: 0.0425 * screenwidth,
                            color: Colors.black,
                            fontWeight: FontWeight.w600)),
                    const SizedBox(
                      height: 2.5,
                    ),
                    SizedBox(
                      width: 0.45*screenwidth,
                      height: 0.0765*screenwidth,
                      child: Text(productsTP[widget.menuindex].itemdescription,
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
                        '${productsTP[widget.menuindex].price.toString()}',
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
                            productsTP[widget.menuindex].image,
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
                              _showModalBottomSheet(context);

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
                          (productsTP[this.widget.menuindex].identity)))) {
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
                                          "Your cart contains dishes from ${provider.cart[0].restaurantName}. Do you wish to discard those and add dishes from ${productsTP[this.widget.menuindex].restaurant}"),
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

                                                        _showModalBottomSheet(
                                                            context);

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

void _showModalBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    enableDrag: true,
    isDismissible: true,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
      top: Radius.circular(30),
    )),
    builder: (context) => DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.35,
        maxChildSize: 0.9,
        minChildSize: 0.32,
        builder: (context, scrollcontroller) {
          double screenwidth = MediaQuery.of(context).size.width;
          return Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                  color: Color.fromARGB(255, 229, 229, 229)),
              padding: const EdgeInsets.only(top: 25),
              child: Stack(
                children: [
                  const Center(child: CartScreen()),
                  Positioned(
                    left: screenwidth * 0.5 - 40,
                    child: Container(
                      width: 80,
                      height: 7,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 154, 154, 154),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ],
              ));
        }),
  );
}
