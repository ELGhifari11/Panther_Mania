// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:panther_mania/app/modules/option_login/widgets/button/button.dart';
import 'package:panther_mania/app/routes/app_pages.dart';
import '../controllers/option_login_controller.dart';

class OptionLoginView extends GetView<OptionLoginController> {
  const OptionLoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('lib/app/data/images/bgg.png'),
                  fit: BoxFit.cover)),
          child: Container(
            padding: EdgeInsets.fromLTRB(
                55, MediaQuery.of(context).size.height * 0.2, 40, 0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Center(
                  child: Column(
                children: [
                  Image(
                    image: AssetImage(
                      'lib/app/data/images/car.png',
                    ),
                    height: 300,
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Buttons(
                            context: context,
                            title: 'Scan ID',
                            onTap: () {
                              Get.toNamed(
                                Routes.LOGIN,
                              );
                            },
                            panjang: 250),
                        Buttons(
                            context: context,
                            title: 'Masuk',
                            onTap: () => Get.toNamed(
                                  Routes.LOGIN,
                                ),
                            panjang: 250),
                        Buttons(
                            context: context,
                            title: 'Daftar',
                            onTap: () {
                              Get.toNamed(
                                Routes.REGISTER,
                              );
                            },
                            panjang: 250)
                      ],
                    ),
                  ),
                ],
              )),
            ]),
          )),
    );
  }
}
