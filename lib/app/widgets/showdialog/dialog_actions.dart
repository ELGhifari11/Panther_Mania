// ignore: file_names
// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:panther_mania/app/data/colors/colors.dart';

class CustomAlertAction extends StatefulWidget {
  final String content;
  final IconData iconTitle;
  final VoidCallback button1;
  final VoidCallback button2;
  final Widget childButton1;
  final Widget childButton2;

  const CustomAlertAction({
    required this.content,
    required this.iconTitle,
    required this.button1,
    required this.button2,
    required this.childButton1,
    required this.childButton2,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CustomAlertActionState createState() => _CustomAlertActionState();
}

class _CustomAlertActionState extends State<CustomAlertAction> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.fromLTRB(30, 10, 30, 10),
      actionsPadding: EdgeInsets.fromLTRB(0, 0, 20, 10),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Icon(widget.iconTitle, color: AppColors.primaryColor),
      ]),
      iconColor: Colors.white,
      content:
          Text(widget.content, style: TextStyle(color: AppColors.primaryColor)),
      actions: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              foregroundColor: AppColors.primaryColor,
              backgroundColor: Colors.white),
          onPressed: () {
            Navigator.pop(context);
            widget.button1.call();
          },
          child: widget.childButton1,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              foregroundColor: AppColors.primaryColor,
              backgroundColor: Colors.white),
          onPressed: () {
            Navigator.pop(context);
            widget.button2.call();
          },
          child: widget.childButton2,
        ),
      ],
    );
  }
}
