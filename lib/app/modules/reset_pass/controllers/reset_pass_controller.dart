// ignore_for_file: unnecessary_overrides

import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ResetPassController extends GetxController {
  TextEditingController emailC = TextEditingController();

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

    super.onClose();
  }

  void increment() => count.value++;
}
