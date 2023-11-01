// ignore_for_file: prefer_const_constructors, unnecessary_new, use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:panther_mania/app/modules/register/controllers/register_controller.dart';

class CustomFieldGender extends StatefulWidget {
  final String text;
  final IconData icon;
  final regisC = Get.find<RegisterController>();

  CustomFieldGender({
    required this.text,
    required this.icon,
  });

  @override
  _CustomFieldGenderState createState() => _CustomFieldGenderState();
}

class _CustomFieldGenderState extends State<CustomFieldGender> {
  String dropdownValue = 'Laki-laki';

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(40),
          border: Border.all(
            color: Colors.white,
            width: 1,
          ),
        ),
        width: MediaQuery.of(context).size.width * .9,
        height: 60,
        child: Row(children: <Widget>[
          Icon(widget.icon, color: Colors.white),
          SizedBox(width: 10.0),
          Expanded(
              child: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Colors.grey,
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: dropdownValue,
                isExpanded: true,
                iconEnabledColor: Colors.white,
                iconDisabledColor: Colors.grey,
                style: TextStyle(color: Colors.white),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;

                    widget.regisC.genderC = newValue;
                  });
                },
                items: <String>['Laki-laki', 'Perempuan']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: new Text(value,
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                  );
                }).toList(),
              ),
            ),
          ))
        ]));
  }
}
