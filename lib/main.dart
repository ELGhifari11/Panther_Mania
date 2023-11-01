// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:panther_mania/app/controllers/auth_controller.dart';
import 'package:panther_mania/app/data/colors/colors.dart';
import 'package:panther_mania/app/modules/loading/views/loading_view.dart';
import 'package:panther_mania/firebase_options.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final AuthC = Get.put(AuthController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: AuthC.streamAuthStatus,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            print('ini Snapshot ${snapshot.data} ');

            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primaryColor: AppColors.primaryColor,
                colorScheme:
                    const ColorScheme.light(primary: AppColors.primaryColor),
                textButtonTheme: TextButtonThemeData(
                    style:
                        // ignore: deprecated_member_use
                        TextButton.styleFrom(primary: AppColors.primaryColor)),
              ),
              initialRoute:
                  snapshot.data != null && snapshot.data!.emailVerified == true
                      ? Routes.SPLASH_HOME
                      : Routes.SPLASH,
              getPages: AppPages.routes,
            );
          }
          return const LoadingView();
        });
  }
}
