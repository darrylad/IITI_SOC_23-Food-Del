import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Paymentpage extends StatefulWidget {
  const Paymentpage({super.key});

  @override
  State<Paymentpage> createState() => _PaymentpageState();
}

class _PaymentpageState extends State<Paymentpage> {
  final _razorpay = Razorpay();

  @override
  void initState() {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.initState();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    {
      context.go('/afterpayments.dart');
    }
    // Do something when payment succeeds
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    {
      context.go('/afterpayments.dart');
    }
    // Do something when payment fails
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
  }

  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator PaymentpageWidget - FRAME
    return Material(
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment(6.123234262925839e-17, -1),
              end: Alignment(1, 6.123234262925839e-17),
              colors: [
                Color.fromRGBO(0, 174, 93, 1),
                Color.fromRGBO(0, 193, 104, 1),
                Color.fromRGBO(31, 252, 145, 1)
              ]),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 70,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 40,
                ),
                Text('Payments',
                    style: GoogleFonts.inter(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.white)),
              ],
            ),
            const SizedBox(
              height: 150,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Rs 500',
                    style: GoogleFonts.inter(
                        fontSize: 70,
                        fontWeight: FontWeight.w700,
                        color: Colors.white)),
              ],
            ),
            const SizedBox(
              height: 150,
            ),
            GestureDetector(
              onTap: () {
                var options = {
                  'key': '<rzp_test_V9s6DK7Eadsvfx>',
                  'amount': 50000, //in the smallest currency sub-unit.
                  'name': 'Acme Corp.',
                  'order_id':
                      'order_EMBFqjDHEEn80l', // Generate order_id using Orders API
                  'description': 'Fine T-Shirt',
                  'timeout': 300, // in seconds
                  'prefill': {
                    'contact': '9123456789',
                    'email': 'gaurav.kumar@example.com'
                  }
                };
                _razorpay.open(options);
              },
              child: Container(
                height: 60,
                width: 285,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  color: Colors.white,
                ),
                child: SvgPicture.asset(
                  'assets/buttons/Razorpay_logo.svg',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }
}
