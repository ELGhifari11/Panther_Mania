// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:panther_mania/app/controllers/auth_controller.dart';
import 'package:panther_mania/app/modules/login/widgets/textFields/button.dart';
import 'package:panther_mania/app/modules/login/widgets/textFields/text_field.dart';
import 'package:panther_mania/app/routes/app_pages.dart';

import '../controllers/reset_pass_controller.dart';

class ResetPassView extends GetView<ResetPassController> {
  ResetPassView({Key? key}) : super(key: key);
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/app/data/images/bgg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.fromLTRB(
                  25, MediaQuery.of(context).size.height * 0.2, 25, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      children: [
                        Lottie.asset('lib/app/data/lotties/emailll.json',
                            height: 300),
                        SizedBox(height: 30),
                        CustomTextField(
                          text: 'Email',
                          icon: Icons.email,
                          isPasswordType: false,
                          controller: controller.emailC,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            child: Text(
                              'Password sudah ingat?',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              Get.toNamed(Routes.LOGIN);
                            },
                          ),
                        ),
                        SizedBox(height: 20),
                        ButtonLogin(
                          context: context,
                          title: 'Reset',
                          onTap: () {
                            // _login(context);
                            authC.resetPass(controller.emailC.text, context);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(
                15, MediaQuery.of(context).size.height * 0.06, 0, 0),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Get.back();
                  },
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 7.8,
                ),
                Text(
                  'Reset Password',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
