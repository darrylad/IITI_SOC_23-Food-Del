import 'package:get/get.dart';

import '../controller_login/login_controller.dart';

String username = '';
// ignore: non_constant_identifier_names
String Locationselected = 'Select Location';

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
