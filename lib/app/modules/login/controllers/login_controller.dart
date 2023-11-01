// ignore_for_file: use_build_context_synchronously, avoid_print, unnecessary_overrides

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController emailC = TextEditingController();

  TextEditingController passC = TextEditingController(text: '123456');

  @override
  void onClose() {
    emailC.dispose();
    passC.dispose();
    super.onClose();
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

  void increment() => count.value++;
}
