// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:panther_mania/app/controllers/auth_controller.dart';
import 'package:panther_mania/app/modules/login/widgets/textFields/button.dart';
import 'package:panther_mania/app/modules/login/widgets/textFields/text_field.dart';
import 'package:panther_mania/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);
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
                        Lottie.asset(
                          'lib/app/data/lotties/carsignin.json',
                        ),

                        // Image.asset(
                        //   'lib/app/data/images/car.png',
                        //   height: 200,
                        // ),
                        SizedBox(height: 30),
                        CustomTextField(
                          text: 'Email',
                          icon: Icons.email,
                          isPasswordType: false,
                          controller: controller.emailC,
                        ),
                        SizedBox(height: 25),
                        CustomTextField(
                          text: 'Kata sandi',
                          icon: Icons.lock,
                          isPasswordType: true,
                          controller: controller.passC,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            child: Text(
                              'Lupa password',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              Get.toNamed(Routes.RESET_PASS);
                            },
                          ),
                        ),
                        SizedBox(height: 20),
                        ButtonLogin(
                          context: context,
                          title: 'Masuk',
                          onTap: () {
                            // _login(context);
                            authC.login(controller.emailC.text,
                                controller.passC.text, context);
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
                  width: MediaQuery.of(context).size.width / 3.9,
                ),
                Text(
                  'Masuk',
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
