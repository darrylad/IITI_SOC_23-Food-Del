// ignore: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_2/screens/Restaurants/NighCanteen/Cart(SUM)/sum.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: camel_case_types
class Card_cart extends StatelessWidget {
  const Card_cart({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: Name.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 18, 0, 0),
                    child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        child: Image.asset(
                          Img[index].toString(),
                          height: 80,
                          width: 80,
                          fit: BoxFit.fill,
                        )),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: Text(
                          Name[index].toString(),
                          style: GoogleFonts.inter(fontSize: 18),
                        ),
                      ),
                      const SizedBox(height: 7),
                      Container(
                        width: 150,
                        height: 30,
                        decoration: const BoxDecoration(
                          border: Border(
                              right: BorderSide(
                                  color: Color.fromARGB(255, 26, 217, 100)),
                              bottom: BorderSide(
                                  color: Color.fromARGB(255, 26, 217, 100)),
                              left: BorderSide(
                                  color: Color.fromARGB(255, 26, 217, 100)),
                              top: BorderSide(
                                  color: Color.fromARGB(255, 26, 217, 100))),
                          color: Color.fromARGB(255, 229, 255, 216),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 229, 255, 216),
                                border: Border(
                                    right: BorderSide(
                                        color:
                                            Color.fromARGB(255, 26, 217, 100)),
                                    bottom: BorderSide(
                                        color:
                                            Color.fromARGB(255, 26, 217, 100)),
                                    left: BorderSide(
                                        color:
                                            Color.fromARGB(255, 26, 217, 100)),
                                    top: BorderSide(
                                        color:
                                            Color.fromARGB(255, 26, 217, 100))),
                              ),
                              child: IconButton(
                                  onPressed: () {},
                                  icon: Image.asset(
                                    'assets/buttons/minus.png',
                                    height: 30,
                                    width: 30,
                                  )),
                            ),
                            const Text('1'),
                            Container(
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 229, 255, 216),
                                border: Border(
                                    right: BorderSide(
                                        color:
                                            Color.fromARGB(255, 26, 217, 100)),
                                    bottom: BorderSide(
                                        color:
                                            Color.fromARGB(255, 26, 217, 100)),
                                    left: BorderSide(
                                        color:
                                            Color.fromARGB(255, 26, 217, 100)),
                                    top: BorderSide(
                                        color:
                                            Color.fromARGB(255, 26, 217, 100))),
                              ),
                              child: IconButton(
                                  onPressed: () {},
                                  icon: Image.asset(
                                    'assets/buttons/plus.png',
                                    height: 30,
                                    width: 30,
                                  )),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(width: 40),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 43, 0, 0),
                    child: Text(
                      Fin_price[index].toString(),
                      style: GoogleFonts.inter(
                          fontSize: 21,
                          color: const Color.fromARGB(255, 31, 155, 3)),
                    ),
                  ),
                ],
              ),
            ],
          );
        });
  }
}







































// ListView.builder(itemBuilder =(context,index) {return
//     Column(
//       children: [
        // ignore: non_constant_identifier_names
        
      
    
//   }

// }, {super.key} )
// // ignore: non_constant_identifier_names
