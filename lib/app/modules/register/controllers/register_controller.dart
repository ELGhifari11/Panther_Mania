// ignore_for_file: unnecessary_overrides, prefer_const_constructors, use_build_context_synchronously, avoid_print
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:panther_mania/app/widgets/showdialog/dialog_warning.dart';

class RegisterController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();
  TextEditingController passValidC = TextEditingController();
  TextEditingController nameC = TextEditingController();
  TextEditingController dateC = TextEditingController();
  var genderC = 'Laki-laki';
  Rx<File?> imageC = Rx<File?>(null);

  void addUser(String name, String date, String email, String pass,
      String gender, BuildContext context) async {
    CollectionReference users = firestore.collection('Users');

    try {
      await users.add({
        'nama': name,
        'gender': genderC,
        'tanggal_lahir': date,
        'email': email,
        'pass': pass,
      });
    } catch (e) {
      print(e.toString());
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomAlertDialog(content: '$e', iconTitle: Icons.warning);
        },
      );
    }
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    emailC.dispose();
    passC.dispose();
    passValidC.dispose();
    nameC.dispose();
    dateC.dispose();

    super.onClose();
  }

  void increment() => count.value++;
}
