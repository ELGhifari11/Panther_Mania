// ignore: file_names
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:panther_mania/app/data/colors/colors.dart';

class CustomAlertDialog extends StatefulWidget {
  final String content;
  final IconData iconTitle;

  const CustomAlertDialog({
    super.key,
    required this.content,
    required this.iconTitle,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CustomAlertDialogState createState() => _CustomAlertDialogState();
}

class _CustomAlertDialogState extends State<CustomAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.fromLTRB(30, 10, 30, 10),
      actionsPadding: EdgeInsets.fromLTRB(0, 0, 20, 10),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            widget.iconTitle,
            color: AppColors.primaryColor,
            size: 35,
          ),
        ],
      ),
      content: Text(
        widget.content,
        style: TextStyle(color: AppColors.primaryColor),
      ),
      actions: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: AppColors.primaryColor,
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
          onPressed: () => Navigator.pop(context),
          child: Text('OK', style: TextStyle(color: AppColors.primaryColor)),
        ),
      ],
    );
  }
}
