// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, camel_case_types

// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  final Widget customWidget;
  SplashView({required this.customWidget});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 2300), () {
      Get.off(
        () => customWidget,
      );
    });

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 34, 33, 33),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('lib/app/data/images/bgg.png'),
                fit: BoxFit.cover)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image(
              //   image: AssetImage('lib/app/data/images/car.png'),
              //   height: 200,
              // ),
              GetPlatform.isAndroid
                  ? Lottie.asset('lib/app/data/lotties/carload.json',
                      width: 350)
                  // CupertinoActivityIndicator(
                  //     color: Color.fromARGB(255, 255, 255, 255),
                  //     radius: 20,
                  //     animating: true,
                  //   )
                  : CircularProgressIndicator(
                      color: Colors.amber,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
