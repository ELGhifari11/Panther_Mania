// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:panther_mania/app/controllers/auth_controller.dart';
import 'package:panther_mania/app/data/colors/colors.dart';
import 'package:panther_mania/app/modules/home/widgets/ImageIcon/image_button.dart';
import 'package:panther_mania/app/modules/login/widgets/textFields/text_field.dart';
import 'package:panther_mania/app/routes/app_pages.dart';
import '../controllers/home_controller.dart';

// ignore: must_be_immutable
class HomeView extends GetView<HomeController> {
  final authC = Get.find<AuthController>();
  final TextEditingController _searchTextController = TextEditingController();
  bool pressed = false;

  HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          // ignore: sort_child_properties_last
          child: Icon(
            Icons.logout,
            color: Colors.white,
          ),
          backgroundColor: AppColors.primaryColor,
          onPressed: () {
            authC.logout();
          }),
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: true,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white.withOpacity(0.0),
            floating: true,
            snap: true,
            elevation: 0,
            expandedHeight: MediaQuery.of(context).size.height / 4.5,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  image: DecorationImage(
                    image: AssetImage('lib/app/data/images/bgg.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(
                          150, MediaQuery.of(context).size.height / 20, 0, 0),
                      child: Image(
                        image: AssetImage('lib/app/data/images/app-logo.png'),
                        height: 70,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(
                          0, MediaQuery.of(context).size.height / 100, 150, 0),
                      child: Text(
                        'Selamat datang {User}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                      height: 65,
                      padding: EdgeInsets.fromLTRB(
                          10, MediaQuery.of(context).size.height / 50, 10, 0),
                      child: CustomTextField(
                        text: 'Search',
                        icon: Icons.search,
                        isPasswordType: false,
                        controller: _searchTextController,
                        borderColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
              height: 900,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            CustomIconButton(
                              image: 'lib/app/data/images/chat.png',
                              onPress: () {
                                print('Ini Chat');
                              },
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Chat admin',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            CustomIconButton(
                              image: 'lib/app/data/images/date.png',
                              onPress: () {
                                print('Ini DATE');
                              },
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Agenda',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            CustomIconButton(
                              image: 'lib/app/data/images/box.png',
                              onPress: () {
                                print('Ini BOX');
                              },
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Produk',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            CustomIconButton(
                              image: 'lib/app/data/images/sos.png',
                              onPress: () {
                                print('Ini SOS');
                              },
                            ),
                            SizedBox(height: 5),
                            Text(
                              'SOS',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            CustomIconButton(
                              image: 'lib/app/data/images/profile.png',
                              onPress: () {
                                Get.toNamed(Routes.PROFILE);
                              },
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Profile',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
