import 'package:flutter/material.dart';
import 'package:flutter_2/global/globals.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentsPage extends StatefulWidget {
  const PaymentsPage({super.key});

  @override
  State<PaymentsPage> createState() => _PaymentsPageState();
}

class _PaymentsPageState extends State<PaymentsPage> {
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
      colour_3 = colour_4;
      payed = true;
      colourdecider();
      context.go('/Afterpayments.dart');
    }
    // Do something when payment succeeds
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    {
      context.go('/PaymentsPage.dart');
    }
    // Do something when payment fails
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
  }

  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator PaymentsPageWidget - FRAME
    return Material(
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(63, 255, 169, 1),
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
                Text('Rs',
                    style: GoogleFonts.inter(
                        fontSize: 70,
                        fontWeight: FontWeight.w700,
                        color: const Color.fromARGB(255, 255, 255, 255))),
                Text(totalCartValue.toString(),
                    style: GoogleFonts.inter(
                        fontSize: 70,
                        fontWeight: FontWeight.w700,
                        color: const Color.fromARGB(255, 255, 255, 255))),
              ],
            ),
            const SizedBox(
              height: 150,
            ),
            GestureDetector(
              onTap: () {
                var options = {
                  'key': "rzp_test_63wbl8WV8xdIR9",
                  'amount': totalCartValue! * 100,
                  'name': 'DeliverEat',
                  'description': 'Food',
                  'timeout': 300,

                  'send_sms_hash': true, // in seconds
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
                  color: Color.fromARGB(255, 255, 255, 255),
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
