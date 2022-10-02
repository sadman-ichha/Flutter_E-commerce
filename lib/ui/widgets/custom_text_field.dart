import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget customTextField(
  String hintText,
  TextEditingController controller,
  TextInputType keyboardType,
) {
  return TextField(
    controller: controller,
    keyboardType: keyboardType,
    decoration: InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(fontSize: 17.0.sp, fontWeight: FontWeight.w300),
    ),
  );
}
