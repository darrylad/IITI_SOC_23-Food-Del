import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_2/database/model.dart';
import 'package:get/get.dart';

class OrderedRepository extends GetxController {
  static OrderedRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createuser(userModel user) async {
    await _db.collection('PAYMENTS DONE').add(user.toJason());
  }
}