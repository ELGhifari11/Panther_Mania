// ignore_for_file: use_build_context_synchronously, prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:panther_mania/app/controllers/auth_controller.dart';
import 'package:panther_mania/app/data/colors/colors.dart';
import 'package:panther_mania/app/modules/login/widgets/textFields/button.dart';
import 'package:panther_mania/app/modules/login/widgets/textFields/text_field.dart';
import 'package:panther_mania/app/modules/register/widgets/text_field/date_field.dart';
import 'package:panther_mania/app/modules/register/widgets/text_field/gender_field.dart';
import 'package:panther_mania/app/routes/app_pages.dart';
import 'package:panther_mania/app/widgets/showdialog/dialog_actions.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  RegisterView({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final authC = Get.find<AuthController>();

  void getImage(ImageSource source, BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    XFile? pickedImage = await picker.pickImage(source: source);
    if (pickedImage != null) {
      controller.imageC.value = File(pickedImage.path);
    }
    Get.toNamed(Routes.REGISTER);
  }

  void showDialogBox(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => CustomAlertAction(
              content: 'Ambil gambar dari ...',
              iconTitle: Icons.camera_alt,
              button1: () => getImage(ImageSource.camera, context),
              button2: () => getImage(ImageSource.gallery, context),
              childButton1:
                  Icon(Icons.camera_alt, color: AppColors.primaryColor),
              childButton2: Icon(Icons.image, color: AppColors.primaryColor),
            ));
  }

  void register(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      authC.register(
          controller.emailC.text,
          controller.passC.text,
          controller.passValidC.text,
          controller.nameC.text,
          controller.dateC.text,
          context);
    }
    controller.addUser(
        controller.nameC.text,
        controller.dateC.text,
        controller.emailC.text,
        controller.passC.text,
        controller.genderC,
        context);
  }

  var pressed = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('lib/app/data/images/bgg.png'),
          fit: BoxFit.cover,
        )),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              iconTheme: IconThemeData(color: Colors.white),
              centerTitle: true,
              title: Text('Daftar',
                  style: TextStyle(color: Colors.white, fontSize: 22)),
              backgroundColor: Colors.black.withOpacity(0.3),
              floating: true,
              snap: true,
              elevation: 0,
              flexibleSpace: FlexibleSpaceBar(background: Container()),
            ),
            SliverToBoxAdapter(
                child: Obx(() => Column(children: [
                      SizedBox(height: 30),
                      GestureDetector(
                        onTapDown: (TapDownDetails details) {
                          pressed.value = false;
                        },
                        onTapUp: (TapUpDetails details) {
                          pressed.value = true;

                          showDialogBox(context);
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 100),
                          width: !pressed.value ? 320 : 300,
                          height: !pressed.value ? 270 : 250,
                          decoration: BoxDecoration(
                            borderRadius: !pressed.value
                                ? BorderRadius.circular(10)
                                : BorderRadius.circular(5),
                            border: Border.all(color: Colors.white),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white.withOpacity(0.1),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              )
                            ],
                            // ignore: unnecessary_null_comparison
                            image: controller.imageC != null &&
                                    controller.imageC.value != null
                                ? DecorationImage(
                                    image: FileImage(
                                        controller.imageC.value as File),
                                    fit: BoxFit.cover,
                                  )
                                : DecorationImage(
                                    image: AssetImage(
                                        'lib/app/data/images/icon1.png'),
                                    fit: BoxFit.scaleDown,
                                  ),
                          ),
                        ),
                      ),
                      Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(25, 20, 25, 20),
                                child: CustomTextField(
                                  text: 'Nama',
                                  icon: Icons.person,
                                  isPasswordType: false,
                                  controller: controller.nameC,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(25, 0, 25, 20),
                                child: CustomField(
                                  text: 'Tanggal lahir',
                                  icon: Icons.date_range,
                                  controller: controller.dateC,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(25, 0, 25, 20),
                                child: CustomFieldGender(
                                  text: '     ',
                                  icon: Icons.people,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(25, 0, 25, 20),
                                child: CustomTextField(
                                  text: 'Email',
                                  icon: Icons.email,
                                  isPasswordType: false,
                                  controller: controller.emailC,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(25, 0, 25, 20),
                                child: CustomTextField(
                                  text: 'Kata sandi',
                                  icon: Icons.lock,
                                  isPasswordType: true,
                                  controller: controller.passC,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(25, 0, 25, 20),
                                child: CustomTextField(
                                  text: 'Ulangi kata sandi',
                                  icon: Icons.lock,
                                  isPasswordType: true,
                                  controller: controller.passValidC,
                                ),
                              ),
                            ],
                          )),
                      Container(
                          margin: EdgeInsets.fromLTRB(25, 0, 25, 20),
                          child: ButtonLogin(
                              context: context,
                              title: 'Daftar',
                              onTap: () {
                                register(context);
                              })),
                    ])))
          ],
        ),
      ),
    );
  }
}
