// ignore: duplicate_ignore
// ignore_for_file: prefer_typing_uninitialized_variables, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller_login/login_controller.dart';

final String deliveryAgentName = "Abhinav Tiwari";
final String deliveryAgentPhone = "9876543210";
final String RestPhone = "8302193934";

String username = '';
// ignore: non_constant_identifier_names
String Locationselected = 'Select Location';
String categorySelected = 'All';

bool home = true;
bool cart = false;
bool account = false;
bool payed = false;
String route = '/ProfileScreen.dart';
String route_payed = '/Afterpayments.dart';

// ignore: prefer_typing_uninitialized_variables
var colour_1;
var colour_2;
var colour_3;
var colour_4 = const Color.fromARGB(255, 123, 254, 0);

void colourdecider() {
  if (home == true) {
    colour_1 = const Color.fromARGB(255, 152, 46, 1);
    colour_2 = const Color.fromARGB(255, 255, 255, 255);
    colour_3 = const Color.fromARGB(255, 255, 255, 255);
  } else if (cart == true) {
    colour_1 = const Color.fromARGB(255, 255, 255, 255);
    colour_2 = const Color.fromARGB(255, 152, 46, 1);
    colour_3 = const Color.fromARGB(255, 255, 255, 255);
  } else if (payed == true) {
    colour_1 = const Color.fromARGB(255, 255, 255, 255);
    colour_3 = colour_4;
    colour_2 = const Color.fromARGB(255, 255, 255, 255);
    route = route_payed;
  } else {
    colour_1 = const Color.fromARGB(255, 255, 255, 255);
    colour_3 = const Color.fromARGB(255, 152, 46, 1);
    colour_2 = const Color.fromARGB(255, 255, 255, 255);
  }
}

final controller = Get.put(LoginController());

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
int? totalCartValue = 0;
