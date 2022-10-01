import 'package:e_commerce/const/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget pastelRedButton(String title) {
  return Container(
    height: 55.0.h,
    width: 350.0.w,
    decoration: BoxDecoration(
        color: AppColors.pastelRed,
        borderRadius: BorderRadius.all(Radius.circular(10.0.r))),
    child: Center(
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20.0.sp,
          fontWeight: FontWeight.w300,
          color: Colors.white ,
        ),
      ),
    ),
  );
}
