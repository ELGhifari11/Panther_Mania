// ignore_for_file: unnecessary_overrides, avoid_print, use_build_context_synchronously, prefer_const_constructors, non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:panther_mania/app/data/colors/colors.dart';
import 'package:panther_mania/app/modules/register/controllers/register_controller.dart';
import 'package:panther_mania/app/routes/app_pages.dart';
import 'package:panther_mania/app/widgets/showdialog/dialog_actions.dart';
import 'package:panther_mania/app/widgets/showdialog/dialog_warning.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  Stream<User?> get streamAuthStatus => auth.authStateChanges();

// ////////////////////////    L  O  G  I  N      ////////////////////////////////////////////////

  void login(String email, String password, BuildContext context) async {
    try {
      UserCredential myUser = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (myUser.user!.emailVerified) {
        print('$email berhasil login');

        Fluttertoast.showToast(
          msg: '$email berhasil login',
          gravity: ToastGravity.TOP,
          backgroundColor: Colors.white,
          textColor: AppColors.primaryColor,
        );

        Get.offAllNamed(Routes.SPLASH_HOME);
      } else if (!myUser.user!.emailVerified) {
        showDialog(
            context: context,
            builder: (BuildContext conntext) {
              return CustomAlertAction(
                content: 'Email belum di verifikasi, Kirim ulang  verifikasi ?',
                iconTitle: Icons.email,
                button1: () => {},
                button2: () async => {
                  await Future.delayed(const Duration(seconds: 5), () async {
                    await myUser.user!.sendEmailVerification();
                  }),
                },
                childButton1: const Text('NO'),
                childButton2: const Text('Kirim ulang'),
              );
            });
      } else {
        Fluttertoast.showToast(
            msg: '$email Belum di verifikasi',
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.white,
            textColor: AppColors.primaryColor);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return const CustomAlertDialog(
                content: 'Email tidak valid \nHarap masukkan email yang valid.',
                iconTitle: Icons.warning);
          },
        );
      } else if (e.code == 'user-not-found' ||
          e.code == 'wrong-password' ||
          e.code == 'INVALID_LOGIN_CREDENTIALS') {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return const CustomAlertDialog(
                content: 'Email atau kata sandi salah \nCoba lagi.',
                iconTitle: Icons.warning);
          },
        );
      }
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return const CustomAlertDialog(
              content: 'error terjadi tidak bisa login',
              iconTitle: Icons.warning);
        },
      );
    }
  }

  // ////////////////////////    R  E   G  I  S  T  E  R     ////////////////////////////////////////////////

  void register(String email, String password, String passValid, String name,
      String date, BuildContext context) async {
    final regisC = Get.find<RegisterController>();
    if (email == '' ||
        password == '' ||
        passValid == '' ||
        name == '' ||
        date == '') {
      showDialog(
          context: context,
          builder: (context) => (CustomAlertDialog(
              content: 'Oops! Ada yang belum di isi',
              iconTitle: Icons.warning)));
    } else if (password != passValid) {
      showDialog(
          context: context,
          builder: (context) => (CustomAlertDialog(
              content: 'Pastikan password yang anda masukan sesuai',
              iconTitle: Icons.warning)));
    } else if (!email.toString().contains('@gmail.com')) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomAlertDialog(
            content: 'Email tidak valid. Harap masukkan email yang valid.',
            iconTitle: Icons.warning,
          );
        },
      );
    } else {
      try {
        UserCredential myUser = await auth.createUserWithEmailAndPassword(
            email: email, password: password);

        await myUser.user!.sendEmailVerification();
        showDialog(
            context: context,
            builder: (BuildContext conntext) {
              return CustomAlertAction(
                content:
                    'Silahkan verifikasi email yang kami kirim terlebih dahulu!',
                iconTitle: Icons.email,
                button1: () => {
                  regisC.nameC.clear(),
                  regisC.dateC.clear(),
                  regisC.emailC.clear(),
                  regisC.passC.clear(),
                  regisC.passValidC.clear()
                },
                button2: () => {Get.offNamed(Routes.SPLASH)},
                childButton1: Text('NO'),
                childButton2: Text('OK'),
              );
            });
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return CustomAlertDialog(
                  content: 'Password minimal 6 karakter',
                  iconTitle: Icons.warning);
            },
          );
        } else if (e.code == 'email-already-in-use') {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return CustomAlertDialog(
                  content: 'Email sudah di gunakan', iconTitle: Icons.warning);
            },
          );
        }
      } catch (e) {
        print(e.toString());
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomAlertDialog(
                content: 'Error gagal mendaftar', iconTitle: Icons.warning);
          },
        );
      }
    }
  }

  // ////////////////////////            R E S E T       P A S S W O R D     ////////////////////////////////////////////////

  void resetPass(String email, BuildContext context) async {
    if (email != "" && GetUtils.isEmail(email)) {
      try {
        auth.sendPasswordResetEmail(email: email);
        showDialog(
            context: context,
            builder: (BuildContext conntext) {
              return CustomAlertAction(
                content:
                    'Silahkan reset password anda dengan email yang kami kirim ke ( $email )',
                iconTitle: Icons.email,
                button1: () => {},
                button2: () => {Get.offAllNamed(Routes.SPLASH_LOGIN)},
                childButton1: Text('NO'),
                childButton2: Text('OK'),
              );
            });
      } catch (e) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomAlertDialog(
                content: 'Error terjadi kesalahan', iconTitle: Icons.warning);
          },
        );
      }
    }
    // else {
    //   showDialog(
    //     context: context,
    //     builder: (BuildContext context) {
    //       return CustomAlertDialog(
    //           content: 'Error terjadi kesalahan', iconTitle: Icons.warning);
    //     },
    //   );
    // }
  }

  // ////////////////////////    L O G O U T     ////////////////////////////////////////////////

  void logout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(Routes.SPLASH);
  }

//  /////////////////////////////////////////////////////////////////////////////////
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
    Get.back();
    super.onClose();
  }

  void increment() => count.value++;
}
