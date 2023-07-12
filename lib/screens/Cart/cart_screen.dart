import 'package:flutter/material.dart';
import 'package:flutter_2/Screens/Cart/cart_model.dart';
import 'package:flutter_2/Screens/Cart/data_base.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../global/globals.dart';
import '../Restaurants/non_veg_logo.dart';
import '../Restaurants/veg_logo.dart';
import 'cart_provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({
    Key? key,
  }) : super(key: key);

  static const String routeName = '/cart';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const CartScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  DBHelper? dbHelper = DBHelper();
  List<bool> tapped = [];

  @override
  void initState() {
    super.initState();
    context.read<CartProvider>().getData();
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Cart',
          style: GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: 24),
        ),
      ),
      backgroundColor: const Color.fromRGBO(240, 255, 253, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Consumer<CartProvider>(
              builder: (BuildContext context, provider, widget) {
                if (provider.cart.isEmpty) {
                  return Column(
                    children: [
                      SizedBox(
                        height: (MediaQuery.of(context).size.height) / 2.8,
                      ),
                      Center(
                        child: Text(
                          'Something Delicious is Waiting For you!',
                          style: GoogleFonts.inter(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  );
                } else {
                  return Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              //color: Colors.black12,
                              borderRadius: BorderRadius.circular(15)),
                          child: SingleChildScrollView(
                            child: ListView.builder(
                              physics: const ClampingScrollPhysics(),
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              itemCount: provider.cart.length,
                              itemBuilder: (context, index) {
                                return Center(
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        left: 10,
                                        right: 10,
                                        top: 10,
                                        bottom: 10),
                                    width: double.maxFinite,
                                    height: 100,
                                    child: Stack(
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 80,
                                              height: 80,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: Image.asset(
                                                  provider.cart[index].image!,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 3),
                                              child: Row(
                                                children: [
                                                  const SizedBox(
                                                    width: 7,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Stack(
                                                        children: [
                                                          SizedBox(
                                                            width: 215,
                                                            height: 22,
                                                            child: Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                RichText(
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  maxLines: 1,
                                                                  text: TextSpan(
                                                                      text: provider
                                                                          .cart[
                                                                              index]
                                                                          .productName!,
                                                                      style: const TextStyle(
                                                                          color: Color.fromARGB(
                                                                              255,
                                                                              0,
                                                                              126,
                                                                              51),
                                                                          fontSize:
                                                                              17,
                                                                          fontFamily:
                                                                              'Dropdown',
                                                                          fontWeight:
                                                                              FontWeight.bold)),
                                                                ),
                                                                const SizedBox(
                                                                  width: 15,
                                                                ),
                                                                CartLogoDecider(
                                                                    logoindex:
                                                                        index),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      RichText(
                                                        text: TextSpan(
                                                            text: provider
                                                                .cart[index]
                                                                .restaurantName!,
                                                            style: const TextStyle(
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        120,
                                                                        120,
                                                                        120),
                                                                fontSize: 16,
                                                                fontFamily:
                                                                    'Dropdown',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                      ),
                                                      const SizedBox(
                                                        height: 12,
                                                      ),
                                                      RichText(
                                                        text: TextSpan(
                                                            text:
                                                                '\u{20B9} ${provider.cart[index].productPrice!}',
                                                            style: const TextStyle(
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        0,
                                                                        126,
                                                                        51),
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Positioned(
                                          bottom: 5,
                                          right: 5,
                                          child: ValueListenableBuilder<int>(
                                              valueListenable: provider
                                                  .cart[index].quantity!,
                                              builder: (context, val, child) {
                                                return PlusMinusButtons(
                                                  addQuantity: () {
                                                    cart.addQuantity(provider
                                                        .cart[index].id!);
                                                    dbHelper!
                                                        .updateQuantity(Cart(
                                                            id: index,
                                                            productId: index
                                                                .toString(),
                                                            productName: provider
                                                                .cart[index]
                                                                .productName,
                                                            restaurantName: provider
                                                                .cart[index]
                                                                .restaurantName,
                                                            identity: provider
                                                                .cart[index]
                                                                .identity,
                                                            menutype: provider
                                                                .cart[index]
                                                                .menutype,
                                                            initialPrice: provider
                                                                .cart[index]
                                                                .initialPrice,
                                                            productPrice: provider
                                                                .cart[index]
                                                                .productPrice,
                                                            quantity: ValueNotifier(
                                                                provider
                                                                    .cart[index]
                                                                    .quantity!
                                                                    .value),
                                                            categoryTag: provider
                                                                .cart[index]
                                                                .categoryTag,
                                                            image: provider
                                                                .cart[index]
                                                                .image))
                                                        .then((value) {
                                                      setState(() {
                                                        cart.addTotalPrice(
                                                            double.parse(provider
                                                                .cart[index]
                                                                .productPrice
                                                                .toString()));
                                                      });
                                                    });
                                                  },
                                                  deleteQuantity: () {
                                                    cart.deleteQuantity(provider
                                                        .cart[index].id!);
                                                    cart.removeTotalPrice(
                                                        double.parse(provider
                                                            .cart[index]
                                                            .productPrice
                                                            .toString()));
                                                  },
                                                  removeItem: () {
                                                    dbHelper!.deleteCartItem(
                                                        provider
                                                            .cart[index].id!);
                                                    provider.removeItem(provider
                                                        .cart[index].id!);
                                                    provider.removeCounter();
                                                  },
                                                  text: val.toString(),
                                                );
                                              }),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              // separatorBuilder: (context, index) {
                              //   return const Divider(
                              //     thickness: 1.75,
                              //     color: Color.fromARGB(255, 211, 211, 211),
                              //   );
                              // },
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
            Consumer<CartProvider>(
              builder: (BuildContext context, value, Widget? child) {
                if (value.cart.isEmpty) {
                  return Center(
                      child: Text(
                    'Please add some items',
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500, fontSize: 18.0),
                  ));
                } else {
                  final ValueNotifier<int?> totalPrice = ValueNotifier(null);
                  for (var element in value.cart) {
                    totalPrice.value =
                        (element.productPrice! * element.quantity!.value) +
                            (totalPrice.value ?? 0);
                  }
                  return Column(
                    children: [
                      Image.asset(
                        'assets/buttons/line.png',
                        width: (MediaQuery.of(context).size.width - 60),
                      ),
                      const SizedBox(
                        height: 0,
                      ),
                      ValueListenableBuilder<int?>(
                          valueListenable: totalPrice,
                          builder: (context, val, child) {
                            totalCartValue = val! + 20;
                            return Column(
                              children: [
                                // const SizedBox(
                                //   width: double.maxFinite,
                                //   child: Padding(
                                //     padding: EdgeInsets.only(left: 30.0),
                                //     child: Text(
                                //       'Bill Details',
                                //       style: TextStyle(
                                //           fontFamily: 'Dropdown',
                                //           fontSize: 18,
                                //           fontWeight: FontWeight.bold),
                                //     ),
                                //   ),
                                // ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 15),
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Column(
                                      children: [
                                        BillingParameters(
                                            title: 'Item Total',
                                            value:
                                                val?.toStringAsFixed(2) ?? '0'),
                                        const BillingParameters(
                                            title: 'Restaurant Charges',
                                            value: '10.00'),
                                        const BillingParameters(
                                            title: 'Delivery Partner Fees',
                                            value: '10.00'),
                                        const SizedBox(
                                          height: 30,
                                        ),
                                        Image.asset(
                                          'assets/buttons/line.png',
                                          width: (MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              50),
                                        ),
                                        const SizedBox(
                                          height: 30,
                                        ),
                                        BillingAmount(
                                            title: 'Grand Total',
                                            value:
                                                (val! + 20).toStringAsFixed(2)),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/payments');
                            },
                            child: Container(
                              height: 60,
                              width: 250,
                              decoration: const BoxDecoration(
                                  color: Color.fromRGBO(36, 194, 138, 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Center(
                                child: Text(
                                  'CHECKOUT',
                                  style: GoogleFonts.inter(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                              ),
                            )),
                      )
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
      // bottomNavigationBar: TextButton(
      //   child: const Text(
      //     'Proceed To Pay',
      //     style: TextStyle(
      //         fontFamily: 'Dropdown',
      //         fontSize: 16,
      //         color: Color.fromARGB(255, 0, 126, 51),
      //         fontWeight: FontWeight.bold),
      //   ),
      //   onPressed: () {

      //     _razorpay.open(options);
      //   },
      // ),
    );
  }
}

class PlusMinusButtons extends StatelessWidget {
  final VoidCallback deleteQuantity;
  final VoidCallback addQuantity;
  final VoidCallback removeItem;
  final String text;
  const PlusMinusButtons(
      {Key? key,
      required this.addQuantity,
      required this.deleteQuantity,
      required this.removeItem,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MinusButton(
            deleteQuantity: deleteQuantity, removeItem: removeItem, text: text),
        const SizedBox(
          width: 6,
        ),
        Text(
          text,
          style: const TextStyle(
              fontFamily: 'Dropdown',
              fontSize: 20,
              fontWeight: FontWeight.w800),
        ),
        const SizedBox(
          width: 6,
        ),
        PlusButton(addQuantity: addQuantity),
      ],
    );
  }
}

class MinusButton extends StatelessWidget {
  final VoidCallback deleteQuantity;
  final VoidCallback removeItem;

  final String text;

  const MinusButton(
      {Key? key,
      required this.deleteQuantity,
      required this.removeItem,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (text == '1') {
      return Container(
        height: 35,
        width: 35,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
              width: 2.5, color: const Color.fromARGB(255, 36, 194, 128)),
        ),
        child: Center(
          child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: removeItem,
              icon: const Icon(
                Icons.remove_rounded,
                size: 20,
                color: Color.fromARGB(255, 36, 194, 128),
              )),
        ),
      );
    } else {
      return Container(
        height: 35,
        width: 35,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
              width: 2.5, color: const Color.fromARGB(255, 36, 194, 128)),
        ),
        child: Center(
          child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: deleteQuantity,
              icon: const Icon(
                Icons.remove_rounded,
                color: Color.fromARGB(255, 36, 194, 128),
              )),
        ),
      );
    }
  }
}

class PlusButton extends StatelessWidget {
  final VoidCallback addQuantity;
  const PlusButton({Key? key, required this.addQuantity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 35,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 36, 194, 128),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: IconButton(
            padding: EdgeInsets.zero,
            color: Colors.white,
            onPressed: addQuantity,
            icon: const Icon(Icons.add_rounded)),
      ),
    );
  }
}

class BillingParameters extends StatelessWidget {
  final String title, value;
  const BillingParameters(
      {super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.inter(
                fontSize: 20,
                color: const Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.w600),
          ),
          Text(
            '\u{20B9}$value',
            style: GoogleFonts.inter(
              fontSize: 18,
              color: const Color.fromRGBO(0, 126, 51, 1),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class BillingAmount extends StatelessWidget {
  final String title, value;
  const BillingAmount({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.inter(
                fontSize: 25,
                color: const Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.w600),
          ),
          Text(
            '\u{20B9}' + value.toString(),
            style: GoogleFonts.inter(
              fontSize: 23,
              color: const Color.fromRGBO(0, 126, 51, 1),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class CuttlerySection extends StatelessWidget {
  const CuttlerySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        width: double.maxFinite,
        height: 80,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 10),
              width: double.maxFinite,
              child: const Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Text(
                  'Add Cooking Requests',
                  style: TextStyle(
                      fontFamily: 'Dropdown',
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10.0,
                left: 10,
                right: 10,
              ),
              child: Center(
                child: TextField(
                  cursorColor: Colors.black,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    filled: true,
                    border: InputBorder.none,
                    fillColor: Colors.white,
                    hintText: 'Cuttlery,Napkins,No Onions or Any Other...',
                    hintStyle: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Dropdown',
                        color: Color.fromARGB(255, 162, 58, 0)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 162, 58, 0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 162, 58, 0)),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CartLogoDecider extends StatelessWidget {
  final int logoindex;
  const CartLogoDecider({
    super.key,
    required this.logoindex,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (BuildContext context, provider, widget) {
        if (provider.cart[logoindex].categoryTag == 'Veg') {
          // ignore: prefer_const_constructors
          return VegLogo();
        } else {
          return const NonVegLogo();
        }
      },
    );
  }
}
