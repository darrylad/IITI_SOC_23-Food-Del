import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Cancel extends StatefulWidget {
  const Cancel({super.key});

  @override
  State<Cancel> createState() => _CancelState();
}

class _CancelState extends State<Cancel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Stack(children: [
            Container(
              decoration: const BoxDecoration(
                gradient: RadialGradient(colors: [
                  Color.fromRGBO(219, 66, 36, 1),
                  Color.fromRGBO(186, 56, 0, 1),
                  Color.fromRGBO(115, 23, 2, 1),
                ], center: Alignment.center, radius: 1.2),
              ),
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Request Cancellation?',
                    style: GoogleFonts.inter(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'Please refer to company policy',
                    style: GoogleFonts.inter(
                        fontSize: 20,
                        color: const Color.fromRGBO(255, 195, 195, 1),
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'for refund',
                    style: GoogleFonts.inter(
                        fontSize: 20,
                        color: const Color.fromRGBO(255, 195, 195, 1),
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Container(
                    height: 55,
                    width: 250,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: Color.fromRGBO(255, 222, 222, 1),
                    ),
                    child: Center(
                        child: Text(
                      'Cancel the order',
                      style: GoogleFonts.inter(
                          fontSize: 20,
                          color: const Color.fromRGBO(195, 0, 0, 1)),
                    )),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 55,
                    width: 250,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: Color.fromRGBO(255, 222, 222, 1),
                    ),
                    child: Center(
                        child: Text(
                      'Don\u0027t cancel',
                      style: GoogleFonts.inter(
                          fontSize: 20,
                          color: const Color.fromRGBO(0, 106, 42, 1)),
                    )),
                  )
                ],
              ),
            ),
          ]),
        ));
  }
}

class SlideToAction extends StatefulWidget {
  final double screenwidth;
  const SlideToAction({
    Key? key,
    required this.screenwidth,
  }) : super(key: key);
  @override
  State<SlideToAction> createState() => _SlideToAction();
}

class _SlideToAction extends State<SlideToAction>
    with TickerProviderStateMixin {
  bool _isCanceled = false;
  double _slideAmount = 0.0;
  late AnimationController _slideController;
  late double _maxSlideAmount;

  @override
  void initState() {
    super.initState();
    _slideController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300))
          ..addListener(() {
            setState(() {
              _slideAmount = _slideController.value * _maxSlideAmount;
            });
          });
  }

  @override
  void dispose() {
    _slideController.dispose();
    super.dispose();
  }

  void _slideToCancel() {
    _isCanceled = true;
    _slideController.animateTo(_maxSlideAmount /
        _maxSlideAmount); // Slide to the cancel state smoothly
    // Perform the task when the slide reaches the end
    print('Cancel');
  }

  void _onSlideStart(DragStartDetails details) {
    _isCanceled = false;
    _slideController.forward();
  }

  void _onSlideUpdate(DragUpdateDetails details) {
    if (!_isCanceled) {
      setState(() {
        _slideAmount += details.delta.dx;
        if (_slideAmount < 0) {
          _slideAmount = 0;
        } else if (_slideAmount > _maxSlideAmount) {
          _slideAmount = _maxSlideAmount;
        }
        // Compute the fading value based on the slide amount
        _slideController.value = _slideAmount / _maxSlideAmount;
      });
    }
  }

  void _onSlideEnd(DragEndDetails details) {
    if (!_isCanceled) {
      if (_slideAmount >= _maxSlideAmount - widget.screenwidth * 0.16) {
        _slideToCancel();
      } else {
        _slideController.reverse();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    _maxSlideAmount =
        screenWidth * 0.7611; // Adjust the value as per your requirements

    return Container(
      width: screenWidth * 0.7611,
      height: screenWidth * 0.18055,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 109, 1, 1),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Stack(
        children: [
          Positioned(
            left: _slideAmount.clamp(
                0.0,
                _maxSlideAmount -
                    screenWidth * 0.185), // Ensure sliding within the container
            child: GestureDetector(
              onTap: () {
                if (!_isCanceled) {
                  _slideToCancel();
                }
              },
              onHorizontalDragStart: _onSlideStart,
              onHorizontalDragUpdate: _onSlideUpdate,
              onHorizontalDragEnd: _onSlideEnd,
              child: Padding(
                padding: EdgeInsets.all(screenWidth * 0.0085),
                child: Container(
                    width: screenWidth * 0.1667,
                    height: screenWidth * 0.1667,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 255, 187, 187),
                      shape: BoxShape.circle,
                    ),
                    child:Center(
                      child: SizedBox(
                          width: screenWidth * 0.02083,
                          height: screenWidth * 0.04166,
                          child: SvgPicture.asset('assets/buttons/slideactionarrow.svg',
                          ),
                        ),
                    ),),
              ),
            ),
          ),
          Opacity(
            opacity: 1.0 - _slideController.value,
            child: Center(
              child: Text(
                'Slide To Cancel',
                style: TextStyle(
                  color:
                      const Color.fromARGB(255, 255, 170, 190).withOpacity(0.6),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
