// ignore: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../global/globals.dart';

// ignore: camel_case_types
class popup extends StatefulWidget {
  const popup({super.key});

  @override
  State<popup> createState() => _popupState();
}

// ignore: camel_case_types
class _popupState extends State<popup> {
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;

    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 0.063 * screenwidth,
            width: screenwidth * 0.84,
          ),
          Image.asset(
            'assets/buttons/addlocationpop.png',
            height: 0.37 * screenwidth,
            width: 0.37 * screenwidth,
          ),
          SizedBox(
            height: 0.115 * screenwidth,
          ),
          Text('Choose your Location',
              style: GoogleFonts.inter(
                  fontSize: 21,
                  color: const Color.fromRGBO(173, 82, 31, 1),
                  fontWeight: FontWeight.w500)),
          SizedBox(
            height: 0.127 * screenwidth,
          ),
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color.fromRGBO(255, 249, 245, 1),
                      border: Border(
                        top: BorderSide(
                            width: 2, color: Color.fromRGBO(110, 46, 0, 1)),
                        bottom: BorderSide(
                            width: 2, color: Color.fromRGBO(110, 46, 0, 1)),
                        right: BorderSide(
                            width: 2, color: Color.fromRGBO(110, 46, 0, 1)),
                        left: BorderSide(
                            width: 2, color: Color.fromRGBO(110, 46, 0, 1)),
                      )),
                  width: 0.60 * screenwidth,
                  height: 0.120 * screenwidth,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      iconEnabledColor: const Color.fromRGBO(173, 82, 31, 1),
                      iconSize: 30.0,
                      isDense: true,
                      isExpanded: true,
                      menuMaxHeight: 250,
                      value: dropdownValue,
                      onChanged: (String? value) {
                        setState(() {
                          dropdownValue = value!;
                          Locationselected = dropdownValue;
                        });
                      },
                      style: GoogleFonts.inter(
                          fontSize: 23,
                          color: const Color.fromRGBO(173, 82, 31, 1)),
                      selectedItemBuilder: (BuildContext context) {
                        return options.map((String value) {
                          return Align(
                            alignment: const Alignment(-0.9, 0.0),
                            child: Text(
                              dropdownValue,
                              style: GoogleFonts.inter(
                                fontSize: 20,
                              ),
                            ),
                          );
                        }).toList();
                      },
                      items:
                          options.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                              style: GoogleFonts.inter(
                                  fontSize: 20,
                                  color: const Color.fromRGBO(173, 82, 31, 1)),
                              value),
                        );
                      }).toList(),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 0.15 * screenwidth,
          ),
          SubmitButton(
            dropdownValue: dropdownValue,
          ),
          SizedBox(
            height: screenwidth * 0.0765,
          ),
        ],
      ),
    );
  }
}

class SubmitButton extends StatefulWidget {
  const SubmitButton({
    super.key,
    required this.dropdownValue,
  });

  final String dropdownValue;

  @override
  State<SubmitButton> createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {
  late FToast fToast;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 100,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Color.fromRGBO(173, 82, 31, 1),
      ),
      child: TextButton(
          onPressed: () {
            if (Locationselected == 'Select Location') {
              fToast.showToast(
                  toastDuration: const Duration(seconds: 2),
                  child: Container(
                      height: 28,
                      width: 190,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Color.fromARGB(255, 255, 255, 255)),
                      child: Center(
                        child: Text(
                          'Please select a location',
                          style: GoogleFonts.inter(
                              fontSize: 16, color: Colors.black),
                        ),
                      )));
            } else {
              Navigator.of(context).pop();
            }
          },
          child: Text(
            'Done',
            style: GoogleFonts.inter(fontSize: 18, color: Colors.white),
          )),
    );
  }
}
