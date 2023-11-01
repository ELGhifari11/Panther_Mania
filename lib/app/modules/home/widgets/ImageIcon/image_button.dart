// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:panther_mania/app/data/colors/colors.dart';

// ignore: must_be_immutable
class CustomIconButton extends StatefulWidget {
  late String image;
  final VoidCallback onPress;

  CustomIconButton({
    this.image = 'lib/app/data/images/chat.png',
    required this.onPress,
  });

  @override
  _CustomIconButtonState createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<CustomIconButton> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (TapDownDetails details) {
        setState(() {
          pressed = true;
          widget.onPress.call();
        });
        Future.delayed(Duration(milliseconds: 150), () {
          setState(() {
            pressed = false;
          });
        });
      },
      child: Container(
        height: 60,
        padding: EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: pressed ? Colors.black12 : Colors.white,
          borderRadius: BorderRadius.circular(90),
          border: Border.all(
            color: pressed ? AppColors.primaryColor : Colors.black12,
            width: 3,
          ),
        ),
        child: Image(
          image: AssetImage(widget.image),
        ),
      ),
    );
  }
}
