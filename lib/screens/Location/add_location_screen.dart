import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../global/globals.dart';

// ignore: camel_case_types, must_be_immutable
class Add_Location_Screen extends StatefulWidget {
  const Add_Location_Screen({super.key});

  @override
  State<Add_Location_Screen> createState() => _Add_Location_ScreenState();
}

// ignore: camel_case_types
class _Add_Location_ScreenState extends State<Add_Location_Screen> {
  List<String> options = <String>[
    'Select Location',
    'VSB Hostel',
    'APJ Hostel',
    'CVR Hostel',
    'Devi Ahilya Hostel',
    'JC Bose Hostel',
    'HJ Bhabha Hostel',
    'Central Dining Facility',
    'POD Building',
    'Vidhyanchal Guest House',
    'Health Centre',
    'LRC-Swadyaya',
    'Abhinandan Bhavan',
    'Sports Complex',
    'Bal Hanuman Mandir',
    'La Fresco',
    'Lecture Hall Complex',
    'Narmada Housing',
    'Kshipra Housing',
    'Director Bunglow',
    'CITC Hub Building',
    'Central Workshop',
    'Central HVAC Plant',
    'Gate No. 1',
    'Gate No. 2',
    'Badminton Court',
    'Basketball Court',
    'Tennis Court',
    'Kendriya Vidhyalaya',
  ];

  String dropdownValue = 'Select Location';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(255, 233, 214, 1),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 145,
            ),
            Image.asset(
              'assets/buttons/addlocation.jpg',
              height: 172,
              width: 172,
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              'Choose your Location',
              style: GoogleFonts.inter(
                  fontSize: 25, color: const Color.fromRGBO(110, 46, 0, 1)),
            ),
            const SizedBox(
              height: 80,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color.fromARGB(236, 255, 255, 255),
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
                  width: 320,
                  height: 50,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      iconEnabledColor: const Color.fromRGBO(110, 46, 0, 1),
                      iconSize: 30.0,
                      isDense: true,
                      isExpanded: true,
                      menuMaxHeight: 350,
                      value: dropdownValue,
                      onChanged: (String? value) {
                        setState(() {
                          dropdownValue = value!;
                          Locationselected = dropdownValue;
                        });
                      },
                      style: GoogleFonts.inter(
                          fontSize: 23,
                          color: const Color.fromRGBO(110, 46, 0, 1)),
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
                                  color: const Color.fromRGBO(110, 46, 0, 1)),
                              value),
                        );
                      }).toList(),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 70,
            ),
            SubmitButton(
              dropdownValue: dropdownValue,
            ),
          ],
        ));
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
      height: 50,
      width: 150,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Color.fromRGBO(115, 50, 2, 1),
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
              context.go('/home_screen.dart');
            }
          },
          child: Text(
            'Done',
            style: GoogleFonts.inter(fontSize: 20, color: Colors.white),
          )),
    );
  }
}
